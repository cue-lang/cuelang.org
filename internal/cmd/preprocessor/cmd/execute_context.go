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
	"encoding/base64"
	"encoding/json"
	"fmt"
	"io"
	"io/fs"
	"math/rand"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"runtime/debug"
	"sort"
	"strconv"
	"strings"
	"sync"
	"testing"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/cue/parser"
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

	// fmtContainers is a map[string]string of the Docker image to container ID.
	// The containers are used to perform formatting of files. A single
	// container per image is started on first use.
	fmtContainers     map[string]func() (string, error)
	fmtContainersLock sync.Mutex

	imageCheckers     map[string]func() error
	imageCheckersLock sync.Mutex

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
		fmtContainers:    make(map[string]func() (string, error)),
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

	inputs := ec.findSiteCUE()

	// If we are in error or have the --check or --ls flag we don't want to do anything else
	if ec.isInError() || flagCheck.Bool(ec.executor.cmd) || flagList.Bool(ec.executor.cmd) {
		return errorIfInError(ec)
	}

	// At this point we know we are not in --check mode, check we are not in
	// serve mode and delete hugo/content as a temporary(ish) measure to ensure
	// that we don't leave any stale files around.
	if !flagServe.Bool(ec.executor.cmd) {
		hugoContent := filepath.Join(ec.executor.root, "hugo", "content")
		if err := os.RemoveAll(hugoContent); err != nil {
			return ec.errorf("%v: failed to remove %s: %v", ec, hugoContent, err)
		}
	}

	// Load all the CUE in one go and validate against the preprocessor schema.
	cfg := &load.Config{
		Dir: ec.executor.root,
	}
	bps := load.Instances(inputs, cfg)
	if l := len(bps); l != 1 {
		return ec.errorf("%v: expected 1 build instance; saw %d", ec, l)
	}
	v := ec.executor.ctx.BuildInstance(bps[0])
	if err := v.Err(); err != nil {
		return ec.errorf("%v: error in site configuration: %v", ec, err)
	}
	v = v.Unify(ec.executor.siteSchema)
	if err := v.Err(); err != nil {
		return ec.errorf("%v: site failed to validate against schema: %v", ec, err)
	}
	ec.config = v

	// Load the CUE versions configured as part of the site
	ec.cueVersions = make(map[string]cueVersion)
	ec.cueEnvVersions = make(map[string]string)
	cueVersionsPath := cue.ParsePath("versions.cue")
	cueVersions := ec.config.LookupPath(cueVersionsPath)
	if cueVersions.Exists() {
		if err := cueVersions.Decode(&ec.cueVersions); err != nil {
			return ec.errorf("%v: failed to decode %v: %v", cueVersionsPath, err)
		}
		for _, v := range ec.cueVersions {
			ec.cueEnvVersions[v.Var] = v.V
		}
	}

	// Build up a list of the test users we need for all the pages
	testUsers := make(map[string]bool)

	// Now load config per page
	for _, d := range ec.order {
		p := ec.pages[d]
		p.loadConfig()

		if p.config.TestUserAuthn != nil {
			for _, u := range p.config.TestUserAuthn {
				testUsers[u] = true
			}
		}

		// This doesn't feel very elegant in the non-concurrent mode
		ec.updateInError(p.isInError())
		ec.logf("%s", p.bytes())
	}

	// If the user (of the preprocessor) has not provided config via --testuserauthn
	// or the PREPROCESSOR_TEST_USER_AUTHN env var, we "fall back" to asking for these
	// credentials via a special Central Registry endpoint
	if ec.testUserAuthn == nil {
		fetcher := centralRegistryTestUserFetcher{
			requiredUsers: testUsers,
		}
		ec.testUserAuthn = sync.OnceValues(fetcher.fetch)
	}

	// At this point we have config for each page, which means we know
	// which pages needs which test user.

	if ec.isInError() {
		return errorIfInError(ec)
	}

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

	// Now kill any fmtContainers
	for _, v := range ec.fmtContainers {
		name, err := v()
		if err != nil {
			// We will already have captured an error here when we came
			// to use the container. Just ignore.
			continue
		}
		cmd := exec.Command("docker", "kill", name)
		out, err := cmd.CombinedOutput()
		if err != nil {
			ec.errorf("%v: failed to run [%v]: %v\n%s", ec, cmd, err, out)
		}
	}

	return errorIfInError(ec)
}

func (e *executeContext) image(image string) error {
	e.imageCheckersLock.Lock()
	f, ok := e.imageCheckers[image]
	if !ok {
		f = sync.OnceValue(func() error {
			cmd := exec.Command("docker", "image", "inspect", image)
			if out, err := cmd.CombinedOutput(); err != nil {
				return fmt.Errorf("failed to find docker image %s: %s", image, out)
			}
			return nil
		})
	}
	e.imageCheckersLock.Unlock()
	return f()
}

