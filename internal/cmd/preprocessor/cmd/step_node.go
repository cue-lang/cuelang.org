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
)

const (
	fnStep = "step"
)

// A stepNode is simply a wrapper around non-step nodes. It renders its
// contents wrapped in a step shortcode, essentially a numbered block. As a
// container it does nothing other that wrap its contents.
type stepNode struct {
	*nodeWrapper

	number   int
	children []node
}

func (s *stepNode) nodeType() string {
	return fnStep
}

func (s *stepNode) writeSourceTo(b *bytes.Buffer) {
	p := bufPrintf(b)
	p("%swith %s%s", s.rf.page.leftDelim, s.nodeType(), s.rf.page.rightDelim)
	for _, n := range s.children {
		n.writeSourceTo(b)
	}
	p("%send%s", s.rf.page.leftDelim, s.rf.page.rightDelim)
}

func (s *stepNode) writeTransformTo(b *bytes.Buffer) error {
	p := bufPrintf(b)
	p("{{< step stepNumber=\"%d\" >}}", s.number)
	if err := transformNodes(b, s.children); err != nil {
		return err
	}
	p("{{< /step >}}")
	return nil
}
