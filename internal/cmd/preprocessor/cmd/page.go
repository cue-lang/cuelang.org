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
	"encoding/json"
	"fmt"
	"maps"
	"os"
	"path/filepath"
	"slices"
	"sort"
	"strings"

	"cuelang.org/go/cue"
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

	config pageConfig

	// path is the path in ctx.config at which the page's configuration can be
	// found (if it exists).
	path cue.Path

	// bufferedErrorContext is used because we process pages concurrently and then
	// log the buffered messages in blocks
	bufferedErrorContext
	*executionContext
}

// pageConfig follows a subset of the #site.#page type. Field comments
// therefore follow the CUE definition.
//
// TODO: should we generate this Go type from the CUE (or vice versa)?
type pageConfig struct {
	LeftDelim  string `json:"leftDelim"`
	RightDelim string `json:"rightDelim"`

	Sanitisers  []sanitiserMatcher
	Comparators []comparatorMatcher

	TestUserAuthn []string `json:"testUserAuthn"`

	Vars             map[string]pageVar `json:"vars"`
	randomReplacer   *strings.Replacer
	unexpandReplacer *strings.Replacer
}

func (p pageConfig) unexpandReferences(src []byte) []byte {
	// We know that the reverse map is unique, but what we don't know is whether
	// the values overlap in any way with variable names. A dumb approach via
	// replace all would therefore be susceptible to replacing part of a
	// variable name with a further reference to another variable.
	//
	// For example, if we had the variables:
	//
	// CUE: "really long value"
	// BANANA: "CUE"
	//
	// Then the value "really long value" would be unexpanded first, leaving us
	// with {{{.CUE}}} in src. At which point we would replace "CUE" with
	// {{{.BANANA}}} leaving us with {{{.{{{.BANANA}}}}}}. Which is clearly
	// wrong.
	//
	// The simplest way to fix this is to first replace with known random
	// values, then do a second pass to replace with the references. Doesn't
	// have to be cryto random, just unpredictable.
	return []byte(p.unexpandReplacer.Replace(string(src)))
}

func (p *pageConfig) init() error {
	// First ensure that we have a unique reverse map of variable's values. This
	// is required in order that we can return a source txtar to a normalised
	// form.
	varValues := make(map[string][]string)
	for name, val := range p.Vars {
		l := varValues[val.value()]
		l = append(l, name)
		varValues[val.value()] = l
	}
	// Iterate the values in a stable order
	var varValuesList []string
	// TODO: switch to using maps.Keys
	for val := range varValues {
		varValuesList = append(varValuesList, val)
	}
	sort.Strings(varValuesList)
	for _, val := range varValuesList {
		names := varValues[val]
		if len(names) != 1 {
			sort.Strings(names)
			return fmt.Errorf("multiple variables map to the same value: %v", strings.Join(names, ", "))
		}
	}

	// Create a replacer for the random variable values to their stable
	// alternative.
	var randomVarsToReplace []pageVar
	for _, v := range p.Vars {
		v, ok := v.(randomVariable)
		if !ok {
			continue
		}
		randomVarsToReplace = append(randomVarsToReplace, v)
	}
	slices.SortFunc(randomVarsToReplace, func(lhs, rhs pageVar) int {
		// Longest first
		if diff := len(rhs.value()) - len(lhs.value()); diff != 0 {
			return diff
		}
		// Lexicographic order second
		return strings.Compare(lhs.value(), rhs.value())
	})
	var randomReplacerArgs []string
	for _, v := range randomVarsToReplace {
		randomReplacerArgs = append(randomReplacerArgs, v.value(), v.transformedValue())
	}
	p.randomReplacer = strings.NewReplacer(randomReplacerArgs...)

	// Create a replacer for the unexpanded reference version of a variable.
	type pair struct {
		n string
		v string
	}
	var unexpandVars []pair
	for k, v := range p.Vars {
		unexpandVars = append(unexpandVars, pair{
			n: k,
			v: v.value(),
		})
	}
	slices.SortFunc(unexpandVars, func(lhs, rhs pair) int {
		// Longest first
		if diff := len(rhs.v) - len(lhs.v); diff != 0 {
			return diff
		}
		// Lexicographic order second
		return strings.Compare(lhs.v, rhs.v)
	})
	var unexpandReplacerArgs []string
	for _, v := range unexpandVars {
		ref := fmt.Sprintf("%s.%s%s", p.LeftDelim, v.n, p.RightDelim)
		unexpandReplacerArgs = append(unexpandReplacerArgs, v.v, ref)
	}
	p.unexpandReplacer = strings.NewReplacer(unexpandReplacerArgs...)

	return nil
}

func (p pageConfig) randomReplace(src string) string {
	return p.randomReplacer.Replace(src)
}

func (p *page) Format(state fmt.State, verb rune) {
	fmt.Fprintf(state, "%s", p.dir)
}

func (ec *executeContext) newPage(dir, rel string) (*page, error) {
	contentDir := filepath.Join(ec.executor.root, "content")
	contentRelPath, err := filepath.Rel(contentDir, dir)
	if err != nil {
		return nil, ec.errorf("%v: failed to determine %s relative to %s: %v", ec, dir, contentDir, err)
	}

	// Every bit of content is rooted at "content"
	pageSelectors := []cue.Selector{cue.Str("content")}

	// Only if we are not in the content directory is dereferencing required.
	if rel != "." {
		pathParts := strings.Split(rel, string(os.PathSeparator))
		for _, p := range pathParts {
			pageSelectors = append(pageSelectors, cue.Str(p))
		}
	}

	// And finally we root everything under "page" to make the "recursive"
	// definition of content complete.
	pageSelectors = append(pageSelectors, cue.Str("page"))
	pagePath := cue.MakePath(pageSelectors...)

	res := &page{
		contentRelPath: contentRelPath,
		relPath:        rel,
		ctx:            ec,
		dir:            dir,
		langTargets:    make(map[lang][]*rootFile),
		rootFiles:      make(map[string]*rootFile),

		path: pagePath,

		bufferedErrorContext: &errorContextBuffer{
			executionContext: ec.executionContext,
		},
		executionContext: ec.executionContext,
	}

	return res, nil
}

