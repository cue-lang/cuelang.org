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
	"io"

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

func (e *errorContextBuffer) updateInError(v bool) {
	e.inError = e.inError || v
}

func (e *errorContextBuffer) logf(format string, args ...any) string {
	var res bytes.Buffer
	w := io.MultiWriter(&res, &e.log)
	fmt.Fprintf(w, format, args...)
	if b := res.Bytes(); len(b) > 0 && !bytes.HasSuffix(b, []byte("\n")) {
		fmt.Fprint(w, "\n")
	}
	return res.String()
}

func (e *errorContextBuffer) errorf(format string, args ...any) error {
	e.inError = true
	return errors.New(e.logf("** "+format, args...))
}

func (e *errorContextBuffer) fatalf(format string, args ...any) {
	err := e.errorf(format, args...)
	panic(fatalError{error: err})
}

func (e *errorContextBuffer) debugf(enabled bool, format string, args ...any) {
	if !enabled {
		return
	}
	e.logf("debug: "+format, args...)
}

func (e *errorContextBuffer) bytes() []byte {
	return e.log.Bytes()
}
