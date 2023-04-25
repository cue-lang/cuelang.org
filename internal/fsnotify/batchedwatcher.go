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
// new BatchedRecursiveWatcher via NewBatchedWatcher.
type BatchedRecursiveWatcher struct {
	// w is the underlying Watcher used to batch events
	w *RecursiveWatcher

	// events is the channel over which batches of events are sent.
	events chan []fsnotify.Event

	// errors is the channel over which any errors are reported
	errors chan error

	// ticker is set if the run loop is in the process of batching events.
	ticker ticker

	// batchWindow is the maximum length of a batch window.
	batchWindow time.Duration

	// buffer is the buffer into which we batch events
	buffer []fsnotify.Event

	// inGitOperation is set when a git operation is in progress.
	inGitOperation bool

	// doneClose indicates that we are done handling the close from the
	// underlying fsnotify
	doneClose chan struct{}

	// send is set to non-nil when a batch of events is ready to be sent on.
	// When send != nil, no timer ticks will be set. Instead, if something needs
	// to queue in the time we are waiting to send on a batch it will simply add
	// to the back of the queue. This allows for slow consumers (which we log).
	send chan []fsnotify.Event

	// tickerCreator creates new tickers where required
	tickerCreator func(time.Duration) ticker
}

var _ Watcher[[]fsnotify.Event] = (*BatchedRecursiveWatcher)(nil)

// NewBatchedRecursiveWatcher creates a new batched watcher. A
// BatchedRecursiveWatcher's Events are batched into windows of at most
// batchWindow duration.  Furthermore, if gittoplevel is supplied, events
// received during git operations are batched until the end of the git
// operation. This can mean that batch time windows can be less than
// batchWindow when a git operation starts before a time window expires. It can
// also mean that a batch captures events over a time period greater than
// batchWindow, when a git operation exceeds this duration.
func NewBatchedRecursiveWatcher(dir, gittoplevel string, batchWindow time.Duration, opts ...Option) (*BatchedRecursiveWatcher, error) {
	w, theopts, err := newRecursiveWatcher(dir, gittoplevel, opts...)
	if err != nil {
		return nil, err
	}
	res := &BatchedRecursiveWatcher{
		w:           w,
		events:      make(chan []fsnotify.Event),
		errors:      w.errors,
		batchWindow: batchWindow,
		doneClose:   make(chan struct{}),
	}

	res.tickerCreator = theopts.tickerCreator
	if res.tickerCreator == nil {
		res.tickerCreator = newTimeTicker
	}

	go res.runEventLoop()

	return res, nil
}

func (bw *BatchedRecursiveWatcher) Events() <-chan []fsnotify.Event {
	return bw.events
}

func (bw *BatchedRecursiveWatcher) Errors() <-chan error {
	return bw.errors
}

// Close shuts down the watcher, by removing all watches and closing the Events
// channel.
func (bw *BatchedRecursiveWatcher) Close() error {
	if err := bw.w.Close(); err != nil {
		return fmt.Errorf("failed to shutdown underlying Watcher: %w", err)
	}
	<-bw.doneClose
	return nil
}

// runEventLoop is the main event loop of a BatchedWatcher. It is responsible
// for batching events from the underlying Watcher.
func (bw *BatchedRecursiveWatcher) runEventLoop() {
	gitDir := bw.w.gitDir
	lockFile := bw.w.gitLockFile
Forever:
	for {
		var tick <-chan time.Time
		if bw.ticker != nil {
			tick = bw.ticker.C()
		}
		select {
		case ev, ok := <-bw.w.events:
			if !ok {
				// Pass on the close
				close(bw.events)
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

			// Only create a ticker if we are not on the edge of a git operation
			// and not waiting to send.  Because if we are on the edge, then we
			// flush below so creating a ticker would be pointless.
			if bw.send == nil && !startOfGitOp && !endOfGitOp && bw.ticker == nil {
				bw.ticker = bw.tickerCreator(bw.batchWindow)
			}

			if bw.send != nil {
				// We have a slow consumer
				bw.w.debugf("slow consumer; adding %s (%v) to existing batch", ev.Name, ev.Op)
			}
			bw.buffer = append(bw.buffer, ev)

			// Again we only flush if we are not already waiting to send. There is no
			// point flushing at the start of a git op, because it's possible/likely
			// that there will be further changes. Triggering an event on this edge
			// therefore increases the likelihood of there being a race in the code
			// that reacts to a change. So only trigger at the end of the git op, by
			// which point we might well have gathered more events.
			if bw.send == nil && endOfGitOp {
				bw.flush()
			}
		case <-tick:
			if len(bw.buffer) == 0 {
				panic("oh dear")
			}
			bw.flush()
		case bw.send <- bw.buffer:
			bw.send = nil
			bw.buffer = nil
		}
	}
	close(bw.doneClose)
}

// flush triggers a send of any batched events and ensures the ticker is reset
// if it is active.
func (bw *BatchedRecursiveWatcher) flush() {
	// bw.ticker would be nil if we are eagerly flushing at the start
	// of a git operation.
	if bw.ticker != nil {
		bw.ticker.Stop()
	}
	bw.ticker = nil
	if len(bw.buffer) == 0 {
		return
	}
	bw.send = bw.events
}

type ticker interface {
	C() <-chan time.Time
	Stop()
}

var _ ticker = (*timeTicker)(nil)

func newTimeTicker(d time.Duration) ticker {
	return &timeTicker{
		t: time.NewTicker(d),
	}
}

// timeTicker is a wrapper around a time.Ticker that implements
type timeTicker struct {
	t *time.Ticker
}

func (t *timeTicker) C() <-chan time.Time {
	return t.t.C
}

func (t *timeTicker) Stop() {
	t.t.Stop()
}
