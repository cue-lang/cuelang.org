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
	"errors"
	"fmt"
	"io"
	"io/fs"
	"log"
	"os"
	"path/filepath"
	"strings"
)

const (
	flagDir   flagName = "dir"
	flagDebug flagName = "debug"
)

var (
	// supportedLanguages defines the set of ISO 639-1 language codes supported by
	// preprocessor.
	supportedLanguages = []string{"en", "de"}
)

// executeDef is the implementation of the execute command
//
// See execute_doc.go for docs and an explanation of the directory and file
// structure that it works with.
//
// For now, execute simply sources files from /content and writes them to
// the /hugo/content equivalent. This will be heavily refined in later CLs.
func executeDef(c *Command, args []string) error {
	// Get our working directory. Default to current working directory
	wd := flagDir.String(c)
	if wd == "" {
		wd = "."
	}
	if !filepath.IsAbs(wd) {
		d, err := filepath.Abs(wd)
		if err != nil {
			return fmt.Errorf("failed to make %s absolute: %w", wd, err)
		}
		wd = d
	}

	// Ensure that wd is a subdirectory of a directory structure where
	// an ancestor of wd (which could be wd itself) contains content and
	// hugo/content directories. If wd is itself the directory that contains
	// content and hugo/content, then we interpret that is meaning to
	// run as if content had been specified as the input. Otherwise, wd
	// must be a subdirectory of content/.
	projectRoot := wd
	for {
		for _, dn := range []string{"content", "hugo/content"} {
			fi, err := os.Stat(filepath.Join(projectRoot, filepath.FromSlash(dn)))
			if err != nil || !fi.IsDir() {
				goto WalkParent
			}
		}

		// We found the content root.
		break

	WalkParent:
		pd := filepath.Clean(filepath.Join(projectRoot, ".."))
		if pd == projectRoot {
			// We are at the root of the filesystem
			// and failed to find the content and hugo/content dirs
			return fmt.Errorf("failed to find project root")
		}
		projectRoot = pd
	}

	if projectRoot == wd {
		// Special case. We want to walk the content dir from its root
		// At this point we know this directory exists.
		wd = filepath.Join(wd, "content")
	} else {
		// Ensure wd is a subdirectory of d/content
		cd := filepath.Join(projectRoot, "content")
		rel, err := filepath.Rel(cd, wd)
		if err != nil {
			return fmt.Errorf("failed to determine if working directory %s is a subdirectory of the project root %s: %w", wd, projectRoot, err)
		}
		fmt.Println(rel)
		if strings.HasPrefix(rel, "..") {
			return fmt.Errorf("working directory %s is not a subdirectory of %s", wd, cd)
		}
	}

	e := newExecutor(wd, projectRoot, c)
	return e.execute()
}

type executor struct {
	// wd is the working directory
	wd string

	// root is the project root that contains content
	// and hugo/content subdirectories
	root string

	// cmd is the execute Cobra command, used to access flag values etc
	cmd *Command

	// log is the logger used by the executor
	logger *log.Logger

	// pages is a set of all the pages discovered by the executor.
	// The string key is the full directory path of the page source.
	pages map[string]*page
}

func newExecutor(wd, projectRoot string, cmd *Command) *executor {
	l := log.New(os.Stderr, "", 0)
	return &executor{
		wd:     wd,
		root:   projectRoot,
		cmd:    cmd,
		logger: l,
		pages:  make(map[string]*page),
	}
}

type page struct {
	exec *executor

	langTargets map[string][]string
	dir         string
	relPath     string

	indexFiles map[string]bool
}

type langTarget struct {
	lang   string
	prefix string
}

func newPage(e *executor, dir, rel string) *page {
	return &page{
		exec: e,
		dir:  dir,
	}
}

// execute runs the transformation recursively walking through e.wd
func (e *executor) execute() error {
	e.debugf("working directory: %v\n", e.wd)

	var order []string

	// Recursively walk wd to find $lang.md and _$lang.md files
	// for all supported languages.
	err := filepath.WalkDir(e.wd, func(path string, d os.DirEntry, err error) error {
		// If we receive an error simply return it to stop
		if err != nil {
			return err
		}

		// Only walk directories
		if !d.IsDir() {
			return nil
		}

		// Ignore and do not recurse into directories that begin with _
		if strings.HasPrefix(d.Name(), "_") {
			return filepath.SkipDir
		}

		// per the docs for filepath.WalkDir, path has wd as a prefix
		// We want the relative path below.
		relPath, err := filepath.Rel(e.wd, path)
		if err != nil {
			return fmt.Errorf("failed to determine %s relative to %s: %w", path, e.wd, err)
		}

		// Keep the order so we process the resulting pages in the same order.
		// For now this doesn't really serve any specific purpose, other than to
		// make the result of execute deterministic order-wise.
		order = append(order, path)

		var p *page

		for _, lang := range supportedLanguages {
			for _, prefix := range []string{"", "_"} {
				sourcePath := filepath.Join(path, prefix+lang+".md")
				fi, err := os.Stat(sourcePath)
				if errors.Is(err, fs.ErrNotExist) {
					continue
				}
				if err != nil {
					return fmt.Errorf("failed to stat %s: %w", sourcePath, err)
				}
				if fi.IsDir() {
					// We only copy the specail _$LANG directories if we have a page
					// So that copy happens during (*page).process
					return fmt.Errorf("expected %s to be a file", sourcePath)
				}
				// We found a page!
				if p == nil {
					p = newPage(e, path, relPath)
					e.pages[path] = p
				}
				p.indexFiles[filepath.Base(sourcePath)] = true
				prefixes := p.langTargets[lang]
				prefixes = append(prefixes, prefix)
				p.langTargets[lang] = prefixes
			}
		}

		return nil
	})
	if err != nil {
		return err
	}

	// Process the pages we found.
	for _, d := range order {
		p := e.pages[d]
		if p == nil {
			continue
		}
		if err := p.process(); err != nil {
			return err
		}
	}

	return nil
}

