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
	"html/template"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	"github.com/rogpeppe/go-internal/txtar"
)

const (
	fnSidebyside = "sidebyside"

	goldenExt = ".golden"

	tagNorun = "norun"
)

type sidebysideNode struct {
	*nodeWrapper
	lang             string
	label            string
	sourceArchive    *txtar.Archive
	effectiveArchive *txtar.Archive
}

func (s *sidebysideNode) Format(state fmt.State, verb rune) {
	fmt.Fprintf(state, "%v", s.nodeWrapper)
}

var _ runnableNode = (*sidebysideNode)(nil)

type sidebysideNodeRunContext struct {
	node *sidebysideNode
	*errorContextBuffer
}

func (s *sidebysideNode) run() runnable {
	return &sidebysideNodeRunContext{
		node:               s,
		errorContextBuffer: newBufferedErrorContext(s.executionContext),
	}
}

func (s *sidebysideNodeRunContext) run() (err error) {
	defer recoverFatalError(&err)
	// Skip entirely if the #norun tag is present
	if _, ok, _ := s.node.tag(tagNorun); ok {
		return nil
	}

	type job struct {
		cmd  *exec.Cmd
		post func()
	}
	var jobs []job

	// First format all non-output files
	for i := range s.node.sourceArchive.Files {
		f := &s.node.sourceArchive.Files[i]
		a := analyseFilename(f.Name)
		if a.IsOut {
			continue
		}
		switch a.Ext {
		case "json":
			var res bytes.Buffer
			cmd := s.dockerCmd(nil, "cue", "export", "--out=json", "json:", "-")
			cmd.Stdin = bytes.NewReader(f.Data)
			cmd.Stdout = &res
			jobs = append(jobs, job{
				cmd: cmd,
				post: func() {
					f.Data = res.Bytes()
				},
			})
		case "yaml":
			var res bytes.Buffer
			cmd := s.dockerCmd(nil, "cue", "export", "--out=yaml", "yaml:", "-")
			cmd.Stdin = bytes.NewReader(f.Data)
			cmd.Stdout = &res
			jobs = append(jobs, job{
				cmd: cmd,
				post: func() {
					f.Data = res.Bytes()
				},
			})
		case "cue":
			var res bytes.Buffer
			cmd := s.dockerCmd(nil, "cue", "fmt", "-")
			cmd.Stdin = bytes.NewReader(f.Data)
			cmd.Stdout = &res
			jobs = append(jobs, job{
				cmd: cmd,
				post: func() {
					f.Data = res.Bytes()
				},
			})
		}
	}

	// Start the formatting jobs
	for _, j := range jobs {
		s.debugf("%v: running %v", s, j.cmd)
		if err := j.cmd.Start(); err != nil {
			s.errorf("%v: failed to start %v: %v", s, j.cmd, err)
		}
	}

	// Wait for the formatting jobs in order
	for _, j := range jobs {
		if err := j.cmd.Wait(); err != nil {
			s.errorf("%v: failed to run %v: %v", s, j.cmd, err)
		} else {
			j.post()
		}
	}

	if s.inError {
		return
	}

	// Is there a script to run? If there is no effective script, i.e. non blank
	// non comment lines, we might need to fill one in when running. There are
	// shorthand versions of sidebyside nodes which don't have a script and yet
	// we want to run a predefined set of commands and write the files back.
	effectiveArchive := *s.node.sourceArchive
	s.node.effectiveArchive = &effectiveArchive

	var ok bool
	if !isEffectiveComment(effectiveArchive.Comment) {
		effectiveArchive.Comment, ok = s.buildEffectiveScript(&effectiveArchive)
		if !ok {
			s.logf("%v: failed to build effective comment", s)
			return
		}
	}

	// Now that the archive is updated with valid formatted files, run the
	// script
	td, err := s.tempDir("")
	if err != nil {
		s.fatalf("%v: failed to create temp dir: %v", s, err)
	}
	targetFile := filepath.Join(td, "script.txtar")
	containerFile := "/tmp/script.txtar"
	if err := os.WriteFile(targetFile, txtar.Format(s.node.effectiveArchive), 0666); err != nil {
		s.fatalf("%v: failed to write script: %v", s, err)
	}
	ts := s.dockerCmd(
		// We need to mount the script
		[]string{fmt.Sprintf("-v=%s:%s", targetFile, containerFile)},
		"testscript",
		fmt.Sprintf("-u=%v", s.updateGoldenFiles),
		containerFile,
	)
	s.debugf("%v: running %v\n%s", s, ts, tabIndent(txtar.Format(&effectiveArchive)))

	if byts, err := ts.CombinedOutput(); err != nil {
		s.fatalf("%v: failed to run %v: %v\n%s", s, ts, err, tabIndent(byts))
	}

	// Read the archive back and assign to indices of the effective archive
	resArchive, err := txtar.ParseFile(targetFile)
	if err != nil {
		s.fatalf("%v: failed to read resulting archvie %s: %v", s, targetFile, err)
	}
	for i := range effectiveArchive.Files {
		effectiveArchive.Files[i] = resArchive.Files[i]
	}

	return nil
}

