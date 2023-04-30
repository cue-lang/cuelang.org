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

	"github.com/cue-lang/cuelang.org/internal/parse"
	"golang.org/x/tools/txtar"
)

const (
	// markdown header delimiters
	headerDelimiter = "---"
	headerLine      = headerDelimiter + "\n"

	// {{with}} blocks can optionally be wrapped in a ```coq ``` pair
	// to make rendering nicer within tools like Notion
	withStartWrapperLine = "```coq\n" // could appear at the start or a clear line
	withEndWrapper       = "\n```\n"  // always appears on a clear line
)

var (
	// withFunctions is the list of bare {{with}} transforms that we support.
	// The variable is called withFunctions because text/template/parse sees the
	// bare words and interprets them as if they were function calls.
	withFunctions = map[string]any{
		"sidebyside": true,
		"reference":  true,
		"def":        true,
		"sidetrack":  true,
		"TODO":       true,
	}
)

// rootFile is a convenience data structure for keeping track of root files we
// have found.
type rootFile struct {
	// page is the "enclosing" page for which this root file (and others) acts
	// as a root.
	page *page

	// filename is the name of the root file. It is relative to page.dir
	filename string

	// prefix is the prefix present on filename
	prefix string

	// ext is the filename extension of filename
	ext string

	// lang is the language of the root file filename
	lang lang

	// contents is the raw []byte contents of the file captured
	// during parse in order that the subsequent write back to
	// the source file can be skipped if the contents are byte-equal.
	contents []byte

	// header is the Yaml header of a root file. It will either be nil
	// or a \n terminated block (that should parse as yaml).
	header []byte

	// bodyPrefix is the newline padding added as a prefix to the string parsed
	// as the body text/template. This helps ensure line numbers are accurate.
	// This needs to be stripped off when writing out the result.
	bodyPrefix []byte

	// body is the text/template/parse-d result of the body
	body *parse.Tree
}

// newRootFile creates a new rootFile for fn.
func (p *page) newRootFile(fn string, lang lang, prefix, ext string) *rootFile {
	return &rootFile{
		page:     p,
		filename: filepath.Join(p.dir, fn),
		lang:     lang,
		prefix:   prefix,
		ext:      ext,
	}
}

func (rf *rootFile) process(targetPath string) error {
	// For now, we only support en as a main language. For other languages
	// we simply copy from source to target.
	if rf.lang != langEn {
		return copyFile(rf.filename, targetPath)
	}
	// HTML files don't need any special processing
	if rf.ext == "html" {
		return copyFile(rf.filename, targetPath)
	}

	// Start by parsing the root file
	if err := rf.parse(); err != nil {
		return fmt.Errorf("failed to parse %s: %w", rf.filename, err)
	}

	if err := rf.run(); err != nil {
		return fmt.Errorf("failed to run %s: %w", rf.filename, err)
	}

	// Write the parsed rootFile back to ensure we have have normalised input.
	writeBack := new(bytes.Buffer)
	if err := rf.write(writeBack); err != nil {
		return fmt.Errorf("failed to write to %s: %w", rf.filename, err)
	}
	if err := writeIfDiff(writeBack, rf.filename, rf.contents); err != nil {
		return fmt.Errorf("failed to write normalised input: %w", err)
	}

	// Transform the root file
	transformed := new(bytes.Buffer)
	if err := rf.transform(transformed); err != nil {
		return fmt.Errorf("failed to transform: %w", err)
	}
	if err := writeIfDiff(transformed, targetPath, nil); err != nil {
		return fmt.Errorf("failed to write transformed output: %w", err)
	}
	return nil
}

// parse parses a root file into its component parse: a header and body. The body
// is parsed as a text/template document.
func (rf *rootFile) parse() error {
	f, err := os.ReadFile(rf.filename)
	if err != nil {
		return fmt.Errorf("failed to read: %w", err)
	}
	rf.contents = f

	bodyStart := 0

	// Parse header. Must be right at the headerStart of the file
	if !bytes.HasPrefix(f, []byte(headerLine)) {
		return fmt.Errorf("failed to find start of header")
	}
	header := f[len(headerLine):]
	bodyStart += len(headerLine)
	// If the header is empty the end will immediately follow
	if bytes.HasPrefix(header, []byte(headerLine)) {
		header = nil
		bodyStart += len(headerLine)
	} else {
		// It's not a prefix, it must be a clear line
		const headerEnd = "\n" + headerLine
		endIndex := bytes.Index(header, []byte(headerEnd))
		if endIndex == -1 {
			return fmt.Errorf("failed to find end of header")
		}
		bodyStart += endIndex + len(headerEnd)
		header = header[:endIndex+1] // to leave the header including the \n
	}
	rf.header = header

	// Prefix the body with as many newlines as we saw across
	// the header block in order that offsets etc are accurate
	rf.bodyPrefix = bytes.Repeat([]byte("\n"), bytes.Count(f[:bodyStart], []byte("\n")))
	body := append(rf.bodyPrefix, f[bodyStart:]...)

	// TODO derive the delimiters from the page's CUE config
	parseTrees, err := parse.Parse(rf.filename, string(body), "{{{", "}}}", withFunctions)
	if err != nil {
		return fmt.Errorf("failed to parse body: %w", err)
	}
	rf.body = parseTrees[rf.filename]

	return nil
}