func (e *executeContext) container(image string) (string, error) {
	e.fmtContainersLock.Lock()
	containerBuilder, ok := e.fmtContainers[image]
	if !ok {
		containerBuilder = sync.OnceValues(func() (string, error) {
			if err := e.image(image); err != nil {
				return "", err
			}
			return dockerRunDetached("preprocessor_format_", image)
		})
		e.fmtContainers[image] = containerBuilder
	}
	e.fmtContainersLock.Unlock()
	return containerBuilder()
}

func dockerRunDetached(prefix, image string) (string, error) {
	var args []string

	// Generate a random suffix name for our container with a
	// human-readable prefix
	name := fmt.Sprintf("%s_%x", prefix,
		sha256.Sum256(strconv.AppendInt(nil, rand.Int63(), 16)),
	)

	args = append(args,
		"docker", "run", "--name", name,

		// We want to detach from this container and 'docker exec' commands
		// within it.
		"-d",

		// We do not want to leave this container lying around when it stops
		"--rm",

		// All docker images used by unity must support this interface
		"-e", fmt.Sprintf("USER_UID=%v", os.Geteuid()),
		"-e", fmt.Sprintf("USER_GID=%v", os.Getegid()),
	)

	// If the user wants to be unsafe and _not_ isolate the network let them
	// It results in much faster running times when working on changes in the
	// preprocessor.
	if os.Getenv("CUE_UNSAFE_NETWORK_HOST") != "" {
		args = append(args, "--network=host")
	}

	args = append(args,
		image,
		"--",

		// We need this command to run forever in a detached state
		"sleep", "infinity",
	)

	cmd := exec.Command(args[0], args[1:]...)
	out, err := cmd.CombinedOutput()
	if err != nil {
		return "", fmt.Errorf("failed to run [%v]: %v\n%s", cmd, err, out)
	}
	return name, nil
}

