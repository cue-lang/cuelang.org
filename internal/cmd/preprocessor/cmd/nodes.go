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
	"strings"

	"github.com/cue-lang/cuelang.org/internal/parse"
)

// A node is an abstraction around the structures that can appear in a page.
type node interface {

	// writeSourceTo writes the source (text/template) form of a node to buf.
	writeSourceTo(buf *bytes.Buffer)

	// writeTransformTo writes the Hugo-aware form of a node to buf. A call to
	// writeTransformTo is the transform or output step of the preprocessor.
	writeTransformTo(buf *bytes.Buffer) error

	fmt.Formatter
}

type runnableNode interface {
	// run is called to cause a node to update itself. The simplest example is a
	// node that includes a testscript script. Running such a node would involve
	// running the script, ensuring it passes and is therefore consistent with
	// the source that forms that node. Running the node with some flag to
	// indicate that scripts should be updated to ensure assertions pass (e.g.
	// testscript.Params.UpdateScripts)
	run() runnable
}

type runnable interface {
	run() error
	bytes() []byte
	isInError() bool
}

// nodeWrapper is a simple wrapper around an underlying
// text/template/parse.Node. It basically represents a TODO.
type nodeWrapper struct {
	rf         *rootFile
	underlying parse.Node
	errorContext
}

func newNodeWrapper(rf *rootFile, underlying parse.Node, e errorContextInterface) *nodeWrapper {
	return &nodeWrapper{
		rf:           rf,
		underlying:   underlying,
		errorContext: newErrorContext(e),
	}
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

func (t *textNode) Format(f fmt.State, verb rune) {
	loc, _ := t.rf.body.ErrorContext(t.underlying)
	_, after, _ := strings.Cut(loc, ":")
	fmt.Fprint(f, after)
}

func bufPrintf(b *bytes.Buffer) func(string, ...any) (int, error) {
	return func(format string, args ...any) (int, error) {
		return fmt.Fprintf(b, format, args...)
	}
}
