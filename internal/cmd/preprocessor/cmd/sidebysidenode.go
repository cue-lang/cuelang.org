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
	"bufio"
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

	tagNorun = "norun"
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

// tag searches for the first #$key tag line in the comment section of s's
// txtar archive. Tags are # prefixed lines where the # at the beginning of the
// line must be followed by a non-space character. args contains the contents
// of the quote-aware args that follow the tag name. present indicates whether
// the tag identified by key was present or not. err will be non-nil if there
// were errors in parsing the arguments to a tag.
//
// TODO: work out whether we want to handle comments in tag lines (which are
// themselves comments already).
func (s *sidebysideNode) tag(key string) (args []string, present bool, err error) {
	prefix := []byte("#" + key)
	sc := bufio.NewScanner(bytes.NewReader(s.ar.Comment))
	lineNo := 1
	for sc.Scan() {
		line := bytes.TrimSpace(sc.Bytes())
		if bytes.Equal(bytes.TrimSpace(line), prefix) {
			args, err := parseLineArgs(string(line))
			if err != nil {
				err = fmt.Errorf("%s:%d %w", s.label, lineNo, err)
			}
			return args, true, err
		}
		lineNo++
	}
	return nil, false, nil
}

// parseLineArgs is factored out of the testscript code. We use the same logic
// for quoting in tag arguments as we do in testscript commands. Expansion does
// not happen for tag arguments.
func parseLineArgs(line string) ([]string, error) {
	var (
		args   []string
		arg    string  // text of current arg so far (need to add line[start:i])
		start  = -1    // if >= 0, position where current arg text chunk starts
		quoted = false // currently processing quoted text
	)
	for i := 0; ; i++ {
		if !quoted && (i >= len(line) || line[i] == ' ' || line[i] == '\t' || line[i] == '\r' || line[i] == '#') {
			// Found arg-separating space.
			if start >= 0 {
				arg += line[start:i]
				args = append(args, arg)
				start = -1
				arg = ""
			}
			if i >= len(line) || line[i] == '#' {
				break
			}
			continue
		}
		if i >= len(line) {
			return nil, fmt.Errorf("unterminated quoted argument")
		}
		if line[i] == '\'' {
			if !quoted {
				// starting a quoted chunk
				if start >= 0 {
					arg += line[start:i]
				}
				start = i + 1
				quoted = true
				continue
			}
			// 'foo''bar' means foo'bar, like in rc shell and Pascal.
			if i+1 < len(line) && line[i+1] == '\'' {
				arg += line[start:i]
				start = i + 1
				i++ // skip over second ' before next iteration
				continue
			}
			// ending a quoted chunk
			arg += line[start:i]
			start = i + 1
			quoted = false
			continue
		}
		// found character worth saving; make sure we're saving
		if start < 0 {
			start = i
		}
	}
	return args, nil
}
