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
	"io"
	"os"
	"path/filepath"
	"runtime"
	"sort"
	"strings"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/format"
	"github.com/cue-lang/cuelang.org/internal/parse"
	"golang.org/x/exp/maps"
)

var (
	// templateFunctions is the list of bare {{with}} transforms that we
	// support.  The variable is called templateFunctions because
	// text/template/parse sees the bare words and interprets them as if they
	// were function calls.
	templateFunctions = map[string]any{
		fnSidebyside: true,
		fnUpload:     true,
		fnScript:     true,
		"reference":  true,
		"def":        true,
		"sidetrack":  true,
		"TODO":       true,
	}

	goMajorVersion = computeGoMajorVersion()
)

// rootFile is a convenience data structure for keeping track of root files we
// have found.
type rootFile struct {
	// page is the "enclosing" page for which this root file (and others) acts
	// as a root.
	page *page

	// filename is the name of the root file. It is relative to page.dir
	filename string

	// prefix is the prefix present on filename
	prefix string

	// ext is the filename extension of filename
	ext string

	// lang is the language of the root file filename
	lang lang

	// contents is the raw []byte contents of the file captured
	// during parse in order that the subsequent write back to
	// the source file can be skipped if the contents are byte-equal.
	contents []byte

	// header is the Yaml header of a root file. It will either be nil
	// or a \n terminated block (that should parse as yaml).
	header []byte

	// bodyPrefix is the newline padding added as a prefix to the string parsed
	// as the body text/template. This helps ensure line numbers are accurate.
	// This needs to be stripped off when writing out the result.
	bodyPrefix []byte

	// body is the text/template/parse-d result of the body
	body *parse.Tree

	// bodyParts is a list of the internalised versions of the
	// text/template/parse-d input. Each node can be written back
	// to the input format, run (to update itself), or written
	// to the output format ready for consumption by Hugo.
	bodyParts []node

	// bufferedErrorContext reuses the existing page.errorContext because for
	// now we don't do root files concurrently
	errorContext
	*executionContext
}

func (r *rootFile) Format(f fmt.State, verb rune) {
	fmt.Fprint(f, r.filename)
}

// newRootFile creates a new rootFile for fn.
func (p *page) newRootFile(fn string, lang lang, prefix, ext string) *rootFile {
	return &rootFile{
		page:             p,
		filename:         filepath.Join(p.dir, fn),
		lang:             lang,
		prefix:           prefix,
		ext:              ext,
		errorContext:     p.bufferedErrorContext,
		executionContext: p.executionContext,
	}
}

func (rf *rootFile) transform(targetPath string) error {
	rf.debugf(rf.debugGeneral, "%v: transform root file", rf)
	// For now, we only support en as a main language. For other languages
	// we simply copy from source to target.
	if rf.lang != langEn {
		if err := copyFile(rf.filename, targetPath); err != nil {
			return rf.errorf("%v: %v", rf, err)
		}
	}
	// HTML files don't need any special processing
	if rf.ext == "html" {
		if err := copyFile(rf.filename, targetPath); err != nil {
			return rf.errorf("%v: %v", rf, err)
		}
	}

	// Start by parsing the root file
	if err := rf.parse(); err != nil {
		// Note errors in parse have position information
		return err
	}

	// Validate the steps that we parsed. This allows us, for example, to ensure
	// that we don't repeat step labels.
	if err := rf.validate(); err != nil {
		return err
	}

	if err := rf.run(); err != nil {
		return err
	}

	if rf.isInError() {
		return errorIfInError(rf)
	}

	// Derive a map of hashes of the runnable nodes
	if err := rf.writePageCache(); err != nil {
		return err
	}

	// Write the parsed rootFile back to ensure we have have normalised input.
	writeBack := new(bytes.Buffer)
	if err := rf.writeSource(writeBack); err != nil {
		return err
	}
	if err := writeIfDiff(writeBack, rf.filename, rf.contents); err != nil {
		return err
	}

	// Transform the root file
	transformed := new(bytes.Buffer)
	if err := rf.writeTarget(transformed); err != nil {
		return err
	}
	if err := writeIfDiff(transformed, targetPath, nil); err != nil {
		return err
	}
	return nil
}

