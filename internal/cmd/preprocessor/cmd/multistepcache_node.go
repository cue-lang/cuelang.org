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
	// A multistepCache exists as a singleton in a page iff there are multi-step
	// script and/or upload nodes.
	fnMultistepCache = "multistepCache"
)

// A multistepcache is a singleton in a page. It contains the input (as a
// comment) and the output (as a single file named "output") in its contents.
type multistepCacheNode struct {
	txtarNode
}

var _ validatingNode = (*multistepCacheNode)(nil)

func (m *multistepCacheNode) nodeType() string {
	return "multistepcache"
}

func (m *multistepCacheNode) isHidden() bool {
	return true
}

// validate the scriptNode. This also has the side effect of parsing the
// bash script in the comment o commandStmt's.
func (m *multistepCacheNode) validate() {
	if l := len(m.analysis.fileNames); l != 1 {
		m.errorf("%v: multistepcache nodes must contain a single file, the output", m)
	}
}

// A multistepcache node is invisible as far as the output is concerned.
func (m *multistepCacheNode) writeTransformTo(b *bytes.Buffer) error {
	return nil
}
