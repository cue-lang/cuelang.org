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
)

type cmdContext struct {
	// UpdateScripts is consistent with the parameter to testscript.Run's Config
	UpdateScripts bool
}

func TestScripts(t *testing.T) {
	cmds := cmdContext{
		UpdateScripts: os.Getenv("CUE_UPDATE") != "",
	}
	testscript.Run(t, testscript.Params{
		UpdateScripts: cmds.UpdateScripts,
		Dir:           "testdata",
		Setup:         setup,
		Cmds: map[string]func(ts *testscript.TestScript, neg bool, args []string){
			// "add":    cmds.addCmd,
			// "remove": cmds.removeCmd,
			// "close": cmds.closeCmd,
			"touch": cmds.touchCmd,
			"sleep": cmds.sleepCmd,
			"log":   cmds.logCmd,
		},
	})
}

type watcherLog struct {
	*fsnotify.Watcher

	logLock sync.Mutex
	log     *bytes.Buffer
}

func newWatcherLog(basedir, gittoplevel string) (*watcherLog, error) {
	w, err := fsnotify.NewWatcher(basedir, gittoplevel, fsnotify.Debug(os.Stderr))
	if err != nil {
		return nil, fmt.Errorf("failed to create a watcher: %w", err)
	}

	res := &watcherLog{
		Watcher: w,
		log:     bytes.NewBuffer(nil),
	}

	return res, nil
}

func (tw *watcherLog) logf(format string, args ...any) {
	tw.logLock.Lock()
	defer tw.logLock.Unlock()
	fmt.Fprintf(tw.log, format, args...)
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
		l: &watcherLog{
			log: bytes.NewBuffer(nil),
		},
	}
	// Establish $HOME for a clean git configuration
	homeDir := filepath.Join(e.Cd, ".home")
	if err := os.Mkdir(homeDir, 0777); err != nil {
		return fmt.Errorf("failed to create HOME at %s: %w", homeDir, err)
	}
	e.Setenv("HOME", homeDir)
	// Find the special ._basedir and ._gittoplevel files to determine the
	// parameters to newTestWatcher. Search breadth-first.
	var _basedir, _gittoplevel *string
	toWalk := []string{e.Cd}
Walk:
	for len(toWalk) > 0 {
		var dir string
		dir, toWalk = toWalk[0], toWalk[1:]
		dirEntries, err := os.ReadDir(dir)
		if err != nil {
			return fmt.Errorf("failed in search for .basedir and .gitTopLevel")
		}
		for _, dirEntry := range dirEntries {
			if dirEntry.IsDir() {
				toWalk = append(toWalk, filepath.Join(dir, dirEntry.Name()))
				continue
			}
			if !dirEntry.Type().IsRegular() {
				continue
			}
			if _basedir == nil && dirEntry.Name() == ".basedir" {
				_basedir = &dir
			}
			if _gittoplevel == nil && dirEntry.Name() == ".gittoplevel" {
				_gittoplevel = &dir
			}
			if _basedir != nil && _gittoplevel != nil {
				break Walk
			}
		}
	}
	if _basedir == nil {
		return fmt.Errorf("failed to find special .basedir file")
	}
	s.basedir = *_basedir
	if _gittoplevel != nil {
		s.gittoplevel = *_gittoplevel
		s.run(s.gittoplevel, "git", "init")
		s.run(s.gittoplevel, "git", "config", "user.name", "blah")
		s.run(s.gittoplevel, "git", "config", "user.email", "blah@blah.com")
		s.run(s.gittoplevel, "git", "add", "-A")
		s.run(s.gittoplevel, "git", "commit", "-m", "initial commit")
	}

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
	basedir     string
	gittoplevel string
}

func (s setupCtx) watcher() error {
	w, err := fsnotify.NewWatcher(s.basedir, s.gittoplevel, fsnotify.Debug(os.Stderr))
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
				rel, err := filepath.Rel(s.basedir, ev.Name)
				if err != nil {
					s.l.logf("error: failed to derive %q relative to %q: %v", ev.Name, s.basedir, err)
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
	w, err := fsnotify.NewBatchedWatcher(s.basedir, s.gittoplevel, d, fsnotify.Debug(os.Stderr))
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
					rel, err := filepath.Rel(s.basedir, ev.Name)
					if err != nil {
						s.l.logf("error: failed to derive %q relative to %q: %v", ev.Name, s.basedir, err)
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

func (c cmdContext) testWatcher(ts *testscript.TestScript) *watcherLog {
	tw, ok := ts.Value(watcherLogKey).(*watcherLog)
	if !ok {
		ts.Fatalf("failed to find watcher")
	}
	return tw
}

// add takes a single argument, the directory to add recursively
// func (c cmdContext) addCmd(ts *testscript.TestScript, neg bool, args []string) {
// 	c.doOp("add", (*fsnotify.Watcher).Add, ts, neg, args)
// }

// remove takes a single argument, the directory to remove recursively
// func (c cmdContext) removeCmd(ts *testscript.TestScript, neg bool, args []string) {
// 	c.doOp("remove", (*fsnotify.Watcher).Add, ts, neg, args)
// }

// close takes no arguments. It shuts down the watcher
// func (c cmdContext) closeCmd(ts *testscript.TestScript, neg bool, args []string) {
// 	if neg {
// 		ts.Fatalf("cannot negate close")
// 	}
// 	if len(args) != 0 {
// 		ts.Fatalf("close does not take any arguments")
// 	}
// 	tw := c.testWatcher(ts)
// 	if err := tw.Close(); err != nil {
// 		ts.Fatalf("failed to close watcher: %v", err)
// 	}
// }

// func (c cmdContext) doOp(o string, fn func(*fsnotify.Watcher, string) error, ts *testscript.TestScript, neg bool, args []string) {
// 	if neg {
// 		ts.Fatalf("cannot negate %v", o)
// 	}
// 	nArgs := 1
// 	if l := len(args); l != nArgs {
// 		ts.Fatalf("%v expected %d arg; got %d", o, nArgs, l)
// 	}
// 	tw := c.testWatcher(ts)
// 	err := fn(tw.Watcher, ts.MkAbs(args[0]))
// 	if err != nil {
// 		ts.Fatalf("could not perform %v: %v", o, err)
// 	}
// }

// log takes zero arguments. It dumps the log since the last call log (or since
// the beginning of time if there was no such call) to stdout.
func (c cmdContext) logCmd(ts *testscript.TestScript, neg bool, args []string) {
	if len(args) != 0 {
		ts.Fatalf("log takes no arguments")
	}
	if neg {
		ts.Fatalf("log cannot be negated")
	}
	// Snapshot the log
	tw := c.testWatcher(ts)
	tw.logLock.Lock()
	got, err := io.ReadAll(tw.log)
	tw.logLock.Unlock()
	if err != nil {
		ts.Fatalf("failed to read log: %v", err)
	}
	fmt.Fprintf(ts.Stdout(), "%s", got)
}

// touch takes a list of files to touch, like the unix touch command
func (c cmdContext) touchCmd(ts *testscript.TestScript, neg bool, args []string) {
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
func (c cmdContext) sleepCmd(ts *testscript.TestScript, neg bool, args []string) {
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
