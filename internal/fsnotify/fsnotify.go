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

// Package fsnotify is a light wrapper around github.com/fsnotify/fsnotify that
// allows for recursively watching directories, and provides a simple interface
// for batching events.
package fsnotify

import (
	"fmt"
	"io"
	"io/fs"
	"os"
	"path/filepath"
	"sort"
	"strings"
	"time"

	"github.com/fsnotify/fsnotify"
)

//go:generate go run golang.org/x/tools/cmd/stringer -type=opType -linecomment
type opType uint

const (
	addOpType    opType = iota // add
	removeOpType               // remove
)

type op struct {
	// op tells us what to do, Add or Remove
	o opType

	// dir is the argument to the op. A directory generally.
	dir string

	// err is the channel on which an error reported by an op
	// is reported
	err chan error
}

func newOp(o opType, dir string) op {
	return op{
		dir: dir,
		o:   o,
		err: make(chan error),
	}
}

type Watcher struct {
	// rootDir is the root directory we are recursively watching. If rootDir is
	// part of a git repository (such that git rev-parse --show-toplevel hsa a 0
	// exit code with the path of the root of the git repository) then events
	// are ignored for the duration of a git operation, and the end of the git
	// operation is signalled by a special event on the $repoDir/.git/index.lock
	// file. Note that this file might exist in a parent directory to rootDir.
	rootDir string

	// gitDir is set if the watcher is configured to watch for git events.
	gitDir string

	// w is the fsnotify watcher we use under the covers.
	w *fsnotify.Watcher

	// ops is the channel on which commands are sent to the control loop.
	// ops chan op

	// Events is a proxy to the Events channel exposed by fsnotify
	Events chan fsnotify.Event

	// Errors is proxy for errors passed from fsnotify
	Errors chan error

	// watchers is a set of dir paths for which we have active watchers.
	watchers map[string]struct{}

	// doneClose indicates that we are done handling the close from the
	// underlying fsnotify
	doneClose chan struct{}

	// debug can be set to an io.Writer in order to log debug-level information
	debug io.Writer
}

type watch struct {
	watching bool
	watches  map[string]*watch
}

// NewWatcher creates a new recursive watcher rooted at directory dir. If
// gittoplevel is non-empty, then the $gittoplevel/.git is watched for for an
// index.lock file that signals git operations. This allows a consumer of
// Events to ignore or batch events that are received whilst a git operation is
// in progress, a batch of events that can be handled in some when when the git
// operation completes. In glob terms, the Events channel will therefore
// contain events for $gittoplevel/.git/index.lock and dir/**/* (including
// directories).  If gittoplevel is supplied, dir must be a subdirectory of
// gittoplevel.
func NewWatcher(dir, gittoplevel string, opts ...Option) (*Watcher, error) {
	if dir != gittoplevel && !strings.HasPrefix(dir, gittoplevel+string(os.PathSeparator)) {
		return nil, fmt.Errorf("%s is not a subdirectory of %s", dir, gittoplevel)
	}
	var gitDir string
	if gittoplevel != "" {
		gitDir = filepath.Join(gittoplevel, ".git")
	}
	uw, err := fsnotify.NewWatcher()
	if err != nil {
		return nil, fmt.Errorf("failed to create fsnotify watcher: %w", err)
	}

	res := &Watcher{
		rootDir: dir,
		gitDir:  gitDir,
		w:       uw,
		// ops:       make(chan op),
		Events:    make(chan fsnotify.Event),
		Errors:    make(chan error),
		watchers:  make(map[string]struct{}),
		doneClose: make(chan struct{}),
	}

	theOpts := new(options)
	for _, v := range opts {
		v(theOpts)
	}
	res.debug = theOpts.debug

	if err = res.addDir(dir, false); err != nil {
		// Best-efforts close of underlying fsnotify
		res.w.Close()
		return nil, err
	}

	if gitDir != "" {
		if err := res.w.Add(gitDir); err != nil {
			// Best-efforts close of underlying fsnotify
			res.w.Close()
			return nil, err
		}
	}

	go res.run()

	return res, nil
}

type Option option

type option func(p *options)

type options struct {
	debug io.Writer
}

func Debug(w io.Writer) Option {
	return func(o *options) {
		o.debug = w
	}
}

