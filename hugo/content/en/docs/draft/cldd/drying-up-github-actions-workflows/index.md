---
title: DRYing up GitHub Actions workflows
---

If you've already started
[using CUE to define GitHub Actions workflows](../getting-started-with-github-actions-cue/index.md)
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
``` { .cue title="ci/github/test.cue" }
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
```
{{<columns-separator>}}
``` { .cue title="ci/github/release.cue" }
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
```
{{</columns>}}

## Tidy the local CUE module

Running
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
ensures that all module dependencies are satisfied:

``` { .text title="TERMINAL" data-copy="cue mod tidy" }
$ cue mod tidy
```

Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).

## Check that the CUE exports cleanly

We need to check that our CUE is valid, and that it produces the config files
we expect.
We use a pair of `cue export` commands that each target a named workflow to
create the specific YAML files that GitHub requires:

``` { .text title="TERMINAL" data-copy="cue export ./ci/github -f -e workflows.test -o .github/workflows/test.yml&#10;cue export ./ci/github -f -e workflows.release -o .github/workflows/release.yml" }
$ cue export ./ci/github -f -e workflows.test -o .github/workflows/test.yml
$ cue export ./ci/github -f -e workflows.release -o .github/workflows/release.yml
```

We check that our exported YAML files look as expected:

{{<columns>}}
``` { .yaml title=".github/workflows/test.yml" }
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
```
{{<columns-separator>}}
``` { .yaml title=".github/workflows/release.yml" }
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
```
{{</columns>}}

## Simplify the CUE

We now DRY up and simplify our two CUE files as follows.
Don't worry if any parts don't make sense immediately - we'll explain what's
going on later!

{{<columns>}}
``` { .cue title="ci/github/test.cue" }
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
```
{{<columns-separator>}}
``` { .cue title="ci/github/release.cue" }
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
```
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

``` { .cue title="ci/github/workflows.cue" }
package github

import (
	"strings"
	"cue.dev/x/githubactions"
)

// Explanation #1
#defaultBranch: "main"

// Explanation #2
workflows: [_]: githubactions.#Workflow & {
	// Explanation #3
	jobs: [_]: "runs-on": *"ubuntu-latest" | _

	// Explanation #4
	permissions: contents: *"read" | "write" | "none"
}

// Explanation #5
_checkoutCode: githubactions.#Step & {uses: "actions/checkout@v4"}
_setupGo: githubactions.#Step & {
	uses: "actions/setup-go@v5"
	with: "go-version": "1.24"
}

// Explanation #6
_goTest: githubactions.#Step & {
	name:   *"Test" | _
	#flags: *"" | string
	#packages: *["./..."] | [...string]
	let packages = strings.Join(#packages, " ")
	run: "go test -v \(#flags) \(packages)"
}
```

1. This definition (a field whose name starts with "#") can be used anywhere
   inside the `github` package, and is also available to CUE that imports the
   package.
2. The curated `#Workflow` schema validates each workflow through the use of a
   pattern constraint.
3. Every job gets a default task runner, also through a pattern constraint.
4. By default, each workflow's jobs get read access to the relevant repo.
5. `_checkoutCode` and `_setupGo` are common steps that our workflows can
   include by using a reference.
6. `_goTest` defines a step that runs a "go test" command driven by sensible
   defaults specifying the step's name, its command line flags, and a list of
   Go packages it should test.

These common elements could be reused by other reposities because their
definitions aren't specific to the repository and the code that they're helping
us test, here.

## How are the workflows defined?

Now that we've seen how the common and shared elements are defined separately,
let's check back in and review the workflows that use these elements.

Here's the succinct, DRYed up `test` workflow, with a few comments added to
explain the CUE:

``` { .cue title="ci/github/test.cue" }
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
```

The CUE defining the `release` workflow does a little more work customising
a shared element:

``` { .cue title="ci/github/release.cue" }
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
```

## Check that the CUE still exports cleanly

After DRYing up our CUE, we need to re-export the static YAML workflow files
that GitHub Actions expects:
``` { .text title="TERMINAL" data-copy="cue export ./ci/github -f -e workflows.test -o .github/workflows/test.yml&#10;cue export ./ci/github -f -e workflows.release -o .github/workflows/release.yml" }
$ cue export ./ci/github -f -e workflows.test -o .github/workflows/test.yml
$ cue export ./ci/github -f -e workflows.release -o .github/workflows/release.yml
```
Because the `cue export` commands ran successfully, we know that the curated
schema used in `workflows.cue` validated the workflows.

## Review the changes

Lastly, we make sure that our DRYing up hasn't changed the exported YAML files'
contents:

``` { .text title="TERMINAL" data-copy="git diff .github/workflows" }
$ git diff .github/workflows
```

If you're following along and simplifying your own workflows then do make sure
you understand any differences shown by the `git diff` command (after you've
finished DRYing up), and that the changes are as expected. In our example there
aren't any differences, so we know that our workflows will run identically to
before we started.
