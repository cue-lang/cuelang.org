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

	"github.com/cue-lang/cuelang.org/internal/parse"
)

// A node is an abstraction around the structures that can appear in a page.
type node interface {
	// writeSourceTo writes the source (text/template) form of a node to buf.
	writeSourceTo(buf *bytes.Buffer)

	// writeTransformTo writes the Hugo-aware form of a node to buf. A call to
	// writeTransformTo is the transform or output step of the preprocessor.
	writeTransformTo(buf *bytes.Buffer) error

	// nodeType is a human-friendly name identifying the type of the node.
	nodeType() string
}

type runnableNode interface {
	labelledNode

	// run is called to cause a node to update itself. The simplest example is a
	// node that includes a testscript script. Running such a node would involve
	// running the script, ensuring it passes and is therefore consistent with
	// the source that forms that node. Running the node with some flag to
	// indicate that scripts should be updated to ensure assertions pass (e.g.
	// testscript.Params.UpdateScripts)
	run() runnable

	hash(w io.Writer)
}

type labelledNode interface {
	node

	// A Label uniquely identifies a node of a give nodeType(). Nodes only need
	// labels where that node needs to be addressed in some way.
	Label() string
}

// A runnable is something that can be run. It has a bufferedErrorContext for
// logging purposes, so that the call can grab the logged messages on
// completion or run.
type runnable interface {
	bufferedErrorContext
	run() error
}

// nodeWrapper is a simple wrapper around an underlying
// text/template/parse.Node. It basically represents a TODO.
type nodeWrapper struct {
	rf         *rootFile
	underlying parse.Node

	errorContext
	*executionContext
}

var _ node = (*nodeWrapper)(nil)

func (n *nodeWrapper) writeSourceTo(b *bytes.Buffer) {
	b.WriteString(n.underlying.String())
}

func (n *nodeWrapper) writeTransformTo(b *bytes.Buffer) error {
	b.WriteString(n.underlying.String())
	return nil
}

func (n *nodeWrapper) Format(f fmt.State, verb rune) {
	fmt.Fprintf(f, "%v:%s", n.rf, n.rf.nodePos(n.underlying))
}

func (n *nodeWrapper) nodeType() string {
	return fmt.Sprintf("nodeWrapper(%T)", n.underlying)
}

// textNode represents some text in an index page. It wraps a regular
// template.Node in order that the contained text can be munged in the case of
// a text node appearing before/after a sidebyside.
type textNode struct {
	*nodeWrapper
	text []byte
}

var _ node = (*textNode)(nil)

func (t *textNode) writeSourceTo(b *bytes.Buffer) {
	b.Write(t.text)
}

func (t *textNode) writeTransformTo(b *bytes.Buffer) error {
	b.Write(t.text)
	return nil
}