func NewBatchedWatcher(dir, gittoplevel string, batchWindow time.Duration, opts ...Option) (*BatchedWatcher, error) {
	w, err := NewWatcher(dir, gittoplevel, opts...)
	if err != nil {
		return nil, err
	}
	res := &BatchedWatcher{
		w:           w,
		Events:      make(chan []fsnotify.Event),
		Errors:      w.Errors,
		batchWindow: batchWindow,
	}

	go res.run()

	return res, nil
}

type BatchedWatcher struct {
	w              *Watcher
	Events         chan []fsnotify.Event
	Errors         chan error
	ticker         *time.Ticker
	batchWindow    time.Duration
	buffer         []fsnotify.Event
	inGitOperation bool
}

func (bw *BatchedWatcher) run() {
	gitDir := bw.w.gitDir
	lockFile := filepath.Join(gitDir, "index.lock")
	for {
		var tick <-chan time.Time
		if bw.ticker != nil {
			tick = bw.ticker.C
		}
		select {
		case ev, ok := <-bw.w.Events:
			if !ok {
				// Closed
				return
			}
			switch {
			case ev.Name == lockFile:
				startOfGitOp := !bw.inGitOperation && ev.Op == fsnotify.Create
				endOfGitOp := bw.inGitOperation && ev.Op == fsnotify.Rename
				if startOfGitOp {
					bw.inGitOperation = true
					bw.flush()
				}
				if endOfGitOp {
					bw.inGitOperation = false
					bw.buffer = append(bw.buffer, ev)
					bw.flush()
				}
				continue
			case ev.Name == gitDir || filepath.Dir(ev.Name) == gitDir:
				continue
			}

			if bw.ticker == nil {
				bw.ticker = time.NewTicker(bw.batchWindow)
			}
			bw.buffer = append(bw.buffer, ev)
		case <-tick:
			if len(bw.buffer) == 0 {
				panic("oh dear")
			}
			bw.flush()
		}
	}
}

func (bw *BatchedWatcher) flush() {
	// bw.ticker would be nil if we are eagerly flushing at the start
	// of a git operation.
	if bw.ticker != nil {
		bw.ticker.Stop()
	}
	bw.ticker = nil
	if len(bw.buffer) == 0 {
		return
	}
	bw.Events <- bw.buffer
	bw.buffer = nil
}

func (bw *BatchedWatcher) Close() error {
	return bw.w.Close()
}

func (w *Watcher) debugf(format string, args ...any) {
	if w.debug != nil {
		fmt.Fprintf(w.debug, format, args...)
	}
}

func (w *Watcher) run() {
Forever:
	for {
		select {
		case ev, ok := <-w.w.Events:
			// TODO handle event with respect to adding more watchers etc, i.e.
			// when a new directory is added
			if !ok {
				// Pass on the close
				close(w.Events)
				break Forever
			}

			w.debugf("event: path: %v, op: %v\n", ev.Name, ev.Op)
			if err := w.run_handleEvent(ev); err != nil {
				w.Errors <- err
			}

			// Finally relay the event, regardless of whether our processing
			// encountered an error. If the event comes from w.gitDir, only
			// relay the events for index.lock
			if w.gitDir != "" && filepath.Dir(ev.Name) == w.gitDir && filepath.Base(ev.Name) != "index.lock" {
				continue
			}
			w.Events <- ev
		case err := <-w.w.Errors:
			// TODO any handling required here?
			w.Errors <- err
			// case op := <-w.ops:
			// 	if err := w.run_handleOp(op); err != nil {
			// 		op.err <- err
			// 	} else {
			// 		close(op.err)
			// 	}
		}
	}
	close(w.doneClose)
}

