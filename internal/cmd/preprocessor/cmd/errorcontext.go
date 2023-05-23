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

	// setInError updates the receiver error state if v is true.
	setInError(v bool)

	// isInError returns the error state.
	isInError() bool

	// errorIfInError is a convenience method for returning a non-nil
	// error value if the receive is in error.
	errorIfInError() error
}

// errorContextWriter is a base implementation of errorContext
//
// Is is intentionally not threadsafe.
type errorContextWriter struct {
	ec      *executionContext
	inError bool
	log     io.Writer
}

func (e *errorContextWriter) isInError() bool {
	return e.inError
}

func (e *errorContextWriter) setInError(v bool) {
	e.inError = e.inError || v
}

func (e *errorContextWriter) errorIfInError() error {
	if !e.inError {
		return nil
	}
	return errors.New("in error")
}

func (e *errorContextWriter) logf(format string, args ...any) string {
	res := fmt.Sprintf(format, args...)
	m := res
	if len(m) > 0 && m[len(m)-1] != '\n' {
		m += "\n"
	}
	fmt.Fprint(e.log, m)
	return res
}

func (e *errorContextWriter) errorf(format string, args ...any) error {
	s := fmt.Sprintf(format, args...)
	e.inError = true
	return errors.New(e.logf("** %s", s))
}

func (e *errorContextWriter) fatalf(format string, args ...any) {
	err := e.errorf(format, args...)
	panic(fatalError{error: err})
}

func (e *errorContextWriter) debugf(format string, args ...any) {
	if !e.ec.debug {
		return
	}
	s := fmt.Sprintf(format, args...)
	e.logf("debug: " + s)
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
