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

	"github.com/cue-lang/cuelang.org/internal/parse"
)

type node interface {
	run() error
	write(*bytes.Buffer)
	transform(*bytes.Buffer) error
}

// nodeWrapper is a simple wrapper around an underlying
// text/template/parse.Node. It basically represents a TODO.
type nodeWrapper struct {
	rf         *rootFile
	underlying parse.Node
}

func (t *nodeWrapper) run() error {
	t.rf.page.debugf("nodeWrapper.run() not implemented yet")
	return nil
}

func (t *nodeWrapper) write(b *bytes.Buffer) {
	b.WriteString(t.underlying.String())
}

func (t *nodeWrapper) transform(b *bytes.Buffer) error {
	b.WriteString(t.underlying.String())
	return nil
}

type textNode struct {
	rf   *rootFile
	text []byte
}

func (t *textNode) run() error {
	// nothing to do
	return nil
}

func (t *textNode) write(b *bytes.Buffer) {
	b.Write(t.text)
}

func (t *textNode) transform(b *bytes.Buffer) error {
	b.Write(t.text)
	return nil
}

func mkf(b *bytes.Buffer) func(string, ...any) (int, error) {
	return func(format string, args ...any) (int, error) {
		return fmt.Fprintf(b, format, args...)
	}
}