// debugf logs debugging information if the --debug flag has been set
func (e *executor) debugf(format string, args ...any) {
	if flagDebug.Bool(e.cmd) {
		e.logger.Printf("debug: "+format, args...)
	}
}

// process transforms the set of $LANG.md files that form the basis of a page
// to the hugo equivalent input. For now this involves a simple transformation
// of the $LANG.md file into the target $LANG/$PATH/index.md file, but in the
// future the execute (and therefore process method) will derive the source of
// truth from a CUE-based guide per page.
func (p *page) process() error {
	p.debugf("process page from %s\n", p.relPath)

	var langs []string
	for _, sl := range supportedLanguages {
		if _, ok := p.langTargets[sl]; ok {
			langs = append(langs, sl)
		}
	}

	// langDirs are the _$LANG-specific dirs we need to recursively copy
	// after we have copied the non-index files to each $TARGET_DIR
	var langDirs []string

	// First copy everything from $SOURCE_DIR to each $TARGET_DIR for this page.
	dirEntries, err := os.ReadDir(p.dir)
	if err != nil {
		return fmt.Errorf("failed to read %s: %w", p.dir, err)
	}
	for _, de := range dirEntries {
		if de.IsDir() {
			np := strings.TrimPrefix(de.Name(), "_")
			if _, ok := p.langTargets[np]; ok {
				langDirs = append(langDirs, np)
			}
			continue
		}
		if p.indexFiles[de.Name()] {
			continue
		}

		// We know we have a non-index file. Copy to each target
		sourcePath := filepath.Join(p.dir, de.Name())
		sourceFile, err := os.Open(sourcePath)
		if err != nil {
			return fmt.Errorf("failed to read %s: %w", sourcePath, err)
		}
		var targets []io.Writer
		for _, lang := range langs {
			targetDir := filepath.Join(p.exec.root, "hugo", "content", lang, p.relPath)
			targetPath := filepath.Join(targetDir, de.Name())
			if err := os.MkdirAll(filepath.Dir(targetDir), 0700); err != nil {
				return fmt.Errorf("failed to mkdir %s: %w", targetDir, err)
			}
			targetFile, err := os.Create(targetPath)
			if err != nil {
				return fmt.Errorf("failed to create target file %s: %w", targetPath, err)
			}
			targets = append(targets, targetFile)
		}
		target := io.MultiWriter(targets...)
		if _, err := io.Copy(target, sourceFile); err != nil {
			return fmt.Errorf("failed to copy source file %s to targets: %w", sourcePath, err)
		}
	}

	// Recursively copy any _$LANG content to $TARGET_DIR.
	for _, langDir := range langDirs {
		targetLangDir := filepath.Join(p.exec.root, "hugo", "content", langDir, p.relPath)
		err := filepath.WalkDir(langDir, func(path string, d os.DirEntry, err error) error {
			if d.IsDir() {
				// continue
				return nil
			}
		})
		if err != nil {
			return fmt.Errorf("failed to copy %s ")
		}
	}

	for _, lang := range langs {
		prefixes := p.langTargets[lang]
		for _, prefix := range prefixes {
			sourcePath := filepath.Join(p.dir, prefix+lang+".md")
			targetDir := filepath.Join(p.exec.root, "hugo", "content", lang, p.relPath)
			targetPath := filepath.Join(targetDir, prefix+"index.md")

			sourceFile, err := os.Open(sourcePath)
			if err != nil {
				return fmt.Errorf("failed to read %s: %w", sourcePath, err)
			}

			if err := os.MkdirAll(targetDir, 0700); err != nil {
				return fmt.Errorf("failed to create target directory %s: %w", targetDir, err)
			}
			p.debugf("target %s\n", targetPath)
			targetFile, err := os.Create(targetPath)
			if err != nil {
				return fmt.Errorf("failed to create %s: %w", targetPath, err)
			}
			if _, err := io.Copy(targetFile, sourceFile); err != nil {
				return fmt.Errorf("failed to copy %s to %s: %w", sourcePath, targetPath, err)
			}
			// We don't care of the closes of the source file fails
			_ = sourceFile.Close()
			if err := targetFile.Close(); err != nil {
				return fmt.Errorf("failed to close %s: %w", targetPath, err)
			}
		}
	}

	return nil
}

func copyFile(dst, src string) error {
	sourceFile, err := os.Open(src)
	if err != nil {
		return fmt.Errorf("failed to read %s: %w", src, err)
	}
	targetDir := filepath.Dir(dst)
	if err := os.MkdirAll(targetDir, 0700); err != nil {
		return fmt.Errorf("failed to create target directory %s: %w", targetDir, err)
	}
	targetFile, err := os.Create(dst)
	if err != nil {
		return fmt.Errorf("failed to create %s: %w", dst, err)
	}
	if _, err := io.Copy(targetFile, sourceFile); err != nil {
		return fmt.Errorf("failed to copy %s to %s: %w", src, dst, err)
	}
	return nil
}

// debugf logs debugging information if the --debug flag has been set
func (p *page) debugf(format string, args ...any) {
	p.exec.debugf(p.dir+": "+format, args...)
}
