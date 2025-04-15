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
{{{end}}}

If you've already started
[using CUE to define GitHub Actions workflows]({{<relref"getting-started-with-github-actions-cue">}})
then you might have several workflows that share common characteristics.
Some of CUE's most useful features are designed to reduce repetition and allow
easy <dfn title="&quot;Don't Repeat Yourself&quot;">DRYing up</dfn>
of configuration and data sources.
This guide shows you how to use those features to simplify the sources of
multiple GitHub Actions workflows -- allowing their most important, unique
elements to stand out.

To follow along with this guide the latest pre-release of the `cue` command is
required -- please [upgrade to this version](/docs/installing-cue/) if you
don't have it installed already:
{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

The techniques and language features demonstrated in this guide can be applied
to any CUE, but the changes we'll make here are specific to the configurations
shown on this page -- you'll need to adapt them to suit your CUE.

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

{{<todo "FIXME: intro">}}

{{{with upload "en" "1"}}}
-- ci/github/workflows.cue --
package github

import "cue.dev/x/githubactions"

workflows: {
	go: githubactions.#Workflow & {
		name: "Go"
		on: pull_request: branches: ["main"]
		jobs: build: {
			"runs-on": "ubuntu-latest"
			steps: [{
				uses: "actions/checkout@v4"
			}, {
				name: "Set up Go"
				uses: "actions/setup-go@v4"
				with: "go-version": "1.20"
			}, {
				name: "Build"
				run:  "go build -v ./..."
			}, {
				name: "Test"
				run:  "go test -v ./..."
			}]
		}
	}
	dotNet: githubactions.#Workflow & {
		name: ".NET"
		on: pull_request: branches: ["main"]
		jobs: build: {
			"runs-on": "ubuntu-latest"
			steps: [{
				uses: "actions/checkout@v4"
			}, {
				name: "Setup .NET"
				uses: "actions/setup-dotnet@v4"
				with: "dotnet-version": "8.0.x"
			}, {
				name: "Restore dependencies"
				run:  "dotnet restore"
			}, {
				name: "Build"
				run:  "dotnet build --no-restore"
			}, {
				name: "Test"
				run:  "dotnet test --no-build --verbosity normal"
			}]
		}
	}
}
{{{end}}}

## Tidy your local CUE module

FIXME:
{{{with script "en" "cue mod tidy"}}}
cue mod tidy
{{{end}}}

## Check that your CUE exports cleanly

{{{with script "en" "cue export pre"}}}
cue export ./ci/github --out yaml
cue export ./ci/github | md5sum
{{{end}}}

## Simplify the CUE

{{<todo "FIXME: lots of words">}}

{{{with upload "en" "2"}}}
#force
-- ci/github/workflows.cue --
package github

import (
	"strings"
	"cue.dev/x/githubactions"
)

workflows: {
	[_]: githubactions.#Workflow & {
		on: pull_request: branches: [#defaultBranch]
		jobs: build: "runs-on": "ubuntu-latest"
	}
	go: {
		name: "Go"
		jobs: build: steps: [
			_checkoutStep,
			_setupGoStep,
			_goDotDotDotStep & {#action: "build"},
			_goDotDotDotStep & {#action: "test"},
		]
	}
	dotNet: {
		name: ".NET"
		jobs: build: steps: [
			_checkoutStep,
			_setupDotnetStep,
			{name: "Restore dependencies", run: "dotnet restore"},
			{name: "Build", run: "dotnet build --no-restore"},
			{name: "Test", run: "dotnet test --no-build --verbosity normal"},
		]
	}
}

_checkoutStep: githubactions.#Step & {
	uses: "actions/checkout@v4"
}
_setupDotnetStep: githubactions.#Step & {
	name: "Setup .NET"
	uses: "actions/setup-dotnet@v4"
	with: "dotnet-version": "8.0.x"
}
_setupGoStep: githubactions.#Step & {
	name: "Set up Go"
	uses: "actions/setup-go@v4"
	with: "go-version": "1.20"
}
_goDotDotDotStep: githubactions.#Step & {
	#action: "build" | "clean" | "generate" | "test"
	name:    *strings.ToTitle(#action) | _
	run:     "go \(#action) -v ./..."
}
#defaultBranch: "main"
{{{end}}}
## Draw the rest of the owl
## Use cue trim?
## Check that your CUE still exports cleanly

{{{with script "en" "cue export post"}}}
cue export ./ci/github --out yaml
cue export ./ci/github | md5sum
{{{end}}}

## Review the changes
## Next steps
