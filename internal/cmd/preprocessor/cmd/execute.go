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
	"strings"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
	"golang.org/x/exp/maps"
	"golang.org/x/exp/slices"
)

type lang string

const (
	langEn lang = "en"
)

const (
	flagDir   flagName = "dir"
	flagDebug flagName = "debug"
)

var (
	// supportedLanguages defines the set of ISO 639-1 language codes supported by
	// preprocessor.
	supportedLanguages = []lang{
		langEn,
	}

	pageRootFileRegexp = buildRootFileRegexp(supportedLanguages)
)

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
		return fmt.Errorf("failed to derive project root: %w", err)
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

	e := newExecutor(wd, projectRoot, c)
	if err := e.execute(filter); err != nil {
		return err
	}
	return nil
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

	// ctx is the context used for all CUE operations
	ctx *cue.Context
}

type executeContext struct {
	// executor is the underlying executor behind this context
	executor *executor

	// filter is a set of absolute path directories that should be considered as
	// part of an execute step. If filter is nil, then all directories are
	// considered.
	filter map[string]bool

	// order captures the order in which we discovered index pages. That is,
	// order contains the directories in the order in which we walked the
	// directory to discover the page roots.  It provides a consistent order for
	// the subsequent processing of pages.
	order []string

	// pages is a set of all the pages discovered by the executor.  The string
	// key is the full directory path of the page source.
	pages map[string]*page
}

func newExecutor(wd, projectRoot string, cmd *Command) *executor {
	l := log.New(os.Stderr, "", 0)
	return &executor{
		wd:     wd,
		root:   projectRoot,
		cmd:    cmd,
		logger: l,
		ctx:    cuecontext.New(),
	}
}

func (e *executor) newExecuteContext(filter map[string]bool) *executeContext {
	return &executeContext{
		executor: e,
		pages:    make(map[string]*page),
		filter:   filter,
	}
}

type page struct {
	ctx *executeContext

	// langTargets is the set of languages for which we find root pages.
	langTargets map[lang][]*rootFile

	// dir is the absolute path directory that contains the root pages contained
	// in langTargets.
	dir string

	// contentRelPath is dir relative to the root content directory.
	contentRelPath string

	// relPath is dir relative to the working directory. As a convenience
	// error messages are show in terms of relPath, because the user knows
	// things in terms of the working directory.
	relPath string

	// rootFiles are the basenames of the files which are identified as root
	// files. These root files define a page root. rootFiles exists as a
	// filename-based lookup convenience to langTargets.
	rootFiles map[string]*rootFile
}

func (ec *executeContext) newPage(dir, rel string) (*page, error) {
	contentDir := filepath.Join(ec.executor.root, "content")
	contentRelPath, err := filepath.Rel(contentDir, dir)
	if err != nil {
		return nil, fmt.Errorf("failed to determine %s relative to %s: %w", dir, contentDir, err)
	}

	res := &page{
		contentRelPath: contentRelPath,
		relPath:        rel,
		ctx:            ec,
		dir:            dir,
		langTargets:    make(map[lang][]*rootFile),
		rootFiles:      make(map[string]*rootFile),
	}

	return res, nil
}

func buildRootFileRegexp(langs []lang) *regexp.Regexp {
	var qlangs []string
	for _, lang := range langs {
		qlangs = append(qlangs, regexp.QuoteMeta(string(lang)))
	}
	rstr := fmt.Sprintf(`^(_)?(%s)\.(md|html|markdown)$`, strings.Join(qlangs, "|"))
	return regexp.MustCompile(rstr)
}

// execute runs the transformation recursively walking through e.wd. If filter
// is non-nil the it limits the execute step to only those directories present
// in filter.
func (e *executor) execute(filter map[string]bool) error {
	e.debugf("working directory: %v\n", e.wd)

	ec := e.newExecuteContext(filter)
	return ec.execute()
}

func (ec *executeContext) execute() error {
	// Recursively walk wd to find $lang.md and _$lang.md files for all
	// supported languages.
	if err := ec.findIndexFiles(); err != nil {
		return err
	}

	// Load all the CUE in one go
	cfg := &load.Config{
		Dir: ec.executor.wd,
	}
	var insts []string
	for _, d := range ec.order {
		p := ec.pages[d]
		insts = append(insts, "."+string(os.PathSeparator)+p.relPath)
	}
	bps := load.Instances(insts, cfg)
	vs, err := ec.executor.ctx.BuildInstances(bps)
	if err != nil {
		return fmt.Errorf("failed to build CUE instances: %w", err)
	}

	// Process the pages we found.
	for i, d := range ec.order {
		p := ec.pages[d]
		v := vs[i]
		if err := v.Validate(); err != nil {
			return fmt.Errorf("failed to validate CUE package %s: %w", p.relPath, err)
		}
		if err := p.process(); err != nil {
			return err
		}
	}

	return nil
}

