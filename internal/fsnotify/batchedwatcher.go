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
	"path/filepath"
	"time"

	"github.com/fsnotify/fsnotify"
)

// Watcher is an instance of a recursive watcher that batches events. Create a
// new BatchedWatcher via NewBatchedWatcher.
type BatchedWatcher struct {
	// w is the underlying Watcher used to batch events
	w *Watcher

	// Events is the channel over which batches of events are sent.
	Events chan []fsnotify.Event

	// Errors is the channel over which any errors are reported
	Errors chan error

	// ticker is set if the run loop is in the process of batching events.
	ticker *time.Ticker

	// batchWindow is the maximum length of a batch window.
	batchWindow time.Duration

	// buffer is the buffer into which we batch events
	buffer []fsnotify.Event

	// inGitOperation is set when a git operation is in progress.
	inGitOperation bool

	// doneClose indicates that we are done handling the close from the
	// underlying fsnotify
	doneClose chan struct{}
}

// NewRecursiveBatchedWatcher creates a new batched watcher. A BatchedWatcher's
// Events are batched into windows of at most batchWindow duration.
// Furthermore, if gittoplevel is supplied, events received during git
// operations are batched until the end of the git operation. This can mean
// that batch time windows can be less than batchWindow when a git operation
// starts before a time window expires. It can also mean that a batch captures
// events over a time period greater than batchWindow, when a git operation
// exceeds this duration.
func NewRecursiveBatchedWatcher(dir, gittoplevel string, batchWindow time.Duration, opts ...Option) (*BatchedWatcher, error) {
	w, err := newRecursiveWatcher(dir, gittoplevel, opts...)
	if err != nil {
		return nil, err
	}
	res := &BatchedWatcher{
		w:           w,
		Events:      make(chan []fsnotify.Event),
		Errors:      w.Errors,
		batchWindow: batchWindow,
		doneClose:   make(chan struct{}),
	}

	go res.runEventLoop()

	return res, nil
}

// Close shuts down the watcher, by removing all watches and closing the Events
// channel.
func (bw *BatchedWatcher) Close() error {
	if err := bw.w.Close(); err != nil {
		return fmt.Errorf("failed to shutdown underlying Watcher: %w", err)
	}
	<-bw.doneClose
	return nil
}

// runEventLoop is the main event loop of a BatchedWatcher. It is responsible
// for batching events from the underlying Watcher.
func (bw *BatchedWatcher) runEventLoop() {
	gitDir := bw.w.gitDir
	lockFile := bw.w.gitLockFile
Forever:
	for {
		var tick <-chan time.Time
		if bw.ticker != nil {
			tick = bw.ticker.C
		}
		select {
		case ev, ok := <-bw.w.Events:
			if !ok {
				// Pass on the close
				close(bw.Events)
				break Forever
			}
			var startOfGitOp, endOfGitOp bool
			switch {
			case ev.Name == lockFile:
				startOfGitOp = !bw.inGitOperation && ev.Op == fsnotify.Create
				endOfGitOp = bw.inGitOperation && (ev.Op == fsnotify.Rename || ev.Op == fsnotify.Remove)
				if startOfGitOp {
					bw.w.debugf("git: operation: start")
					bw.inGitOperation = true
				}
				if endOfGitOp {
					bw.w.debugf("git: operation: end")
					bw.inGitOperation = false
				}
				// We don't care about events during a git op
				if !startOfGitOp && !endOfGitOp {
					continue
				}
				// Proceed like a normal event at this point
			case ev.Name == gitDir || filepath.Dir(ev.Name) == gitDir:
				continue
			}

			// Only create a ticker if we are not on the edge of a git operation.
			// Because if we are on the edge, then we flush below so creating a
			// ticker would be pointless.
			if !startOfGitOp && !endOfGitOp && bw.ticker == nil {
				bw.ticker = time.NewTicker(bw.batchWindow)
			}

			bw.buffer = append(bw.buffer, ev)

			if startOfGitOp || endOfGitOp {
				bw.flush()
			}
		case <-tick:
			if len(bw.buffer) == 0 {
				panic("oh dear")
			}
			bw.flush()
		}
	}
	close(bw.doneClose)
}

// flush flushes any batched events and ensures the ticker is reset
// if it is active.
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
