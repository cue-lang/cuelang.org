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

package fsnotify

import (
	"fmt"
	"io"
	"io/fs"
	"os"
	"path/filepath"
	"sort"
	"strings"

	"github.com/fsnotify/fsnotify"
)

type Watcher[T any] interface {
	Events() <-chan T
	Errors() <-chan error
	Close() error
}

// RecursiveWatcher is an instance of a recursive watcher. Create a new
// RecursiveWatcher via NewRecursiveWatcher.
type RecursiveWatcher struct {
	// rootDir is the root directory we are recursively watching.
	rootDir string

	// gitDir is set if the watcher is configured to also watch for git events.
	// See the NewWatcher for an explanation of which git events are recognised.
	gitDir string

	// gitLockFile is set if the watcher is configured to watch for git events.
	// It is a convenience value for use in other methods, that is the absolute
	// file path of the index.lock file in the git repository that containes
	// rootDir.
	gitLockFile string

	// w is the underlying fsnotify watcher used for watching.
	w *fsnotify.Watcher

	// events is a proxy to the events channel exposed by fsnotify
	events chan fsnotify.Event

	// errors is proxy for errors passed from fsnotify
	errors chan error

	// watchers is a set of dir paths for which we have active watchers.
	//
	// TODO there might be a more efficient data structure here.
	watchers map[string]struct{}

	// doneClose indicates that we are done handling the close from the
	// underlying fsnotify
	doneClose chan struct{}

	// debug can be set to an io.Writer in order to log debug-level information
	debug io.Writer
}

var _ Watcher[fsnotify.Event] = (*RecursiveWatcher)(nil)

// NewRecursiveWatcher creates a new recursive watcher rooted at directory rootDir.
func NewRecursiveWatcher(rootDir string, opts ...Option) (*RecursiveWatcher, error) {
	rw, _, err := newRecursiveWatcher(rootDir, "", opts...)
	return rw, err
}

// newRecursiveWatcher creates a new recursive watcher rooted at directory
// rootDir. If gittoplevel is non-empty, then the $gittoplevel/.git is watched
// for for an index.lock file that signals git operations. This allows a
// consumer of Events to ignore or batch events that are received whilst a git
// operation is in progress, a batch of events that can be handled in some when
// when the git operation completes. In glob terms, if gittoplevel where non
// empty, the Events channel would contain events for
// $gittoplevel/.git/index.lock and dir/**/* (including directories).  If
// gittoplevel is supplied, dir must be a subdirectory of gittoplevel.
func newRecursiveWatcher(rootDir, gittoplevel string, opts ...Option) (*RecursiveWatcher, *options, error) {
	if rootDir != gittoplevel && !strings.HasPrefix(rootDir, gittoplevel+string(os.PathSeparator)) {
		return nil, nil, fmt.Errorf("%s is not a subdirectory of %s", rootDir, gittoplevel)
	}
	var gitDir, gitLockfile string
	if gittoplevel != "" {
		gitDir = filepath.Join(gittoplevel, ".git")
		gitLockfile = filepath.Join(gitDir, "index.lock")
	}
	uw, err := fsnotify.NewWatcher()
	if err != nil {
		return nil, nil, fmt.Errorf("failed to create fsnotify watcher: %w", err)
	}

	res := &RecursiveWatcher{
		rootDir:     rootDir,
		gitDir:      gitDir,
		gitLockFile: gitLockfile,
		w:           uw,
		events:      make(chan fsnotify.Event),
		errors:      make(chan error),
		watchers:    make(map[string]struct{}),
		doneClose:   make(chan struct{}),
	}

	theOpts := new(options)
	for _, v := range opts {
		if v == nil {
			continue
		}
		v(theOpts)
	}
	res.debug = theOpts.debug

	// Recursively add rootDir. Because we are not yet in the main event loop,
	// we can be more aggressive in reporting errors.
	if err = res.addDir(rootDir, false); err != nil {
		// Best-efforts close of underlying fsnotify
		res.w.Close()
		return nil, nil, err
	}

	// If we are configured to watch for git events, add a watch on the git
	// directory.
	if gitDir != "" {
		if err := res.w.Add(gitDir); err != nil {
			// Best-efforts close of underlying fsnotify
			res.w.Close()
			return nil, nil, err
		}
	}

	go res.runEventLoop()

	return res, theOpts, nil

}

