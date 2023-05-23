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

// errorContext is an error-aware logging interface embedded by types.
type errorContext interface {
	// logf logs an normal log-level message.
	logf(format string, args ...any) string

	// errorf logs an error-level message, and sets the receiver to be in error.
	errorf(format string, args ...any) error

	// debugf logs a debug-level message.
	debugf(format string, args ...any)

	// fatalf logs an error-level message via errorf, and then panics with a
	// fatalError value.
	fatalf(format string, args ...any)

	// updateInError updates the receiver error state if v is true.
	updateInError(v bool)

	// isInError returns the error state.
	isInError() bool
}

// errorContextWriter is a base implementation of errorContext
//
// Is is intentionally not threadsafe.
type errorContextWriter struct {
	*executionContext
	inError bool
	log     io.Writer
}

func (e *errorContextWriter) isInError() bool {
	return e.inError
}

func (e *errorContextWriter) updateInError(v bool) {
	e.inError = e.inError || v
}

func (e *errorContextWriter) logf(format string, args ...any) string {
	var res bytes.Buffer
	w := io.MultiWriter(&res, e.log)
	fmt.Fprintf(w, format, args...)
	if !bytes.HasSuffix(res.Bytes(), []byte("\n")) {
		fmt.Fprint(w, "\n")
	}
	return res.String()
}

func (e *errorContextWriter) errorf(format string, args ...any) error {
	e.inError = true
	return errors.New(e.logf("** "+format, args...))
}

func (e *errorContextWriter) fatalf(format string, args ...any) {
	err := e.errorf(format, args...)
	panic(fatalError{error: err})
}

func (e *errorContextWriter) debugf(format string, args ...any) {
	if !e.debug {
		return
	}
	e.logf("debug: "+format, args...)
}

type fatalError struct {
	error
}

func recoverFatalError(err *error) {
	switch r := recover().(type) {
	case nil:
		// normal behaviour
	case fatalError:
		if *err != nil {
			panic("error value already set?")
		}
		*err = r.error
	default:
		// Unknown value - panic on
		panic(r)
	}
}

func errorIfInError(e errorContext) error {
	if !e.isInError() {
		return nil
	}
	return errors.New("in error")
}