// findSiteCUE finds all the CUE inputs that contribute to the site
// configuration. Because we have a non-standard load mode, this is a useful
// step to standardise. If `execute --check` is set, findSiteCUE also ensures
// that page CUE files contain configuration that only define values in the
// "namespace" defined by the page root directory. For example, for
// content/docs/howto/find-a-guide/page.cue it will ensure that fields are
// defined only within the content.docs.howto."find-a-guide" struct.
//
// If execute --list is set, then the CUE files that contribute to the site
// configurate are simply printed to stdout.
//
// Note that we know as a precondition of execute that the process working
// directory is contained by the project root.
func (ec *executeContext) findSiteCUE() (inputs []string) {
	// Loop through the root and content CUE files that belong to the site
	// package. Ensure that the content/**/*.cue files that are in page roots
	// are well structured.
	order := append([]string{ec.executor.root}, ec.order...)

dirs:
	for _, absDir := range order {
		// Load the files in the directory (assuming they all belong
		// to the same package)
		var filenames []string
		filenames, err := filepath.Glob(filepath.Join(absDir, "*.cue"))
		if err != nil {
			ec.errorf("%s: failed to read: %v", absDir, err)
			continue
		}

		doList := flagList.Bool(ec.executor.cmd)

		var siteFilenames []string
		// We only want the files that are part of the "site" package
		for _, fn := range filenames {
			f, err := parser.ParseFile(fn, nil, parser.PackageClauseOnly)
			if err != nil {
				ec.errorf("%v: failed to parse %s: %v", ec, fn, err)
				continue
			}
			if f.PackageName() != sitePackage {
				continue
			}
			if doList {
				fmt.Printf("%s\n", fn)
			} else {
				siteFilenames = append(siteFilenames, fn)
			}
		}

		if doList {
			continue
		}

		// No CUE files is also fine. We don't require CUE anywhere
		if len(siteFilenames) == 0 {
			continue
		}
		inputs = append(inputs, siteFilenames...)

		bps := load.Instances(siteFilenames, &load.Config{
			Dir: absDir,
		})
		if l := len(bps); l != 1 {
			ec.errorf("%s: expected 1 build package; saw %d", absDir, l)
			continue
		}
		v := ec.ctx.BuildInstance(bps[0])

		// If we have an error at this stage we can't be
		// sure  things are fine. Bail early
		if err := v.Err(); err != nil {
			ec.errorf("%s: error loading .cue files: %v", absDir, err)
			continue
		}

		// Now only do a structure check if we are not in the root of the site
		if absDir == ec.executor.root {
			continue
		}

		// derive the relative dirPath of d to the root, in canonical dirPath format
		// (i.e. not OS-specific)
		relDir := strings.TrimPrefix(absDir, ec.executor.root+string(os.PathSeparator))
		dirPath := filepath.ToSlash(filepath.Clean(relDir))
		parts := strings.Split(dirPath, "/")

		// We now want to walk down into v to ensure that the only fields that
		// exist at each "level" are consistent with the elements of path
		var selectors []cue.Selector
		for _, elem := range parts {
			path := cue.MakePath(selectors...)
			toCheck := v.LookupPath(path)
			fieldIter, err := toCheck.Fields(cue.Definitions(true), cue.Hidden(true))
			if err != nil {
				ec.errorf("%v: %s: failed to create iterator over CUE value at path %v: %v", ec, absDir, path, err)
				continue dirs
			}
			// Could be multiple bad fields at this level, report them all
			var inError bool
			for fieldIter.Next() {
				sel := fieldIter.Selector()
				if sel.LabelType() != cue.StringLabel || sel.Unquoted() != elem {
					inError = true
					val := fieldIter.Value()
					badPath := cue.MakePath(append(selectors, sel)...)

					// val.Pos() is the position of the _value_ (the RHS), not the
					// field name.  Hence we need to construct the format string by
					// hand.
					//
					// TODO: work out whether we can get the location(s) of the
					// label for this value in a more principled way.
					pos := val.Pos()
					ec.errorf("%v:%d: %v: field not allowed; expected %q", pos.Filename(), pos.Line(), badPath, elem)
				}
			}
			if inError {
				// No point descending further at this point
				continue dirs
			}
			selectors = append(selectors, cue.Str(elem))
		}
	}
	return inputs
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

// deriveHashOfSelf is responsible for setting ec.selfHash to a value that
// represents a hash of the running preprocessor binary.
func (ec *executeContext) deriveHashOfSelf() (err error) {
	// Post condition: ec.selfHash must be non-empty
	defer func() {
		if err == nil && ec.selfHash == "" {
			err = ec.errorf("%v: failed to compute non-empty hash of self", ec)
		}
	}()

	// In the special case of the preprocessor being tested, we want a stable
	// value to avoid a change in the preprocessor itself affecting the contents
	// of any gen_cache.cue testscript golden files.
	if testing.Testing() {
		ec.selfHash = "testing self"
		return nil
	}

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
	hash, _ := ec.executionContext.createHash()
	err = fs.WalkDir(files, ".", func(path string, d fs.DirEntry, err error) error {
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

	ec.selfHash = base64.StdEncoding.EncodeToString(hash.Sum(nil))

	return nil
}

// centralRegistryTestUserFetcher exists as a separate type to provide the
// context to its single method, fetch. This makes the process of "wrapping" a
// call to centralRegistryTestUserFetcher.fetch with a sync.Values call simpler
// than closing over a variable for the args.
//
// TODO: have the fetch method fully support OAuth2, with refresh tokens etc.
type centralRegistryTestUserFetcher struct {
	requiredUsers map[string]bool
}

func (c centralRegistryTestUserFetcher) fetch() (res map[string]wireToken, err error) {
	const centralRegistryHost = "registry.cue.works"
	// Fallback to calling the central registry
	userAuthnSrc := fmt.Sprintf("https://%s/_api/test_user_tokens", centralRegistryHost)

	configDir, err := os.UserConfigDir()
	if err != nil {
		return nil, fmt.Errorf("failed to locate config directory: %v", err)
	}

	loginsJsonPath := filepath.Join(configDir, "cue", "logins.json")
	loginsJson, err := os.ReadFile(loginsJsonPath)
	if err != nil {
		return nil, fmt.Errorf("failed to read config file %s: %v", loginsJsonPath, err)
	}
	var logins struct {
		Registries map[string]wireToken
	}

	if err := json.Unmarshal(loginsJson, &logins); err != nil {
		return nil, fmt.Errorf("failed to JSON unmarshal %s: %v", loginsJsonPath, err)
	}

	var centralRegistryWireToken *wireToken
	if logins.Registries != nil {
		v, ok := logins.Registries[centralRegistryHost]
		if ok {
			centralRegistryWireToken = &v
		}
	}
	if centralRegistryWireToken == nil {
		return nil, fmt.Errorf("failed to find auth credentials for %s in %s; run `cue login`", centralRegistryHost, loginsJsonPath)
	}

	type testuserTokensArgs struct {
		Usernames []string `json:"usernames"`
	}

	var args testuserTokensArgs
	for u := range c.requiredUsers {
		args.Usernames = append(args.Usernames, u)
	}
	sort.Strings(args.Usernames)
	argsByts, err := json.Marshal(args)
	if err != nil {
		return nil, fmt.Errorf("failed to marshal args for call: %v", err)
	}

	client := new(http.Client)
	req, err := http.NewRequest("POST", userAuthnSrc, nil)
	if err != nil {
		return nil, fmt.Errorf("failed to create reqest to %s: %v", userAuthnSrc, err)
	}
	req.Header.Add("Authorization", fmt.Sprintf("Bearer %s", centralRegistryWireToken.AccessToken))
	req.Body = io.NopCloser(bytes.NewReader(argsByts))

	resp, err := client.Do(req)
	if err != nil {
		return nil, fmt.Errorf("failed to make call for test user tokens: %v", err)
	}
	defer resp.Body.Close()

	userAuthnByts, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, fmt.Errorf("failed to read response for test user tokens: %v", err)
	}

	if resp.StatusCode < 200 || resp.StatusCode > 299 {
		return nil, fmt.Errorf("failed to get test user tokens: %d: %s", resp.StatusCode, userAuthnByts)
	}

	if err := json.Unmarshal(userAuthnByts, &res); err != nil {
		return nil, fmt.Errorf("failed to decode user authn map from %s: %v", userAuthnSrc, err)
	}

	return
}
