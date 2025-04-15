---
title: DRYing up GitHub Actions workflows
---

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
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.13.0-alpha.3
...
```

The techniques and language features demonstrated in this guide can be applied
to any CUE, but the changes we'll make here are specific to the configurations
shown on this page -- you'll need to adapt them to suit your CUE.

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2luICMgb25seSBkdXJpbmcgYmV0YQ==" }
$ cue login # only during beta
```
The
[Central Registry](https://registry.cue.works)
requires authentication while it's in beta testing,
so you need to login before you can use its schemas.

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```
You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).
It makes sense for your CUE module to exist at the root of a git repository
that's hosted on GitHub, but the commands in this guide will work in any setup.

## Start with several workflows defined in CUE

{{<todo "FIXME: intro">}}

```cue { title="ci/github/workflows.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCmltcG9ydCAiY3VlLmRldi94L2dpdGh1YmFjdGlvbnMiCgp3b3JrZmxvd3M6IHsKCWdvOiBnaXRodWJhY3Rpb25zLiNXb3JrZmxvdyAmIHsKCQluYW1lOiAiR28iCgkJb246IHB1bGxfcmVxdWVzdDogYnJhbmNoZXM6IFsibWFpbiJdCgkJam9iczogYnVpbGQ6IHsKCQkJInJ1bnMtb24iOiAidWJ1bnR1LWxhdGVzdCIKCQkJc3RlcHM6IFt7CgkJCQl1c2VzOiAiYWN0aW9ucy9jaGVja291dEB2NCIKCQkJfSwgewoJCQkJbmFtZTogIlNldCB1cCBHbyIKCQkJCXVzZXM6ICJhY3Rpb25zL3NldHVwLWdvQHY0IgoJCQkJd2l0aDogImdvLXZlcnNpb24iOiAiMS4yMCIKCQkJfSwgewoJCQkJbmFtZTogIkJ1aWxkIgoJCQkJcnVuOiAgImdvIGJ1aWxkIC12IC4vLi4uIgoJCQl9LCB7CgkJCQluYW1lOiAiVGVzdCIKCQkJCXJ1bjogICJnbyB0ZXN0IC12IC4vLi4uIgoJCQl9XQoJCX0KCX0KCWRvdE5ldDogZ2l0aHViYWN0aW9ucy4jV29ya2Zsb3cgJiB7CgkJbmFtZTogIi5ORVQiCgkJb246IHB1bGxfcmVxdWVzdDogYnJhbmNoZXM6IFsibWFpbiJdCgkJam9iczogYnVpbGQ6IHsKCQkJInJ1bnMtb24iOiAidWJ1bnR1LWxhdGVzdCIKCQkJc3RlcHM6IFt7CgkJCQl1c2VzOiAiYWN0aW9ucy9jaGVja291dEB2NCIKCQkJfSwgewoJCQkJbmFtZTogIlNldHVwIC5ORVQiCgkJCQl1c2VzOiAiYWN0aW9ucy9zZXR1cC1kb3RuZXRAdjQiCgkJCQl3aXRoOiAiZG90bmV0LXZlcnNpb24iOiAiOC4wLngiCgkJCX0sIHsKCQkJCW5hbWU6ICJSZXN0b3JlIGRlcGVuZGVuY2llcyIKCQkJCXJ1bjogICJkb3RuZXQgcmVzdG9yZSIKCQkJfSwgewoJCQkJbmFtZTogIkJ1aWxkIgoJCQkJcnVuOiAgImRvdG5ldCBidWlsZCAtLW5vLXJlc3RvcmUiCgkJCX0sIHsKCQkJCW5hbWU6ICJUZXN0IgoJCQkJcnVuOiAgImRvdG5ldCB0ZXN0IC0tbm8tYnVpbGQgLS12ZXJib3NpdHkgbm9ybWFsIgoJCQl9XQoJCX0KCX0KfQo=" }
// filepath: ci/github/workflows.cue

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
```

## Tidy your local CUE module

FIXME:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

## Check that your CUE exports cleanly

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAuL2NpL2dpdGh1YiAtLW91dCB5YW1sCmN1ZSBleHBvcnQgLi9jaS9naXRodWIgfCBtZDVzdW0=" }
$ cue export ./ci/github --out yaml
workflows:
  go:
    name: Go
    "on":
      pull_request:
        branches:
          - main
    jobs:
      build:
        runs-on: ubuntu-latest
        steps:
          - uses: actions/checkout@v4
          - name: Set up Go
            uses: actions/setup-go@v4
            with:
              go-version: "1.20"
          - name: Build
            run: go build -v ./...
          - name: Test
            run: go test -v ./...
  dotNet:
    name: .NET
    "on":
      pull_request:
        branches:
          - main
    jobs:
      build:
        runs-on: ubuntu-latest
        steps:
          - uses: actions/checkout@v4
          - name: Setup .NET
            uses: actions/setup-dotnet@v4
            with:
              dotnet-version: 8.0.x
          - name: Restore dependencies
            run: dotnet restore
          - name: Build
            run: dotnet build --no-restore
          - name: Test
            run: dotnet test --no-build --verbosity normal
$ cue export ./ci/github | md5sum
2d30c3c0c51a277bb7683951015fa3f6  -
```

## Simplify the CUE

{{<todo "FIXME: lots of words">}}

```cue { title="ci/github/workflows.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCmltcG9ydCAoCgkic3RyaW5ncyIKCSJjdWUuZGV2L3gvZ2l0aHViYWN0aW9ucyIKKQoKd29ya2Zsb3dzOiB7CglbX106IGdpdGh1YmFjdGlvbnMuI1dvcmtmbG93ICYgewoJCW9uOiBwdWxsX3JlcXVlc3Q6IGJyYW5jaGVzOiBbI2RlZmF1bHRCcmFuY2hdCgkJam9iczogYnVpbGQ6ICJydW5zLW9uIjogInVidW50dS1sYXRlc3QiCgl9CglnbzogewoJCW5hbWU6ICJHbyIKCQlqb2JzOiBidWlsZDogc3RlcHM6IFsKCQkJX2NoZWNrb3V0U3RlcCwKCQkJX3NldHVwR29TdGVwLAoJCQlfZ29Eb3REb3REb3RTdGVwICYgeyNhY3Rpb246ICJidWlsZCJ9LAoJCQlfZ29Eb3REb3REb3RTdGVwICYgeyNhY3Rpb246ICJ0ZXN0In0sCgkJXQoJfQoJZG90TmV0OiB7CgkJbmFtZTogIi5ORVQiCgkJam9iczogYnVpbGQ6IHN0ZXBzOiBbCgkJCV9jaGVja291dFN0ZXAsCgkJCV9zZXR1cERvdG5ldFN0ZXAsCgkJCXtuYW1lOiAiUmVzdG9yZSBkZXBlbmRlbmNpZXMiLCBydW46ICJkb3RuZXQgcmVzdG9yZSJ9LAoJCQl7bmFtZTogIkJ1aWxkIiwgcnVuOiAiZG90bmV0IGJ1aWxkIC0tbm8tcmVzdG9yZSJ9LAoJCQl7bmFtZTogIlRlc3QiLCBydW46ICJkb3RuZXQgdGVzdCAtLW5vLWJ1aWxkIC0tdmVyYm9zaXR5IG5vcm1hbCJ9LAoJCV0KCX0KfQoKX2NoZWNrb3V0U3RlcDogZ2l0aHViYWN0aW9ucy4jU3RlcCAmIHsKCXVzZXM6ICJhY3Rpb25zL2NoZWNrb3V0QHY0Igp9Cl9zZXR1cERvdG5ldFN0ZXA6IGdpdGh1YmFjdGlvbnMuI1N0ZXAgJiB7CgluYW1lOiAiU2V0dXAgLk5FVCIKCXVzZXM6ICJhY3Rpb25zL3NldHVwLWRvdG5ldEB2NCIKCXdpdGg6ICJkb3RuZXQtdmVyc2lvbiI6ICI4LjAueCIKfQpfc2V0dXBHb1N0ZXA6IGdpdGh1YmFjdGlvbnMuI1N0ZXAgJiB7CgluYW1lOiAiU2V0IHVwIEdvIgoJdXNlczogImFjdGlvbnMvc2V0dXAtZ29AdjQiCgl3aXRoOiAiZ28tdmVyc2lvbiI6ICIxLjIwIgp9Cl9nb0RvdERvdERvdFN0ZXA6IGdpdGh1YmFjdGlvbnMuI1N0ZXAgJiB7CgkjYWN0aW9uOiAiYnVpbGQiIHwgImNsZWFuIiB8ICJnZW5lcmF0ZSIgfCAidGVzdCIKCW5hbWU6ICAgICpzdHJpbmdzLlRvVGl0bGUoI2FjdGlvbikgfCBfCglydW46ICAgICAiZ28gXCgjYWN0aW9uKSAtdiAuLy4uLiIKfQojZGVmYXVsdEJyYW5jaDogIm1haW4iCg==" }
// filepath: ci/github/workflows.cue

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
```
## Draw the rest of the owl
## Use cue trim?
## Check that your CUE still exports cleanly

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAuL2NpL2dpdGh1YiAtLW91dCB5YW1sCmN1ZSBleHBvcnQgLi9jaS9naXRodWIgfCBtZDVzdW0=" }
$ cue export ./ci/github --out yaml
workflows:
  go:
    name: Go
    "on":
      pull_request:
        branches:
          - main
    jobs:
      build:
        runs-on: ubuntu-latest
        steps:
          - uses: actions/checkout@v4
          - name: Set up Go
            uses: actions/setup-go@v4
            with:
              go-version: "1.20"
          - name: Build
            run: go build -v ./...
          - name: Test
            run: go test -v ./...
  dotNet:
    name: .NET
    "on":
      pull_request:
        branches:
          - main
    jobs:
      build:
        runs-on: ubuntu-latest
        steps:
          - uses: actions/checkout@v4
          - name: Setup .NET
            uses: actions/setup-dotnet@v4
            with:
              dotnet-version: 8.0.x
          - name: Restore dependencies
            run: dotnet restore
          - name: Build
            run: dotnet build --no-restore
          - name: Test
            run: dotnet test --no-build --verbosity normal
$ cue export ./ci/github | md5sum
2d30c3c0c51a277bb7683951015fa3f6  -
```

## Review the changes
## Next steps