// run is responsible for updating those nodes which contain inputs and outputs.
// The inputs generally need to be formatted, scripts run, and outputs updated.
// This method also adds as a means to check that we only have parsed things
// that we can support.
func (rf *rootFile) run() error {
	for _, n := range rf.body.Root.Nodes {
		switch n := n.(type) {
		case *parse.WithNode:
			fmt.Printf(">>> %#v\n", n.Pipe.Cmds[0])
			// For now we do not support else blocks
			if n.ElseList != nil && len(n.ElseList.Nodes) > 0 {
				return rf.bodyError(n.ElseList, "with node cannot have else block")
			}

			// For now we only support a single text node, i.e. a testscript blob
			bodyOk := n.List != nil && len(n.List.Nodes) == 1
			var body *parse.TextNode
			if bodyOk {
				body, bodyOk = n.List.Nodes[0].(*parse.TextNode)
			}
			if !bodyOk {
				return rf.bodyError(n, "with node must contain a text-only (testscript) body")
			}
			_ = txtar.Parse(body.Text)
		}
	}
	return nil

}

func (rf *rootFile) bodyError(n parse.Node, format string, args ...any) error {
	location, _ := rf.body.ErrorContext(n)
	return fmt.Errorf(location+" "+format, args...)
}

// transform writes out root file rf in a format that is ready to be consumed by hugo.
func (rf *rootFile) transform(b *bytes.Buffer) error {
	// Write out the header
	b.WriteString(headerLine)
	b.Write(rf.header)
	b.WriteString(headerLine)
	parts := rf.body.Root.Nodes

	for i, n := range parts {

		var lastWasWith, nextIsWith bool
		if i < len(parts)-1 {
			_, nextIsWith = parts[i+1].(*parse.WithNode)
		}
		if i > 0 {
			_, lastWasWith = parts[i-1].(*parse.WithNode)
		}
		switch n := n.(type) {
		case *parse.TextNode:
			t := n.String()
			if i == 0 {
				// We know this will be a text node because we put in a fake prefix
				t = strings.TrimPrefix(t, string(rf.bodyPrefix))
			}
			if nextIsWith {
				if t == withStartWrapperLine {
					t = ""
				} else {
					t = strings.TrimSuffix(t, "\n"+withStartWrapperLine)
				}
			}
			if lastWasWith {
				// the close ``` must always be on a clear line
				t = strings.TrimPrefix(t, withEndWrapper)
			}
			b.WriteString(t)
		case *parse.WithNode:
		}
	}
	return nil
}

// write writes to b, in a form that would allow it to be parsed for a perfect
// round trip. It panics if rf has not been parsed, a state that is indicated
// by a nil body.
func (rf *rootFile) write(b *bytes.Buffer) error {
	if rf.body == nil {
		panic("cannot call write on an unparsed rootFile")
	}
	b.WriteString(headerLine)
	b.Write(rf.header)
	b.WriteString(headerLine)

	for i, n := range rf.body.Root.Nodes {
		if i == 0 {
			// We know this will be a text node because we put in a fake prefix
			t := n.(*parse.TextNode).Text
			t = bytes.TrimPrefix(t, rf.bodyPrefix)
			b.Write(t)
			continue
		}
		fmt.Fprintf(b, "%v", n)
	}

	return nil
}

// writeIfDiff writes b to target but only if b represents a diff from the
// current contents of target.
func writeIfDiff(b *bytes.Buffer, target string, curVal []byte) error {
	var err error
	var exists bool
	if curVal == nil {
		// The file might not exist
		curVal, err = os.ReadFile(target)
		if err == nil {
			exists = true
		}
	}
	// Early return if the target exists and is byte-equal
	if exists && bytes.Equal(curVal, b.Bytes()) {
		return nil
	}
	targetDir := filepath.Dir(target)
	if err := os.MkdirAll(targetDir, 0777); err != nil {
		return fmt.Errorf("failed to ensure %s exists: %w", targetDir, err)
	}
	if err := os.WriteFile(target, b.Bytes(), 0666); err != nil {
		return fmt.Errorf("failed to write to %s: %w", target, err)
	}
	return nil

}
