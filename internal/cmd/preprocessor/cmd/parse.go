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
	"os"
	"strings"

	"github.com/cue-lang/cuelang.org/internal/parse"
	"golang.org/x/tools/txtar"
)

const (
	// markdown header delimiters
	headerDelimiter = "---"
	headerLine      = headerDelimiter + "\n"

	// {{with}} blocks can optionally be wrapped in a ```coq ``` pair
	// to make rendering nicer within tools like Notion
	withStartWrapperLine = "```coq\n" // could appear at the start or a clear line
	withEndWrapper       = "\n```\n"  // always appears on a clear line
)

// parse parses a root file into its component parse: a header and body. The body
// is parsed as a text/template document.
func (rf *rootFile) parse() error {
	f, err := os.ReadFile(rf.filename)
	if err != nil {
		return rf.errorf("%v: failed to read: %v", rf, err)
	}
	rf.contents = f

	bodyStart := 0

	// Parse header. Must be right at the headerStart of the file
	if !bytes.HasPrefix(f, []byte(headerLine)) {
		return rf.errorf("%v: failed to find start of header", rf)
	}
	header := f[len(headerLine):]
	bodyStart += len(headerLine)
	// If the header is empty the end will immediately follow
	if bytes.HasPrefix(header, []byte(headerLine)) {
		header = nil
		bodyStart += len(headerLine)
	} else {
		// It's not a prefix, it must be a clear line
		const headerEnd = "\n" + headerLine
		endIndex := bytes.Index(header, []byte(headerEnd))
		if endIndex == -1 {
			return rf.errorf("%v: failed to find end of header", rf)
		}
		bodyStart += endIndex + len(headerEnd)
		header = header[:endIndex+1] // to leave the header including the \n
	}
	rf.header = header

	// Prefix the body with as many newlines as we saw across
	// the header block in order that offsets etc are accurate
	rf.bodyPrefix = bytes.Repeat([]byte("\n"), bytes.Count(f[:bodyStart], []byte("\n")))
	body := append(rf.bodyPrefix, f[bodyStart:]...)

	// TODO derive the delimiters from the page's CUE config
	parseTrees, err := parse.Parse(rf.filename, string(body), rf.page.leftDelim, rf.page.rightDelim, templateFunctions)
	if err != nil {
		return rf.errorf("%v: failed to parse body: %v", rf, err)
	}
	rf.body = parseTrees[rf.filename]
	pc := parseContext{
		rootFile: rf,
		parts:    rf.body.Root.Nodes,
	}

	for ; pc.i < len(pc.parts); pc.i++ {
		n := pc.parts[pc.i]
		var newNode node
		var err error
		switch n := n.(type) {
		case *parse.TextNode:
			newNode, err = pc.parse_TextNode(n)
		case *parse.WithNode:
			newNode, err = pc.parse_WithNode(n)
		case *parse.ActionNode:
			newNode, err = pc.parse_ActionNode(n)
		default:
			return rf.bodyError(n, "do not know how to handle node of type %T", n)
		}
		if err != nil {
			return err
		}
		rf.bodyParts = append(rf.bodyParts, newNode)
	}

	return nil
}

// bodyError is a convenience for creating a formatted error that includes the
// position of n within the original input.
func (rf *rootFile) bodyError(n parse.Node, format string, args ...any) error {
	// So we can take advantage of the vet checker
	s := fmt.Sprintf(format, args...)
	loc := rf.nodePos(n)
	return rf.errorf("%v:%s %s", rf, loc, s)
}

func (rf *rootFile) nodePos(theNode parse.Node) string {
	loc, _ := rf.body.ErrorContext(theNode)
	_, after, _ := strings.Cut(loc, ":")
	return after
}

// parseContext is a convenience for passing the current state of parsing of
// the text/template/parse root node list. This is really only required to
// handle the case of text nodes that may surround WithNode's. These nodes
// need to have triple-backtick text stripped from them, and leading blank
// lines in the case of the first text node.
type parseContext struct {
	*rootFile
	parts []parse.Node
	i     int
}

// parse_TextNode parses a text-only node.
func (pc parseContext) parse_TextNode(n *parse.TextNode) (node, error) {
	var lastWasWith, nextIsWith bool
	if pc.i < len(pc.parts)-1 {
		_, nextIsWith = pc.parts[pc.i+1].(*parse.WithNode)
	}
	if pc.i > 0 {
		_, lastWasWith = pc.parts[pc.i-1].(*parse.WithNode)
	}
	t := string(n.Text)
	if pc.i == 0 {
		// We know this will be a text node because we put in a fake prefix
		t = strings.TrimPrefix(t, string(pc.bodyPrefix))
	}
	if nextIsWith {
		if t == withStartWrapperLine {
			t = ""
		} else if strings.HasSuffix(t, "\n"+withStartWrapperLine) {
			t = strings.TrimSuffix(t, withStartWrapperLine)
		}
	}
	if lastWasWith {
		// the close ``` must always be on a clear line
		t = strings.TrimPrefix(t, withEndWrapper)
	}
	return &textNode{
		nodeWrapper: &nodeWrapper{
			rf:               pc.rootFile,
			underlying:       n,
			errorContext:     pc.errorContext,
			executionContext: pc.executionContext,
		},
		text: []byte(t),
	}, nil

}

