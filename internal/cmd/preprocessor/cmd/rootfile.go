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

	"github.com/cue-lang/cuelang.org/internal/parse"
)

var (
	withFunctions = map[string]any{
		"sidebyside": true,
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

	// header is the Yaml header of a root file
	header []byte

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

func (rf *rootFile) process(sourcePath, targetPath string) error {
	// For now, we only support en as a main language. For other languages
	// we simply copy from source to target.
	if rf.lang != langEn {
		return copyFile(sourcePath, targetPath)
	}
	// HTML files don't need any special processing
	if rf.ext == "html" {
		return copyFile(sourcePath, targetPath)
	}

	// Start by parsing the root file
	if err := rf.parse(); err != nil {
		return fmt.Errorf("failed to parse %s: %w", rf.filename, err)
	}

	// Write the parsed rootFile back to ensure we have have normalised input.
	writeBack := new(bytes.Buffer)
	if err := rf.write(writeBack); err != nil {
		return fmt.Errorf("failed to write to %s: %w", sourcePath, err)
	}
	if err := writeIfDiff(writeBack, sourcePath, rf.contents); err != nil {
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

	return copyFile(sourcePath, targetPath)
}

func (rf *rootFile) transform(b *bytes.Buffer) error {
	if err := rf.write(b); err != nil {
		return err
	}
	return nil
}

var (
	headerStart = []byte("---\n")   // clear line
	headerEnd   = []byte("\n---\n") // clear line required
)

// parse parses a root file into its components.
func (rf *rootFile) parse() error {
	f, err := os.ReadFile(rf.filename)
	if err != nil {
		return fmt.Errorf("failed to read: %w", err)
	}
	rf.contents = f
	if !bytes.HasPrefix(f, headerStart) {
		return fmt.Errorf("failed to find start of header")
	}
	header := f[len(headerStart):]
	body := header
	if bytes.HasPrefix(header, headerStart) {
		// Special case of empty header
		header = nil
		body = body[len(headerStart):]
	} else {
		end := bytes.Index(header, headerEnd)
		if end == -1 {
			return fmt.Errorf("failed to find end of header")
		}
		header = header[:end]
		body = body[end+len(headerEnd):]
	}
	rf.header = header

	parseTrees, err := parse.Parse(rf.filename, string(body), "{{{", "}}}", withFunctions)
	if err != nil {
		return fmt.Errorf("failed to parse body: %w", err)
	}
	rf.body = parseTrees[rf.filename]

	return nil
}

// write writes a parsed rf to the absolute file target. It panics if rf
// has not been parsed, a state that is indicated by a nil body.
func (rf *rootFile) write(b *bytes.Buffer) error {
	if rf.body == nil {
		panic("cannot call write on an unparsed rootFile")
	}
	b.Write(headerStart)
	if len(rf.header) == 0 {
		b.Write(headerStart)
	} else {
		b.Write(rf.header)
		b.Write(headerEnd)
	}

	for _, n := range rf.body.Root.Nodes {
		fmt.Fprintf(b, "%v", n)
	}

	return nil
}

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