// validate ensures that the parsed steps are valid with respect to each other.
// For example, we ensure that we don't have multiple steps of the same type
// with the same label.
func (rf *rootFile) validate() error {
	labels := make(map[string]map[string][]node)
	for _, bp := range rf.bodyParts {
		n, ok := bp.(labelledNode)
		if !ok {
			continue
		}
		t := n.nodeType()
		tld := labels[t]
		if tld == nil {
			tld = make(map[string][]node)
			labels[t] = tld
		}
		l := n.nodeLabel()
		nls := tld[l]
		nls = append(nls, bp)
		tld[l] = nls
	}
	types := maps.Keys(labels)
	sort.Strings(types)
	for _, t := range types {
		tld := labels[t]
		labels := maps.Keys(tld)
		sort.Strings(labels)
		for _, l := range labels {
			nls := tld[l]
			if len(nls) == 1 {
				continue
			}
			// We have multiple positions. Report an error showing allow of them
			// for convenience.
			var positions bytes.Buffer
			for _, n := range nls {
				fmt.Fprintf(&positions, "\t%v\n", n)
			}
			rf.errorf("%v: node type %q declares label %q multiple times:\n%s", rf, t, l, positions.Bytes())
		}
	}

	return nil
}

// run is responsible for updating those nodes which contain inputs and outputs.
// The inputs generally need to be formatted, scripts run, and outputs updated.
// This method also adds as a means to check that we only have parsed things
// that we can support.
func (rf *rootFile) run() error {
	var torun []runnable
	var wait []waitRunnable
	for i := range rf.bodyParts {
		switch n := rf.bodyParts[i].(type) {
		case runnableNode:
			// Ideally we run nodes concurrently, in which case a node needs to
			// have its own error context (how do we enforce that?).
			//
			// But in the case of steps in a guide, we generate a single script
			// from a number of parts, and run that script concurrently (with any
			// other nodes). In which case we would establish a special context,
			// a script context perhaps, in which we run that script.
			//
			// For now we don't support multi-steps guides, but when we do it will
			// be here.

			// Check for cache hit
			h, b := rf.createHash()
			hashPath := rf.hashRunnableNode(n, h)
			if b != nil {
				rf.debugf(rf.debugCache, "%v: hashed node %v:\n%s", rf, n, b.Bytes())
			}
			currHash := base64.StdEncoding.EncodeToString(h.Sum(nil))
			cacheHash, err := rf.config.LookupPath(hashPath).String()
			cacheMiss := err != nil || currHash != cacheHash

			if !cacheMiss && !rf.skipCache {
				rf.debugf(rf.debugCache, "%v: cache hit for %v; not running", rf, hashPath)
				continue
			}

			if cacheMiss && rf.norun {
				// Earlier we ensured the user did not provide --skipcache and
				// --norun So we know we are here because of a cache miss. Panic in
				// case that is somehow broken.
				if rf.skipCache {
					panic("skipCache set and norun?")
				}
				// Otherwise error because we are in a situation where we need to
				// break the cache, but the user has told us not to.
				return rf.errorf("%v: cache miss for %v; but told not to run", rf, hashPath)
			} else if cacheMiss {
				// It's a cache miss
				rf.debugf(rf.debugCache, "%v: cache miss for %v", rf, hashPath)
			} else { // skip cache
				rf.debugf(rf.debugCache, "%v: skipping cache for %v; was a hit", rf, hashPath)
			}
			r := n.run()
			torun = append(torun, r)
		}
	}

	script, err := rf.buildMultistepScript()
	if err != nil {
		return err
	}
	// If there is nothing to do, script will be nil. Check against that
	if script != nil {
		torun = append(torun, script)
	}

	for _, r := range torun {
		wait = append(wait, runRunnable(r))
	}

	for _, v := range wait {
		<-v.done

		// Could make the following a method on errorContext
		rf.updateInError(v.isInError())
		rf.logf("%s", v.bytes())
	}

	return nil
}

func (rf *rootFile) buildMultistepScript() (runnable, error) {
	didWork := false
	for i := range rf.bodyParts {
		switch n := rf.bodyParts[i].(type) {
		case *scriptNode:
			didWork = true

			// A script should not have any files
			if len(n.sourceArchive.Files) > 0 {
				return nil, rf.errorf("%v: script nodes cannot contain files", n)
			}

			// Parse the comments as a shell script, not testscript
			// file, err := syntax.NewParser().Parse(bytes.NewReader(n.sourceArchive.Comment), "")
			// if err != nil {
			// 	return nil, rf.errorf("%v: failed to parse shell script: %v", n, err)
			// }
		case *uploadNode:
			didWork = true
		default:
			// Nothing to do; other nodes don't contribute
		}
	}

	if !didWork {
		// there is nothing to do
		return nil, nil
	}

	return nil, nil
}

