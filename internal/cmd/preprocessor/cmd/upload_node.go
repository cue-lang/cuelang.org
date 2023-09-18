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

const fnUpload = "upload"

type uploadNode struct {
	txtarNode
}

func (u *uploadNode) nodeType() string {
	return "upload"
}

func (u *uploadNode) validate() error {
	if l := len(u.analysis.fileNames); l != 1 {
		return fmt.Errorf("upload nodes can only contain a single file; saw %d", l)
	}
	return nil
}

func (u *uploadNode) writeTransformTo(b *bytes.Buffer) error {
	p := bufPrintf(b)
	// For now there will be a single file, ensured by validate()
	f := u.effectiveArchive.Files[0]
	a := u.analysis.fileNames[0]
	props := tabProps{
		Name:     f.Name,
		Language: a.Ext,
	}
	p("```%s { title=%q", props.Language, props.Name)

	// Work out if there are any code-tab options specified via the codetab tag.
	// If there are, add them.
	opts, _, err := u.tag(tagCodeTab, f.Name)
	if err != nil {
		return u.errorf("failed to search for tag %v(%v): %v", tagCodeTab, f.Name, err)
	}
	for _, o := range opts {
		p(" %s", o)
	}

	p(" }\n")
	p("%s", f.Data)
	p("```")
	return nil
}

type uploadNodeRunContext struct {
	*txtarRunContext
}

func (u *uploadNode) run() runnable {
	return &uploadNodeRunContext{
		txtarRunContext: &txtarRunContext{
			txtarNode:        u.txtarNode,
			executionContext: u.executionContext,
			bufferedErrorContext: &errorContextBuffer{
				executionContext: u.executionContext,
			},
		},
	}
}

func (u *uploadNodeRunContext) run() (err error) {
	defer recoverFatalError(&err)

	// Skip entirely if the #norun tag is present
	if _, ok, _ := u.tag(tagNorun, ""); ok {
		return nil
	}

	if err := u.formatFiles(); err != nil {
		return errorIfInError(u)
	}

	return nil
}
