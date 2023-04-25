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

package fsnotify_test

import (
	"bytes"
	"fmt"
	"io"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
	"sync"
	"testing"
	"time"

	"github.com/cue-lang/cuelang.org/internal/fsnotify"
	"github.com/rogpeppe/go-internal/testscript"
)

const (
	watcherLogKey = "watcherlog"

	rootdirFilename     = ".rootdir"
	gittoplevelFilename = ".gittoplevel"
)

func TestScripts(t *testing.T) {
	testscript.Run(t, testscript.Params{
		UpdateScripts: os.Getenv("CUE_UPDATE") != "",
		Dir:           "testdata",
		Setup:         setup,
		Cmds: map[string]func(ts *testscript.TestScript, neg bool, args []string){
			"touch": touchCmd,
			"sleep": sleepCmd,
			"log":   logCmd,
		},
	})
}

func setup(e *testscript.Env) (err error) {
	defer func() {
		switch r := recover().(type) {
		case nil:
		case cmdError:
			err = r
		default:
			panic(r)
		}
	}()

	s := setupCtx{
		e: e,
		l: &watcherLog{log: bytes.NewBuffer(nil)},
	}

	// Establish $HOME for a clean git configuration
	homeDir := filepath.Join(e.Cd, ".home")
	if err := os.Mkdir(homeDir, 0777); err != nil {
		return fmt.Errorf("failed to create HOME at %s: %w", homeDir, err)
	}
	e.Setenv("HOME", homeDir)

	if err := s.findSpecialFiles(); err != nil {
		return err
	}

	// Run git setup if we have a configured gittoplevel
	if s.gittoplevel != "" {
		s.rungit("init")
		s.rungit("config", "user.name", "blah")
		s.rungit("config", "user.email", "blah@blah.com")
		s.rungit("add", "-A")
		s.rungit("commit", "-m", "initial commit")
	}

	// Pass the watcherLog to the log command
	e.Values[watcherLogKey] = s.l

	// If there is a .batched file in e.Cd, we want a BatchedWatcher. If it has
	// non-empty contents, they should parse to a time.Duration
	batchedFn := filepath.Join(e.Cd, ".batched")
	if f, err := os.Open(batchedFn); err == nil {
		byts, err := io.ReadAll(f)
		if err != nil {
			return fmt.Errorf("failed to read %s: %w", batchedFn, err)
		}
		dur := strings.TrimSpace(string(byts))
		d, err := time.ParseDuration(dur)
		if err != nil {
			return fmt.Errorf("failed to parse time.Duration from contents of %s: %w", batchedFn, err)
		}
		return s.batchedWatcher(d)
	}

	return s.watcher()
}

type setupCtx struct {
	e           *testscript.Env
	l           *watcherLog
	rootdir     string
	gittoplevel string
}

// findSpecialFiles walks the directory rooted at s.e.Cd to find special files
// that indicate where our watcher should be established, but also where the
// git directory is rooted.
func (s *setupCtx) findSpecialFiles() error {
	var _rootdir, _gittoplevel *string
	toWalk := []string{s.e.Cd}
Walk:
	for len(toWalk) > 0 {
		var dir string
		dir, toWalk = toWalk[0], toWalk[1:]
		dirEntries, err := os.ReadDir(dir)
		if err != nil {
			return fmt.Errorf("failed in search for %s and %s", rootdirFilename, gittoplevelFilename)
		}
		for _, dirEntry := range dirEntries {
			if dirEntry.IsDir() {
				toWalk = append(toWalk, filepath.Join(dir, dirEntry.Name()))
				continue
			}
			if !dirEntry.Type().IsRegular() {
				continue
			}
			if _rootdir == nil && dirEntry.Name() == rootdirFilename {
				_rootdir = &dir
			}
			if _gittoplevel == nil && dirEntry.Name() == gittoplevelFilename {
				_gittoplevel = &dir
			}
			if _rootdir != nil && _gittoplevel != nil {
				break Walk
			}
		}
	}
	if _rootdir == nil {
		return fmt.Errorf("failed to find special %s file", rootdirFilename)
	}
	s.rootdir = *_rootdir
	if _gittoplevel != nil {
		s.gittoplevel = *_gittoplevel
	}
	return nil
}

func (s setupCtx) watcher() error {
	w, err := fsnotify.NewRecursiveWatcher(s.rootdir, fsnotify.Debug(os.Stderr))
	if err != nil {
		return fmt.Errorf("failed to create a Watcher: %w", err)
	}
	s.e.Defer(func() {
		w.Close()
	})
	go func() {
		for {
			select {
			case ev, ok := <-w.Events:
				if !ok {
					// Events have been stopped
					return
				}
				// Make ev.Name relative for logging
				rel, err := filepath.Rel(s.rootdir, ev.Name)
				if err != nil {
					s.l.logf("error: failed to derive %q relative to %q: %v", ev.Name, s.rootdir, err)
				} else {
					ev.Name = rel
					s.l.logf("name: %s, op: %v\n", ev.Name, ev.Op)
				}
			case err := <-w.Errors:
				s.l.logf("error: %v", err)
			}
		}
	}()
	return nil
}

