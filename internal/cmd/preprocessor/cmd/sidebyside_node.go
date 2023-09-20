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
	"html/template"
	"os"
	"path/filepath"
	"strings"

	"golang.org/x/tools/txtar"
)

const (
	fnSidebyside = "sidebyside"

	goldenExt = ".golden"
)

type sidebysideNode struct {
	txtarNode
}

func (s *sidebysideNode) nodeType() string {
	return fnSidebyside
}

var _ runnableNode = (*sidebysideNode)(nil)

type sidebysideNodeRunContext struct {
	*txtarRunContext
}

func (s *sidebysideNode) validate() error {
	// Is there a script to run? If there is no effective script, i.e. non blank
	// non comment lines, we might need to fill one in when running. There are
	// shorthand versions of sidebyside nodes which don't have a script and yet
	// we want to run a predefined set of commands and write the files back.
	effectiveArchive := *s.sourceArchive
	s.effectiveArchive = &effectiveArchive

	// used below, declare early for visibility
	var ok bool

	// Validate that we know how to layout the txtar archive. It's always possible to
	// use the #location tag, just so long as the number of files matches the number of
	// "arguments" to that tag. In case there are 2 or 3 files, there are sensible
	// defaults, otherwise if there are >3 files the #location tag is required.
	locations, ok, err := s.tag(tagLocation, "")
	if err != nil {
		return s.errorf("%v: failed to extract #%s tag: %v", s, tagLocation, err)
	}
	if !ok {
		// This case is only a problem if we have >3 files
		if l := len(s.analysis.fileNames); l > 3 {
			s.errorf("%v: #%s tag required for %d files", s, tagLocation, l)
		}
	} else {
		// We have a tag, do we have enough arguments?
		nargs := len(locations)
		nfiles := len(s.analysis.fileNames)
		if nargs != nfiles {
			s.errorf("%v: saw %d files but only %d arguments to #%s", s, nfiles, nargs, tagLocation)
		}

		// Ensure we can parse the locations
		for _, l := range locations {
			// TODO: switch to an auto-generated function that tries to parse
			switch codeTabLocation(l) {
			case codeTabTop, codeTabBottom, codeTabLeft, codeTabRight,
				codeTabTopLeft, codeTabTopRight:
			default:
				s.errorf("%v: unknown locaion %q", s, l)
			}
		}
	}

	if s.isInError() {
		return errorIfInError(s)
	}

	// Return early if we have been told to #norun this archive
	if _, found, _ := s.tag(tagNorun, ""); found {
		return nil
	}

	if !s.analysis.hasEffectiveComment {
		effectiveArchive.Comment, ok = s.buildEffectiveScript(s.analysis, s.effectiveArchive)
		if !ok {
			return s.errorf("%v: failed to build effective comment", s)
		}
	}

	// Above we either had an effective comment in which case we didn't
	// need to create a script, or we didn't and we had to create one.
	// In either case, we want to take the first non-comment line as
	// the command, stripping the leading "exec"
	s.analysis.cmd = extractCommand(effectiveArchive.Comment)
	if s.analysis.cmd == "" {
		s.fatalf("no effective command?")
	}
	return nil
}

func (s *sidebysideNode) run() runnable {
	return &sidebysideNodeRunContext{
		txtarRunContext: &txtarRunContext{
			txtarNode:        s.txtarNode,
			executionContext: s.executionContext,
			bufferedErrorContext: &errorContextBuffer{
				executionContext: s.executionContext,
			},
		},
	}
}

func (s *sidebysideNodeRunContext) run() (err error) {
	defer recoverFatalError(&err)

	if err := s.formatFiles(); err != nil {
		return errorIfInError(s)
	}

	// Update the effective files in from the source files
	for i, f := range s.sourceArchive.Files {
		s.effectiveArchive.Files[i].Data = f.Data
	}

	// Skip entirely if the #norun tag is present
	if _, ok, _ := s.tag(tagNorun, ""); ok {
		return nil
	}

	// Now that the archive is updated with valid formatted files, run the
	// script
	td, err := s.tempDir("")
	if err != nil {
		s.fatalf("%v: failed to create temp dir: %v", s, err)
	}
	targetFile := filepath.Join(td, "script.txtar")
	containerFile := "/tmp/script.txtar"
	if err := os.WriteFile(targetFile, txtar.Format(s.effectiveArchive), 0666); err != nil {
		s.fatalf("%v: failed to write script: %v", s, err)
	}
	ts := s.dockerCmd(
		// We need to mount the script
		[]string{fmt.Sprintf("-v=%s:%s", targetFile, containerFile)},
		"testscript",
		fmt.Sprintf("-u=%v", s.updateGoldenFiles),
		containerFile,
	)
	s.debugf(s.debugGeneral, "%v: running %v\n%s", s, ts, tabIndent(txtar.Format(s.effectiveArchive)))

	if byts, err := ts.CombinedOutput(); err != nil {
		s.fatalf("%v: failed to run %v: %v\n%s", s, ts, err, tabIndent(byts))
	}

	// Read the archive back and assign to indices of the effective archive
	resArchive, err := txtar.ParseFile(targetFile)
	if err != nil {
		s.fatalf("%v: failed to read resulting archvie %s: %v", s, targetFile, err)
	}
	for i := range s.effectiveArchive.Files {
		s.effectiveArchive.Files[i] = resArchive.Files[i]
	}

	return nil
}

