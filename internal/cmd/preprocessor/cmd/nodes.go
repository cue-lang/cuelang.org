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

// A node is an abstraction around the structures that can appear in a page.
type node interface {
	// run is called to cause a node to update itself. The simplest example is a
	// node that includes a testscript script. Running such a node would involve
	// running the script, ensuring it passes and is therefore consistent with
	// the source that forms that node. Running the node with some flag to
	// indicate that scripts should be updated to ensure assertions pass (e.g.
	// testscript.Params.UpdateScripts)
	run() error

	// writeSourceTo writes the source (text/template) form of a node to buf.
	writeSourceTo(buf *bytes.Buffer)

	// writeTransformTo writes the Hugo-aware form of a node to buf. A call to
	// writeTransformTo is the transform or output step of the preprocessor.
	writeTransformTo(buf *bytes.Buffer) error
}

// nodeWrapper is a simple wrapper around an underlying
// text/template/parse.Node. It basically represents a TODO.
type nodeWrapper struct {
	rf         *rootFile
	underlying parse.Node
}

var _ node = (*nodeWrapper)(nil)

func (t *nodeWrapper) run() error {
	t.rf.page.debugf("nodeWrapper.run() not implemented yet")
	return nil
}

func (t *nodeWrapper) writeSourceTo(b *bytes.Buffer) {
	b.WriteString(t.underlying.String())
}

func (t *nodeWrapper) writeTransformTo(b *bytes.Buffer) error {
	b.WriteString(t.underlying.String())
	return nil
}

type textNode struct {
	rf   *rootFile
	text []byte
}

var _ node = (*textNode)(nil)

func (t *textNode) run() error {
	// nothing to do
	return nil
}

func (t *textNode) writeSourceTo(b *bytes.Buffer) {
	b.Write(t.text)
}

func (t *textNode) writeTransformTo(b *bytes.Buffer) error {
	b.Write(t.text)
	return nil
}

func bufPrintf(b *bytes.Buffer) func(string, ...any) (int, error) {
	return func(format string, args ...any) (int, error) {
		return fmt.Fprintf(b, format, args...)
	}
}
