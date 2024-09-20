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
	"io/fs"
	"os"
	"path/filepath"
	"slices"
	"strings"
	"unicode"

	"cuelang.org/go/cue/errors"
	"github.com/cue-lang/cuelang.org/internal/parse"
	"golang.org/x/tools/txtar"
)

const (
	// markdown header delimiters
	headerDelimiter = "---"
	headerLine      = headerDelimiter + "\n"
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

	parseTrees, err := parse.Parse(rf.filename, string(body), rf.page.config.LeftDelim, rf.page.config.RightDelim, templateFunctions)
	if err != nil {
		return rf.errorf("%v: failed to parse body: %v", rf, err)
	}
	rf.body = parseTrees[rf.filename]
	rf.bodyParts, err = rf.parse_ListNode(rf.body.Root)
	if err != nil {
		return err
	}

	// The first part will always be a *parse.TextNode, because it contains the header
	// for the page. Trim the prefix that is the header text for processing, because
	// we separately write and format the header when writing back to source or transforming.
	// (The header is left in for parsing so that line and byte offsets of the text/template
	// parse tree are true to the source file).
	tn := rf.bodyParts[0].(*textNode)
	utn := tn.underlying.(*parse.TextNode)
	tn.text = bytes.TrimPrefix(utn.Text, rf.bodyPrefix)
	tn.transformText = tn.text

	return nil
}

var errAbort = errors.New("abort walkBody early")

