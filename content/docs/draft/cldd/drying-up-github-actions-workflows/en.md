---
title: DRYing up GitHub Actions workflows
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD

# Set up the working directory, given that the reader's hypothetical entry
# point into this guide would bring some existing state with them.
mkdir -p .github/workflows
cue mod init cue.example
{{{end}}}

If you've already started
[using CUE to define GitHub Actions workflows]({{<relref"getting-started-with-github-actions-cue">}})
then you might have several workflows that share common characteristics.
Some of CUE's most powerful features are designed to reduce repetition and
allow easy <dfn title="&quot;Don't Repeat Yourself&quot;">DRYing</dfn> up
of configuration and data sources.
This guide shows you how to use those features to simplify your GitHub Actions
workflows -- allowing their critical, unique elements to stand out.

The techniques and language features shown in this guide can be applied to any
CUE, but the changes we'll demonstrate are specific to the configurations
you'll see here -- you'll need to adapt those techniques to suit *your* CUE.

## Start with several workflows defined in CUE

In this example we start with a pair of GitHub Actions workflows that test and
release a Go module:

{{<columns>}}
{{{with upload "en" "test.cue pre"}}}
-- ci/github/test.cue --
package github

import "cue.dev/x/githubactions"

workflows: test: githubactions.#Workflow & {
	name: "Test PRs"
	on: pull_request: branches: ["main"]
	permissions: {
		contents:        "read"
		"pull-requests": "read"
	}
	jobs: test: {
		"runs-on": "ubuntu-latest"
		steps: [{
			uses: "actions/checkout@v4"
		}, {
			uses: "actions/setup-go@v5"
			with: "go-version": "1.24"
		}, {
			name: "Test"
			run:  "go test -v  ./..."
		}]
	}
}
{{{end}}}
{{<columns-separator>}}
{{{with upload "en" "release.cue pre"}}}
-- ci/github/release.cue --
package github

import "cue.dev/x/githubactions"

workflows: release: githubactions.#Workflow & {
	name: "Release"
	on: push: tags: ["v*"]
	permissions: contents: "read"
	jobs: release: {
		"runs-on": "ubuntu-latest"
		steps: [{
			uses: "actions/checkout@v4"
		}, {
			uses: "actions/setup-go@v5"
			with: "go-version": "1.24"
		}, {
			name: "Test"
			run:  "go test -v -race ./..."
		}, {
			name: "Release"
			run:  "echo Release process here."
		}]
	}
}
{{{end}}}
{{</columns>}}

## Tidy the local CUE module

Running
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
ensures that all module dependencies are satisfied:

{{{with script "en" "cue mod tidy"}}}
cue mod tidy
{{{end}}}

Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).

## Check that the CUE exports cleanly

We need to check that our CUE is valid, and that it produces the config files
we expect.
We use a pair of `cue export` commands that each target a named workflow to
create the specific YAML files that GitHub requires:

{{{with script "en" "cue export pre"}}}
cue export ./ci/github -f -e workflows.test -o .github/workflows/test.yml
cue export ./ci/github -f -e workflows.release -o .github/workflows/release.yml
{{{end}}}

We check that our exported YAML files look as expected:

{{<columns>}}
{{{with upload "en" "test.yml pre"}}}
#assert
-- .github/workflows/test.yml --
name: Test PRs
"on":
  pull_request:
    branches:
      - main
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-go@v5
        with:
          go-version: "1.24"
      - name: Test
        run: go test -v  ./...
permissions:
  contents: read
  pull-requests: read
{{{end}}}
{{<columns-separator>}}
{{{with upload "en" "release.yml pre"}}}
#force
-- .github/workflows/release.yml --
name: Release
"on":
  push:
    tags:
      - v*
permissions:
  contents: read
jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-go@v5
        with:
          go-version: "1.24"
      - name: Test
        run: go test -v -race ./...
      - name: Release
        run: echo Release process here.
{{{end}}}
{{</columns>}}

## Simplify the CUE

We now DRY up and simplify our two CUE files as follows.
Don't worry if any parts don't make sense immediately - we'll explain what's
going on later!

{{<columns>}}
{{{with upload "en" "test.cue post"}}}
#force
-- ci/github/test.cue --
package github

workflows: test: {
	name: "Test PRs"
	on: pull_request: branches: [#defaultBranch]
	permissions: "pull-requests": "read"
	jobs: test: steps: [
		_checkoutCode,
		_setupGo,
		_goTest,
	]
}
{{{end}}}
{{<columns-separator>}}
{{{with upload "en" "release.cue post"}}}
#force
-- ci/github/release.cue --
package github

workflows: release: {
	name: "Release"
	on: push: tags: ["v*"]
	jobs: release: steps: [
		_checkoutCode,
		_setupGo,
		_goTest & {
			#flags: "-race"
		}, {
			name: "Release"
			run:  "echo Release process here."
		},
	]
}
{{{end}}}
{{</columns>}}

The workflows are now much simpler and easier to understand, as they contain
just the critical and unique information that's needed to distiguish them from
each other. More importantly we've also introduced consistency to the
workflows, and can rely on CUE to enforce it for us. But we haven't thrown the
boilerplate away - it still needs to be defined *somewhere*.

In fact, we've placed the common and shared elements of our workflows in a
third CUE file, along with numbered comments pointing to explanations
(presented after the CUE) of how each element helps to reduces our individual
workflows' boilerplate:

{{{with upload "en" "workflows.cue"}}}
#nofmt
-- ci/github/workflows.cue --
package github

import (
	"strings"
	"cue.dev/x/githubactions"
)

#defaultBranch: "main"                                             // Explanation #1
workflows: [_]: githubactions.#Workflow & {                        // Explanation #2
	jobs: [_]: "runs-on": *"ubuntu-latest" | _                     // Explanation #3
	permissions: contents: *"read" | "write" | "none"              // Explanation #4
}
_checkoutCode: githubactions.#Step & {uses: "actions/checkout@v4"} // Explanation #5
_setupGo: githubactions.#Step & {                                  // Explanation #5
	uses: "actions/setup-go@v5"
	with: "go-version": "1.24"
}
_goTest: githubactions.#Step & {                                   // Explanation #6
	name:   *"Test" | _
	#flags: *"" | string
	#packages: *["./..."] | [...string]
	let packages = strings.Join(#packages, " ")
	run: "go test -v \(#flags) \(packages)"
}
{{{end}}}

