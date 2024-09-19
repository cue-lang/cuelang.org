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
	"encoding/json"
	"fmt"
	"hash"
	"io"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"strings"
	"sync"

	"cuelang.org/go/cmd/cue/cmd"
	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"golang.org/x/oauth2"
)

type lang string

const (
	langEn lang = "en"

	flagDir             flagName = "dir"
	flagDebug           flagName = "debug"
	flagServe           flagName = "serve"
	flagUpdate          flagName = "update"
	flagReadonlyCache   flagName = "readonlycache"
	flagSkipCache       flagName = "skipcache"
	flagHugoFlag        flagName = "hugo"
	flagNoWriteCache    flagName = "nowritecache"
	flagCheck           flagName = "check"
	flagList            flagName = "ls"
	flagCacheVolumeName flagName = "cachevolumename"
	flagNoCacheVolume   flagName = "nocachevolume"
	flagTestUserAuthn   flagName = "testuserauthn"

	envTestUserAuthn = "PREPROCESSOR_TEST_USER_AUTHN"
)

const (
	sitePackage = "site"
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

	// debugHugo is set when we want to enabled fine-grained logging related
	// to hugo output in the --serve mode.
	debugHugo bool

	// debugScript is set when we should output multi-step script debug level
	// logging.
	debugScript bool

	// debugCode is set when we should output code node debug level
	// logging.
	debugCode bool

	// debugFormatting is set when we should output multi-step formatting debug level
	// logging.
	debugFormatting bool

	// tempRoot is the directory path under which all temporary files created
	// during an execution run of the preprocessor should be created.
	tempRoot string

	// readonlyCache is indicates whether a cache hit is required or not for
	// nodes or scripts that can be run.
	readonlyCache bool

	// ctx is the context used for all CUE operations
	ctx *cue.Context

	// config is the configuration for the entire site being handled by the
	// preprocessor.
	config cue.Value

	// cueVersions is a map of name to version of CUE versions configured on the
	// site.
	cueVersions map[string]cueVersion
	// cueEnvVersions is a map of env var name to CUE versions, derived from
	// cueVersions. For example the entry:
	//
	// latest => v0.7.0
	//
	// in cueVersions exists in this map as:
	//
	// CUELANG_CUE_LATEST => v0.7.0
	cueEnvVersions map[string]string

	// selfHash is the hash of the preprocessor itself that hashing calculations
	// should use if they need the preprocessor to affect the hash result.
	selfHash string

	// skipCache is set to avoid any run steps consulting the current state of
	// the run cache.
	skipCache bool

	// noWriteCache is set to avoid page cache files being written to disk.
	noWriteCache bool

	// siteSchema is a CUE schema that validates a preprocessor site
	siteSchema cue.Value

	// noCacheVolume can be set to avoid using a shared docker volume for
	// multi-step scripts.
	noCacheVolume bool

	// cacheVolumeName is the name of the cache volume to use to optimise
	// multi-step scripts.
	cacheVolumeName string

	// testUserAuthn returns a map from GitHub username to [oauth2.Token],
	// which are OAuth 2.0 tokens as specified by [RFC 6749].
	//
	// In their config, pages declare that they require authn credentials for a
	// given list of users, the preprocessor makes available environment
	// variables for each user with the access_token from those credentials,
	// taken that access_token from the wireToken in the testUserAuthn map.
	//
	// [RFC 6749]: https://datatracker.ietf.org/doc/html/rfc6749#section-4.2.2
	testUserAuthn func() (map[string]oauth2.Token, error)
}