func (ec *executeContext) findIndexFiles() error {
	dirsToWalk := []string{ec.executor.wd}

	var dir string
	for len(dirsToWalk) > 0 {
		dir, dirsToWalk = dirsToWalk[0], dirsToWalk[1:]

		entries, err := os.ReadDir(dir)
		if err != nil {
			return fmt.Errorf("failed to read dir %s: %w", dir, err)
		}

		searchForRootFiles := ec.filter == nil || ec.filter[dir]

		var p *page

		for _, entry := range entries {
			name := entry.Name()

			// Add child directories to our list of dirs to walk if they don't
			// begin with '.' or '_'.
			if entry.IsDir() {
				if name[0] != '_' && name[0] != '.' {
					dirsToWalk = append(dirsToWalk, filepath.Join(dir, name))
				}
				continue
			}

			// name is now know to be a file. Only proceed if the filter
			// was nil or dir matched the filter
			if !searchForRootFiles {
				continue
			}

			// Is the file path a page root?
			match := pageRootFileRegexp.FindStringSubmatch(name)
			if match == nil {
				continue
			}

			// We found a page root! Extract key parts of the match
			prefix := match[1]
			lang := lang(match[2])
			ext := match[3]

			if p == nil {
				// Keep the order so we process the resulting pages in the same order.
				// For now this doesn't really serve any specific purpose, other than to
				// make the result of execute deterministic order-wise.
				ec.order = append(ec.order, dir)

				relDir, err := filepath.Rel(ec.executor.wd, dir)
				if err != nil {
					return fmt.Errorf("failed to determine %s relative to %s: %w", dir, ec.executor.wd, err)
				}

				p, err = ec.newPage(dir, relDir)
				if err != nil {
					return fmt.Errorf("failed to create page in dir %s: %w", dir, err)
				}
				ec.pages[dir] = p
			}

			// Register the root file with the page
			rf := p.newRootFile(name, lang, prefix, ext)
			p.rootFiles[name] = rf
			rootPages := p.langTargets[lang]
			rootPages = append(rootPages, rf)
			p.langTargets[lang] = rootPages
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

// process processes a page root. It copies all relevant non-root file content
// to target /hugo/content directories (including _$LANG directories), and then
// processes the set of root files that form the basis of a page root.
func (p *page) process() error {
	p.debugf("process page from %s\n", p.relPath)

	// langs are the languages "supported" by this page
	langs := maps.Keys(p.langTargets)
	slices.Sort(langs)

	// langsWithLangDirs are the languages for which _$LANG-specific dirs exist. We need
	// to recursively copy the contents of these after we have copied the
	// non-index files to each $TARGET_DIR.
	var langsWithLangDirs []string

	// First process everything other than the root files. We have already
	// identified the root files. _$LANG directories are treated especially,
	// everything else beginning with "_" and "." is ignored, everything else is
	// copied.
	dirEntries, err := os.ReadDir(p.dir)
	if err != nil {
		return fmt.Errorf("failed to read %s: %w", p.dir, err)
	}
	for _, de := range dirEntries {
		n := de.Name()
		if de.IsDir() {
			// If we have a special _$LANG dir, then this needs to be
			// handled separately.
			np := strings.TrimPrefix(n, "_")
			if _, ok := p.langTargets[lang(np)]; ok {
				langsWithLangDirs = append(langsWithLangDirs, np)
			}
			// Otherwise, we ignore directories entirely.
			continue
		}

		// At this point we know we are handling a file

		// Do not copy index files. They are handled later.
		if _, ok := p.rootFiles[n]; ok {
			continue
		}

		// TODO: come up with a better approach to skipping certain files.
		// Should this perhaps be an include-based approach?
		switch filepath.Ext(n) {
		case ".cue":
			continue
		}

		// We know we have a non-index file/directory. Copy to each target.
		// If we have a source directory, then the target does not include
		// the name n.
		sourcePath := filepath.Join(p.dir, n)
		var targets []string
		for _, lang := range langs {
			targetPath := filepath.Join(p.ctx.executor.root, "hugo", "content", string(lang), p.relPath)
			if !de.IsDir() {
				targetPath = filepath.Join(targetPath, n)
			}
			targets = append(targets, targetPath)
		}

		if err := copyFile(sourcePath, targets...); err != nil {
			return err
		}
	}

	// Recursively copy any _$LANG directory content to $TARGET_DIR.
	for _, ld := range langsWithLangDirs {
		sourceLangDir := filepath.Join(p.dir, "_"+ld)
		targetLangDir := filepath.Join(p.ctx.executor.root, "hugo", "content", ld, p.relPath)
		if err := copyDirContents(sourceLangDir, targetLangDir); err != nil {
			return err
		}
	}

	// Now handle the root files
	for _, lang := range langs {
		rootFiles := p.langTargets[lang]
		for _, rootFile := range rootFiles {
			prefix, ext := rootFile.prefix, rootFile.ext
			targetDir := filepath.Join(p.ctx.executor.root, "hugo", "content", string(lang), p.contentRelPath)
			targetPath := filepath.Join(targetDir, prefix+"index."+ext)

			if err := rootFile.transform(targetPath); err != nil {
				return err
			}
		}
	}

	return nil
}

// debugf logs debugging information if the --debug flag has been set
func (p *page) debugf(format string, args ...any) {
	p.ctx.executor.debugf(p.dir+": "+format, args...)
}

// copyFile copies the file at path src to the target files dsts, ensuring that
// the directories containing each dst exist.
func copyFile(src string, dsts ...string) error {
	var toClose []*os.File
	defer func() {
		for _, f := range toClose {
			f.Close()
		}
	}()
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
		toClose = append(toClose, targetFile)
		targets = append(targets, targetFile)
	}
	target := io.MultiWriter(targets...)
	if _, err := io.Copy(target, sf); err != nil {
		return fmt.Errorf("failed to copy source file %s to targets: %w", src, err)
	}
	var f *os.File
	for len(toClose) > 0 {
		f, toClose = toClose[0], toClose[1:]
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
