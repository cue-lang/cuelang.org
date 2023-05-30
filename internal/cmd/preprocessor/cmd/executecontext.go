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
	"io/fs"
	"os"
	"path/filepath"
	"runtime/debug"
	"strings"

	"cuelang.org/go/cue/load"
	preprocessembed "github.com/cue-lang/cuelang.org"
)

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

	errorContext
	*executionContext
}

func (ec *executeContext) Format(state fmt.State, verb rune) {
	fmt.Fprintf(state, "%v", ec.executor)
}

func (e *executor) newExecuteContext(filter map[string]bool) *executeContext {
	return &executeContext{
		executor:         e,
		pages:            make(map[string]*page),
		filter:           filter,
		executionContext: e.executionContext,
		errorContext:     e.errorContext,
	}
}

func (ec *executeContext) execute() error {
	// Determine the buildID or version information of self, which will act as
	// input into the caching calculation.
	if err := ec.deriveHashOfSelf(); err != nil {
		return err
	}

	ec.debugf(ec.debugCache, "%v: selfHash: %s", ec, ec.selfHash)

	// Recursively walk wd to find $lang.md and _$lang.md files for all
	// supported languages.
	if err := ec.findPages(); err != nil {
		return err
	}

	// Load all the CUE in one go
	cfg := &load.Config{
		Dir: ec.executor.root,
	}
	var insts []string
	for _, d := range ec.order {
		// Find all CUE files
		//
		// TODO: filter for only those that are part of the site package? Maybe
		// later
		entries, err := os.ReadDir(d)
		if err != nil {
			return ec.errorf("%v: failed to read %s: %v", ec, d, err)
		}
		for _, e := range entries {
			n := e.Name()
			if filepath.Ext(n) == ".cue" {
				insts = append(insts, filepath.Join(d, n))
			}
		}
	}
	bps := load.Instances(insts, cfg)
	if l := len(bps); l != 1 {
		return ec.errorf("%v: expected 1 build instance; saw %d", ec, l)
	}
	v := ec.executor.ctx.BuildInstance(bps[0])
	if err := v.Err(); err != nil {
		return ec.errorf("%v: error in site configuration: %v", ec, err)
	}
	ec.config = v

	var pageWaits []<-chan struct{}

	// Process the pages we found.
	for _, d := range ec.order {
		p := ec.pages[d]
		// v := vs[i]
		// if err := v.Validate(); err != nil {
		// 	return fmt.Errorf("failed to validate CUE package %s: %w", p.relPath, err)
		// }
		done := make(chan struct{})
		go func() {
			p.process()
			close(done)
		}()
		pageWaits = append(pageWaits, done)
	}

	for i, d := range ec.order {
		p := ec.pages[d]
		w := pageWaits[i]
		<-w
		ec.updateInError(p.isInError())
		ec.logf("%s", p.bytes())
	}

	return errorIfInError(ec)
}

func (ec *executeContext) findPages() error {
	dirsToWalk := []string{ec.executor.wd}

	var dir string
	for len(dirsToWalk) > 0 {
		dir, dirsToWalk = dirsToWalk[0], dirsToWalk[1:]

		entries, err := os.ReadDir(dir)
		if err != nil {
			return ec.errorf("%v: failed to read dir %s: %v", ec, dir, err)
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
					return ec.errorf("%v: failed to determine %s relative to %s: %v", ec, dir, ec.executor.wd, err)
				}

				p, err = ec.newPage(dir, relDir)
				if err != nil {
					return ec.errorf("%v: failed to create page in dir %s: %v", ec, dir, err)
				}
				ec.debugf(ec.debugGeneral, "%v: found page at %v", ec, dir)
				ec.pages[dir] = p
			}

			// Register the root file with the page
			rf := p.newRootFile(name, lang, prefix, ext)
			p.debugf(ec.debugGeneral, "%v: added root file named %s", p, name)
			p.rootFiles[name] = rf
			rootPages := p.langTargets[lang]
			rootPages = append(rootPages, rf)
			p.langTargets[lang] = rootPages
		}
	}

	return nil
}

func (ec *executeContext) deriveHashOfSelf() error {
	// If we have buildinfo, with a main package module which has version and sum
	// information we use that
	bi, ok := debug.ReadBuildInfo()
	if !ok {
		return ec.errorf("%v: failed to read buildinfo from self", ec)
	}
	// If the main module has been replaced, read the replacement
	if bi.Main.Replace != nil {
		bi.Main = *bi.Main.Replace
	}
	// Iff the resulting main package module has sum (and therefore version)
	// information we can use that.
	if bi.Main.Sum != "" {
		ec.selfHash = bi.Main.Version + " " + bi.Main.Sum
		return nil
	}

	// A simple sanity check to ensure we actually do some work hashing self.
	// Otherwise it's an indicator that we have no embedded files.
	didWork := false

	files := preprocessembed.Files

	// This fallback only works if the main module is is
	// github.com/cue-lang/cuelang.org. (It might be possible to relax this
	// constraint, but a tight constraint works for now).
	hash, buf := ec.executionContext.createHash()
	err := fs.WalkDir(files, ".", func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			return err
		}
		if d.IsDir() {
			return nil
		}
		// Skip certain files we cannot exclude via the embed globs
		if strings.HasSuffix(path, "_test.go") {
			return nil
		}
		f, err := files.ReadFile(path)
		if err != nil {
			return err
		}
		fmt.Fprintf(hash, "hashing %s:\n%s", path, f)
		didWork = true
		return nil
	})
	if err != nil {
		return ec.errorf("%v: failed to hash the files of self: %v", ec, err)
	}
	if !didWork {
		ec.fatalf("%v: did no work computing hash of self", ec)
	}
	if buf != nil {
		ec.debugf(ec.debugCache, "hash of self: %s\n", tabIndent(buf.Bytes()))
	}

	return nil
}
