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
// allows for recursively watching directories, and provides a simple wrapper
// for batching events.
package fsnotify

import (
	"io"
	"time"

	"github.com/fsnotify/fsnotify"
)

// Provide access to the underlying fsnotify ops.
const (
	Chmod  = fsnotify.Chmod
	Create = fsnotify.Create
	Remove = fsnotify.Remove
	Rename = fsnotify.Rename
	Write  = fsnotify.Write
)

type Event = fsnotify.Event

// Option is used to further configure a Watcher or BatchedWatcher.
type Option option

type option func(p *options)

type options struct {
	debug         io.Writer
	tickerCreator func(time.Duration) ticker
}

// Debug configures debug-level logging via the io.Writer w.
func Debug(w io.Writer) Option {
	return func(o *options) {
		o.debug = w
	}
}
