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
	errorContext

	// writeSourceTo writes the source (text/template) form of a node to buf.
	writeSourceTo(buf *bytes.Buffer)

	// writeTransformTo writes the Hugo-aware form of a node to buf. A call to
	// writeTransformTo is the transform or output step of the preprocessor.
	writeTransformTo(buf *bytes.Buffer) error

	// nodeType is a human-friendly name identifying the type of the node.
	nodeType() string

	isHidden() bool
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

	// writeToHasher is called to ask a node to write its source contents to w
	// in order that a hash value can be computed, a hash value that is compared
	// against a cache to determine whether the node needs to be re-run or not.
	writeToHasher(w io.Writer)
}

type labelledNode interface {
	node

	// A Label uniquely identifies a node of a given nodeType. Nodes only need
	// labels where that node needs to be addressed in some way.
	nodeLabel() string
}

type validatingNode interface {
	node

	// validate ensures that a node is valid. This type of validation is
	// self-contained, i.e. can only be a function of the contents of the
	// node itself. Implementers record errors via errorf(), which has
	// the effect of marking the node as isInError() == true.
	validate()
}

// A runnable is something that can be run. It has a bufferedErrorContext for
// logging purposes, so that the call can grab the logged messages on
// completion or run.
type runnable interface {
	bufferedErrorContext
	run()
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

func (n *nodeWrapper) isHidden() bool {
	return false
}

func (n *nodeWrapper) writeSourceTo(b *bytes.Buffer) {
	b.WriteString(n.underlying.String())
}

func (n *nodeWrapper) writeTransformTo(b *bytes.Buffer) error {
	fmt.Fprintf(b, "%s", n.underlying)
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
// a text node appearing before/after a code node.
type textNode struct {
	*nodeWrapper
	text          []byte
	transformText []byte
}

var _ node = (*textNode)(nil)

func (t *textNode) writeSourceTo(b *bytes.Buffer) {
	b.Write(t.text)
}

func (t *textNode) writeTransformTo(b *bytes.Buffer) error {
	b.Write(t.transformText)
	return nil
}

type referenceNode struct {
	*nodeWrapper
	reference string
}

func (r *referenceNode) writeTransformTo(b *bytes.Buffer) error {
	// At this point we know the reference is valid, i.e. the variable exists.
	val := r.rf.page.config.Vars[r.reference].transformedValue()
	b.WriteString(val)
	return nil
}
