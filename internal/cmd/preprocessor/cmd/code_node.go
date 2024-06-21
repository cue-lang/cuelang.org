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
	"encoding/base64"
	"fmt"
	"html/template"
	"strings"

	"golang.org/x/tools/txtar"
)

const (
	fnCode = "code"

	goldenExt = ".golden"
)

// A codeNode is used to create a simple ```-based code block for a single file
// whose contents are formatted. This ensures good formatting but also valid
// code.
type codeNode struct {
	txtarNode
	effectiveScript []byte
}

func (c *codeNode) nodeType() string {
	return fnCode
}

var _ runnableNode = (*codeNode)(nil)
var _ validatingNode = (*codeNode)(nil)

type codeNodeRunContext struct {
	codeNode *codeNode
	*txtarRunContext
}

func (c *codeNode) validate() {
	// If there is just one file, we behave like the old "code" node did.  Just
	// render a ```-based code block. Otherwise fall through to the old
	// sidebyside validation.
	if l := len(c.analysis.fileNames); l == 1 {
		return
	}

	// Validate that we know how to layout the txtar archive. It's always possible to
	// use the #location tag, just so long as the number of files matches the number of
	// "arguments" to that tag. In case there are 2 or 3 files, there are sensible
	// defaults, otherwise if there are >3 files the #location tag is required.
	ok := c.validateLocationDirective()
	l := len(c.analysis.fileNames)
	if !ok && l > 3 {
		c.errorf("%v: #%s tag required for %d files", c, tagLocation, l)
	}

	// Return early in case we are already in error
	if c.isInError() {
		return
	}

	// Return early if we have been told to #norun this archive
	if _, found, _ := c.tag(tagNorun, ""); found {
		return
	}

	var err error
	if !c.analysis.hasEffectiveComment {
		if c.effectiveScript, err = c.buildEffectiveScript(); err != nil {
			c.errorf("%v: failed to build effective comment: %v", c, err)
			return
		}
	}

	// Above we either had an effective comment in which case we didn't
	// need to create a script, or we didn't and we had to create one.
	// In either case, we want to take the first non-comment line as
	// the command, stripping the leading "exec"
	c.analysis.cmd = extractCommand(c.effectiveScript)
	if c.analysis.cmd == "" {
		c.errorf("%v: failed to find effective command in script:\n%s", c, tabIndent(c.effectiveScript))
	}
}

