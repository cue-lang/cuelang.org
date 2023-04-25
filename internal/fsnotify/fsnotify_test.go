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
	"flag"
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

var (
	fDebug = flag.Bool("debug", false, "debug logging for tests")
)

const (
	setupContextKey     = "setupContextKey"
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
			// "tick":  tickCmd,
		},
	})
}

func setup(e *testscript.Env) (err error) {
	defer func() {
		r := recover()
		switch r := r.(type) {
		case nil:
		case cmdError:
			err = r
		default:
			panic(r)
		}
	}()

	s := &setupCtx{
		Env: e,
		log: &watcherLog{log: bytes.NewBuffer(nil)},
	}
	e.Values[setupContextKey] = s

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

	// If there is a .batched file in e.Cd, we want a BatchedWatcher. If it has
	// non-empty contents, they should parse to a time.Duration
	var h specialHander
	var herr error
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
		h, herr = s.batchedWatcher(d)
	} else {
		h, herr = s.watcher()
	}
	s.hander = h
	return herr
}

type setupCtx struct {
	*testscript.Env
	hander      specialHander
	log         *watcherLog
	rootdir     string
	gittoplevel string
}

// findSpecialFiles walks the directory rooted at s.e.Cd to find special files
// that indicate where our watcher should be established, but also where the
// git directory is rooted.
func (s *setupCtx) findSpecialFiles() error {
	var _rootdir, _gittoplevel *string
	toWalk := []string{s.Cd}
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

func debugOpt() fsnotify.Option {
	if *fDebug {
		return fsnotify.Debug(os.Stderr)
	}
	return nil
}

func (s *setupCtx) watcher() (specialHander, error) {
	w, err := fsnotify.NewRecursiveWatcher(s.rootdir, debugOpt())
	if err != nil {
		return nil, fmt.Errorf("failed to create a Watcher: %w", err)
	}
	s.Defer(func() {
		w.Close()
	})
	bwh := newBatchedWatcherHandler[fsnotify.Event](s, w, handleEvent)
	s.hander = bwh
	go bwh.run()
	return bwh, nil
}

func (s *setupCtx) batchedWatcher(d time.Duration) (specialHander, error) {
	bw, err := fsnotify.NewBatchedRecursiveWatcher(s.rootdir, s.gittoplevel, d, debugOpt())
	if err != nil {
		return nil, fmt.Errorf("failed to create a Watcher: %w", err)
	}
	s.Defer(func() {
		bw.Close()
	})
	bwh := newBatchedWatcherHandler[[]fsnotify.Event](s, bw, handleSliceEvent)
	go bwh.run()
	return bwh, nil
}

type specialHander interface {
	SpecialWatch() chan string
	SpecialWait() chan struct{}
}

func newBatchedWatcherHandler[T any](s *setupCtx, w fsnotify.Watcher[T], handler eventHandler[T]) *batchedWatcherHandler[T] {
	return &batchedWatcherHandler[T]{
		s:            s,
		w:            w,
		specialWatch: make(chan string),
		specialWait:  make(chan struct{}),
		handler:      handler,
	}
}

type eventHandler[T any] func(*batchedWatcherHandler[T], string, T) string

type batchedWatcherHandler[T any] struct {
	s            *setupCtx
	w            fsnotify.Watcher[T]
	specialWatch chan string
	specialWait  chan struct{}
	handler      eventHandler[T]
}

var _ specialHander = (*batchedWatcherHandler[fsnotify.Event])(nil)

func (b *batchedWatcherHandler[T]) SpecialWatch() chan string {
	return b.specialWatch
}

func (b *batchedWatcherHandler[T]) SpecialWait() chan struct{} {
	return b.specialWait
}

func (b *batchedWatcherHandler[T]) run() {
	var specialFile string
	w := b.w
	for {
		select {
		case f := <-b.specialWatch:
			if specialFile != "" {
				panic(fmt.Errorf("specialFile already set to %q; tried to set to %q", specialFile, f))
			}
			specialFile = f
		case evs, ok := <-w.Events():
			if !ok {
				// Events have been stopped
				return
			}
			specialFile = b.handler(b, specialFile, evs)
		case err := <-w.Errors():
			b.s.log.logf("error: %v", err)
		}
	}
}

func handleEvent(b *batchedWatcherHandler[fsnotify.Event], specialFile string, ev fsnotify.Event) string {
	// Make ev.Name relative for logging
	rel, err := filepath.Rel(b.s.rootdir, ev.Name)
	if err != nil {
		b.s.log.logf("error: failed to derive %q relative to %q: %v", ev.Name, b.s.rootdir, err)
	} else {
		b.s.log.logf("name: %s, op: %v\n", rel, ev.Op)
	}
	if ev.Name == specialFile {
		b.specialWait <- struct{}{}
		return ""
	}
	return specialFile
}

func handleSliceEvent(b *batchedWatcherHandler[[]fsnotify.Event], specialFile string, evs []fsnotify.Event) string {
	var sb strings.Builder
	var sawSpecial bool
	sb.WriteString("events [\n")
	for _, ev := range evs {
		if ev.Name == specialFile {
			sawSpecial = true
		}
		// Make ev.Name relative for logging
		rel, err := filepath.Rel(b.s.rootdir, ev.Name)
		if err != nil {
			b.s.log.logf("error: failed to derive %q relative to %q: %v", ev.Name, b.s.rootdir, err)
		} else {
			sb.WriteString(fmt.Sprintf("  name: %s, op: %v\n", rel, ev.Op))
		}
	}
	sb.WriteString("]\n")
	b.s.log.logf(sb.String())
	if sawSpecial {
		b.specialWait <- struct{}{}
		return ""
	}
	return specialFile
}

func (s *setupCtx) rungit(args ...string) {
	s.run(s.gittoplevel, "git", args...)
}

func (s *setupCtx) run(dir, cmd string, args ...string) {
	c := exec.Command(cmd, args...)
	c.Dir = dir
	c.Env = s.Vars
	byts, err := c.CombinedOutput()

	if err != nil {
		panic(cmdError{fmt.Errorf("failed to run %v: %w\n%s", c, err, byts)})
	}
}

type cmdError struct {
	error
}

// log dumps the log since the last call to log (or since the beginning of time
// if this is the first such call in a script) to stdout. It optionally takes a
// single argument, a path to the special file to use.
func logCmd(ts *testscript.TestScript, neg bool, args []string) {
	if neg {
		ts.Fatalf("log cannot be negated")
	}
	if len(args) > 1 {
		ts.Fatalf("log takes at most one argument")
	}

	sc, ok := ts.Value(setupContextKey).(*setupCtx)
	if !ok {
		ts.Fatalf("failed to find batchedWatcherHandler - are we in a batched watcher test?")
	}

	sf := filepath.Join(sc.rootdir, ".special")
	if len(args) == 1 {
		sf = ts.MkAbs(args[0])
	}
	sf = ts.MkAbs(sf)

	done := make(chan struct{})
	go func() {
		<-sc.hander.SpecialWait()
		close(done)
	}()

	// Tell the handler about the special file
	sc.hander.SpecialWatch() <- sf

	// Now touch the special file
	now := time.Now()
	if err := os.Chtimes(sf, now, now); err != nil {
		ts.Fatalf("failed to touch special file %s: %v", sf, err)
	}

	// Wait till we hear back
	<-done

	// Snapshot the log
	snapshot, err := sc.log.snapshot()
	if err != nil {
		ts.Fatalf("failed to snapshot watcher log: %v", err)
	}
	fmt.Fprintf(ts.Stdout(), "%s", snapshot)
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

// tick simulate a timer tick on a batched watcher. This allows us
// to ensure tick "edges" happen at well-defined times in tests.
// func tickCmd(ts *testscript.TestScript, neg bool, args []string) {
// 	mt, ok := ts.Value(manualTickerKey).(*manualTicker)
// 	if !ok {
// 		ts.Fatalf("no batchedWatcher found - is this a BatchedWatcher test?")
// 	}

// 	select {
// 	case mt.c <- time.Now():
// 	default:
// 		// The send on tickC could not proceed
// 		ts.Fatalf("failed to simulate tick")
// 	}
// }

// sleep optionally takes a single argument, a time.Duration that can be parsed
// by time.ParseDuration, and sleeps for that length of time. If no duration is
// passed then a sensible default value is used, a default that works in "most"
// situations.
func sleepCmd(ts *testscript.TestScript, neg bool, args []string) {
	if neg {
		ts.Fatalf("sleep cannot be negated")
	}
	if len(args) > 1 {
		ts.Fatalf("sleep takes at most one argument")
	}
	doSleep(ts, args)
}

func doSleep(ts *testscript.TestScript, args []string) {
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
		panic("should not be here")
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

func (tw *watcherLog) snapshot() ([]byte, error) {
	tw.logLock.Lock()
	got, err := io.ReadAll(tw.log)
	tw.logLock.Unlock()
	return got, err
}
