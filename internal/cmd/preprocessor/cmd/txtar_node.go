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
	"io"
	"os"
	"os/exec"
	"path/filepath"
	"strings"

	"golang.org/x/tools/txtar"
)

type txtarNode struct {
	*nodeWrapper
	typ     string
	lang    string
	label   string
	archive *txtar.Archive

	analysis txtarAnalysis
}

func (t *txtarNode) nodeLabel() string {
	return t.label
}

func (t *txtarNode) nodeType() string {
	return t.typ
}

func (t *txtarNode) writeToHasher(w io.Writer) {
	ar := t.rf.page.config.randomReplace(string(txtar.Format(t.archive)))
	fmt.Fprintf(w, "%q.%q:\n%s", t.nodeType(), t.nodeLabel(), tabIndent([]byte(ar)))
}

func (t *txtarNode) writeSourceTo(b *bytes.Buffer) {
	p := bufPrintf(b)
	p("%swith %s %q %q%s\n", t.rf.page.config.LeftDelim, t.typ, t.lang, t.label, t.rf.page.config.RightDelim)
	p("%s", t.rf.page.config.unexpandReferences(txtar.Format(t.archive)))
	p("%send%s", t.rf.page.config.LeftDelim, t.rf.page.config.RightDelim)
}

// tag searches for the first tag directive named key in the sourceArchive.
// See findTag for more details on the search.
//
// TODO: work out whether we want to handle comments in tag lines (which are
// themselves comments already).
//
// TODO: add an explicit test for when arg != ""
func (t *txtarNode) tag(key, arg string) (args []string, present bool, err error) {
	args, present, err = findTag(t.archive.Comment, key, arg)
	if err != nil {
		err = fmt.Errorf("%s: %v", t.label, err)
	}
	return args, present, err
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

	// cmd is the command used to "run" a txtar node. In case
	// hasEffectiveComment is true, it will be the first effective
	// line in the comment. Otherwise, it will be determined
	// according to a strategy like the in-out pattern and set
	// later.
	cmd string

	fileNames []filenameAnalysis

	// isInOut indicates that the txtar uses the in/out pattern
	isInOut bool
}

type filenameAnalysis struct {
	// Filepath is the original file path.
	Filepath string

	// Basename is the last element of filepath with Ext removed.
	Basename string

	// Ext is the bit of the last element of filepath after the last '.' (unlike
	// filepath.Ext which starts at the final '.').
	Ext string

	// IsGolden is set if the file is considered a golden file.
	IsGolden bool

	// IsOut is set if the file is considered an output in the archive.
	IsOut bool

	// Language is the name used when rendering a code block for the
	// archive file. In most cases this will be the same value as Ext
	// but this field exists in order to allow for varying it.
	Language string
}

// analyseTxtarArchive provides common analysis that is used by
// the nodes which have txtar contents.
func analyseTxtarArchive(t *txtar.Archive) (res txtarAnalysis) {
	res.hasEffectiveComment = isEffectiveComment(t.Comment)
	for _, f := range t.Files {
		res.fileNames = append(res.fileNames, analyseFilename(f.Name))
	}
	res.isInOut = len(t.Files) == 2 && res.fileNames[0].Basename == "in" && res.fileNames[1].Basename == "out"
	return
}

// isEffectiveComment returns true if the txtar comment b comprises anything
// more than simply comments and whitespace.
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

// analyseFilename provides useful details about a file in a txtar archive.
func analyseFilename(p string) (res filenameAnalysis) {
	res.Filepath = p
	b := filepath.Base(p)
	if res.IsGolden = strings.HasSuffix(b, goldenExt); res.IsGolden {
		b = strings.TrimSuffix(b, goldenExt)
	}
	// Default the basename to the filename itself, updating below
	// if we find an extension.
	res.Basename = b
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

		res.Language = res.Ext
	}
	switch res.Basename {
	case "out", "stdout":
		res.IsOut = true
	}
	return
}

