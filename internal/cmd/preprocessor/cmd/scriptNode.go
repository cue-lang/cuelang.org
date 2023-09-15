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

	"mvdan.cc/sh/v3/syntax"
)

const (
	fnScript = "script"
)

type scriptNode struct {
	txtarNode

	stmts []*commandStmt
}

func (s *scriptNode) nodeType() string {
	return "script"
}

// validate the scriptNode. This also has the side effect of parsing the
// bash script in the comment o commandStmt's.
func (s *scriptNode) validate() error {
	if l := len(s.analysis.fileNames); l != 0 {
		return fmt.Errorf("script nodes cannot contain any files in the txtar archive")
	}

	// Now ensure that we can parse the script
	file, err := syntax.NewParser().Parse(bytes.NewReader(s.effectiveArchive.Comment), "")
	if err != nil {
		return fmt.Errorf("failed to parse shell script: %v", err)
	}
	s.debugf(s.debugGeneral, "parsed %q, gave %v statements", s.effectiveArchive.Comment, len(file.Stmts))
	for _, stmt := range file.Stmts {
		var cmdStmt commandStmt
		// Capture whether this statement is negated or not
		negated := stmt.Negated
		// Set to not negated because we need to capture the exit code.
		// Handling of the exit code and negated happens in the generated
		// bash script
		stmt.Negated = false
		var sb strings.Builder
		if err := s.rf.stmtPrinter.Print(&sb, stmt); err != nil {
			return fmt.Errorf("failed to print statement: %v", err)
		}
		cmdStmt.cmdStr = sb.String()
		cmdStmt.negated = negated
		s.stmts = append(s.stmts, &cmdStmt)
	}

	return nil
}

// commandStmt is effectively a local version of the parsed *syntax.Stmt. This
// struct holds the details we need to build bash script to run in docker, but
// also to capture a specific statement's output ready for rendering. See
// (*scriptNode).validate() for more information.
type commandStmt struct {
	negated     bool
	cmdStr      string
	exitCode    int
	output      string
	outputFence string
}

func (s *scriptNode) writeTransformTo(b *bytes.Buffer) error {
	p := bufPrintf(b)
	// With a script there are no files... just script
	p("```text { title=%q", "TERMINAL")
	p(" }\n")
	for _, stmt := range s.stmts {
		p("$ %s\n", stmt.cmdStr)
		p("%s", stmt.output)
	}
	p("```")
	return nil
}
