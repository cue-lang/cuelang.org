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
	"encoding/base64"
	"fmt"
	"regexp"
	"strconv"
	"strings"

	"mvdan.cc/sh/v3/syntax"
)

const (
	fnScript       = "script"
	fnHiddenScript = "_script_"
)

type scriptNode struct {
	txtarNode

	// hidden is set to indicate the script exists for side effects
	// only and will not be rendered
	hidden bool

	stmts []*commandStmt

	// comments are the comments in the script node not attached to statements.
	// We leave them as a slice of comments for now; it might be that they are
	// only required as a concatenated string, we will see later.
	comments []syntax.Comment
}

var _ validatingNode = (*scriptNode)(nil)

func (s *scriptNode) nodeType() string {
	return "script"
}

func (s *scriptNode) isHidden() bool {
	return s.hidden
}

// validate the scriptNode. This also has the side effect of parsing the
// bash script in the comment o commandStmt's.
func (s *scriptNode) validate() {
	if l := len(s.analysis.fileNames); l != 0 {
		s.errorf("%v: script nodes cannot contain any files in the txtar archive", s)
	}

	// Now ensure that we can parse the script
	//
	// Per @mvdan, use https://pkg.go.dev/mvdan.cc/sh/v3/syntax#Parser.Stmts
	file, err := syntax.NewParser(syntax.KeepComments(true)).Parse(bytes.NewReader(s.archive.Comment), "")
	if err != nil {
		// If we get an error here we cannot proceed to further
		// validation analysis
		s.errorf("%v: failed to parse shell script: %v", s, err)
		return
	}

	s.debugf(s.debugScript, "parsed %q, gave %v statements", s.archive.Comment, len(file.Stmts))

	// Now render each statement, creating doc comments for each as we go, and
	// gathering any non-doc comments as script node-level comments.

	envSubstCUEVersions := func(v string) string {
		return expand(v, func(vv string) (bool, string) {
			version, ok := s.cueEnvVersions[vv]
			return ok, version
		})
	}

	for _, stmt := range file.Stmts {
		cmdStmt := commandStmt{
			stmt: stmt,

			// Capture whether this statement is negated or not
			negated: stmt.Negated,
		}
		// Set to not negated because we need to capture the exit code.
		// Handling of the exit code and negated happens in the generated
		// bash script
		stmt.Negated = false

		// doc will ense up being the doc comment for the statement. Anything
		// that does not form part of the doc comment gets added to the script
		// node as a "block comment". As we walk through the comments that are
		// attached to the statement AST, the resetDocComment helper function is
		// responsible for transferring the currently collected doc comment to
		// being script node-level comments whenever we detect a section of
		// comments that is non-contiguous with the statement itself.
		var doc syntax.Stmt
		resetDocComment := func(line uint) {
			if l := len(doc.Comments); l > 0 {
				last := doc.Comments[l-1]
				if last.End().Line()+1 != line {
					s.comments = append(s.comments, doc.Comments...)
					doc.Comments = nil
				}
			}
		}
		for len(stmt.Comments) > 0 {
			c := stmt.Comments[0]
			if c.Pos().After(stmt.Cmd.Pos()) {
				// We have reached a comment that starts after the beginning of the
				// statement. Leave it and any that follow on the command
				//
				// TODO: properly document as part of execute_doc.go or similar the
				// requirements of doc comments, and their interaction with tags
				// (especially when it comes to rendered output). We could leverage
				// the Go docs in this respect: https://tip.golang.org/doc/comment.
				break
			}
			resetDocComment(c.Pos().Line())
			doc.Comments = append(doc.Comments, c)
			stmt.Comments = stmt.Comments[1:]
		}
		resetDocComment(stmt.Pos().Line())

		var sb strings.Builder
		if err := s.rf.shellPrinter.Print(&sb, stmt); err != nil {
			s.errorf("%v: failed to print statement at %v: %v", s, stmt.Position, err)
			continue
		}
		cmdStmt.Cmd = envSubstCUEVersions(sb.String())

		sb.Reset()
		if err := s.rf.shellPrinter.Print(&sb, &doc); err != nil {
			s.errorf("%v: failed to print doc comment for stmt at %v: %v", s, stmt.Position, err)
			continue
		}
		cmdStmt.Doc = envSubstCUEVersions(sb.String())

		// Now check if there are any known tag-based sanitiser directives
		//
		// TODO: we really need a different mechanism to gather the tags (and
		// their args) which might appear here, and then parse them. For now this
		// is a bit of a hack.
		args, matched, err := findTag([]byte(cmdStmt.Doc), tagEllipsis, "")
		if err != nil {
			s.errorf("%v: failed to search for ellipsis tag: %v", s, err)
			continue
		}
		if matched {
			// TODO: this needs a more principled approach. Very hacky for now.

			// Must be only one arg
			var start int
			switch len(args) {
			case 0:
			case 1:
				start64, err := strconv.ParseInt(args[0], 10, 32)
				if err != nil {
					s.errorf("%v: failed to parse integer from %s argument %q: %v", s, tagEllipsis, args[0], err)
					continue
				}
				start = int(start64)
			default:
				s.errorf("%v: too many args for %s directive (%v)", s, tagEllipsis, len(args))
				continue
			}
			cmdStmt.sanitisers = []sanitiser{&ellipsisSanitiser{
				Start: start,
			}}
		}

		// Revert the negated state for completeness given
		// we set stmt as part of cmdStmt for sanitiser etc
		// checks where it might matter
		stmt.Negated = cmdStmt.negated

		s.stmts = append(s.stmts, &cmdStmt)
	}

	// The trailing comments in the script not attached to any commands because
	// no commands follow them.
	s.comments = append(s.comments, file.Last...)
}

