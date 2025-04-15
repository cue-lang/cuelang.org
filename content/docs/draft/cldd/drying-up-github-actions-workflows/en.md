---
title: DRYing up GitHub Actions workflows
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD

# TODO(jm): revert to latest when it has evalv3 as default.
export PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH

# Set up working directory state.
mkdir -p .github/workflows
{{{end}}}

If you've already started
[using CUE to define GitHub Actions workflows]({{<relref"getting-started-with-github-actions-cue">}})
then you might have several workflows that share common characteristics.
Some of CUE's most useful features are designed to reduce repetition and allow
easy <dfn title="&quot;Don't Repeat Yourself&quot;">DRYing up</dfn>
of configuration and data sources.
This guide shows you how to use those features to simplify the sources of
multiple GitHub Actions workflows -- allowing their critical, unique elements
to stand out.

To follow along with this guide you need to use the latest pre-release of the
`cue` command. Please [upgrade to this version](/docs/installing-cue/) if you
don't have it installed already:
{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

The techniques and language features demonstrated in this guide can be applied
to any CUE, but the changes we'll make here are specific to the configurations
shown on this page -- you'll need to adapt them to suit *your* CUE.

## Login to the Central Registry

{{{with script "en" "cue login"}}}
#norun
cue login # only during beta
{{{end}}}
The
[Central Registry](https://registry.cue.works)
requires authentication while it's in beta testing,
so you need to login before you can use its schemas.

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
{{{with script "en" "cue mod init"}}}
cue mod init cue.example
{{{end}}}
You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).
It makes sense for your CUE module to exist at the root of a git repository
that's hosted on GitHub, but the commands in this guide will work in any setup.

## Start with several workflows defined in CUE

In this example we start with a pair of GitHub Actions workflows that test and
release a Golang module:

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
			name: "Set up Go"
			uses: "actions/setup-go@v5"
			with: "go-version": "1.24"
		}, {
			name: "Install dependencies"
			run:  "go mod tidy"
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
			name: "Set up Go"
			uses: "actions/setup-go@v5"
			with: "go-version": "1.24"
		}, {
			name: "Install dependencies"
			run:  "go mod tidy"
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

{{{with script "en" "cue mod tidy"}}}
cue mod tidy
{{{end}}}

Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
after you import any CUE module for the first time.

## Check that the CUE exports cleanly

We need to start by checking that our CUE is valid, and it produces the
config files we expect.

We use a pair of `cue export` commands that each target a named GitHub
Actions workflow, and create the specific YAML files that Github
requires:

{{{with script "en" "cue export pre"}}}
cue export ./ci/github -f -e workflows.test -o .github/workflows/test.yml
cue export ./ci/github -f -e workflows.release -o .github/workflows/release.yml
{{{end}}}

We could have chosen to use a single CUE
[workflow command](https://cuelang.org/docs/howto/use-your-first-cue-workflow-command/)
instead of these two commands. Workflow commands provide a scalable way to
define repeatable, data-driven tasks that can, for example, export different
parts of a CUE configuration into different data files.

We check that our exported YAML files look as expected:

{{{with script "en" "head test.yml pre"}}}
#ellipsis 10
head -10 .github/workflows/test.yml
{{{end}}}

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
	jobs: test: {
		steps: [
			_checkoutCode,
			_setupGo,
			_installGoDependencies,
			_goTest,
		]
	}
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
	jobs: release: {
		steps: [
			_checkoutCode,
			_setupGo,
			_installGoDependencies,
			_goTest & {
				#flags: "-race"
			}, {
				name: "Release"
				run:  "echo Release process here."
			},
		]
	}
}
{{{end}}}
{{</columns>}}

The workflows are now much simpler and easier to understand, as they contain
just the critical or unique information that's needed to distiguish them from
each other.
But we haven't thrown the boilerplate away - it still needs to be defined
*somewhere!*

In fact, we've placed the common and shared elements of our workflows in a
third CUE file. CUE packages are composed of all CUE files that are in scope,
and CUE takes care of unifying them for us. This means that we can split out
the boilerplate without each workflow's file needing to keep track of how to
find the shared elements.

Here's the additional file that we've created, along with inline comments
explaining how it reduces our boilerplate:

{{{with upload "en" "workflows.cue"}}}
-- ci/github/workflows.cue --
package github

import (
	"strings"
	"cue.dev/x/githubactions"
)

// The curated #Workflow schema validates each workflow through the use of a pattern constraint.
workflows: [_]: githubactions.#Workflow & {
	// Every job gets a default task runner - also using a pattern constraint.
	jobs: [_]: "runs-on": *"ubuntu-latest" | _
	// Each workflow's jobs get read access to the relevant repo by default.
	permissions: contents: *"read" | "write" | "none"
}

#defaultBranch: "main"
#goVersion:     "1.24"

// These three steps define common tasks that our workflows can include using a reference.
_checkoutCode: githubactions.#Step & {uses: "actions/checkout@v4"}
_setupGo: githubactions.#Step & {
	name: "Set up Go"
	uses: "actions/setup-go@v5"
	with: "go-version": #goVersion
}
_installGoDependencies: githubactions.#Step & {
	name: "Install dependencies"
	run:  "go mod tidy"
}

// _goTest defines a step that runs a "go test" command driven by sensible defaults specifying
// the step's name, its command line flags, and a list of Go packages it should test.
_goTest: githubactions.#Step & {
	name:   *"Test" | _
	#flags: *"" | string
	#packages: *["./..."] | [...string]
	let packages = strings.Join(#packages, " ")
	run: "go test -v \(#flags) \(packages)"
}
{{{end}}}

## How are the workflows defined?

Now that we've seen how the common and shared elements are defined separately,
let's check back in and review the workflows that use these elements.

Here's the succinct `test` workflow, with a few comments added to explain the CUE:

{{{with upload "en" "test.cue comments"}}}
#force
-- ci/github/test.cue --
package github

// The release workflow accepts all the defaults specified in workflows.cue.
workflows: test: {
	name: "Test PRs"
	// There's no default for the workflow trigger so we need to define it here.
	on: pull_request: branches: [#defaultBranch]
	// This adds to the default read permission for the repo's contents.
	permissions: "pull-requests": "read"
	jobs: test: {
		steps: [
			// These steps template the shared steps by referencing them.
			_checkoutCode,
			_setupGo,
			_installGoDependencies,
			_goTest,
		]
	}
}
{{{end}}}

The CUE defining the `release` workflow does a little more work to customise
the shared elements:

{{{with upload "en" "release.cue comments"}}}
#force
-- ci/github/release.cue --
package github

workflows: release: {
	name: "Release"
	// There's no default for the workflow trigger so we need to define it here.
	on: push: tags: ["v*"]
	jobs: release: {
		steps: [
			// These references use the steps as templates, without modification.
			_checkoutCode,
			_setupGo,
			_installGoDependencies,
			// The release workflow needs to specify the slower, safer "-race" flag,
			// so it uses the template's parameter to override the default.
			_goTest & {
				#flags: "-race"
			}, {
				name: "Release"
				run:  "echo Release process here."
			},
		]
	}
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

Lastly, we review the newly-exported YAML files to confirm that our DRYing up
hasn't changed their contents:

{{{with script "en" "head test.yml post"}}}
#ellipsis 10
head -10 .github/workflows/test.yml
{{{end}}}

You might use the `git diff` command on your YAML workflows to confirm that any
changes are purely cosmetic, and only contain harmless field reordering,
different (but consistent) whitespace indentation choices, and other trivial
changes.
