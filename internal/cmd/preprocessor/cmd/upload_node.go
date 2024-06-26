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
)

const (
	fnUpload       = "upload"
	fnHiddenUpload = "_upload_"
)

type uploadNode struct {
	txtarNode

	// hidden is set to indicate the script exists for side effects
	// only and will not be rendered
	hidden bool
}

var _ validatingNode = (*uploadNode)(nil)

func (u *uploadNode) nodeType() string {
	return "upload"
}

func (u *uploadNode) isHidden() bool {
	return u.hidden
}

func (u *uploadNode) validate() {
	if len(u.analysis.fileNames) == 0 {
		u.errorf("%v: upload nodes must contain at least one file", u)
	}

	// We just default to stacking all files in case no locations are provided.
	u.validateLocationDirective()
}

func (u *uploadNode) writeTransformTo(res *bytes.Buffer) error {
	b := new(bytes.Buffer)
	p := bufPrintf(b)

	// Invariant: we will have zero locations or the right number of
	// locations for the number of files in the archive
	locs, gotLocs, _ := u.tag(tagLocation, "")

	p("{{< code-tabs >}}\n")
	for i, f := range u.archive.Files {
		a := u.analysis.fileNames[i]
		var loc string
		if !gotLocs {
			loc = "top-left"
		} else {
			loc = locs[i]
		}
		args := []string{
			fmt.Sprintf("name=%q", f.Name),
			fmt.Sprintf("language=%q", a.Language),
			fmt.Sprintf("area=%q", loc),
		}
		// Work out if there are any code-tab options specified via the codetab tag.
		// If there are, add them.
		opts, _, err := u.tag(tagCodeTab, f.Name)
		if err != nil {
			return u.errorf("failed to search for tag %v(%v): %v", tagCodeTab, f.Name, err)
		}
		args = append(args, opts...)
		p("{{< code-tab %s >}}\n", strings.Join(args, " "))
		p("%s", f.Data)
		p("{{< /code-tab >}}")
	}
	p("{{< /code-tabs >}}")
	res.WriteString(u.rf.page.config.randomReplace(b.String()))
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

func (u *uploadNodeRunContext) run() {
	defer recoverFatalError(u)

	// Skip entirely if the #norun tag is present
	if _, ok, _ := u.tag(tagNorun, ""); ok {
		return
	}

	if err := u.formatFiles(); err != nil {
		u.errorf("%v: failed to format files: %v", u, err)
	}
}