type txtarRunContext struct {
	txtarNode
	bufferedErrorContext
	*executionContext
}

// formatFiles formats the files in the source archive.
func (t *txtarRunContext) formatFiles() error {
	type job struct {
		f   *txtar.File
		cmd *exec.Cmd
		out bytes.Buffer
	}
	var jobs []*job

	// If the entire txtar is marked as #nofmt, skip all files
	if _, ok, _ := t.tag(tagNoFmt, ""); ok {
		return nil
	}

	// First format all non-output files
	for i := range t.archive.Files {
		f := &t.archive.Files[i]
		if _, ok, _ := t.tag(tagNoFmt, f.Name); ok {
			continue
		}
		a := analyseFilename(f.Name)
		if a.IsOut {
			continue
		}
		var cmd *exec.Cmd
		switch a.Ext {
		case "json":
			cmd = t.dockerCmd(nil, "cue", "export", "--out=json", "json:", "-")
			cmd.Stdin = bytes.NewReader(f.Data)
		case "yaml", "yml":
			// TODO: add support for yaml formatting, after working out how to make
			// this tooling generally available in the base docker image. The problem
			// is that right now CUE drops comments on Yaml export.
		case "go":
			cmd = t.dockerCmd(nil, "gofmt")
			cmd.Stdin = bytes.NewReader(f.Data)
		case "cue":
			cmd = t.dockerCmd(nil, "cue", "fmt", "-")
			cmd.Stdin = bytes.NewReader(f.Data)
		case "proto":
			// TODO: add support for proto formatting, after working out how to make
			// this tooling generally available in the base docker image.
		case "txt", "csv":
			// do nothing, simply avoid logging
		default:
			t.logf("%v: skipping formatting of file %q; unknown extension %q", t, a.Basename, a.Ext)
		}
		if cmd == nil {
			// Nothing to do
			continue
		}
		jobs = append(jobs, &job{
			f:   f,
			cmd: cmd,
		})
	}

	if err := dockerImageChecker(); err != nil {
		t.fatalf("%v", err)
	}

	// Start the formatting jobs
	for _, j := range jobs {
		j.cmd.Stdout = &j.out
		j.cmd.Stderr = &j.out
		t.debugf(t.debugFormatting, "%v: running %v", t, j.cmd)
		if err := j.cmd.Start(); err != nil {
			t.errorf("%v: failed to start %v: %v", t, j.cmd, err)
		}
	}

	// Wait for the formatting jobs in order
	for _, j := range jobs {
		if err := j.cmd.Wait(); err != nil {
			t.errorf("%v: failed to run %v: %v\n%s", t, j.cmd, err, tabIndent(j.out.Bytes()))
		} else {
			j.f.Data = j.out.Bytes()
		}
	}

	return errorIfInError(t)
}

func (t *txtarRunContext) dockerCmd(dockerArgs []string, cmdArgs ...string) *exec.Cmd {
	td, err := t.tempDir("")
	if err != nil {
		t.fatalf("%v: failed to create temp dir: %v", t, err)
	}
	var args []string
	args = append(args,
		"docker", "run", "--rm",

		// Need to be able to pass stdin
		"-i",

		// All docker images used by unity must support this interface
		"-e", fmt.Sprintf("USER_UID=%v", os.Geteuid()),
		"-e", fmt.Sprintf("USER_GID=%v", os.Getegid()),
	)

	// If the user wants to be unsafe and _not_ isolate the network let them
	// It results in much faster running times when working on changes in the
	// preprocessor.
	if os.Getenv("CUE_UNSAFE_NETWORK_HOST") != "" {
		args = append(args, "--network=host")
	}

	args = append(args, dockerArgs...)
	args = append(args,
		// TODO: support per-guide docker images
		dockerImageTag,
		"--",
	)
	args = append(args, cmdArgs...)
	cmd := exec.Command(args[0], args[1:]...)
	cmd.Dir = td
	return cmd
}
