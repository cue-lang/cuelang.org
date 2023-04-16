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
	"log"
	"os"
	"path/filepath"
	"regexp"
	"sort"
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

	pageRootFileRegexps = buildRootFileRegexps(supportedLanguages)
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

type rootPage struct {
	prefix string
	ext    string
}

type page struct {
	exec *executor

	langTargets map[string][]rootPage
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
		relPath:     rel,
		exec:        e,
		dir:         dir,
		langTargets: make(map[string][]rootPage),
		indexFiles:  make(map[string]bool),
	}
}

func buildRootFileRegexps(langs []string) (res []*regexp.Regexp) {
	for _, lang := range langs {
		expr := fmt.Sprintf(`(_)?(%s)\.(md|html|markdown)`, regexp.QuoteMeta(lang))
		r, err := regexp.Compile(expr)
		if err != nil {
			panic(err)
		}
		res = append(res, r)
	}
	return
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

		// For each language, gather root files that form a page instance of
		// there are any.
		dirEntries, err := os.ReadDir(path)
		if err != nil {
			return fmt.Errorf("failed to read directory %s: %w", path, err)
		}
		for _, dirEntry := range dirEntries {
			if dirEntry.Type().IsDir() {
				continue
			}
			fn := dirEntry.Name()
			for _, r := range pageRootFileRegexps {
				match := r.FindStringSubmatch(fn)
				if match == nil {
					continue
				}
				// We found a page! Extract key parts of the match
				prefix := match[1]
				lang := match[2]
				ext := match[3]

				if p == nil {
					p = newPage(e, path, relPath)
					e.pages[path] = p
				}
				sourcePath := filepath.Join(path, fn)
				p.indexFiles[filepath.Base(sourcePath)] = true
				rootPages := p.langTargets[lang]
				rootPages = append(rootPages, rootPage{
					prefix: prefix,
					ext:    ext,
				})
				p.langTargets[lang] = rootPages
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

	// langs are the languages "supported" by this page
	var langs []string
	for l := range p.langTargets {
		langs = append(langs, l)
	}
	sort.Strings(langs)

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

		// Do not copy index files. They are handled later.
		if p.indexFiles[de.Name()] {
			continue
		}

		// We know we have a non-index file. Copy to each target
		sourcePath := filepath.Join(p.dir, de.Name())
		var targets []string
		for _, lang := range langs {
			targetDir := filepath.Join(p.exec.root, "hugo", "content", lang, p.relPath)
			targetPath := filepath.Join(targetDir, de.Name())
			targets = append(targets, targetPath)
		}
		if err := copyFile(sourcePath, targets...); err != nil {
			// The error will always be rich
			return err
		}
	}

	// Recursively copy any _$LANG directory content to $TARGET_DIR.
	for _, langDir := range langDirs {
		targetLangDir := filepath.Join(p.exec.root, "hugo", "content", langDir, p.relPath)
		err := filepath.WalkDir(langDir, func(path string, d os.DirEntry, err error) error {
			if d.IsDir() {
				// continue
				return nil
			}
			relPath, err := filepath.Rel(langDir, path)
			if err != nil {
				return fmt.Errorf("failed to determine %s relative to %s: %w", path, langDir, err)
			}
			tfn := filepath.Join(targetLangDir, relPath)
			return copyFile(path, tfn)
		})
		if err != nil {
			return fmt.Errorf("failed to copy %s to %s ", langDir, targetLangDir)
		}
	}

	// Now handle the index pages.
	for _, lang := range langs {
		rootPages := p.langTargets[lang]
		for _, rootPage := range rootPages {
			prefix, ext := rootPage.prefix, rootPage.ext
			sourcePath := filepath.Join(p.dir, prefix+lang+"."+ext)
			targetDir := filepath.Join(p.exec.root, "hugo", "content", lang, p.relPath)
			targetPath := filepath.Join(targetDir, prefix+"index."+ext)

			// For now we just copy from source to target
			if err := copyFile(sourcePath, targetPath); err != nil {
				return err
			}
		}
	}

	return nil
}

// debugf logs debugging information if the --debug flag has been set
func (p *page) debugf(format string, args ...any) {
	p.exec.debugf(p.dir+": "+format, args...)
}

// copyFile copies the file at path src to the target files dsts, ensuring that
// the directories containing each dst exist.
func copyFile(src string, dsts ...string) error {
	sf, err := os.Open(src)
	if err != nil {
		return fmt.Errorf("failed to read %s: %w", src, err)
	}
	defer sf.Close()
	var targets []io.Writer
	for _, dst := range dsts {
		dstDir := filepath.Dir(dst)
		if err := os.MkdirAll(dstDir, 0700); err != nil {
			return fmt.Errorf("failed to mkdir %s: %w", dstDir, err)
		}
		targetFile, err := os.Create(dst)
		if err != nil {
			return fmt.Errorf("failed to create target file %s: %w", dst, err)
		}
		targets = append(targets, targetFile)
	}
	target := io.MultiWriter(targets...)
	if _, err := io.Copy(target, sf); err != nil {
		return fmt.Errorf("failed to copy source file %s to targets: %w", src, err)
	}
	for i, target := range targets {
		dst := dsts[i]
		if err := target.(io.WriteCloser).Close(); err != nil {
			return fmt.Errorf("failed to close target file %s: %w", dst, err)
		}
	}
	return nil
}
