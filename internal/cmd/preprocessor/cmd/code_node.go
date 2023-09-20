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
)

const (
	fnCode = "code"
)

// A codeNode is used to create a simple ```-based code block for a single file
// whose contents are formatted. This ensures good formatting but also valid
// code.
type codeNode struct {
	txtarNode
}

func (c *codeNode) nodeType() string {
	return fnCode
}

var _ runnableNode = (*codeNode)(nil)

type codeNodeRunContext struct {
	*txtarRunContext
}

func (s *codeNode) validate() error {
	if l := len(s.analysis.fileNames); l != 1 {
		return fmt.Errorf("code nodes can only contain one file in the txtar archive")
	}
	return nil
}

func (s *codeNode) run() runnable {
	return &codeNodeRunContext{
		txtarRunContext: &txtarRunContext{
			txtarNode:        &s.txtarNode,
			executionContext: s.executionContext,
			bufferedErrorContext: &errorContextBuffer{
				executionContext: s.executionContext,
			},
		},
	}
}

func (s *codeNodeRunContext) run() (err error) {
	defer recoverFatalError(&err)

	if err := s.formatFiles(); err != nil {
		return errorIfInError(s)
	}

	return nil
}

func (s *codeNode) writeTransformTo(b *bytes.Buffer) error {
	p := bufPrintf(b)

	// There will only be one file
	a := s.analysis.fileNames[0]
	f := s.effectiveArchive.Files[0]

	// TODO tidy up templating etc
	p("```%s\n", a.Language)

	// Need to be sure we write a trailing newline because we always want to
	// write the closing ``` on a clear line.
	data := f.Data
	if len(data) > 0 && data[len(data)-1] != '\n' {
		data = append(data, '\n')
	}

	p("%s", data)
	p("```")
	return nil
}