// commandStmt is effectively a local version of the parsed *syntax.Stmt. This
// struct holds the details we need to build bash script to run in docker, but
// also to capture a specific statement's output ready for rendering. See
// (*scriptNode).validate() for more information.
type commandStmt struct {
	stmt        *syntax.Stmt
	negated     bool
	Doc         string `json:"doc"`
	Cmd         string `json:"cmd"`
	ExitCode    int    `json:"exitCode"`
	Output      string `json:"output"`
	outputFence string
	sanitisers  []sanitiser
}

var tagPrefix = regexp.MustCompile(`^#\S`)

func (s *scriptNode) writeTransformTo(b *bytes.Buffer) error {
	p := bufPrintf(b)
	// With a script there are no files... just script

	// Build up a base64 encoded script that will be copied. This is necessary
	// because the rendered window will include the output... which won't work
	// if copy-pasted.
	var copyCmdStr strings.Builder
	enc := base64.NewEncoder(base64.StdEncoding, &copyCmdStr)
	var start string
	for _, stmt := range s.stmts {
		fmt.Fprintf(enc, "%s%s", start, stmt.Cmd)
		start = "\n"
	}
	enc.Close()

	p("```text { title=%q type=%q codeToCopy=%q ", "TERMINAL", "terminal", copyCmdStr.String())
	p(" }\n")
	var lastOutput string
	for i, stmt := range s.stmts {
		if stmt.Doc != "" {
			var docLines []string
			for _, line := range strings.Split(stmt.Doc, "\n") {
				if tagPrefix.MatchString(line) {
					continue
				}
				docLines = append(docLines, line)
			}
			if len(docLines) > 0 && i > 0 && !strings.HasSuffix(lastOutput, "\n\n") {
				// Add a clear line to separate the start of the comment
				p("\n")
			}
			for _, l := range docLines {
				p("%s\n", l)
			}
		}
		p("$ %s\n", stmt.Cmd)
		p("%s", stmt.Output)
		lastOutput = stmt.Output
	}
	p("```")
	return nil
}