// run_handleEvent reacts to the event ev by adding/removing watchers
// or doing nothing at all. Handling an event is inherently racey and
// so this method is largely tolerant of errors, i.e. they are ignored.
// Everything is on a best-efforts basis, but the state of w.watches
// must remain intact. i.e. we only have entries in w.watches iff we
// successfully added a watcher.
func (w *Watcher) run_handleEvent(ev fsnotify.Event) error {
	// Remember, everything we do here could be racey.

	// If the event is a remove and we have a watcher against that
	// name, then it was a directory (it's gone now) and we need
	// to recursively remove watchers against that name and everything
	// under it.
	switch ev.Op {
	case fsnotify.Remove:
		// If we have a watcher at that path then it is a directory. Remove that
		// watcher path and all watchers that have a directory prefix of the path
		// we just removed.
		if _, ok := w.watchers[ev.Name]; !ok {
			return nil
		}
		// In case it matters, remove the directory watches breadth first.
		var toRemove []string
		dirPrefix := ev.Name + string(os.PathSeparator)
		for k := range w.watchers {
			if k == ev.Name || strings.HasPrefix(k, dirPrefix) {
				toRemove = append(toRemove, k)
			}
		}
		sort.Slice(toRemove, func(i, j int) bool {
			lhs, rhs := toRemove[i], toRemove[j]
			lhsSeps := strings.Count(lhs, string(os.PathSeparator))
			rhsSeps := strings.Count(rhs, string(os.PathSeparator))
			if diff := lhsSeps - rhsSeps; diff != 0 {
				return diff < 0
			}
			return strings.Compare(lhs, rhs) < 0
		})
		for _, v := range toRemove {
			_ = w.w.Remove(v)
			delete(w.watchers, v)
		}
	case fsnotify.Create:
		// Best efforts walk if this is a directory (if it is not it will be an
		// error which we will ignore)
		_ = filepath.WalkDir(ev.Name, func(path string, d fs.DirEntry, err error) error {
			if err != nil {
				return fs.SkipDir
			}
			// Only need to do something when we see a directory
			if !d.IsDir() {
				return nil
			}
			// Only need to create a watcher if we don't have one
			if _, ok := w.watchers[path]; ok {
				return nil
			}
			w.debugf("add: %v\n", path)
			// Try to create a watcher. Only add an entry in w.watches if we succeed
			if err := w.w.Add(path); err == nil {
				w.watchers[path] = struct{}{}
			}
			return nil
		})
	case fsnotify.Rename:
		// nothing to do; the watcher remains entact
	}

	return nil
}

func (w *Watcher) addDir(dir string, ignoreErrors bool) error {
	return filepath.WalkDir(dir, func(path string, d fs.DirEntry, err error) error {
		// Only need to do something when we see a directory
		if !d.IsDir() {
			return nil
		}
		// Do not descend into gitDir if set
		if w.gitDir != "" && w.gitDir == path {
			return fs.SkipDir
		}
		// Only need to create a watcher if we don't have one
		if _, ok := w.watchers[path]; ok {
			return nil
		}
		w.debugf("add: %v\n", path)
		// Try to create a watcher. Only add an entry in w.watches if we succeed
		err = w.w.Add(path)
		if !ignoreErrors && err != nil {
			return err
		}
		if err == nil {
			w.watchers[path] = struct{}{}
		}
		return nil
	})
}

// func (w *Watcher) run_handleOp(op op) error {
// 	// We have a directory. It will be absolute
// 	d := op.dir

// 	switch op.o {
// 	case addOpType:
// 		// Fake a create
// 		return w.run_handleEvent(fsnotify.Event{Name: d, Op: fsnotify.Create})
// 	case removeOpType:
// 		// TODO implement remove
// 	default:
// 		panic("here")
// 	}

// 	return nil
// }

// Add recursively adds watches on absolute directory dir. If a watcher already
// exists on a directory or any directory contained within it, then nothing is
// done. If dir is not absolute, or there was an error adding the watcher, an
// error is
// returned.
// func (w *Watcher) Add(dir string) error {
// 	if !filepath.IsAbs(dir) {
// 		return fmt.Errorf("dir %q is not absolute", dir)
// 	}
// 	o := newOp(addOpType, dir)
// 	w.ops <- o
// 	return <-o.err
// }

// Remove recursively removes any watches on absolutely directory dir. If there
// is no watcher on a directory walked in response to this call then this call
// is a noop. If dir is not absolute, or there was an error remove the watcher,
// an error is returned.
// func (w *Watcher) Remove(dir string) error {
// 	if !filepath.IsAbs(dir) {
// 		return fmt.Errorf("dir %q is not absolute", dir)
// 	}
// 	o := newOp(removeOpType, dir)
// 	w.ops <- o
// 	return <-o.err
// }

// Close shuts down the watcher.
func (w *Watcher) Close() error {
	if err := w.w.Close(); err != nil {
		return fmt.Errorf("failed to shutdown underlying fsnotify watcher: %w", err)
	}
	<-w.doneClose

	return nil
}
