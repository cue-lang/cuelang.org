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
	"bytes"
	"fmt"

	"cuelang.org/go/cue/errors"
)

// bufferedErrorContext is a buffered extension of errorContext. That is, all
// log messages are buffered, and then later retrieved via the bytes() method.
type bufferedErrorContext interface {
	errorContext

	// bytes returns the log messages buffered.
	bytes() []byte
}

// errorContextBuffer is a base implementation of bufferedErrorContext
//
// Is is intentionally not threadsafe.
type errorContextBuffer struct {
	*executionContext
	inError bool
	log     bytes.Buffer
}

var _ errorContext = (*errorContextBuffer)(nil)

func (e *errorContextBuffer) isInError() bool {
	return e.inError
}

func (e *errorContextBuffer) setInError(v bool) {
	e.inError = e.inError || v
}

func (e *errorContextBuffer) errorIfInError() error {
	if !e.inError {
		return nil
	}
	return errors.New("in error")
}

func (e *errorContextBuffer) logf(format string, args ...any) string {
	res := fmt.Sprintf(format, args...)
	m := res
	if len(m) > 0 && m[len(m)-1] != '\n' {
		m += "\n"
	}
	fmt.Fprint(&e.log, m)
	return res
}

func (e *errorContextBuffer) errorf(format string, args ...any) error {
	s := fmt.Sprintf(format, args...)
	e.inError = true
	return errors.New(e.logf("** %s", s))
}

func (e *errorContextBuffer) fatalf(format string, args ...any) {
	err := e.errorf(format, args...)
	panic(fatalError{error: err})
}

func (e *errorContextBuffer) debugf(format string, args ...any) {
	if !e.debug {
		return
	}
	s := fmt.Sprintf(format, args...)
	e.logf("debug: " + s)
}

func (e *errorContextBuffer) bytes() []byte {
	return e.log.Bytes()
}
