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
	"syscall"

	"github.com/cue-lang/cuelang.org/internal/fsnotify"
)

// serve establishes a file watcher on e.wd and runs e.execute() on each change.
// It also runs hugo serve passing the non-flag arguments to execute.
func (e *executor) serve(args []string) error {
	// Run hugo, and relay stdout and stderr to a "hugo: " prefix debug output
	args = append([]string{"serve"}, args...)
	cmd := exec.Command("hugo", args...)
	hugoOutput, hugoWriter := io.Pipe()
	cmd.Dir = filepath.Join(e.root, "hugo")
	cmd.Stdout = hugoWriter
	cmd.Stderr = hugoWriter

	if err := cmd.Start(); err != nil {
		return fmt.Errorf("failed to start [%v]: %v", cmd, err)
	}
	errs := make(chan error)
	go func() {
		if err := cmd.Wait(); err != nil {
			errs <- fmt.Errorf("got a non-zero exit code from [%v]: %v\n", cmd, err)
		} else {
			errs <- nil
		}
	}()
	// Read the first line of the command output as the server address
	go func() {
		reader := bufio.NewReader(hugoOutput)
		nl := "\n"
		for {
			line, isPrefix, err := reader.ReadLine()
			if err == io.EOF {
				break
			}
			if err != nil {
				// Reset
				nl = "\n"
				e.logger.Printf("hugo: failed to read output line: %v", err)
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

			e.logger.Printf("%s%s%s", prefix, line, nl)
		}
	}()

	// Serve
	w, err := fsnotify.NewWatcher()
	if err != nil {
		return fmt.Errorf("failed to create watcher: %w", err)
	}
	defer w.Close()

	go func() {
		if err := w.Add(e.wd); err != nil {
			errs <- fmt.Errorf("failed to watch %s: %w", e.wd, err)
		}
		for {
			select {
			case ev := <-w.Events:
				e.debugf("change: %v", ev)
				if err := e.execute(); err != nil {
					e.debugf("failed to execute: %w", err)
				}
			case err := <-w.Errors:
				if err != nil {
					e.debugf("error from filewatcher: %w", err)
				}
			}
		}
	}()

	sigs := make(chan os.Signal, 1)
	signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)
	select {
	case <-sigs:
	case err := <-errs:
		return err
	}

	return nil

}