func (s *codeNode) buildEffectiveScript() ([]byte, error) {
	// We only know how to build an effective script for the in/out pattern
	if !s.analysis.isInOut {
		return nil, fmt.Errorf("only know how to build an effective script for an in-out archive")
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
	return s.templateScript(`
		{{if eq .Out.Ext "err"}}! {{end}}exec cue {{if and (eq .In.Ext "cue") (eq .Out.Ext "cue")}}eval{{else}}export{{end}} {{with .Out.Ext}}{{if ne . "err"}}--out {{.}}{{end}}{{end}} {{.In.Ext}}: {{.In.Filepath}}
		cmp {{if eq .Out.Ext "err"}}stderr{{else}}stdout{{end}} {{.Out.Filepath}}
		`, args{In: in, Out: out}), nil
}

func (s codeNode) templateScript(tmpl string, arg any) []byte {
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

func (s *codeNode) run() runnable {
	return &codeNodeRunContext{
		codeNode: s,
		txtarRunContext: &txtarRunContext{
			txtarNode:        s.txtarNode,
			executionContext: s.executionContext,
			bufferedErrorContext: &errorContextBuffer{
				executionContext: s.executionContext,
			},
		},
	}
}

func (s *codeNodeRunContext) run() {
	defer recoverFatalError(s)

	if err := s.formatFiles(); err != nil {
		s.fatalf("%v: failed to format files: %v", s, err)
	}

	// If we only have one file, behave like an old code node
	// and return early.
	if l := len(s.analysis.fileNames); l == 1 {
		return
	}

	effectiveArchive := &txtar.Archive{
		Comment: s.codeNode.effectiveScript,
		// We intentionally share the Files slice with the source archive because
		// we want updates to the effective archive to reflect in the source
		// archive.
		Files: s.archive.Files,
	}

	// Skip entirely if the #norun tag is present
	if _, ok, _ := s.tag(tagNorun, ""); ok {
		return
	}

	// Now that the archive is updated with valid formatted files, run the
	// script
	ts := s.dockerCmd(
		"testscript.sh",
		fmt.Sprintf("-u=%v", s.updateGoldenFiles),
	)
	ts.Stdin = bytes.NewReader(txtar.Format(effectiveArchive))
	s.debugf(s.debugCode, "%v: running %v\n%s", s, ts, tabIndent(txtar.Format(effectiveArchive)))

	byts, err := ts.CombinedOutput()
	if err != nil {
		s.fatalf("%v: failed to run %v: %v\n%s", s, ts, err, tabIndent(byts))
	}

	// Read the archive back and assign to indices of the effective archive
	resArchive := txtar.Parse(byts)
	for i := range effectiveArchive.Files {
		s.archive.Files[i] = resArchive.Files[i]
	}
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

func (s *codeNode) writeTransformTo(res *bytes.Buffer) error {
	b := new(bytes.Buffer)

	// A rather coarse switch based on number of filenames.
	//
	// TODO refactor and tidy up
	switch len(s.analysis.fileNames) {
	case 1:

		p := bufPrintf(b)

		// There will only be one file
		a := s.analysis.fileNames[0]
		f := s.archive.Files[0]

		// TODO tidy up templating etc
		p("```%s\n", a.Language)

		// Need to be sure we write a trailing newline because we always want to
		// write the closing ``` on a clear line.
		data := f.Data
		if len(data) > 0 && data[len(data)-1] != '\n' {
			data = append(data, '\n')
		}

		p("%s", data)
		p("```")

	default:
		p := bufPrintf(b)
		var locations []codeTabLocation
		// We know because of validate() that we will have a #location tag, if there is one
		// and that there are valid.
		tagLocations, found, err := s.tag(tagLocation, "")
		if err != nil {
			s.fatalf("%v: bad state with respect to validate(): err: %v", s, err)
		}
		if found {
			for _, l := range tagLocations {
				locations = append(locations, codeTabLocation(l))
			}
		} else {
			switch l := len(s.archive.Files); l {
			case 2:
				// real side-by-side.
				locations = []codeTabLocation{codeTabTopLeft, codeTabTopRight}
			case 3:
				locations = []codeTabLocation{codeTabTopLeft, codeTabTopRight, codeTabBottom}
			default:
				s.fatalf("%v: bad state with respect to validate(): found not set, but unsupported number of files (%d) for a default", s, l)
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

						// TODO: in its current state, this also includes any trailing
						// line comment. This should be fixed as part of reworking the
						// code node, but is a hack too far for now.
						tp.ToCopy = s.analysis.cmd
					}
				}
			}
		}
		// TODO tidy up templating etc
		p("{{< code-tabs >}}\n")
		for i, f := range s.archive.Files {
			t := tabs[i]
			args := []string{
				fmt.Sprintf("name=%q", t.Name),
				fmt.Sprintf("language=%q", t.Language),
				fmt.Sprintf("area=%q", locations[i]),
			}

			if t.Type != "" {
				args = append(args, fmt.Sprintf("type=%q", t.Type))
			}

			if t.ToCopy != "" {
				// Build up a base64 encoded script that will be copied. This is necessary
				// because the rendered window will include the output... which won't work
				// if copy-pasted.
				var copyCmdStr strings.Builder
				enc := base64.NewEncoder(base64.StdEncoding, &copyCmdStr)
				fmt.Fprintf(enc, "%s", t.ToCopy)
				enc.Close()
				args = append(args, fmt.Sprintf("codetocopy=%q", copyCmdStr.String()))
			}

			p("{{< code-tab %s >}}\n", strings.Join(args, " "))
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
	}

	res.WriteString(s.rf.page.config.randomReplace(b.String()))
	return nil
}
