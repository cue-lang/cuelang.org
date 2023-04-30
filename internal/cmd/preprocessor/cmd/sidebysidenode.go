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
)

type sidebysideNode struct {
	rf    *rootFile
	lang  string
	label string
	ar    *txtar.Archive
}

const (
	goldenExt = ".golden"
)

func (s *sidebysideNode) run() error {
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
				return fmt.Errorf("failed to extract JSON from %s: %w", f.Name, err)
			}
			v := s.rf.page.ctx.executor.ctx.BuildExpr(expr)
			if err := v.Err(); err != nil {
				return fmt.Errorf("failed to build CUE value from %s: %w", f.Name, err)
			}
			var buf bytes.Buffer
			d := encjson.NewEncoder(&buf)
			d.SetIndent("", "  ")
			if err := d.Encode(v); err != nil {
				return fmt.Errorf("failed to format CUE value as json for %s: %w", f.Name, err)
			}
			f.Data = buf.Bytes()
		case "yaml":
		case "cue":
			b, err := format.Source(f.Data)
			if err != nil {
				s.rf.page.debugf("failed to format CUE in %q %q: %w", s.label, f.Name, err)
			} else {
				f.Data = b
			}
		}
	}
	return nil
}

func (s *sidebysideNode) write(b *bytes.Buffer) {
	f := mkf(b)
	f("```coq\n")
	f("%swith %s %q %q%s\n", s.rf.page.leftDelim, fnSidebyside, s.lang, s.label, s.rf.page.rightDelim)
	f("%s", txtar.Format(s.ar))
	f("%send%s\n", s.rf.page.leftDelim, s.rf.page.rightDelim)
	f("```\n")
}

func (s *sidebysideNode) transform(b *bytes.Buffer) error {
	f := mkf(b)
	var locations []string
	switch l := len(s.ar.Files); l {
	case 2:
		// real side-by-side. Yes, you read the following line correctly
		locations = []string{"top-left", "top-right"}
	case 3:
		locations = []string{"top-left", "bottom-left", "top-right"}
	default:
		var b bytes.Buffer
		s.write(&b)
		return fmt.Errorf("do not know how to handle %d txtar files: \n%s\n", l, b.Bytes())
	}
	f("{{< code-tabs >}}\n")
	for i, v := range s.ar.Files {
		var typ string
		name := v.Name
		base, ext, _ := strings.Cut(v.Name, ".")
		if base == "stdout" || base == "out" {
			name = "TERMINAL"
			typ = `type="terminal"`
		}
		f("{{< code-tab name=%q language=%q %v area=%q >}}\n", name, ext, typ, locations[i])
		f("%s", v.Data)
		f("{{< /code-tab >}}\n")
	}
	f("{{< /code-tabs >}}\n")
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
	b, res.isGolden = strings.CutSuffix(b, goldenExt)
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
