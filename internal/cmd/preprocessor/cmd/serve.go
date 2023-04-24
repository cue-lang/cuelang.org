// Copyright 2023 The CUE Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package cmd

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"os/exec"
	"os/signal"
	"path/filepath"
	"strings"
	"syscall"
	"time"

	"github.com/cue-lang/cuelang.org/internal/fsnotify"
)

type serveContext struct {
	// the underlying executor instance
	e *executor

	// errs is the channel over which errors from the wrapped
	// hugo process are relayed.
	errs chan error

	// hugo is the wrapped hugo command.
	hugo *exec.Cmd

	// hugoOutput is the combined stdout and stderr output from the wrapped hugo
	// command.
	hugoOutput io.Reader

	// gittoplevel is the top level git directory (if there is one) for the
	// working directory.
	gittoplevel string

	// indexfile is the path to the index.lock file within gittoplevel if gittoplevel
	// is non empty.
	indexfile string

	// w is the batched watcher from which we receive events.
	w *fsnotify.BatchedRecursiveWatcher
}

func (e *executor) newServeContext() *serveContext {
	return &serveContext{
		e:    e,
		errs: make(chan error),
	}
}

// serve establishes a file watcher on e.wd and runs e.execute() on each change.
// It also runs hugo serve passing the non-flag arguments to execute.
func (e *executor) serve(args []string) error {
	var err error
	sc := e.newServeContext()

	if err := sc.startHugo(args); err != nil {
		return fmt.Errorf("failed to start hugo: %w", err)
	}

	go sc.waitOnHugo()
	go sc.relayHugoOutput()

	sc.findGitTopLevel()

	var oDebug fsnotify.Option
	if flagDebug.Bool(e.cmd) {
		oDebug = fsnotify.Debug(os.Stderr)
	}

	// Serve
	sc.w, err = fsnotify.NewBatchedRecursiveWatcher(e.wd, sc.gittoplevel, 10*time.Millisecond, oDebug)
	if err != nil {
		return fmt.Errorf("failed to create watcher: %w", err)
	}
	defer sc.w.Close()

	go sc.watcherEventLoop()

	// Watch for errors from hugo exiting. Note that errors from the event loop
	// are (largely) ignored and instead logged.
	sigs := make(chan os.Signal, 1)
	signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)
	select {
	case <-sigs:
		// TODO anything better to do here?
		os.Exit(1)
	case err := <-sc.errs:
		return err
	}
	return nil
}

func (sc *serveContext) startHugo(args []string) error {
	// Run hugo, and relay stdout and stderr to a "hugo: " prefix debug output
	args = append([]string{"serve"}, args...)
	cmd := exec.Command("hugo", args...)
	hugoOutput, hugoWriter := io.Pipe()
	cmd.Dir = filepath.Join(sc.e.root, "hugo")
	cmd.Stdout = hugoWriter
	cmd.Stderr = hugoWriter

	sc.hugo = cmd
	sc.hugoOutput = hugoOutput

	if err := cmd.Start(); err != nil {
		return fmt.Errorf("failed to start [%v]: %v", cmd, err)
	}
	return nil
}

func (sc *serveContext) waitOnHugo() {
	if err := sc.hugo.Wait(); err != nil {
		sc.errs <- fmt.Errorf("got a non-zero exit code from [%v]: %v", sc.hugo, err)
	} else {
		sc.errs <- nil
	}
}

func (sc *serveContext) relayHugoOutput() {
	reader := bufio.NewReader(sc.hugoOutput)
	nl := "\n"
	for {
		line, isPrefix, err := reader.ReadLine()
		if err == io.EOF {
			break
		}
		if err != nil {
			// Reset
			nl = "\n"
			sc.e.logger.Printf("hugo: failed to read output line: %v", err)
			continue
		}
		prefix := "hugo: "
		if nl == "" {
			// we are continuing from a previous long line
			prefix = ""
		}
		if isPrefix {
			nl = ""
		} else {
			nl = "\n"
		}

		sc.e.logger.Printf("%s%s%s", prefix, line, nl)
	}

}

func (sc *serveContext) findGitTopLevel() {
	// Find the git top-level directory
	gitCmd := exec.Command("git", "rev-parse", "--show-toplevel")
	gitCmd.Dir = sc.e.wd
	if byts, err := gitCmd.CombinedOutput(); err == nil {
		sc.gittoplevel = strings.TrimSpace(string(byts))
	}
	if sc.gittoplevel != "" {
		sc.indexfile = filepath.Join(sc.gittoplevel, ".git", "index.lock")
	}
}

func (sc *serveContext) watcherEventLoop() {
	// Initial execute
	if err := sc.e.execute(nil); err != nil {
		sc.e.debugf("failed to execute: %w", err)
	}
	for {
		select {
		case evs := <-sc.w.Events():
			// Ignore if we only got events for the index file
			var sawNonIndex bool
			for _, ev := range evs {
				if ev.Name != sc.indexfile {
					sawNonIndex = true
				}
			}
			// If we do have an index file but we only saw events for that
			// index file, skip
			if sc.indexfile != "" && !sawNonIndex {
				continue
			}
			// Build up a log string, but also establish a list of directories
			// ready to feed to execute
			dirs := make(map[string]bool)
			s := new(strings.Builder)
			fmt.Fprintf(s, "changes: [\n")
			for _, ev := range evs {
				fmt.Fprintf(s, "  path: %s, op: %v\n", ev.Name, ev.Op)

				// If we got a remove, treat as a write to the containing
				// directory. Note that the containing directory itself might get
				// removed... but that's a race like any other. We account for the
				// fact that a single batch might contain the removal of a file and
				// its containing directory by removing ev.Name from the dirs set.
				// This prevents unnecessary races/churn in the consumer (further
				// races allowing).
				if ev.Op == fsnotify.Remove {
					delete(dirs, ev.Name)
					d := filepath.Dir(ev.Name)
					dirs[d] = true
					continue
				}

				// ev.Name might be a file or a directory.
				fi, err := os.Stat(ev.Name)
				if err != nil {
					sc.e.debugf("failed to stat %s: %v", ev.Name, err)
					continue
				}
				d := ev.Name
				if !fi.IsDir() {
					d = filepath.Dir(d)
				}
				dirs[d] = true
			}
			fmt.Fprintf(s, "]\n")
			sc.e.debugf(s.String())

			// Debug log the dirs we will execute
			var dirNames []string
			for d := range dirs {
				dirNames = append(dirNames, fmt.Sprintf("%q", d))
			}
			sc.e.debugf("execute(%s)", strings.Join(dirNames, ","))

			// Perform the execute
			if err := sc.e.execute(dirs); err != nil {
				sc.e.debugf("failed to execute: %w", err)
			}

		case err := <-sc.w.Errors():
			if err != nil {
				sc.e.debugf("error from filewatcher: %w", err)
			}
		}
	}
}