func (s setupCtx) batchedWatcher(d time.Duration) error {
	w, err := fsnotify.NewRecursiveBatchedWatcher(s.rootdir, s.gittoplevel, d, fsnotify.Debug(os.Stderr))
	if err != nil {
		return fmt.Errorf("failed to create a Watcher: %w", err)
	}
	s.e.Defer(func() {
		w.Close()
	})
	go func() {
		for {
			select {
			case evs, ok := <-w.Events:
				if !ok {
					// Events have been stopped
					return
				}
				var sb strings.Builder
				sb.WriteString("events [\n")
				for _, ev := range evs {
					// Make ev.Name relative for logging
					rel, err := filepath.Rel(s.rootdir, ev.Name)
					if err != nil {
						s.l.logf("error: failed to derive %q relative to %q: %v", ev.Name, s.rootdir, err)
					} else {
						ev.Name = rel
						sb.WriteString(fmt.Sprintf("  name: %s, op: %v\n", ev.Name, ev.Op))
					}
				}
				sb.WriteString("]\n")
				s.l.logf(sb.String())
			case err := <-w.Errors:
				s.l.logf("error: %v", err)
			}
		}
	}()
	return nil
}

func (s *setupCtx) rungit(args ...string) {
	s.run(s.gittoplevel, "git", args...)
}

func (s *setupCtx) run(dir, cmd string, args ...string) {
	c := exec.Command(cmd, args...)
	c.Dir = dir
	c.Env = s.e.Vars
	byts, err := c.CombinedOutput()

	if err != nil {
		panic(cmdError{fmt.Errorf("failed to run %v: %w\n%s", c, err, byts)})
	}
}

type cmdError struct {
	error
}

func getWatcherLog(ts *testscript.TestScript) *watcherLog {
	tw, ok := ts.Value(watcherLogKey).(*watcherLog)
	if !ok {
		ts.Fatalf("failed to find watcher")
	}
	return tw
}

// log takes zero arguments. It dumps the log since the last call log (or since
// the beginning of time if there was no such call) to stdout.
func logCmd(ts *testscript.TestScript, neg bool, args []string) {
	if len(args) != 0 {
		ts.Fatalf("log takes no arguments")
	}
	if neg {
		ts.Fatalf("log cannot be negated")
	}
	// Snapshot the log
	tw := getWatcherLog(ts)
	tw.logLock.Lock()
	got, err := io.ReadAll(tw.log)
	tw.logLock.Unlock()
	if err != nil {
		ts.Fatalf("failed to read log: %v", err)
	}
	fmt.Fprintf(ts.Stdout(), "%s", got)
}

// touch takes a list of files to touch, like the unix touch command
func touchCmd(ts *testscript.TestScript, neg bool, args []string) {
	if neg {
		ts.Fatalf("touch cannot be negated")
	}
	now := time.Now()
	for _, v := range args {
		v = ts.MkAbs(v)
		if err := os.Chtimes(v, now, now); err != nil {
			ts.Fatalf("failed to touch %s: %v", v, err)
		}
	}
}

// sleep optionally takes a single argument, a time.Duration that can be parsed
// by time.ParseDuration, and sleeps for that length of time. If no duration is
// passed then a sensible default value is used, a default that works in "most"
// situations.
func sleepCmd(ts *testscript.TestScript, neg bool, args []string) {
	if neg {
		ts.Fatalf("sleep cannot be negated")
	}
	var d time.Duration
	var err error
	switch len(args) {
	case 0:
		d = 10 * time.Millisecond
	case 1:
		ds := args[0]
		d, err = time.ParseDuration(ds)
		if err != nil {
			ts.Fatalf("failed to parse %q as a time.Duration: %v", ds, err)
		}
	default:
		ts.Fatalf("sleep takes at most one argument")
	}
	time.Sleep(d)
}

// watcherLog is a mutex-guarded bytes.Buffer. Events are logged to this
// buffer, and periodically the buffer is read by the log testscript builtin.
type watcherLog struct {
	logLock sync.Mutex
	log     *bytes.Buffer
}

func (tw *watcherLog) logf(format string, args ...any) {
	tw.logLock.Lock()
	defer tw.logLock.Unlock()
	fmt.Fprintf(tw.log, format, args...)
}
