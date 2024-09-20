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
	"encoding/base32"
	"encoding/base64"
	"fmt"
	"io"
	"io/fs"
	"maps"
	"math/rand"
	"os"
	"os/exec"
	"path/filepath"
	"slices"
	"sort"
	"strconv"
	"strings"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/format"
	"github.com/cue-lang/cuelang.org/internal/parse"
	"golang.org/x/tools/txtar"
	"mvdan.cc/sh/v3/syntax"
)

var (
	// templateFunctions is the list of bare {{with}} transforms that we
	// support.  The variable is called templateFunctions because
	// text/template/parse sees the bare words and interprets them as if they
	// were function calls.
	templateFunctions = map[string]any{
		fnCode:         true,
		fnStep:         true,
		fnUpload:       true,
		fnHiddenUpload: true,
		fnScript:       true,
		fnHiddenScript: true,
		fnUploadDir:    true,
		"reference":    true,
		"def":          true,
		"sidetrack":    true,
		"TODO":         true,
	}
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

	// script represents the multi-step script for the page if there is one.
	script *multiStepScript

	// stepNumber is the number of the last step directive that was parsed. The
	// first step is numbered 1.
	stepNumber int

	// shellPrinter is a reusable bash shell syntax statement printer
	// re-used in the course of building up a multi-step script.
	shellPrinter *syntax.Printer

	// rand is a page-local pseudo-random source for generating unique "fences"
	// in multi-step scripts
	rand *rand.Rand

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
		shellPrinter:     syntax.NewPrinter(syntax.SingleLine(true)),
		rand:             rand.New(rand.NewSource(42)),
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

	// Do not continue if we are already in error
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

	// Ensure labels across steps (irrespective of type) are unique
	labels := make(map[string]map[string][]node)
	rf.walkBody(func(bp node) error {
		n, ok := bp.(labelledNode)
		if !ok {
			return nil
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
		return nil
	})
	for _, t := range slices.Sorted(maps.Keys(labels)) {
		tld := labels[t]
		for _, l := range slices.Sorted(maps.Keys(tld)) {
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

	// If we are already in error, do not progress to validate each node
	if rf.isInError() {
		return errorIfInError(rf)
	}

	// Validate those parts which have a validate() method
	rf.walkBody(func(n node) error {
		bp, ok := n.(validatingNode)
		if !ok {
			return nil
		}
		bp.validate()
		rf.updateInError(bp.isInError())
		return nil
	})

	return errorIfInError(rf)
}

// run is responsible for updating those nodes which contain inputs and outputs.
// The inputs generally need to be formatted, scripts run, and outputs updated.
// This method also adds as a means to check that we only have parsed things
// that we can support.
func (rf *rootFile) run() error {
	var torun []runnable
	var wait []waitRunnable
	rf.walkBody(func(rn node) error {
		switch n := rn.(type) {
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
				return nil
			}

			if cacheMiss && rf.readonlyCache {
				// Earlier we ensured the user did not provide --skipcache and
				// --readonlycache. So we know we are here because of a cache
				// miss. Panic in case that is somehow broken.
				if rf.skipCache {
					panic("--skipcache and --readonlycache both set?")
				}
				// Otherwise error because we are in a situation where we need to
				// break the cache, but the user has told us not to.
				return rf.errorf("%v: cache miss for %v; but --%s", rf, hashPath, flagReadonlyCache)
			} else if cacheMiss {
				// It's a cache miss
				rf.debugf(rf.debugCache, "%v: cache miss for %v", rf, hashPath)
			} else { // skip cache
				rf.debugf(rf.debugCache, "%v: skipping cache for %v; was a hit", rf, hashPath)
			}
			r := n.run()
			torun = append(torun, r)
		}
		return nil
	})
	if rf.isInError() {
		return errorIfInError(rf)
	}

	runRunnablesAndWait := func() {
		var r runnable
		for len(torun) > 0 {
			r, torun = torun[0], torun[1:]
			wait = append(wait, runRunnable(r))
		}
		var v waitRunnable
		for len(wait) > 0 {
			v, wait = wait[0], wait[1:]
			<-v.done

			// Could make the following a method on errorContext
			rf.updateInError(v.isInError())
			rf.logf("%s", v.bytes())
		}
	}

	// Formatting must happen before the multistep script in case we end up
	// formatting a node that gets uploaded.
	runRunnablesAndWait()

	script, err := rf.buildMultistepScript()
	if err != nil {
		return err
	}
	rf.script = script

	// If there is nothing to do, script will be nil. Check against that
	if script != nil {
		torun = append(torun, script)
	}

	// The multi-step script's turn
	runRunnablesAndWait()

	return nil
}

// buildMultistepScript constructs a bash file that will be run within docker
// and returns a runnable representing that unit of work.
func (rf *rootFile) buildMultistepScript() (*multiStepScript, error) {
	// didWork notes whether we actually found and considered an upload or
	// script node.  If we did not, then there is nothing to actually do
	// and we can return early.
	didWork := false

	var sb strings.Builder
	pf := func(format string, args ...interface{}) {
		fmt.Fprintf(&sb, format, args...)
	}
	pf("#!/usr/bin/env -S bash -l\n")
	pf("export TERM=dumb\n")
	pf("export NO_COLOR=true\n")

	// TODO: work out why we are not inheriting PATH from the setpriv environment
	// whereas we do when we docker run from the command line.
	pf("export PATH=\"/usr/share/maven/bin:/opt/java/openjdk/bin:/cues/${%s}:/go/bin:/usr/local/go/bin:$PATH\"\n", rf.cueVersions["default"].Var)

	// exitCodeVar is the name of the "temporary" variable used to capture
	// the exit code from a command. Named something suitably esoteric to
	// avoid user-declared variables
	const exitCodeVar = "____x"

	var scriptSteps []*commandStmt

	// build up a hash of the author-specified commands and file contents
	userScriptHash := sha256.New()
	userScript := func(format string, args ...any) {
		s := fmt.Sprintf(format, args...)
		fmt.Fprint(userScriptHash, rf.page.config.randomReplace(s))
	}

	// TODO: do a pass over all the shell generated below to ensure that we are
	// quoting everything that we need to.

	upload := func(f txtar.File, force bool) {

		// The upload target path provided via the txtar filename _might_ be
		// absolute. We don't know.  When it is, we should treat it as such.
		// Otherwise, as a convenience we treat it as relative to the starting
		// working directory of the script, i.e. $HOME. The problem is that we
		// can only determine if the target is absolute in the script itself
		// (allowing for env var expansion, etc). So we use a unique variable
		// name to store the target file path, which is made absolute as
		// required.
		targetFileVar := "target" + rf.getFence()
		pf("if [[ \"%s\" != /* ]]; then %s=\"$HOME/%s\"; else %s=\"%s\"; fi\n", f.Name, targetFileVar, f.Name, targetFileVar, f.Name)

		// If we are not in force mode, first check if the file exists
		if !force {
			cmdEchoFence := rf.getFence()
			pf("cat <<'%s'\n", cmdEchoFence)
			pf("$ if [[ -f $%s ]]; then echo target file $%s already exists; exit 1; fi\n", targetFileVar, targetFileVar)
			pf("%s\n", cmdEchoFence)
			pf("if [[ -f $%s ]]; then echo target file $%s already exists; exit 1; fi\n", targetFileVar, targetFileVar)
		}

		// First echo the commands that we will run to make debugging
		// easier. Notice this block is surrounded in a no-interpolation
		// cat using a pseudo-random string fence.
		cmdEchoFence := rf.getFence()
		pf("cat <<'%s'\n", cmdEchoFence)
		if strings.Contains(f.Name, "/") {
			pf("$ mkdir -p \"$(dirname $%s)\"\n", targetFileVar)
		}
		pf("$ cat <<EOD > $%s\n", targetFileVar)
		pf("%s\n", f.Data)
		pf("EOD\n")
		pf("%s\n", cmdEchoFence)

		// Now write the actual commands to the file.
		fence := rf.getFence()
		if strings.Contains(f.Name, "/") {
			pf("mkdir -p \"$(dirname $%s)\"\n", targetFileVar)
		}
		pf("cat <<'%s' > $%s\n", fence, targetFileVar)
		pf("%s", f.Data)
		if !bytes.HasSuffix(f.Data, []byte("\n")) {
			pf("\n")
		}
		pf("%s\n", fence)

		// Check the exit code
		pf("%s=$?\n", exitCodeVar)
		pf("if [[ $%s -ne 0 ]]\n", exitCodeVar)
		pf("then\n")
		pf("exit 1\n")
		pf("fi\n")

		// The file contents are author-specified
		userScript("filename: %s, contents: %s\n", f.Name, f.Data)
	}

	rf.walkBody(func(n node) error {
		switch n := n.(type) {
		case *scriptNode:
			// Skip running this part of the script if the #norun tag is present
			if _, ok, _ := n.tag(tagNorun, ""); ok {
				break
			}
			didWork = true

			// We know a script will not have any files because of validate(), which
			// also parsed the script. So we know it's valid.
			for _, stmt := range n.stmts {
				// echo the command we will run
				cmdEchoFence := rf.getFence()
				pf("cat <<'%s'\n", cmdEchoFence)
				pf("%s\n", stmt.Doc)
				pf("$ %s\n", stmt.Cmd)
				pf("%s\n", cmdEchoFence)
				stmt.outputFence = rf.getFence()
				pf("echo %s\n", stmt.outputFence)
				pf("%s\n", stmt.Cmd)
				pf("%s=$?\n", exitCodeVar)
				pf("echo %s\n", stmt.outputFence)
				if stmt.negated {
					pf("if [[ $%s == 0 ]]\n", exitCodeVar)
				} else {
					pf("if [[ $%s != 0 ]]\n", exitCodeVar)
				}
				pf("then\n")
				pf("exit 1\n")
				pf("fi\n")
				pf("echo $%s\n", exitCodeVar)

				scriptSteps = append(scriptSteps, stmt)

				// Each stmt is author-specified
				userScript("negated: %v, doc: %s, cmd: %s\n", stmt.negated, stmt.Doc, stmt.Cmd)
			}
		case *uploadNode:
			didWork = true

			files, force, _ := n.tag(tagForce, "")
			for _, f := range n.archive.Files {
				forceFile := force && (len(files) == 0 || slices.Contains(files, f.Name))
				upload(f, forceFile)
			}

		case *uploadDirNode:
			didWork = true

			// Walk the directory and add each file to the script as if an
			// individual upload
			err := filepath.WalkDir(n.dir, func(path string, d fs.DirEntry, err error) error {
				if err != nil {
					return err
				}

				if d.IsDir() {
					return nil // recurse
				}

				rel, err := filepath.Rel(n.dir, path)
				if err != nil {
					return fmt.Errorf("failed to determine %s relative to %s: %v", path, n.dir, err)
				}

				// We have a file
				byts, err := os.ReadFile(path)
				if err != nil {
					return fmt.Errorf("failed to read %s: %v", path, err)
				}

				f := txtar.File{
					Name: rel,
					Data: byts,
				}

				upload(f, n.force)

				return nil
			})
			if err != nil {
				return fmt.Errorf("%v: failed to walk upload dir %s: %v", n, n.dir, err)
			}

		default:
			// Nothing to do; other nodes don't contribute
		}
		return nil
	})

	if !didWork {
		return nil, nil
	}

	// Because of https://github.com/moby/moby/issues/43121 we add an
	// additional \n (which will be read as \r\n) to ensure we have a
	// trailing newline.
	pf("echo")

	mss := multiStepScript{
		bashScript:     sb.String(),
		userScriptHash: base32.HexEncoding.EncodeToString(userScriptHash.Sum(nil)),
		rootFile:       rf,
		scriptSteps:    scriptSteps,
		bufferedErrorContext: &errorContextBuffer{
			executionContext: rf.executionContext,
		},
	}
	return &mss, nil
}

func (rf *rootFile) getFence() string {
	h := sha256.Sum256(strconv.AppendInt(nil, rf.rand.Int63(), 16))
	return fmt.Sprintf("%x", h)
}

type multiStepScript struct {
	bashScript string

	// userScriptHash is a hash of the author-specified parts of a multi-step
	// script.  i.e. the filenames and contents to upload, and the commands
	// specified in script blocks.
	userScriptHash string

	scriptSteps []*commandStmt
	*rootFile
	bufferedErrorContext
}

// cachePath returns the path at which to find/place the output from the
// multi-step script represented by m.
func (m *multiStepScript) cachePath() cue.Path {
	return cue.MakePath(append(m.pageCacheSelectors(), cue.Str("multi_step"))...)
}

type multiStepScriptCache struct {
	Hash       string         `json:"hash"`
	ScriptHash string         `json:"scriptHash"`
	Steps      []*commandStmt `json:"steps"`
}

// hash computes the hash of self. This by definition includes the hash of
// dependencies such as the Go major version, preprocessor version and docker
// image.
func (m *multiStepScript) hash() string {
	work := sha256.New()
	fmt.Fprintf(work, "preprocessor version: %s\n", m.selfHash)
	fmt.Fprintf(work, "docker image: %s\n", dockerImageTag)
	fmt.Fprintf(work, "script:\n%s\n", m.rootFile.page.config.randomReplace(m.bashScript))
	return base32.HexEncoding.EncodeToString(work.Sum(nil))
}

// run runs the multi-step bash script in docker, and sets the output
// results on the steps in m.rootFile... which is safe to do because
// we block on all runnables before attempting and writing of the
// transformed output.
//
// A good amount of potential overlap here with the code node use of
// docker but we can (and will) DRY that up later.
func (m *multiStepScript) run() {
	defer recoverFatalError(m)

	td, err := m.tempDir("multistep")
	if err != nil {
		m.fatalf("%v: failed to create temp dir for running multistep script: %v", m, err)
	}

	scriptsDir := filepath.Join(td, "scripts")
	if err := os.Mkdir(scriptsDir, 0777); err != nil {
		m.fatalf("%v: failed to create scripts directory %v: %v", m, scriptsDir, err)
	}
	scriptsFile := filepath.Join(scriptsDir, "script.sh")
	if err := os.WriteFile(scriptsFile, []byte(m.bashScript), 0777); err != nil {
		m.fatalf("%v: failed to write temporary script to %v: %v", m, scriptsFile, err)
	}

	// Explicitly change the permissions for the scripts directory and the
	// script itself so that when mounted within the docker container they are
	// runnable by anyone. This is necessary because the bind mount used adopts
	// the same owner and permissions as the host. Therefore, to be runnable
	// by any user, including the user who ends up running the script as defined
	// by the image we are using, we need to be liberal.
	if err := os.Chmod(scriptsDir, 0777); err != nil {
		m.fatalf("%v: failed to change permissions of %v: %v", m, scriptsDir, err)
	}
	if err := os.Chmod(scriptsFile, 0777); err != nil {
		m.fatalf("%v: failed to change permissions of %v: %v", m, scriptsFile, err)
	}

	m.debugf(m.debugCache, "%v: config value: %v\n", m, m.config)

	var multiStepCache multiStepScriptCache
	cacheVal := m.config.LookupPath(m.cachePath())
	cacheMiss := !cacheVal.Exists()
	scriptCacheMiss := cacheMiss // initial value, refined below

	if !cacheMiss {
		if err := cacheVal.Decode(&multiStepCache); err == nil {
			cacheMiss = multiStepCache.Hash != m.hash()
			scriptCacheMiss = multiStepCache.ScriptHash != m.userScriptHash
		}
	}

	var out []byte
	if !cacheMiss && !m.skipCache {
		m.debugf(m.debugCache, "%v: cache hit for multi-step script; not running", m)

		// We need to assign from the cache the output values to the stmts
		for i, stmt := range m.scriptSteps {
			cstmt := multiStepCache.Steps[i]
			stmt.Doc = cstmt.Doc
			stmt.Cmd = cstmt.Cmd
			stmt.Output = cstmt.Output
			stmt.ExitCode = cstmt.ExitCode
		}
		return
	}

	if cacheMiss {
		m.debugf(m.debugCache, "%v: cache miss for multi-step script", m)
	} else {
		m.debugf(m.debugCache, "%v: skipping cache for multi-step script; was a hit", m)
	}

	// Early check to ensure we have the required docker image available
	//
	// TODO: use page-specified docker image
	if err := m.page.ctx.imageExists(dockerImageTag); err != nil {
		m.fatalf("%v", err)
	}

	var args []string
	args = append(args,
		// We use docker create followed by docker start to avoid problems with
		// stdin, stdout and stderr not being attached to a real tty. Not quite
		// sure what happens to make this "work" but it does, a lesson learned
		// from preguide days.
		//
		// TODO: document the reasons behind the create+start dance, and why this
		// is better/required over a straight docker run.
		"docker", "create", "--rm",

		// Need to be able to pass stdin
		"-i",

		// otherwise stderr is not line buffered
		"-t",

		// TODO: as a temporary measure, pass CUE_TEST_LOGINS through from the
		// host (documentation author) environment to the running multi-step
		// script. CUE_TEST_LOGINS should be set to a string that can be written
		// to $CUE_CONFIG_DIR/logins.json. This allows us to perform a headless
		// 'cue login' step in a guide, whilst asking the user (via #norun
		// script) to perform an actual 'cue login'.
		//
		// The proper/complete solution here is to have the host provide a blob
		// of JSON that maps from a set of well-known users to credentials. These
		// well-known users are isolated and limited bot accounts that we define
		// to perform well-known roles. e.g. user1 has access to these repos,
		// write access to these others, but no access to these private repos.
		// We will document the role each such user plays. The central registry
		// will then give those with sufficient permissions the ability to create
		// short-lived tokens for these users. The short-lived tokens can then be
		// passed to the preprocessor. Each guide can then declare the list of
		// well-known test users it requires. The preprocessor can then lookup
		// the credentials in the host-provided blob, and make the credentials
		// available via well-known environment variables e.g.
		// USER1_CUE_TEST_LOGINS or similar. This approach will also allow us to
		// know precisely what data that is passed in is credentials. We can also
		// therefore perform a final "blanking" phase for safety's sake where we
		// string replace credentials with '*****' or similar.
		"-e", "CUE_TEST_LOGINS",

		// mount the bash script
		"--mount", fmt.Sprintf("type=bind,source=%s,target=/scripts,readonly", scriptsDir),
	)

	var sensitiveValues []string

	// Ensure we have a docker cache volume if one is required
	if !m.noCacheVolume {
		args = append(args, "-v", fmt.Sprintf("%s:/caches", m.cacheVolumeName))
	}

	// We cannot perform the --network=host trick here, even if the user wants
	// to be unsafe, because we might, for example, run cue mod registry which
	// requires its own networking isolation for binding to the port it will
	// use.

	// Set userAuthn env vars for the users required if we are running with
	// --readonlycache unset. Doing so in the bash script ensure that we will
	// cause a cache miss if the credentials have changed.
	if !m.readonlyCache && len(m.page.config.TestUserAuthn) > 0 {
		authMap, err := m.testUserAuthn()
		if err != nil {
			m.fatalf("%v: failed to load authn map: %v", m, err)
		}
		users := make(map[string]bool)
		for _, u := range m.page.config.TestUserAuthn {
			users[u] = true
		}
		var vars []string
		for u := range users {
			creds, ok := authMap[u]
			if !ok {
				m.errorf("%v: failed to find user authn credentials for %q", m, u)
				continue
			}
			safeUser := strings.ReplaceAll(strings.ToUpper(u), "-", "_")
			vars = append(vars, fmt.Sprintf("TEST_USER_AUTHN_%s=%s", safeUser, creds.AccessToken))
			sensitiveValues = append(sensitiveValues, creds.AccessToken)
		}
		if m.isInError() {
			return
		}
		// Sort for stability
		sort.Strings(vars)
		for _, v := range vars {
			args = append(args, "-e", v)
		}
	}

	args = append(args,
		// TODO: support per-guide docker images
		dockerImageTag,
		"--",

		// The script to run
		"/scripts/script.sh",
	)

	createCmd := exec.Command(args[0], args[1:]...)
	var createStdout, createStderr bytes.Buffer
	createCmd.Stdout = &createStdout
	createCmd.Stderr = &createStderr

	m.debugf(m.debugScript, "%v: creating multi-step script container", m)
	m.debugf(m.debugScript, "%v: cmd: %v", m, createCmd)
	m.debugf(m.debugScript, "%v: script: %s", m, m.bashScript)

	if err := createCmd.Run(); err != nil {
		m.fatalf("failed %v: %v\n%s", createCmd, err, createStderr.Bytes())
	}

	instance := strings.TrimSpace(createStdout.String())

	startCmd := exec.Command("docker", "start", "-a", instance)
	out, err = startCmd.CombinedOutput()
	if err != nil {
		var script string
		m.fatalf("%v: failed to start instance for multi-step script [%v]: %v\n%s%s", m, createCmd, err, out, script)
	}

	// Because we are running in -t mode, replace all \r\n with \n
	out = bytes.ReplaceAll(out, []byte("\r\n"), []byte("\n"))

	// At the earliest opportunity, replace any instances of values we known
	// to be sensitive in the output with '******'. We first sort the
	// sensitiveValues for stable behaviour.
	sort.Strings(sensitiveValues)
	for _, v := range sensitiveValues {
		out = bytes.ReplaceAll(out, []byte(v), []byte("******"))
	}

	m.debugf(m.debugScript, "%v: output:\n===========\n%s\n============", m, out)

	walk := out
	advanceWalk := func(end []byte) string {
		before, after, found := bytes.Cut(walk, end)
		if !found {
			m.fatalf("%v: failed to find %q before end of output:\n%q\nOutput was: %q\n", m, end, walk, out)
		}
		walk = after
		return string(before)
	}

	// TODO we should tidy this up to not be a walk... it's getting verbose
	var i int
	m.walkBody(func(n node) error {
		step, ok := n.(*scriptNode)
		if !ok {
			return nil
		}
		if _, noRun, _ := step.tag(tagNorun, ""); noRun {
			return nil
		}
		for _, stmt := range step.stmts {
			fence := []byte(stmt.outputFence + "\n")
			advanceWalk(fence) // Ignore everything before the fence

			stmt.Output = advanceWalk(fence)
			exitCodeStr := advanceWalk([]byte("\n"))
			stmt.ExitCode, err = strconv.Atoi(exitCodeStr)
			if err != nil {
				m.fatalf("%v: failed to parse exit code from %q at position %v in output: %v\n%s", m, exitCodeStr, len(out)-len(walk)-len(exitCodeStr)-1, err, out)
			}

			var sans []sanitiser
			if stmt.sanitisers != nil {
				sans = stmt.sanitisers
			} else {
				for _, s := range m.page.config.Sanitisers {
					matched, err := s.matches(stmt.stmt)
					if err != nil {
						m.fatalf("%v: failed to determine if sanitiser should apply for %q: %v", m, stmt.Cmd, err)
					}
					if !matched {
						continue
					}
					sans = append(sans, s)
				}
			}
			for _, s := range sans {
				if err := s.sanitise(stmt); err != nil {
					m.fatalf("%v: failed to sanitise output for %q: %v", m, stmt.Cmd, err)
				}
			}

			// Now replace all random values which have a replacement with that replacement
			// in both the command and the output
			stmt.Doc = m.rootFile.page.config.randomReplace(stmt.Doc)
			stmt.Cmd = m.rootFile.page.config.randomReplace(stmt.Cmd)
			stmt.Output = m.rootFile.page.config.randomReplace(stmt.Output)

			// At this point, stmt.Output is sanitised.

			if !scriptCacheMiss {
				// In this code path, we had a script cache hit but because of a
				// flag/other we intentionally skipped the cache. This means
				// that cmd.Output might be the same as cstmt.Output. But it
				// might not, because of variations like test times in the
				// output from commands like 'go test'. This is where
				// comparators come in.
				//
				// Comparators normalise the output of commands in order to
				// allow for "fuzzy" comparisons. Running the comparators on
				// both the cached and actual output gives us something we can
				// then compare byte-for-byte. If the results from the
				// normalization compare equal, then we can safely write the
				// output from the cached version to the actual. The actual is
				// what will get written back to disk.

				cstmt := multiStepCache.Steps[i]
				actualAccum := stmt.Output
				cachedAccum := cstmt.Output
				for _, cmp := range m.page.config.Comparators {
					var err error
					matched, err := cmp.matches(stmt.stmt)
					if err != nil {
						m.fatalf("%v: failed to determine if comparator should apply for %q: %v", m, stmt.Cmd, err)
					}
					if !matched {
						continue
					}
					f := m.getFence()
					actualAccum, err = cmp.normalize(stmt, actualAccum, f)
					if err != nil {
						return err
					}
					cachedAccum, err = cmp.normalize(stmt, cachedAccum, f)
					if err != nil {
						return err
					}
				}
				if actualAccum == cachedAccum {
					stmt.Output = cstmt.Output
				}
			}
			i++ // TODO - remove this as part of TODO from above
		}
		return nil
	})
}

// hashRunnableNode computes a hash of n, writing that hash to w, and returns
// the cue.Path at which a cache entry for such a hash could be found.
func (rf *rootFile) hashRunnableNode(n runnableNode, w io.Writer) cue.Path {
	fmt.Fprintf(w, "preprocessor version: %s\n", rf.selfHash)
	fmt.Fprintf(w, "docker image: %s\n", dockerImageTag)
	n.writeToHasher(w)
	selPath := append(rf.pageCacheSelectors(),
		cue.Str(n.nodeType()),
		cue.Str(n.nodeLabel()),
	)
	return cue.MakePath(selPath...)
}

// pageCacheSelectors returns a fresh slice of selectors which
// describe the path to the page's cache configuration.
func (rf *rootFile) pageCacheSelectors() []cue.Selector {
	return append(slices.Clip(rf.page.path.Selectors()), cue.Str("cache"))
}

func (rf *rootFile) writePageCache() error {
	if rf.noWriteCache {
		return nil
	}

	var didWork bool
	// Build a cue.Value of the cache entries
	v := rf.ctx.CompileString("{}")
	rf.walkBody(func(rn node) error {
		n, ok := rn.(runnableNode)
		if !ok {
			return nil
		}
		h, _ := rf.createHash()
		p := rf.hashRunnableNode(n, h)
		strHash := base64.StdEncoding.EncodeToString(h.Sum(nil))
		v = v.FillPath(p, strHash)
		didWork = true
		return nil
	})
	if rf.isInError() {
		return errorIfInError(rf)
	}
	if rf.script != nil {
		p := rf.script.cachePath()
		v = v.FillPath(p, multiStepScriptCache{
			Hash:       rf.script.hash(),
			ScriptHash: rf.script.userScriptHash,
			Steps:      rf.script.scriptSteps,
		})
		didWork = true
	}
	if !didWork {
		return nil
	}

	if rf.debugCache {
		m := []byte(fmt.Sprintf("%v", v))
		rf.debugf(rf.debugCache, "%v: cache entries: \n%s", rf, tabIndent(m))
	}

	// Validate against site schema
	if err := v.Unify(rf.siteSchema).Err(); err != nil {
		return rf.errorf("%v: failed to validate cache entries against site schema: %v", rf, err)
	}

	// Derive CUE source format
	node := v.Syntax()
	nodeSrc, err := format.Node(node)
	if err != nil {
		return rf.errorf("%v: failed to format CUE cache value: %v", rf, err)
	}

	// Write that cue.Value to a generated file in the page directory
	var page bytes.Buffer
	fmt.Fprintf(&page, "package %s", sitePackage)
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

	return transformNodes(b, rf.bodyParts)
}

func transformNodes(b *bytes.Buffer, nodes []node) error {
	for _, n := range nodes {
		if n.isHidden() {
			continue
		}
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
