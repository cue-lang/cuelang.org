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
	// templateFunctions is the list of bare {{with}} transforms that we
	// support.  The variable is called templateFunctions because
	// text/template/parse sees the bare words and interprets them as if they
	// were function calls.
	templateFunctions = map[string]any{
		fnSidebyside: true,
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

	// bodyParts is a list of the internalised versions of the
	// text/template/parse-d input. Each node can be written back
	// to the input format, run (to update itself), or written
	// to the output format ready for consumption by Hugo.
	bodyParts []node
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

func (rf *rootFile) transform(targetPath string) error {
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
		// Note errors in parse have position information
		return fmt.Errorf("failed to parse: %w", err)
	}

	if err := rf.run(); err != nil {
		return err
	}

	// Write the parsed rootFile back to ensure we have have normalised input.
	writeBack := new(bytes.Buffer)
	if err := rf.writeSource(writeBack); err != nil {
		return fmt.Errorf("failed to write to %s: %w", rf.filename, err)
	}
	if err := writeIfDiff(writeBack, rf.filename, rf.contents); err != nil {
		return fmt.Errorf("failed to write normalised input: %w", err)
	}

	// Transform the root file
	transformed := new(bytes.Buffer)
	if err := rf.writeTarget(transformed); err != nil {
		return fmt.Errorf("failed to transform %s: %w", rf.filename, err)
	}
	if err := writeIfDiff(transformed, targetPath, nil); err != nil {
		return fmt.Errorf("failed to write transformed output: %w", err)
	}
	return nil
}

// run is responsible for updating those nodes which contain inputs and outputs.
// The inputs generally need to be formatted, scripts run, and outputs updated.
// This method also adds as a means to check that we only have parsed things
// that we can support.
func (rf *rootFile) run() error {
	for _, n := range rf.bodyParts {
		if err := n.run(); err != nil {
			return fmt.Errorf("failed to run %s: %w", rf.filename, err)
		}
	}
	return nil
}

// transform writes out root file rf in a format that is ready to be consumed
// by hugo.
func (rf *rootFile) writeTarget(b *bytes.Buffer) error {
	// Write out the header
	b.WriteString(headerLine)
	b.Write(rf.header)
	b.WriteString(headerLine)
	parts := rf.bodyParts

	for _, n := range parts {
		if err := n.writeTransformTo(b); err != nil {
			return err
		}
	}
	return nil
}

// write writes to b, in a form that would allow it to be parsed for a perfect
// round trip. It panics if rf has not been parsed, a state that is indicated
// by a nil body.
func (rf *rootFile) writeSource(b *bytes.Buffer) error {
	if rf.body == nil {
		panic("cannot call write on an unparsed rootFile")
	}
	b.WriteString(headerLine)
	b.Write(rf.header)
	b.WriteString(headerLine)

	for _, n := range rf.bodyParts {
		n.writeSourceTo(b)
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
	} else {
		// assume the file exists
		exists = true
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