func (s *sidebysideNode) buildEffectiveScript(a txtarAnalysis, ar *txtar.Archive) ([]byte, bool) {
	// We only know how to build an effective script for the in/out pattern
	if !a.isInOut {
		return nil, false
	}

	// Try to build up a real script. Logic as follows
	files := s.analysis.fileNames

	// Pattern one. 2 files, basenames in and out. The in extension
	// tells us what to expect as input to cmd/cue, the out extension
	// tells us what to generate
	in, out := files[0], files[1]
	switch in.Ext {
	case "cue", "json", "yaml":
	default:
		s.fatalf("%v: unknown input extension %q on %s", s, in.Ext, in.Filepath)
	}
	switch out.Ext {
	case "":
		// This is fine; we just don't want the output specially rendered
	case "cue", "json", "yaml":
	case "err":
		// Special case where we just want the output
	default:
		s.fatalf("%v: unknown output extension %q on %s", s, out.Ext, out.Filepath)
	}
	type args struct {
		In  filenameAnalysis
		Out filenameAnalysis
	}
	cmd := s.templateScript(`
		{{if eq .Out.Ext "err"}}! {{end}}exec cue {{if and (eq .In.Ext "cue") (eq .Out.Ext "cue")}}eval{{else}}export{{end}} {{with .Out.Ext}}{{if ne . "err"}}--out {{.}}{{end}}{{end}} {{.In.Ext}}: {{.In.Filepath}}
		cmp {{if eq .Out.Ext "err"}}stderr{{else}}stdout{{end}} {{.Out.Filepath}}
		`, args{In: in, Out: out})
	return []byte(cmd), true
}

func (s sidebysideNode) templateScript(tmpl string, arg any) []byte {
	// Normalise multiline string for ease of writing in caller
	lines := strings.Split(tmpl, "\n")
	for i := range lines {
		lines[i] = strings.TrimSpace(lines[i])
	}
	tmpl = strings.Join(lines, "\n")
	if tmpl[len(tmpl)-1] != '\n' {
		tmpl += "\n"
	}
	t, err := template.New("test").Parse(tmpl)
	if err != nil {
		s.fatalf("%v: failed to parse template: %v\n%s", s, err, tabIndent([]byte(tmpl)))
	}
	var res bytes.Buffer
	if err := t.Execute(&res, arg); err != nil {
		s.fatalf("%v: failed to execute template: %v\n%s", s, err, tabIndent([]byte(tmpl)))
	}
	return res.Bytes()
}

// extractCommand returns the first non-comment, non-blank line in b, stripping
// an "exec " prefix. extractCommand returns "" in case there was no such line.
//
// TODO strip trailing comments in an argument-aware manner.
func extractCommand(b []byte) string {
	lines := bytes.Split(b, []byte("\n"))
	for _, line := range lines {
		line = bytes.TrimSpace(line)
		if len(line) == 0 || bytes.HasPrefix(line, []byte("#")) {
			continue
		}

		cmd := string(line)

		// We might have a leading ! if we are expecting a command to fail
		cmd = strings.TrimSpace(strings.TrimPrefix(cmd, "!"))

		// We have exec as a prefix on most commands, because we are executing
		// testscript
		cmd = strings.TrimSpace(strings.TrimPrefix(cmd, "exec"))

		return cmd
	}
	return ""
}

func tabIndent(b []byte) []byte {
	if len(b) == 0 {
		return b
	}
	return append([]byte("\t"), bytes.ReplaceAll(b, []byte("\n"), []byte("\n\t"))...)
}

func (s *sidebysideNode) writeTransformTo(b *bytes.Buffer) error {
	p := bufPrintf(b)
	var locations []codeTabLocation
	switch l := len(s.effectiveArchive.Files); l {
	case 2:
		// real side-by-side.
		locations = []codeTabLocation{codeTabTopLeft, codeTabTopRight}
	case 3:
		locations = []codeTabLocation{codeTabTopLeft, codeTabTopRight, codeTabBottom}
	default:
		// We know because of validate() that we will have a #location tag,
		// and that there are valid.
		tagLocations, found, err := s.tag(tagLocation, "")
		if !found || err != nil {
			s.fatalf("%v: bad state with respect to validate(): found: %v, err: %v", s, found, err)
		}
		for _, l := range tagLocations {
			locations = append(locations, codeTabLocation(l))
		}
	}
	analyses := s.analysis.fileNames

	// TODO probably extract this code into some sort of strategy at some point
	tabs := make([]tabProps, len(analyses))
	if s.analysis.isInOut {
		in, out := analyses[0], analyses[1]
		tabs[0] = tabProps{
			Name:     strings.ToUpper(in.Ext),
			Language: in.Language,
		}
		tabs[1] = tabProps{
			Name:     strings.ToUpper(out.Ext),
			Language: out.Language,
			Type:     "terminal",
		}
	} else {
		for i, a := range analyses {
			tp := &tabs[i]
			tp.Name = a.Filepath
			tp.Language = a.Language
			if a.IsOut {
				tp.Name = "TERMINAL"
				tp.Type = "terminal"

				// Only in the case of 3 files do we output the command (for now)
				// We need to improve the rules and logic around this with time.
				if !s.analysis.isInOut {
					tp.ContentPrefix = fmt.Sprintf("$ %s\n", s.analysis.cmd)
				}
			}
		}
	}
	// TODO tidy up templating etc
	p("{{< code-tabs >}}\n")
	for i, f := range s.effectiveArchive.Files {
		t := tabs[i]
		var typ string
		if t.Type != "" {
			typ = fmt.Sprintf("type=%q", t.Type)
		}
		p("{{< code-tab name=%q language=%q %v area=%q >}}\n", t.Name, t.Language, typ, locations[i])
		p(t.ContentPrefix)

		// Need to be sure we write a trailing newline because we always want to
		// write the closing ``` on a clear line.
		data := f.Data
		if len(data) > 0 && data[len(data)-1] != '\n' {
			data = append(data, '\n')
		}
		p("%s", data)
		p("{{< /code-tab >}}\n")
	}
	p("{{< /code-tabs >}}")
	return nil
}