func (p *page) loadConfig() {
	// Eagerly read certain page config values, and set markers where we
	// see we have config values that will later be read/parsed in a lazy
	// fashion.
	pageConfigValue := p.executionContext.config.LookupPath(p.path)

	if !pageConfigValue.Exists() {
		p.errorf("%v: found no config at path %v", p, p.path)
		return
	}

	// Because sanitiser is an interface, we need to load into
	// a []json.RawMessage for the sanitisers themselves
	type shim struct {
		*pageConfig

		Sanitisers  []json.RawMessage `json:"sanitisers"`
		Comparators []json.RawMessage `json:"comparators"`

		Vars map[string]json.RawMessage `json:"vars"`
	}

	s := shim{
		pageConfig: &p.config,
	}

	if err := pageConfigValue.Decode(&s); err != nil {
		p.errorf("%v: failed to load page config: %v", p, err)
		return
	}

	for i, s := range s.Sanitisers {
		realS, err := p.parseSanitiser(s)
		if err != nil {
			p.errorf("%v: failed to parse sanitiser at config index %d: %v", p, i, err)
			return
		}
		p.config.Sanitisers = append(p.config.Sanitisers, realS)
	}

	for i, c := range s.Comparators {
		realC, err := p.parseComparator(c)
		if err != nil {
			p.errorf("%v: failed to parse sanitiser at config index %d: %v", p, i, err)
			return
		}
		p.config.Comparators = append(p.config.Comparators, realC)
	}

	if len(s.Vars) > 0 {
		p.config.Vars = make(map[string]pageVar, len(s.Vars))
	}
	for k, v := range s.Vars {
		// Attempt a string unmarshal first
		var sv string
		if err := json.Unmarshal(v, &sv); err == nil {
			p.config.Vars[k] = stringVar(sv)
			continue
		}
		var rv randomVariable
		if err := json.Unmarshal(v, &rv); err == nil {
			p.config.Vars[k] = newRandomVariable(rv)
			continue
		}
		p.errorf("%v: failed to parse variable at key %q", p, k)
	}
	if p.isInError() {
		return
	}

	if err := p.config.init(); err != nil {
		p.errorf("%v: %v", p, err)
	}
}

// parseSanitiser takes a CUE config value that represents a sanitiser
// and returns a Go value that represents that sanitiser.
func (p *page) parseSanitiser(m json.RawMessage) (sanitiserMatcher, error) {
	kind, err := parseKind(m)
	if err != nil {
		return nil, err
	}

	switch kind {
	case "patternSanitiser":
		var ps patternSanitiserMatcher
		if err := json.Unmarshal(m, &ps); err != nil {
			return nil, fmt.Errorf("failed to unmarshal %s: %v", kind, err)
		}
		if err := ps.init(); err != nil {
			return nil, fmt.Errorf("failed to init %s: %v", kind, err)
		}
		return &ps, nil
	case "ellipsisSanitiser":
		var es ellipsisSanitiserMatcher
		if err := json.Unmarshal(m, &es); err != nil {
			return nil, fmt.Errorf("failed to unmarshal %s: %v", kind, err)
		}
		if err := es.init(); err != nil {
			return nil, fmt.Errorf("failed to init %s: %v", kind, err)
		}
		return &es, nil
	default:
		return nil, fmt.Errorf("unknown sanitiser: %q", kind)
	}
}

func parseKind(m json.RawMessage) (string, error) {
	type discriminator struct {
		Kind string `json:"kind"`
	}

	var d discriminator
	if err := json.Unmarshal(m, &d); err != nil {
		return "", fmt.Errorf("failed to unmarshal discriminator from config: %v", err)
	}

	return d.Kind, nil
}

// parseComparator takes a CUE config value that represents a comparator
// and returns a Go value that represents that comparator.
func (p *page) parseComparator(m json.RawMessage) (comparatorMatcher, error) {
	kind, err := parseKind(m)
	if err != nil {
		return nil, err
	}

	switch kind {
	case "patternComparator":
		var p patternComparatorMatcher
		if err := json.Unmarshal(m, &p); err != nil {
			return nil, fmt.Errorf("failed to unmarshal %s: %v", kind, err)
		}
		if err := p.init(); err != nil {
			return nil, fmt.Errorf("failed to init %s: %v", kind, err)
		}
		return &p, nil
	case "unstableLineOrderComparator":
		var u unstableLineOrderComparatorMatcher
		if err := json.Unmarshal(m, &u); err != nil {
			return nil, fmt.Errorf("failed to unmarshal %s: %v", kind, err)
		}
		if err := u.init(); err != nil {
			return nil, fmt.Errorf("failed to init %s: %v", kind, err)
		}
		return &u, nil
	default:
		return nil, fmt.Errorf("unknown sanitiser: %q", kind)
	}
}

// process processes a page root. It copies all relevant non-root file content
// to target /hugo/content directories (including _$LANG directories), and then
// processes the set of root files that form the basis of a page root.
func (p *page) process() error {
	// langs are the languages "supported" by this page
	langs := slices.Sorted(maps.Keys(p.langTargets))

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
		case ".cue", ".golden", ".go":
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
