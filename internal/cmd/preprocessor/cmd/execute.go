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
	"crypto/sha256"
	"fmt"
	"hash"
	"io"
	"os"
	"path/filepath"
	"regexp"
	"strings"

	"cuelang.org/go/cmd/cue/cmd"
	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
)

type lang string

const (
	langEn lang = "en"

	flagDir       flagName = "dir"
	flagDebug     flagName = "debug"
	flagServe     flagName = "serve"
	flagUpdate    flagName = "update"
	flagNoRun     flagName = "norun"
	flagSkipCache flagName = "skipcache"
	flagHugoFlag  flagName = "hugo"
)

var (
	// supportedLanguages defines the set of ISO 639-1 language codes supported by
	// preprocessor.
	supportedLanguages = []lang{
		langEn,
	}

	pageRootFileRegexp = buildRootFileRegexp(supportedLanguages)
)

// executionContext holds state that is usable throughout the various "layers"
// of the preprocessor.
//
// executionContext should be embedded in each type though the "layers" of the
// preprocessor. Each "layer" spawns child layers, copying the executionContext
// to the child. This works because there is currently no way for a child
// "layer" to safely share an update to what would otherwise be shared state.
// Nor can a child "layer" communicate with a sibling, for much the same
// reason.
//
// That said, because of the way in which we will load CUE configuration (see
// https://cuelang.org/cl/554251), the executeContext "layer" spawns page
// "layers" _before_ the loading of CUE (because the existence of pages tells
// us where to load the CUE) and so the executeContext embedded
// executionContext gets updated after the copy to each page layer has
// happened. Hence the pages do not see the loaded CUE configuration. Whilst
// there are a number of potential workarounds/alternatives to solving this,
// for now we share the state between all layers, effectively relying on the
// race detector to catch issues.
type executionContext struct {
	// updateGoldenFiles is set to allow runs of nodes and scripts to
	// update golden file expectations.
	updateGoldenFiles bool

	// debugGeneral is set when we should output debugGeneral level logging for
	// general logging statements. It is a catch-all for debugging not captured
	// by other debug* fields.
	debugGeneral bool

	// debugCache is set when we want to enable very detailed logging of what
	// goes in to cache decisions. It is distinct from debugGeneral because it
	// creates a lot of noise.
	debugCache bool

	// debugFsnotify is set when we want to enabled fine-grained logging related
	// to fsnotify events. It is distinct from debugGeneral because it creates a
	// lot of noise.
	debugFsnotify bool

	// tempRoot is the directory path under which all temporary files created
	// during an execution run of the preprocessor should be created.
	tempRoot string

	// norun is set to indicate that no nodes or scripts should be run.
	norun bool

	// ctx is the context used for all CUE operations
	ctx *cue.Context

	// config is the configuration for the entire site being handled by the
	// preprocessor.
	config cue.Value

	// selfHash is the hash of the preprocessor itself that hashing calculations
	// should use if they need the preprocessor to affect the hash result.
	selfHash string

	// skipCache is set to avoid any run steps consulting the current state of
	// the run cache.
	skipCache bool
}

// tempDir creates a new temporary directory within the
// tempRoot for this executionContext.
func (e executionContext) tempDir(pattern string) (string, error) {
	return os.MkdirTemp(e.tempRoot, pattern)
}

// createHash returns a new sha256 hash h. If debug mode is enabled, if will
// also return a new bytes.Buffer b, and writes to h will also be reflected in
// b. Otherwise b will be nil.
func (e executionContext) createHash() (hash.Hash, *bytes.Buffer) {
	h := sha256.New()
	if !e.debugCache {
		return h, nil
	}
	return newLoggingHash(h)
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

	if flagSkipCache.Bool(c) && flagNoRun.Bool(c) {
		return fmt.Errorf("cannot use --skipcache and --norun together")
	}

	ctx := executionContext{
		updateGoldenFiles: flagUpdate.Bool(c),
		norun:             flagNoRun.Bool(c),
		ctx:               cuecontext.New(),
		skipCache:         flagSkipCache.Bool(c),
	}

	// Debug logging. Any level of debug logging enabled implies
	// general debug logging is turned on.
	for _, v := range strings.Split(flagDebug.String(c), ",") {
		v, set := strings.CutPrefix(v, "-")
		switch v {
		case "all":
			ctx.debugGeneral = !set
			ctx.debugFsnotify = !set
			ctx.debugCache = !set
		case "fsnotify":
			ctx.debugFsnotify = !set
		case "cache":
			ctx.debugCache = !set
		}
	}
	ctx.debugGeneral = ctx.debugGeneral || ctx.debugCache || ctx.debugFsnotify

	e := newExecutor(&ctx, wd, projectRoot, c)
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
		// Because of our logging strategy, we never want cobra to print an error
		// we return. So instead return the sentinel error that indicates we have
		// already printed errors (which we have).
		return cmd.ErrPrintedError
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
