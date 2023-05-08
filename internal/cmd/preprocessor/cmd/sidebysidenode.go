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
	"os"
	"path/filepath"
	"strings"

	"cuelang.org/go/cue/format"

	encjson "encoding/json"

	"cuelang.org/go/encoding/json"
	"github.com/rogpeppe/go-internal/txtar"
)

const (
	fnSidebyside = "sidebyside"

	goldenExt = ".golden"
)

type sidebysideNode struct {
	nodeWrapper
	lang  string
	label string
	ar    *txtar.Archive
	*bufferedErrorContext
}

var _ runnableNode = (*sidebysideNode)(nil)

type sidebysideNodeRunContext struct {
	*sidebysideNode
	bufferedErrorContext
}

func (s *sidebysideNode) run() runnable {
	return &sidebysideNodeRunContext{
		sidebysideNode: s,
	}
}

func (s *sidebysideNodeRunContext) run() error {
	// First format all non-output files
	for i := range s.ar.Files {
		f := &s.ar.Files[i]
		a := analyseFilename(f.Name)
		if a.isOut {
			continue
		}
		switch a.ext {
		case "json":
			expr, err := json.Extract(f.Name, f.Data)
			if err != nil {
				return s.errorf("%v: failed to extract JSON from %s: %v", s, f.Name, err)
			}
			v := s.rf.page.ctx.executor.ctx.BuildExpr(expr)
			if err := v.Err(); err != nil {
				return s.errorf("%v: failed to build CUE value from %s: %v", s, f.Name, err)
			}
			byts, err := encjson.MarshalIndent(v, "", "  ")
			if err != nil {
				return s.errorf("%v: failed to format CUE value as json for %s: %v", s, f.Name, err)
			}
			f.Data = byts
		case "yaml":
			// TODO implement.
		case "cue":
			b, err := format.Source(f.Data)
			if err != nil {
				s.debugf("%v: failed to format CUE in %q %q: %v", s, s.label, f.Name, err)
			} else {
				f.Data = b
			}
		}
	}
	return nil
}

func (s *sidebysideNode) writeSourceTo(b *bytes.Buffer) {
	p := bufPrintf(b)
	p("```coq\n")
	p("%swith %s %q %q%s\n", s.rf.page.leftDelim, fnSidebyside, s.lang, s.label, s.rf.page.rightDelim)
	p("%s", txtar.Format(s.ar))
	p("%send%s\n", s.rf.page.leftDelim, s.rf.page.rightDelim)
	p("```\n")
}

func (s *sidebysideNode) writeTransformTo(b *bytes.Buffer) error {
	p := bufPrintf(b)
	var locations []string
	switch l := len(s.ar.Files); l {
	case 2:
		// real side-by-side. Yes, you read the following line correctly
		locations = []string{"top-left", "top-right"}
	case 3:
		locations = []string{"top-left", "bottom-left", "top-right"}
	default:
		var b bytes.Buffer
		s.writeSourceTo(&b)
		return fmt.Errorf("do not know how to handle %d txtar files: \n%s", l, b.Bytes())
	}
	p("{{< code-tabs >}}\n")
	for i, f := range s.ar.Files {
		a := analyseFilename(f.Name)
		var typ string
		name := f.Name
		if a.isOut {
			name = "TERMINAL"
			typ = `type="terminal"`
		}
		p("{{< code-tab name=%q language=%q %v area=%q >}}\n", name, a.ext, typ, locations[i])
		p("%s", f.Data)
		p("{{< /code-tab >}}\n")
	}
	p("{{< /code-tabs >}}\n")
	return nil
}

type filenameAnalysis struct {
	// filepath is the original file path
	filepath string

	// basename is the basename of the last element of filepath
	basename string

	// ext is the bit of the last element of filepath after the last '.' (unlike
	// filepath.Ext which starts at the final '.')
	ext string

	// isGolden is set if the file is considered a golden file
	isGolden bool

	// isOut is set if the file is considered an output in the archive
	isOut bool
}

// analyseFilename provides useful details about a file in a txtar archive.
func analyseFilename(p string) (res filenameAnalysis) {
	res.filepath = p
	b := filepath.Base(p)
	if res.isGolden = strings.HasSuffix(b, goldenExt); res.isGolden {
		b = strings.TrimSuffix(b, goldenExt)
	}
	i := len(b) - 1
	for ; i >= 0 && !os.IsPathSeparator(b[i]); i-- {
		if b[i] == '.' {
			break
		}
	}
	res.basename = b[:i]
	if i < len(b) {
		res.ext = b[i+1:]
	}
	switch res.basename {
	case "out", "stdout":
		res.isOut = true
	}
	return
}