type cueVersion struct {
	// V is the semver version
	V string `json:"v"`

	// Var is the special environment variable name associated with this
	// version
	Var string `json:"var"`
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

	// Ensure os.Getwd() is contained by projectRoot, so that loading of
	// CUE packages via (relative) directory paths works.
	cwd, err := os.Getwd()
	if err != nil {
		return fmt.Errorf("failed to determine working directory: %v", err)
	}
	rel, err := filepath.Rel(projectRoot, cwd)
	if err != nil {
		return fmt.Errorf("failed to determine %s relative to %s", cwd, projectRoot)
	}
	if !filepath.IsLocal(rel) {
		return fmt.Errorf("current working directory must be within %s", projectRoot)
	}

	if flagSkipCache.Bool(c) && flagReadonlyCache.Bool(c) {
		return fmt.Errorf("cannot use --%s and --%s together", flagSkipCache, flagReadonlyCache)
	}

	// Load the preprocessor site schema for validation at various points
	cuectx := cuecontext.New()
	schema := cuectx.CompileString(schemaFile).LookupPath(cue.ParsePath("#site"))
	if err := schema.Err(); err != nil {
		return fmt.Errorf("failed to load site schema: %v", err)
	}

	ctx := executionContext{
		updateGoldenFiles: flagUpdate.Bool(c),
		readonlyCache:     flagReadonlyCache.Bool(c),
		ctx:               cuectx,
		skipCache:         flagSkipCache.Bool(c),
		noWriteCache:      flagNoWriteCache.Bool(c),
		siteSchema:        schema,
		cacheVolumeName:   flagCacheVolumeName.String(c),
		noCacheVolume:     flagNoCacheVolume.Bool(c),
	}

	if authFlag := flagTestUserAuthn.String(c); authFlag != "" {
		// We have either a filename passed by the user via the flag, or a string
		// JSON blob from the env var as a result of the flag not having been set
		// and its value defaulting to the env var.

		var byts []byte
		var src string

		var err error

		if c.Flags().Changed(string(flagTestUserAuthn)) {
			// The user set the flag
			byts, err = os.ReadFile(authFlag)
			if err != nil {
				return fmt.Errorf("failed to read user authn map file %s: %v", authFlag, err)
			}
			src = fmt.Sprintf("--%s", flagTestUserAuthn)
		} else {
			// The user set the env var default
			byts = []byte(authFlag)
			src = envTestUserAuthn
		}

		ctx.testUserAuthn = sync.OnceValues(func() (res map[string]oauth2.Token, err error) {
			if err := json.Unmarshal(byts, &res); err != nil {
				return nil, fmt.Errorf("failed to decode user authn map from %s: %v", src, err)
			}
			return
		})
	}

	// Ensure we have a docker cache volume if one is required
	if !ctx.noCacheVolume {
		if err := dockerCacheVolumeCheck(flagCacheVolumeName.String(c)); err != nil {
			return fmt.Errorf("failed to ensure cache volume exists: %v", err)
		}
	}

	// Calculate which levels of debug-level logging to enable, processing each
	// instance of the --debug flag in turn, splitting on ','.
	for _, a := range debugArgs {
		for _, v := range strings.Split(a, ",") {
			v, set := strings.CutPrefix(v, "-")
			switch v {
			case "all":
				ctx.debugGeneral = !set
				ctx.debugFsnotify = !set
				ctx.debugCache = !set
				ctx.debugHugo = !set
				ctx.debugScript = !set
				ctx.debugCode = !set
				ctx.debugFormatting = !set
			case "general":
				ctx.debugGeneral = !set
			case "fsnotify":
				ctx.debugFsnotify = !set
			case "cache":
				ctx.debugCache = !set
			case "hugo":
				ctx.debugHugo = !set
			case "script":
				ctx.debugScript = !set
			case "code":
				ctx.debugCode = !set
			case "formatting":
				ctx.debugFormatting = !set
			default:
				return fmt.Errorf("unknown debug flag %q", flagDebug.String(c))
			}
		}
	}

	e := newExecutor(&ctx, wd, projectRoot, c)
	if flagServe.Bool(c) {
		return e.serve()
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

// dockerCacheVolumeCheck ensures that a docker volume volumeName exists, and
// returns an error if not.
func dockerCacheVolumeCheck(volumeName string) error {
	cmd := exec.Command("docker", "volume", "create", volumeName)
	out, err := cmd.CombinedOutput()
	if err != nil {
		err = fmt.Errorf("command [%v] failed: %v\n%s", cmd, err, out)
	}
	return err
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
