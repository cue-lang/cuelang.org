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

type errorContext interface {
	logf(format string, args ...any) string
	errorf(format string, args ...any) error
	debugf(format string, args ...any)
	setInError(bool)
	isInError() bool
	errorIfInError() error
}

type bufferedErrorContext interface {
	errorContext
	bytes() []byte
}

type errorContextWriter struct {
	ec      *executionContext
	inError bool
	log     io.Writer
}

func newErrorContext(ctx *executionContext, log io.Writer) errorContextWriter {
	return errorContextWriter{
		ec:  ctx,
		log: log,
	}
}

func (e *errorContextWriter) setInError(v bool) {
	e.inError = e.inError || v
}

func (e *errorContextWriter) isInError() bool {
	return e.inError
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

func (e *errorContextWriter) logf(format string, args ...any) string {
	res := fmt.Sprintf(format, args...)
	m := res
	if len(m) > 0 && m[len(m)-1] != '\n' {
		m += "\n"
	}
	fmt.Fprint(e.log, m)
	return res
}

func (e *errorContextWriter) debugf(format string, args ...any) {
	if !e.ec.debug {
		return
	}
	s := fmt.Sprintf(format, args...)
	e.logf("debug: " + s)
}

func (e *errorContextWriter) logger() io.Writer {
	return e.log
}

func (e *errorContextWriter) execContext() *executionContext {
	return e.ec
}

func (e *errorContextWriter) errorIfInError() error {
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