func (pc parseContext) parse_WithNode(n *parse.WithNode) (node, error) {
	// The only form we accept right now is {{{ with function "$lang" "label" }}}
	// This is parsed as a command node with multiple args.
	if n.ElseList != nil {
		return nil, pc.bodyError(n.ElseList, "with node cannot have else block")
	}
	if len(n.Pipe.Cmds) != 1 {
		return nil, pc.bodyError(n, "with node must comprise a single command")
	}
	c := n.Pipe.Cmds[0]
	if l := len(c.Args); l == 0 {
		return nil, pc.bodyError(c, "expected at least one arg, not zero")
	}
	arg0 := c.Args[0]
	fn, ok := arg0.(*parse.IdentifierNode)
	if !ok {
		return nil, pc.bodyError(c, "expected identifier as first arg; got %T", arg0)
	}
	switch fn.Ident {
	case fnSidebyside:
		t, err := pc.parse_txtarNode(n, fn.Ident, c.Args[1:])
		if err != nil {
			return nil, err
		}
		return &sidebysideNode{txtarNode: t}, nil
	case fnUpload:
		t, err := pc.parse_txtarNode(n, fn.Ident, c.Args[1:])
		if err != nil {
			return nil, err
		}
		return &uploadNode{txtarNode: t}, nil
	case fnScript:
		t, err := pc.parse_txtarNode(n, fn.Ident, c.Args[1:])
		if err != nil {
			return nil, err
		}
		return &scriptNode{txtarNode: t}, nil
	case "sidetrack":
	default:
		return nil, pc.bodyError(fn, "do not know how to handle with identifier %q", fn.Ident)
	}
	return &nodeWrapper{
		rf:               pc.rootFile,
		underlying:       n,
		errorContext:     pc.errorContext,
		executionContext: pc.executionContext,
	}, nil
}

// parse_txtarNode extracts a txtar-based node, a value that will be wrapped
// with a specific type. e.g. sidebyside.
func (pc parseContext) parse_txtarNode(n *parse.WithNode, kind string, args []parse.Node) (res txtarNode, err error) {
	if len(args) != 2 {
		return res, pc.bodyError(n, "%s require two args", kind)
	}
	var strArgs []string
	for _, a := range args {
		sa, ok := a.(*parse.StringNode)
		if !ok {
			return res, pc.bodyError(a, "expected a string argument")
		}
		strArgs = append(strArgs, sa.Text)
	}
	lang, label := strArgs[0], strArgs[1]

	// We only support a single TextNode body, i.e. the contents of a txtar archive
	if n.List == nil || len(n.List.Nodes) != 1 {
		return res, pc.bodyError(n, "%s must have a text-only body", kind)
	}
	tn, ok := n.List.Nodes[0].(*parse.TextNode)
	if !ok {
		return res, pc.bodyError(n, "%s must have a text-only body", kind)
	}
	// We "always" use {{{ with .. }}} on a clean line. Strip the leading \n that
	// therefore forms part of the body.
	text := tn.Text[1:]
	ar := txtar.Parse(text)

	res = txtarNode{
		nodeWrapper: &nodeWrapper{
			rf:               pc.rootFile,
			underlying:       n,
			errorContext:     pc.errorContext,
			executionContext: pc.executionContext,
		},
		typ:              kind,
		lang:             lang,
		label:            label,
		sourceArchive:    ar,
		effectiveArchive: ar, // This gets updated in a run step if one happens

		analysis: analyseTxtarArchive(ar),
	}
	return res, nil
}

func (pc parseContext) parse_ActionNode(n *parse.ActionNode) (node, error) {
	// The only forms we support for now are those with a single command
	// with a list of args, e.g. {{{TODO "note on embedding"}}}
	if len(n.Pipe.Cmds) != 1 {
		return nil, pc.bodyError(n, "action node must comprise a single command")
	}
	c := n.Pipe.Cmds[0]
	if l := len(c.Args); l == 0 {
		return nil, pc.bodyError(c, "expected at least one arg, not zero")
	}
	arg0 := c.Args[0]
	fn, ok := arg0.(*parse.IdentifierNode)
	if !ok {
		return nil, pc.bodyError(c, "expected identifier as first arg; got %T", arg0)
	}
	switch fn.Ident {
	case "TODO":
		// TODO implement parsing of TODO nodes
	case "def":
		// TODO implement parsing of def nodes
	case "reference":
		// TODO implement parsing of reference nodes
	default:
		return nil, pc.bodyError(fn, "do not know how to handle with identifier %q", fn.Ident)
	}
	return &nodeWrapper{
		rf:               pc.rootFile,
		underlying:       n,
		errorContext:     pc.errorContext,
		executionContext: pc.executionContext,
	}, nil
}