func (w *RecursiveWatcher) Events() <-chan fsnotify.Event {
	return w.events
}

func (w *RecursiveWatcher) Errors() <-chan error {
	return w.errors
}

// Close shuts down the watcher, by removing all watches and closing the Events
// channel.
func (w *RecursiveWatcher) Close() error {
	if err := w.w.Close(); err != nil {
		return fmt.Errorf("failed to shutdown underlying fsnotify watcher: %w", err)
	}
	<-w.doneClose
	return nil
}

// runEventLoop is the main event loop of a Watcher. It is mainly responsible
// for maintaining the recursive nature of the watcher, but also for filtering
// events on git special files to only allow index.lock events through if
// w.gitDir is non empty (i.e. we are configured to watch for git events). It
// is otherwise responsible for proxying events from the underlying watcher
// that result from the recursive watches we have added.
func (w *RecursiveWatcher) runEventLoop() {
Forever:
	for {
		select {
		case ev, ok := <-w.w.Events:
			// TODO handle event with respect to adding more watchers etc, i.e.
			// when a new directory is added
			if !ok {
				// Pass on the close
				close(w.events)
				break Forever
			}

			// Ignore all .git events except the lock file if w.gitDir != ""
			// Note that we need only check the containing directory of the
			// event name for equality vs the gitDir because we do not
			// recursively watch the .git dir.
			if w.gitDir != "" && ev.Name != w.gitLockFile && (ev.Name == w.gitDir || filepath.Dir(ev.Name) == w.gitDir) {
				continue
			}

			w.debugf("event: path: %v, op: %v\n", ev.Name, ev.Op)

			if err := w.handleEvent(ev); err != nil {
				w.errors <- err
			}

			// Finally relay the event, regardless of whether our processing
			// encountered an error. If the event comes from w.gitDir, only
			// relay the events for index.lock
			w.events <- ev
		case err := <-w.w.Errors:
			w.errors <- err
		}
	}
	close(w.doneClose)
}

// handleEvent reacts to the event ev by adding/removing watchers
// or doing nothing at all. Handling an event is inherently racey and
// so this method is largely tolerant of errors, i.e. they are ignored.
// Everything is on a best-efforts basis, but the state of w.watches
// must remain intact. i.e. we only have entries in w.watches iff we
// successfully added a watcher.
func (w *RecursiveWatcher) handleEvent(ev fsnotify.Event) error {
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
		w.addDir(ev.Name, true)
	case fsnotify.Rename:
		// nothing to do; the watcher remains entact per underlying fsnotify docs.
		// for fsnotify.Watcher.Add.
	}

	return nil
}

// addDir recursively adds watches on dir, ignoring errors if ignoreErrors is
// set.
func (w *RecursiveWatcher) addDir(dir string, ignoreErrors bool) error {
	return filepath.WalkDir(dir, func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			// Don't descend
			return fs.SkipDir
		}
		// Only need to do something when we see a directory
		if !d.IsDir() {
			return nil
		}
		// Do not descend into gitDir if set. Note there is logic in Watcher.run
		// that relies on this not being recursive.
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

// debugf debug-level logs the fmt formatted format and args to w.debug if it
// is non-nil.
func (w *RecursiveWatcher) debugf(format string, args ...any) {
	if format == "" || format[len(format)-1] != '\n' {
		format += "\n"
	}
	if w.debug != nil {
		fmt.Fprintf(w.debug, format, args...)
	}
}
