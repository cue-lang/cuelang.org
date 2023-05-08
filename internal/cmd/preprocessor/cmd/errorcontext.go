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
	"fmt"
	"io"
	"sync"

	"cuelang.org/go/cue/errors"
)

type errorContext struct {
	// debug is set when we should log at the debug level
	debug bool

	// inError is set when the page is in error
	inError bool

	// log is the buffer to which we write log messages
	log io.Writer

	// stateLock protects access
	stateLock sync.Mutex
}

func (e *errorContext) isInError() bool {
	e.stateLock.Lock()
	defer e.stateLock.Unlock()
	return e.inError
}

func (e *errorContext) joinError(err error) {
	if err == nil {
		return
	}
	e.stateLock.Lock()
	defer e.stateLock.Unlock()
	e.inError = true
}

func (e *errorContext) errorf(format string, args ...any) error {
	e.stateLock.Lock()
	defer e.stateLock.Unlock()
	e.inError = true
	return errors.New(e.doLog(format, args...))
}

func (e *errorContext) logf(format string, args ...any) {
	e.stateLock.Lock()
	defer e.stateLock.Unlock()
	e.doLog(format)
}

func (e *errorContext) debugf(format string, args ...any) {
	if !e.debug {
		return
	}
	e.stateLock.Lock()
	defer e.stateLock.Unlock()
	e.doLog(format, args...)
}

// doLog performs the actual logging. stateLock must be held whilst
// calling this method.
func (e *errorContext) doLog(format string, args ...any) string {
	res := fmt.Sprintf(format, args...)
	m := res
	if len(m) > 0 && m[len(m)-1] != '\n' {
		m += "\n"
	}
	fmt.Fprint(e.log, m)
	return res
}