// walkBody performs a preorder traversal of the rootFile's body nodes, calling
// f for each node. If f returns errAbort, it stops the traversal.
//
// We know when executing this function that we successfully parsed the
// underlying text/template into our nodes, which means we can be safe/sure on
// the structure, nested-ness etc of nodes, and just walk them.
func (rf *rootFile) walkBody(f func(n node) error) {
	var work []node = rf.bodyParts

	var n node
	for len(work) > 0 {
		n, work = work[0], work[1:]
		if err := f(n); errors.Is(err, errAbort) {
			return
		}
		if s, ok := n.(*stepNode); ok {
			work = append(slices.Clone(s.children), work...)
		}
	}
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

// parse_ListNode walks a *parse.ListNode and extracts nodes.
func (rf *rootFile) parse_ListNode(ln *parse.ListNode) (res []node, err error) {
	var prev node
	for _, n := range ln.Nodes {
		var newNode node
		switch n := n.(type) {
		case *parse.TextNode:
			tn, tnerr := rf.parse_TextNode(n)
			if tnerr == nil && prev != nil && prev.isHidden() {
				// Eat the leading space on the transformText
				tn.transformText = bytes.TrimLeftFunc(tn.transformText, unicode.IsSpace)
			}
			newNode, err = tn, tnerr
		case *parse.WithNode:
			newNode, err = rf.parse_WithNode(n)
			if err != nil {
				break
			}
			if t, _ := prev.(*textNode); t != nil && newNode.isHidden() {
				if bytes.HasSuffix(t.transformText, []byte("\n")) {
					t.transformText = bytes.TrimRight(t.transformText, "\n")
					// Add back one
					t.transformText = append(t.transformText, '\n')
				}
			}
		case *parse.ActionNode:
			newNode, err = rf.parse_ActionNode(n)
		default:
			err = rf.bodyError(n, "do not know how to handle node of type %T", n)
		}
		if err != nil {
			return nil, err
		}
		res = append(res, newNode)
		prev = newNode
	}
	return
}

// parse_TextNode parses a text-only node.
func (rf *rootFile) parse_TextNode(n *parse.TextNode) (*textNode, error) {
	t := string(n.Text)
	return &textNode{
		nodeWrapper: &nodeWrapper{
			rf:               rf,
			underlying:       n,
			errorContext:     rf.errorContext,
			executionContext: rf.executionContext,
		},
		text:          []byte(t),
		transformText: []byte(t),
	}, nil

}

func (rf *rootFile) parse_WithNode(n *parse.WithNode) (node, error) {
	// The only form we accept right now is {{{ with function "$lang" "label" }}}
	// This is parsed as a command node with multiple args.
	if n.ElseList != nil {
		return nil, rf.bodyError(n.ElseList, "with node cannot have else block")
	}
	if len(n.Pipe.Cmds) != 1 {
		return nil, rf.bodyError(n, "with node must comprise a single command")
	}
	c := n.Pipe.Cmds[0]
	if l := len(c.Args); l == 0 {
		return nil, rf.bodyError(c, "expected at least one arg, not zero")
	}
	arg0 := c.Args[0]
	fn, ok := arg0.(*parse.IdentifierNode)
	if !ok {
		return nil, rf.bodyError(c, "expected identifier as first arg; got %T", arg0)
	}
	switch fn.Ident {
	case fnCode:
		t, err := rf.parse_txtarNode(n, fn.Ident, c.Args[1:])
		if err != nil {
			return nil, err
		}
		return &codeNode{
			txtarNode:       t,
			effectiveScript: t.archive.Comment,
		}, nil
	case fnStep:
		// Increment first because we are numbering from 1
		rf.stepNumber++
		return rf.parse_stepNode(n, rf.stepNumber)
	case fnUpload, fnHiddenUpload:
		hidden := fn.Ident == fnHiddenUpload
		t, err := rf.parse_txtarNode(n, fn.Ident, c.Args[1:])
		if err != nil {
			return nil, err
		}
		return &uploadNode{
			txtarNode: t,
			hidden:    hidden,
		}, nil
	case fnScript, fnHiddenScript:
		hidden := fn.Ident == fnHiddenScript
		t, err := rf.parse_txtarNode(n, fn.Ident, c.Args[1:])
		if err != nil {
			return nil, err
		}
		return &scriptNode{
			txtarNode: t,
			hidden:    hidden,
		}, nil
	case "sidetrack":
	default:
		return nil, rf.bodyError(fn, "do not know how to handle with identifier %q", fn.Ident)
	}
	return &nodeWrapper{
		rf:               rf,
		underlying:       n,
		errorContext:     rf.errorContext,
		executionContext: rf.executionContext,
	}, nil
}

// parse_stepNode parses n into a *stepNode, which implies the parsing of its children
func (rf *rootFile) parse_stepNode(n *parse.WithNode, number int) (res *stepNode, err error) {
	sn := &stepNode{
		number: number,
		nodeWrapper: &nodeWrapper{
			rf:               rf,
			underlying:       n,
			errorContext:     rf.errorContext,
			executionContext: rf.executionContext,
		},
	}
	sn.children, err = rf.parse_ListNode(n.List)
	return sn, err
}

// parse_txtarNode extracts a txtar-based node, a value that will be wrapped
// with a specific type. e.g. code node.
func (rf *rootFile) parse_txtarNode(n *parse.WithNode, kind string, args []parse.Node) (res txtarNode, err error) {
	if len(args) != 2 {
		return res, rf.bodyError(n, "%s require two args", kind)
	}
	var strArgs []string
	for _, a := range args {
		sa, ok := a.(*parse.StringNode)
		if !ok {
			return res, rf.bodyError(a, "expected a string argument")
		}
		strArgs = append(strArgs, sa.Text)
	}
	lang, label := strArgs[0], strArgs[1]

	// Assert that we only have a list of TextNodes possibly interleaved with
	// ActionNodes which are simple references.

	if len(n.List.Nodes) == 0 {
		// TODO: not sure if this can actually happen
		return res, rf.bodyError(n, "expected at least one body element")
	}

	var text []byte

	for i, ln := range n.List.Nodes {
		switch ln := ln.(type) {
		case *parse.TextNode:
			if i == 0 {
				// We "always" use {{{ with .. }}} on a clean line. Strip the
				// leading \n that therefore forms part of the body.
				//
				// TODO: feels like there should be a better way
				text = append(text, ln.Text[1:]...)
			} else {
				text = append(text, ln.Text...)
			}
		case *parse.ActionNode:
			possRefNode, err := rf.parse_ActionNode(ln)
			if err != nil {
				return res, err
			}
			refNode, ok := possRefNode.(*referenceNode)
			if !ok {
				return res, rf.bodyError(ln, "expected reference to variable")
			}
			v, ok := rf.page.config.Vars[refNode.reference]
			if !ok {
				return res, rf.bodyError(ln, "bad state: reference to variable %q that doesn't exist?", refNode.reference)
			}
			// Replace the reference here with the value. Later, when we come
			// to calculate hashes and write output, we will (at the last minute)
			// replace the random value with any replace value.
			text = append(text, []byte(v.value())...)
		default:
			return res, rf.bodyError(ln, "must be text or reference to a variable")
		}
	}

	ar := txtar.Parse(text)

	res = txtarNode{
		nodeWrapper: &nodeWrapper{
			rf:               rf,
			underlying:       n,
			errorContext:     rf.errorContext,
			executionContext: rf.executionContext,
		},
		typ:     kind,
		lang:    lang,
		label:   label,
		archive: ar,

		analysis: analyseTxtarArchive(ar),
	}
	return res, nil
}

func (rf *rootFile) parse_ActionNode(n *parse.ActionNode) (node, error) {
	// The only forms we support for now are those with a single command
	// with a list of args, e.g. {{{TODO "note on embedding"}}}
	if len(n.Pipe.Cmds) != 1 {
		return nil, rf.bodyError(n, "action node must comprise a single command")
	}
	c := n.Pipe.Cmds[0]
	if l := len(c.Args); l == 0 {
		return nil, rf.bodyError(c, "expected at least one arg, not zero")
	}
	arg0 := c.Args[0]
	switch arg0 := arg0.(type) {
	case *parse.FieldNode:
		// We only support simply references for now, i.e. ".Test" and not
		// ".Test.This"
		if len(arg0.Ident) != 1 {
			return nil, rf.bodyError(arg0, "expected a single simple variable reference")
		}
		refName := arg0.Ident[0]
		// Ensure that the variable referenced exists
		if _, ok := rf.page.config.Vars[refName]; !ok {
			return nil, rf.bodyError(arg0, "reference to variable %q that does not exist", arg0.Ident)
		}
		return &referenceNode{
			nodeWrapper: &nodeWrapper{
				rf:               rf,
				underlying:       n,
				errorContext:     rf.errorContext,
				executionContext: rf.executionContext,
			},
			reference: refName,
		}, nil
	case *parse.IdentifierNode:
		nw := &nodeWrapper{
			rf:               rf,
			underlying:       n,
			errorContext:     rf.errorContext,
			executionContext: rf.executionContext,
		}
		switch arg0.Ident {
		case "TODO":
			// TODO implement parsing of TODO nodes
		case "def":
			// TODO implement parsing of def nodes
		case "reference":
			// TODO implement parsing of reference nodes
		case fnUploadDir:
			// We need a single argument
			if len(c.Args) < 2 {
				return nil, rf.bodyError(arg0, "%s takes at least one argument; saw %d", fnUploadDir, len(c.Args)-1)
			}

			sn, ok := c.Args[1].(*parse.StringNode)
			if !ok {
				return nil, rf.bodyError(arg0, "%s takes initial string argument; saw %T", fnUploadDir, c.Args[1])
			}

			relDir := filepath.FromSlash(sn.Text)
			if !filepath.IsLocal(relDir) {
				return nil, rf.bodyError(arg0, "directory %q must be relative to page root", relDir)
			}

			targetPath := filepath.Join(rf.page.dir, relDir)

			fi, err := os.Stat(targetPath)
			if errors.Is(err, fs.ErrNotExist) {
				return nil, rf.bodyError(arg0, "directory %q does not exist", relDir)
			}
			if !fi.IsDir() {
				return nil, rf.bodyError(arg0, "%q is not a directory", relDir)
			}

			// Now try to grab any directives from remaining args
			var directives []string
			for _, a := range c.Args[2:] {
				sn, ok := a.(*parse.StringNode)
				if !ok {
					return nil, rf.bodyError(arg0, "%s expects variadic string arguments; saw %T", fnUploadDir, a)
				}
				directives = append(directives, sn.Text)
			}

			var force bool
			for _, d := range directives {
				if _, found, _ := findTag([]byte(d), tagForce, ""); found {
					force = true
				}
			}

			return &uploadDirNode{
				dir:         targetPath,
				force:       force,
				nodeWrapper: nw,
			}, nil
		default:
			return nil, rf.bodyError(arg0, "do not know how to handle with identifier %q", arg0.Ident)
		}
		return nw, nil
	default:
		return nil, rf.bodyError(c, "expected identifier or variable as first arg; got %T", arg0)
	}
}
