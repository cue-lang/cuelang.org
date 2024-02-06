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
	"strings"

	"mvdan.cc/sh/v3/syntax"
)

const (
	fnScript       = "script"
	fnHiddenScript = "_script"
)

type scriptNode struct {
	txtarNode

	// hidden is set to indicate the script exists for side effects
	// only and will not be rendered
	hidden bool

	stmts []*commandStmt
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
	file, err := syntax.NewParser(syntax.KeepComments(true)).Parse(bytes.NewReader(s.effectiveArchive.Comment), "")
	if err != nil {
		// If we get an error here we cannot proceed to further
		// validation analysis
		s.errorf("%v: failed to parse shell script: %v", s, err)
		return
	}
	s.debugf(s.debugScript, "parsed %q, gave %v statements", s.effectiveArchive.Comment, len(file.Stmts))
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
		// Remove any comments that are at the start of lines.
		// TODO keep comments that look like intended doc comments.
		var comments []syntax.Comment
		for _, c := range stmt.Comments {
			if c.Pos().Col() != 1 {
				// It's a comment not at the start of a line.
				comments = append(comments, c)
			}
		}
		stmt.Comments = comments
		var sb strings.Builder
		if err := s.rf.shellPrinter.Print(&sb, stmt); err != nil {
			s.errorf("%v: failed to print statement at %v: %v", s, stmt.Position, err)
		}
		cmdStmt.Cmd = sb.String()

		// Revert the negated state for completeness given
		// we set stmt as part of cmdStmt for sanitiser etc
		// checks where it might matter
		stmt.Negated = cmdStmt.negated

		s.stmts = append(s.stmts, &cmdStmt)
	}
}

// commandStmt is effectively a local version of the parsed *syntax.Stmt. This
// struct holds the details we need to build bash script to run in docker, but
// also to capture a specific statement's output ready for rendering. See
// (*scriptNode).validate() for more information.
type commandStmt struct {
	stmt        *syntax.Stmt
	negated     bool
	Cmd         string `json:"cmd"`
	ExitCode    int    `json:"exitCode"`
	Output      string `json:"output"`
	outputFence string
}

func (s *scriptNode) writeTransformTo(b *bytes.Buffer) error {
	p := bufPrintf(b)
	// With a script there are no files... just script

	// Build up a base64 encoded script that will be copied. This is necessary
	// because the rendered window will include the output... which won't work
	// if copy-pasted.
	var copyCmdStr strings.Builder
	enc := base64.NewEncoder(base64.StdEncoding, &copyCmdStr)
	for _, stmt := range s.stmts {
		fmt.Fprintf(enc, "%s\n", stmt.Cmd)
	}
	enc.Close()

	p("```text { title=%q codeToCopy=%q", "TERMINAL", copyCmdStr.String())
	p(" }\n")
	for _, stmt := range s.stmts {
		p("$ %s\n", stmt.Cmd)
		p("%s", stmt.Output)
	}
	p("```")
	return nil
}
