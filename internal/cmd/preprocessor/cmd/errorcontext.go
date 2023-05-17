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

type errorContextInterface interface {
	logger() io.Writer
	execContext() executionContext
}

type errorContext struct {
	executionContext

	// inError is set when the page is in error
	inError bool

	// log is the buffer to which we write log messages
	log io.Writer
}

func newErrorContext(e errorContextInterface) errorContext {
	return errorContext{
		executionContext: e.execContext(),
		log:              e.logger(),
	}
}

func (e *errorContext) isInError() bool {
	return e.inError
}

func (e *errorContext) errorf(format string, args ...any) error {
	s := fmt.Sprintf(format, args...)
	e.inError = true
	return errors.New(e.logf("** %s", s))
}

func (e *errorContext) fatalf(format string, args ...any) {
	err := e.errorf(format, args...)
	panic(fatalError{error: err})
}

func (e *errorContext) logf(format string, args ...any) string {
	res := fmt.Sprintf(format, args...)
	m := res
	if len(m) > 0 && m[len(m)-1] != '\n' {
		m += "\n"
	}
	fmt.Fprint(e.log, m)
	return res
}

func (e *errorContext) debugf(format string, args ...any) {
	if !e.debug {
		return
	}
	s := fmt.Sprintf(format, args...)
	e.logf("debug: " + s)
}

func (e *errorContext) logger() io.Writer {
	return e.log
}

func (e *errorContext) execContext() executionContext {
	return e.executionContext
}

func (e *errorContext) errorIfInError() error {
	if !e.inError {
		return nil
	}
	return errors.New("in error")
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