1. This definition (a field whose name starts with "#") can be used anywhere
   inside the `github` package, and is also available to CUE that imports the
   package.
2. The curated `#Workflow` schema validates each workflow through the use of a
   pattern constraint.
3. Every job gets a default task runner - also using a pattern constraint.
4. Each workflow's jobs get read access to the relevant repo by default.
5. This step defines common tasks that our workflows can include using a
   reference.
6. `_goTest` defines a step that runs a "go test" command driven by sensible
   defaults specifying the step's name, its command line flags, and a list of
   Go packages it should test. Several of the common elements could easily be
   reused by other reposities, as their definitions aren't specific to the
   repository and the code that they're helping us test.

## How are the workflows defined?

Now that we've seen how the common and shared elements are defined separately,
let's check back in and review the workflows that use these elements.

Here's the succinct, DRYed up `test` workflow, with a few comments added to
explain the CUE:

{{{with upload "en" "test.cue comments"}}}
#force
-- ci/github/test.cue --
package github

// The test workflow uses all the defaults specified in workflows.cue.
workflows: test: {
	name: "Test PRs"

	// There's no default for the workflow trigger so we need to define it here.
	on: pull_request: branches: [#defaultBranch]

	// This adds to the default read permission for the repo's contents.
	permissions: "pull-requests": "read"
	jobs: test: steps: [
		// These steps template the shared steps by referencing them.
		_checkoutCode,
		_setupGo,
		_goTest,
	]
}
{{{end}}}

The CUE defining the `release` workflow does a little more work customising
a shared element:

{{{with upload "en" "release.cue comments"}}}
#force
-- ci/github/release.cue --
package github

workflows: release: {
	name: "Release"

	// There's no default for the workflow trigger so we need to define it here.
	on: push: tags: ["v*"]
	jobs: release: steps: [

		// These steps template the shared steps by referencing them.
		_checkoutCode,
		_setupGo,

		// The release workflow needs to specify the "go test" "-race" flag,
		// so it uses the template's parameter to override the default.
		_goTest & {
			#flags: "-race"
		},
		{
			// The release process is unique to this workflow, so we leave
			// it defined inline in order to let it stand out clearly.
			name: "Release"
			run:  "echo Release process here."
		},
	]
}
{{{end}}}

## Check that the CUE still exports cleanly

After DRYing up our CUE, we need to re-export the static YAML workflow files
that GitHub Actions expects:

{{{with _script_ "en" "HIDDEN: diff: import before export"}}}
cue import .github/workflows/test.yml    -l '#pre:' -o test.pre.cue
cue import .github/workflows/release.yml -l '#pre:' -o release.pre.cue
{{{end}}}

{{{with script "en" "cue export post"}}}
cue export ./ci/github -f -e workflows.test -o .github/workflows/test.yml
cue export ./ci/github -f -e workflows.release -o .github/workflows/release.yml
{{{end}}}

{{{with _script_ "en" "HIDDEN: diff pre vs post"}}}
cue import .github/workflows/test.yml    -l '#post:' -o test.post.cue
cue import .github/workflows/release.yml -l '#post:' -o release.post.cue
cue eval -e '#pre & #post' test.pre.cue    test.post.cue    >/dev/null
cue eval -e '#pre & #post' release.pre.cue release.post.cue >/dev/null
{{{end}}}

Because the `cue export` commands ran successfully, we know that the curated
schema used in `workflows.cue` validated the workflows.

## Review the changes

Lastly, we make sure that our DRYing up hasn't changed the exported YAML files'
contents:

{{{with script "en" "git diff"}}}
#norun
#We can #norun this (required because we don't have a git repo in scope) as we
#know for sure that the pre- and post-export contents are identical, because
#the hidden cue-eval in the previous section didn't error. It's an acceptable
#command to ask the reader to run as they're definitely inside a git repo, with
#pre-existing exported-from-CUE YAML files (so the whitespace/comments/etc won't
#have changed) where any deltas must be caused by their DRYing up.
git diff .github/workflows
{{{end}}}

If you're following along and simplifying your own workflows then do make sure
you understand any differences shown by the `git diff` command (after you've
finished DRYing up), and that the changes are as expected. In our example there
aren't any differences, so we know that our workflows will run identically to
before we started.
