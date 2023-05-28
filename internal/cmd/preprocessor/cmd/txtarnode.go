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
	"io"
	"os"
	"path/filepath"
	"strings"

	"golang.org/x/tools/txtar"
)

type txtarNode struct {
	*nodeWrapper
	typ              string
	lang             string
	label            string
	sourceArchive    *txtar.Archive
	effectiveArchive *txtar.Archive

	analysis txtarAnalysis
}

func (t *txtarNode) Label() string {
	return t.label
}

func (t *txtarNode) nodeType() string {
	return t.typ
}

func (t *txtarNode) hash(w io.Writer) {
	fmt.Fprintf(w, "%q.%q:\n%s", t.nodeType(), t.Label(), tabIndent(txtar.Format(t.sourceArchive)))
}

func (t *txtarNode) writeSourceTo(b *bytes.Buffer) {
	p := bufPrintf(b)
	p("```coq\n")
	p("%swith %s %q %q%s\n", t.rf.page.leftDelim, fnSidebyside, t.lang, t.label, t.rf.page.rightDelim)
	p("%s", txtar.Format(t.sourceArchive))
	p("%send%s\n", t.rf.page.leftDelim, t.rf.page.rightDelim)
	p("```\n")
}

// tag searches for the first #$key tag line in the comment section of s's
// txtar archive. Tags are # prefixed lines where the # at the beginning of the
// line must be followed by a non-space character. args contains the contents
// of the quote-aware args that follow the tag name. present indicates whether
// the tag identified by key was present or not. err will be non-nil if there
// were errors in parsing the arguments to a tag.
//
// Note that this searches the sourceArchive.
//
// TODO: work out whether we want to handle comments in tag lines (which are
// themselves comments already).
func (t *txtarNode) tag(key string) (args []string, present bool, err error) {
	prefix := []byte("#" + key)
	sc := bufio.NewScanner(bytes.NewReader(t.sourceArchive.Comment))
	lineNo := 1
	for sc.Scan() {
		line := bytes.TrimSpace(sc.Bytes())
		if after, found := bytes.CutPrefix(bytes.TrimSpace(line), prefix); found {
			args, err := parseLineArgs(string(after))
			if err != nil {
				err = fmt.Errorf("%s:%d %w", t.label, lineNo, err)
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

func bufPrintf(b *bytes.Buffer) func(string, ...any) (int, error) {
	return func(format string, args ...any) (int, error) {
		return fmt.Fprintf(b, format, args...)
	}
}

type txtarAnalysis struct {
	hasEffectiveComment bool

	fileNames []filenameAnalysis
}

type filenameAnalysis struct {
	// Filepath is the original file path
	Filepath string

	// Basename is the Basename of the last element of filepath
	Basename string

	// Ext is the bit of the last element of filepath after the last '.' (unlike
	// filepath.Ext which starts at the final '.')
	Ext string

	// IsGolden is set if the file is considered a golden file
	IsGolden bool

	// IsOut is set if the file is considered an output in the archive
	IsOut bool
}

// analyseTxtarArchive provides common analysis that is used by
// the nodes which have txtar contents.
func analyseTxtarArchive(t *txtar.Archive) (res txtarAnalysis) {
	res.hasEffectiveComment = isEffectiveComment(t.Comment)
	for _, f := range t.Files {
		res.fileNames = append(res.fileNames, analyseFilename(f.Name))
	}
	return
}

// analyseFilename provides useful details about a file in a txtar archive.
func analyseFilename(p string) (res filenameAnalysis) {
	res.Filepath = p
	b := filepath.Base(p)
	if res.IsGolden = strings.HasSuffix(b, goldenExt); res.IsGolden {
		b = strings.TrimSuffix(b, goldenExt)
	}
	i := len(b) - 1
	for ; i >= 0 && !os.IsPathSeparator(b[i]); i-- {
		if b[i] == '.' {
			break
		}
	}
	if i > 0 {
		// Found a .
		res.Basename = b[:i]
		res.Ext = b[i+1:]
	}
	switch res.Basename {
	case "out", "stdout":
		res.IsOut = true
	}
	return
}