func (s *sidebysideNodeRunContext) buildEffectiveScript(ar *txtar.Archive) ([]byte, bool) {
	// Try to build up a real script. Logic as follows
	var files []filenameAnalysis
	for _, f := range ar.Files {
		files = append(files, analyseFilename(f.Name))
	}

	// Pattern one. 2 files, basenames in and out. The in extension
	// tells us what to expect as input to cmd/cue, the out extension
	// tells us what to generate
	if len(files) == 2 && files[0].Basename == "in" && files[1].Basename == "out" {
		in, out := files[0], files[1]
		switch in.Ext {
		case "cue", "json", "yaml":
		default:
			s.fatalf("%v: unknown input extension %q on %s", s, in.Ext, in.Filepath)
		}
		switch out.Ext {
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
		{{if eq .Out.Ext "err"}}! {{end}}exec cue {{if and (eq .In.Ext "cue") (eq .Out.Ext "cue")}}eval{{else}}export{{end}} {{if ne .Out.Ext "err"}}--out {{.Out.Ext}}{{end}} {{.In.Ext}}: {{.In.Filepath}}
		cmp {{if eq .Out.Ext "err"}}stderr{{else}}stdout{{end}} {{.Out.Filepath}}
		`, args{In: in, Out: out})
		return []byte(cmd), true
	}

	return nil, false
}

func (s sidebysideNodeRunContext) templateScript(tmpl string, arg any) []byte {
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

func isEffectiveComment(b []byte) bool {
	lines := bytes.Split(b, []byte("\n"))
	for _, line := range lines {
		line = bytes.TrimSpace(line)
		if len(line) != 0 && !bytes.HasPrefix(line, []byte("#")) {
			return true
		}
	}
	// We saw only blank lines or comments
	return false
}

func tabIndent(b []byte) []byte {
	if len(b) == 0 {
		return b
	}
	return append([]byte("\t"), bytes.ReplaceAll(b, []byte("\n"), []byte("\n\t"))...)
}

func (s *sidebysideNodeRunContext) dockerCmd(dockerArgs []string, cmdArgs ...string) *exec.Cmd {
	td, err := s.tempDir("")
	if err != nil {
		s.fatalf("%v: failed to create temp dir: %v", s, err)
	}
	var args []string
	args = append(args,
		"docker", "run", "--rm",

		// Need to be able to pass stdin
		"-i",

		// For now, do not isolate the network. In general this is not an
		// acceptable solution from a security perspective. It also only works on
		// Linux. But given there is currently some control over the scripts that
		// run, there is some real benefit to the speed improvements.
		//
		// When caching of script runs lands, we will remove this workaround.
		"--network=host",

		// All docker images used by unity must support this interface
		"-e", fmt.Sprintf("USER_UID=%v", os.Geteuid()),
		"-e", fmt.Sprintf("USER_GID=%v", os.Getegid()),
	)
	args = append(args, dockerArgs...)
	args = append(args,
		dockerImageTag,
		"--",
	)
	args = append(args, cmdArgs...)
	cmd := exec.Command(args[0], args[1:]...)
	cmd.Dir = td
	return cmd
}

func (s *sidebysideNodeRunContext) Format(state fmt.State, verb rune) {
	fmt.Fprintf(state, "%v", s.node)
}

func (s *sidebysideNode) writeSourceTo(b *bytes.Buffer) {
	p := bufPrintf(b)
	p("```coq\n")
	p("%swith %s %q %q%s\n", s.nodeWrapper.rf.page.leftDelim, fnSidebyside, s.lang, s.label, s.nodeWrapper.rf.page.rightDelim)
	p("%s", txtar.Format(s.sourceArchive))
	p("%send%s\n", s.nodeWrapper.rf.page.leftDelim, s.nodeWrapper.rf.page.rightDelim)
	p("```\n")
}

func (s *sidebysideNode) writeTransformTo(b *bytes.Buffer) error {
	p := bufPrintf(b)
	var locations []string
	switch l := len(s.effectiveArchive.Files); l {
	case 2:
		// real side-by-side.
		locations = []string{"top-left", "top-right"}
	case 3:
		locations = []string{"top-left", "bottom-left", "top-right"}
	default:
		var b bytes.Buffer
		s.writeSourceTo(&b)
		return s.errorf("do not know how to handle %d txtar files: \n%s", l, b.Bytes())
	}
	var analyses []filenameAnalysis
	for _, f := range s.effectiveArchive.Files {
		analyses = append(analyses, analyseFilename(f.Name))
	}
	type tabProps struct {
		Name     string
		Language string
		Type     string
	}
	// TODO probably extract this code into some sort of strategy at some point
	tabs := make([]tabProps, len(analyses))
	if len(analyses) == 2 && analyses[0].Basename == "in" && analyses[1].Basename == "out" {
		in, out := analyses[0], analyses[1]
		tabs[0] = tabProps{
			Name:     strings.ToUpper(in.Ext),
			Language: in.Ext,
		}
		tabs[1] = tabProps{
			Name:     strings.ToUpper(out.Ext),
			Language: out.Ext,
			Type:     "terminal",
		}
	} else {
		for i, a := range analyses {
			tp := &tabs[i]
			tp.Name = a.Filepath
			tp.Language = a.Ext
			if a.IsOut {
				tp.Name = "TERMINAL"
				tp.Type = "terminal"
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
		p("%s", f.Data)
		p("{{< /code-tab >}}\n")
	}
	p("{{< /code-tabs >}}\n")
	return nil
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
func (s *sidebysideNode) tag(key string) (args []string, present bool, err error) {
	prefix := []byte("#" + key)
	sc := bufio.NewScanner(bytes.NewReader(s.sourceArchive.Comment))
	lineNo := 1
	for sc.Scan() {
		line := bytes.TrimSpace(sc.Bytes())
		if after, found := bytesCutPrefix(bytes.TrimSpace(line), prefix); found {
			args, err := parseLineArgs(string(after))
			if err != nil {
				err = fmt.Errorf("%s:%d %w", s.label, lineNo, err)
			}
			return args, true, err
		}
		lineNo++
	}
	return nil, false, nil
}

func bytesCutPrefix(s, prefix []byte) (after []byte, found bool) {
	if !bytes.HasPrefix(s, prefix) {
		return s, false
	}
	return s[len(prefix):], true
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
