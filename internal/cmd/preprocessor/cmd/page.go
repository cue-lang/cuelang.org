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
	"os"
	"path/filepath"
	"strings"

	"golang.org/x/exp/maps"
	"golang.org/x/exp/slices"
)

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

	// leftDelim is the left hand delimiter used in text/template parsing for
	// root files in the page.
	leftDelim string

	// rightDelim is the right hand delimiter used in text/template parsing for
	// root files in the page.
	rightDelim string

	// bufferedErrorContext is used because we process pages concurrently and then
	// log the buffered messages in blocks
	*bufferedErrorContext
}

func (ec *executeContext) newPage(dir, rel string) (*page, error) {
	contentDir := filepath.Join(ec.executor.root, "content")
	contentRelPath, err := filepath.Rel(contentDir, dir)
	if err != nil {
		return nil, ec.errorf("%v: failed to determine %s relative to %s: %v", ec, dir, contentDir, err)
	}

	res := &page{
		bufferedErrorContext: newBufferedErrorContext(ec),
		contentRelPath:       contentRelPath,
		relPath:              rel,
		ctx:                  ec,
		dir:                  dir,
		langTargets:          make(map[lang][]*rootFile),
		rootFiles:            make(map[string]*rootFile),

		// TODO actually extract these from the page's config
		leftDelim:  "{{{",
		rightDelim: "}}}",
	}

	return res, nil
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
		return p.errorf("%v: failed to read %s: %v", p, p.dir, err)
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
