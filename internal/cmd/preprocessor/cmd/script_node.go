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

const fnScript = "script"

type scriptNode struct {
	txtarNode
}

func (s *scriptNode) nodeType() string {
	return "script"
}

func (s *scriptNode) validate() error {
	if l := len(s.analysis.fileNames); l != 0 {
		return fmt.Errorf("script nodes cannot contain any files in the txtar archive")
	}

	return nil
}

func (s *scriptNode) writeTransformTo(b *bytes.Buffer) error {
	p := bufPrintf(b)
	// With a script there are no files... just script
	script := s.effectiveArchive.Comment
	p("```text { title=%q", "TERMINAL")
	p(" }\n")
	p("%s", script)
	p("```")
	return nil
}
