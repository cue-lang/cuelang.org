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
	"fmt"
	"io"
	"os"
	"path/filepath"
	"regexp"
	"strings"
)

type lang string

const (
	langEn lang = "en"

	flagDir    flagName = "dir"
	flagDebug  flagName = "debug"
	flagServe  flagName = "serve"
	flagUpdate flagName = "update"
)

var (
	// supportedLanguages defines the set of ISO 639-1 language codes supported by
	// preprocessor.
	supportedLanguages = []lang{
		langEn,
	}

	pageRootFileRegexp = buildRootFileRegexp(supportedLanguages)
)

type executionContext struct {
	updateGoldenFiles bool

	debug bool

	tempRoot string
}

// tempDir creates a new temporary directory within the
// tempRoot for this executionContext.
func (e executionContext) tempDir(pattern string) (string, error) {
	return os.MkdirTemp(e.tempRoot, pattern)
}

// executeDef is the implementation of the execute command
//
// See execute_doc.go for docs and an explanation of the directory and file
// structure that it works with.
//
// For now, execute simply sources files from /content and writes them to
// the /hugo/content equivalent. This will be heavily refined in later CLs.
//
// args is a list of possibly absolute directory paths. If non-empty, then
// only pages found in those directories will be considered. Otherwise,
// all directories below the working directory are considered.
func executeDef(c *Command, args []string) error {
	// Get our working directory. Default to current working directory
	wd := flagDir.String(c)

	wd, projectRoot, err := deriveProjectRoot(wd)
	if err != nil {
		return err
	}

	ctx := executionContext{
		debug:             flagDebug.Bool(c),
		updateGoldenFiles: flagUpdate.Bool(c),
	}

	e := newExecutor(ctx, wd, projectRoot, c)
	if flagServe.Bool(c) {
		return e.serve(args)
	}

	var filter map[string]bool
	if len(args) > 0 {
		filter = make(map[string]bool)
		for _, v := range args {
			abs, err := filepath.Abs(v)
			if err != nil {
				return fmt.Errorf("failed to make arg %q absolute: %w", v, err)
			}
			filter[abs] = true
		}
	}

	if err := e.execute(filter); err != nil {
		return err
	}
	return nil
}

func buildRootFileRegexp(langs []lang) *regexp.Regexp {
	var qlangs []string
	for _, lang := range langs {
		qlangs = append(qlangs, regexp.QuoteMeta(string(lang)))
	}
	rstr := fmt.Sprintf(`^(_)?(%s)\.(md|html|markdown)$`, strings.Join(qlangs, "|"))
	return regexp.MustCompile(rstr)
}

// copyFile copies the file at path src to the target files dsts, ensuring that
// the directories containing each dst exist.
func copyFile(src string, dsts ...string) error {
	sf, err := os.Open(src)
	if err != nil {
		return fmt.Errorf("failed to read %s: %w", src, err)
	}
	sfi, err := sf.Stat()
	if err != nil {
		return fmt.Errorf("failed to stat %s: %w", src, err)
	}
	defer sf.Close()
	var targets []io.Writer
	for _, dst := range dsts {
		dstDir := filepath.Dir(dst)
		if err := os.MkdirAll(dstDir, 0700); err != nil {
			return fmt.Errorf("failed to mkdir %s: %w", dstDir, err)
		}
		targetFile, err := os.OpenFile(dst, os.O_RDWR|os.O_CREATE|os.O_TRUNC, sfi.Mode())
		if err != nil {
			return fmt.Errorf("failed to create target file %s: %w", dst, err)
		}
		defer targetFile.Close()
		targets = append(targets, targetFile)
	}
	target := io.MultiWriter(targets...)
	if _, err := io.Copy(target, sf); err != nil {
		return fmt.Errorf("failed to copy source file %s to targets: %w", src, err)
	}
	for _, t := range targets {
		f := t.(*os.File)
		if err := f.Close(); err != nil {
			return fmt.Errorf("failed to close target file %s: %w", f.Name(), err)
		}
	}
	return nil
}

// copyDirContents copies the contents of srcDir to targetDir. This is
// non-recursive. Note that this is unlike the cp unix command. Indeed this
// function behaves more like: cp $srcDir/* $targetDir.
func copyDirContents(srcDir string, targetDirs ...string) error {
	dirEntries, err := os.ReadDir(srcDir)
	if err != nil {
		return fmt.Errorf("failed to list source directory %s: %w", srcDir, err)
	}
	for _, de := range dirEntries {
		if de.IsDir() {
			continue
		}
		sourceFile := filepath.Join(srcDir, de.Name())
		var targets []string
		for _, d := range targetDirs {
			targets = append(targets, filepath.Join(d, de.Name()))
		}
		if err := copyFile(sourceFile, targets...); err != nil {
			return err
		}
	}
	return nil
}