// hashRunnableNode computes a hash of n, writing that hash to w, and returns
// the cue.Path at which a cache entry for such a hash could be found.
func (rf *rootFile) hashRunnableNode(n runnableNode, w io.Writer) cue.Path {
	fmt.Fprintf(w, "Go major version: %s\n", goMajorVersion)
	fmt.Fprintf(w, "preprocessor version: %s\n", rf.selfHash)
	fmt.Fprintf(w, "docker image: %s\n", dockerImageTag)
	n.writeToHasher(w)
	selPath := append(rf.page.path.Selectors(),
		cue.Str("cache"),
		cue.Str(n.nodeType()),
		cue.Str(n.nodeLabel()),
	)
	return cue.MakePath(selPath...)
}

func (rf *rootFile) writePageCache() error {
	if rf.noWriteCache {
		return nil
	}

	var didWork bool
	// Build a cue.Value of the cache entries
	v := rf.ctx.CompileString("{}")
	for i := range rf.bodyParts {
		n, ok := rf.bodyParts[i].(runnableNode)
		if !ok {
			continue
		}
		h, _ := rf.createHash()
		p := rf.hashRunnableNode(n, h)
		strHash := base64.StdEncoding.EncodeToString(h.Sum(nil))
		v = v.FillPath(p, strHash)
		didWork = true
	}
	if !didWork {
		return nil
	}

	if rf.debugCache {
		m := []byte(fmt.Sprintf("%v", v))
		rf.debugf(rf.debugCache, "%v: cache entries: \n%s", rf, tabIndent(m))
	}

	// Derive CUE source format
	node := v.Syntax()
	nodeSrc, err := format.Node(node)
	if err != nil {
		return rf.errorf("%v: failed to format CUE cache value: %v", rf, err)
	}

	// Write that cue.Value to a generated file in the page directory
	var page bytes.Buffer
	fmt.Fprintf(&page, "package site")
	fmt.Fprintf(&page, "\n")
	fmt.Fprintf(&page, "%s\n", nodeSrc)
	cacheFile := filepath.Join(rf.page.dir, "gen_cache.cue")
	// Read the current cache file; a missing file is like an empty file, hence
	// ignore any errors associated with the read.
	currCacheFile, _ := os.ReadFile(cacheFile)
	if err := writeIfDiff(&page, cacheFile, currCacheFile); err != nil {
		return rf.errorf("%v: failed to write cache to %s: %v", rf, cacheFile, err)
	}

	return nil
}

type waitRunnable struct {
	runnable
	done <-chan struct{}
}

func runRunnable(r runnable) waitRunnable {
	done := make(chan struct{})
	res := waitRunnable{
		runnable: r,
		done:     done,
	}
	go func() {
		r.run()
		close(done)
	}()
	return res
}

// transform writes out root file rf in a format that is ready to be consumed
// by hugo.
func (rf *rootFile) writeTarget(b *bytes.Buffer) error {
	// Write out the header
	b.WriteString(headerLine)
	b.Write(rf.header)
	b.WriteString(headerLine)
	parts := rf.bodyParts

	for _, n := range parts {
		if err := n.writeTransformTo(b); err != nil {
			return err
		}
	}
	return nil
}

// write writes to b, in a form that would allow it to be parsed for a perfect
// round trip. It panics if rf has not been parsed, a state that is indicated
// by a nil body.
func (rf *rootFile) writeSource(b *bytes.Buffer) error {
	if rf.body == nil {
		panic("cannot call write on an unparsed rootFile")
	}
	b.WriteString(headerLine)
	b.Write(rf.header)
	b.WriteString(headerLine)

	for _, n := range rf.bodyParts {
		n.writeSourceTo(b)
	}

	return nil
}

// writeIfDiff writes b to target but only if b represents a diff from the
// current contents of target.
func writeIfDiff(b *bytes.Buffer, target string, curVal []byte) error {
	var err error
	var exists bool
	if curVal == nil {
		// The file might not exist
		curVal, err = os.ReadFile(target)
		if err == nil {
			exists = true
		}
	} else {
		// assume the file exists
		exists = true
	}
	// Early return if the target exists and is byte-equal
	if exists && bytes.Equal(curVal, b.Bytes()) {
		return nil
	}
	targetDir := filepath.Dir(target)
	if err := os.MkdirAll(targetDir, 0777); err != nil {
		return fmt.Errorf("failed to ensure %s exists: %w", targetDir, err)
	}
	if err := os.WriteFile(target, b.Bytes(), 0666); err != nil {
		return fmt.Errorf("failed to write to %s: %w", target, err)
	}
	return nil
}

func computeGoMajorVersion() string {
	v := runtime.Version()
	if strings.Count(v, ".") == 1 {
		return v
	}
	i := strings.LastIndex(v, ".")
	return v[:i]
}
