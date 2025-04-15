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
cue version v0.13.0-alpha.4
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

{{<columns>}}
```cue { title="ci/github/test.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCmltcG9ydCAiY3VlLmRldi94L2dpdGh1YmFjdGlvbnMiCgp3b3JrZmxvd3M6IHRlc3Q6IGdpdGh1YmFjdGlvbnMuI1dvcmtmbG93ICYgewoJbmFtZTogIlRlc3QgUFJzIgoJb246IHB1bGxfcmVxdWVzdDogYnJhbmNoZXM6IFsibWFpbiJdCglwZXJtaXNzaW9uczogewoJCWNvbnRlbnRzOiAgICAgICAgInJlYWQiCgkJInB1bGwtcmVxdWVzdHMiOiAicmVhZCIKCX0KCWpvYnM6IGJ1aWxkQW5kVGVzdDogewoJCSJydW5zLW9uIjogInVidW50dS1sYXRlc3QiCgkJc3RlcHM6IFt7CgkJCXVzZXM6ICJhY3Rpb25zL2NoZWNrb3V0QHY0IgoJCX0sIHsKCQkJbmFtZTogIlNldCB1cCBHbyIKCQkJdXNlczogImFjdGlvbnMvc2V0dXAtZ29AdjUiCgkJCXdpdGg6ICJnby12ZXJzaW9uIjogIjEuMjQiCgkJfSwgewoJCQluYW1lOiAiSW5zdGFsbCBkZXBlbmRlbmNpZXMiCgkJCXJ1bjogICJnbyBtb2QgdGlkeSIKCQl9LCB7CgkJCW5hbWU6ICJWZXQiCgkJCXJ1bjogICJnbyB2ZXQgLXYgLi8uLi4iCgkJfSwgewoJCQluYW1lOiAiVGVzdCIKCQkJcnVuOiAgImdvIHRlc3QgLXYgLi8uLi4iCgkJfSwgewoJCQluYW1lOiAiQnVpbGQiCgkJCXJ1bjogICJnbyBidWlsZCAtdiAteCAuLy4uLiIKCQl9XQoJfQp9Cg==" }
// filepath: ci/github/test.cue

package github

import "cue.dev/x/githubactions"

workflows: test: githubactions.#Workflow & {
	name: "Test PRs"
	on: pull_request: branches: ["main"]
	permissions: {
		contents:        "read"
		"pull-requests": "read"
	}
	jobs: buildAndTest: {
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
			name: "Vet"
			run:  "go vet -v ./..."
		}, {
			name: "Test"
			run:  "go test -v ./..."
		}, {
			name: "Build"
			run:  "go build -v -x ./..."
		}]
	}
}
```
{{<columns-separator>}}
```cue { title="ci/github/release.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCmltcG9ydCAiY3VlLmRldi94L2dpdGh1YmFjdGlvbnMiCgp3b3JrZmxvd3M6IHJlbGVhc2U6IGdpdGh1YmFjdGlvbnMuI1dvcmtmbG93ICYgewoJbmFtZTogIlJlbGVhc2UiCglvbjogcHVzaDogdGFnczogWyJ2KiJdCglwZXJtaXNzaW9uczogY29udGVudHM6ICJyZWFkIgoJam9iczogYnVpbGQ6IHsKCQkicnVucy1vbiI6ICJ1YnVudHUtbGF0ZXN0IgoJCXN0ZXBzOiBbewoJCQl1c2VzOiAiYWN0aW9ucy9jaGVja291dEB2NCIKCQl9LCB7CgkJCW5hbWU6ICJTZXQgdXAgR28iCgkJCXVzZXM6ICJhY3Rpb25zL3NldHVwLWdvQHY1IgoJCQl3aXRoOiAiZ28tdmVyc2lvbiI6ICIxLjI0IgoJCX0sIHsKCQkJbmFtZTogIkluc3RhbGwgZGVwZW5kZW5jaWVzIgoJCQlydW46ICAiZ28gbW9kIHRpZHkiCgkJfSwgewoJCQluYW1lOiAiVmV0IgoJCQlydW46ICAiZ28gdmV0IC12IC4vLi4uIgoJCX0sIHsKCQkJbmFtZTogIlRlc3QiCgkJCXJ1bjogICJnbyB0ZXN0IC12IC1yYWNlIC4vLi4uIgoJCX0sIHsKCQkJbmFtZTogIkJ1aWxkIgoJCQlydW46ICAiZ28gYnVpbGQgLXYgLXggLi8uLi4iCgkJfSwgewoJCQluYW1lOiAiUmVsZWFzZSIKCQkJcnVuOiAgImVjaG8gQWN0dWFsbHkgZm9sbG93IHRoZSBwcm9qZWN0J3MgcmVsZWFzZSBwcm9jZXNzIGhlcmUgLi4uIgoJCX1dCgl9Cn0K" }
// filepath: ci/github/release.cue

package github

import "cue.dev/x/githubactions"

workflows: release: githubactions.#Workflow & {
	name: "Release"
	on: push: tags: ["v*"]
	permissions: contents: "read"
	jobs: build: {
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
			name: "Vet"
			run:  "go vet -v ./..."
		}, {
			name: "Test"
			run:  "go test -v -race ./..."
		}, {
			name: "Build"
			run:  "go build -v -x ./..."
		}, {
			name: "Release"
			run:  "echo Actually follow the project's release process here ..."
		}]
	}
}
```
{{</columns>}}

## Tidy your local CUE module

FIXME:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

## Check that your CUE exports cleanly

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAuL2NpL2dpdGh1YiAtLW91dCB5YW1sCmN1ZSBleHBvcnQgLi9jaS9naXRodWIgfCBtZDVzdW0=" }
$ cue export ./ci/github --out yaml
workflows:
  release:
    name: Release
    "on":
      push:
        tags:
          - v*
    jobs:
      build:
        runs-on: ubuntu-latest
        steps:
          - uses: actions/checkout@v4
          - name: Set up Go
            uses: actions/setup-go@v5
            with:
              go-version: "1.24"
          - name: Install dependencies
            run: go mod tidy
          - name: Vet
            run: go vet -v ./...
          - name: Test
            run: go test -v -race ./...
          - name: Build
            run: go build -v -x ./...
          - name: Release
            run: echo Actually follow the project's release process here ...
    permissions:
      contents: read
  test:
    name: Test PRs
    "on":
      pull_request:
        branches:
          - main
    jobs:
      buildAndTest:
        runs-on: ubuntu-latest
        steps:
          - uses: actions/checkout@v4
          - name: Set up Go
            uses: actions/setup-go@v5
            with:
              go-version: "1.24"
          - name: Install dependencies
            run: go mod tidy
          - name: Vet
            run: go vet -v ./...
          - name: Test
            run: go test -v ./...
          - name: Build
            run: go build -v -x ./...
    permissions:
      contents: read
      pull-requests: read
$ cue export ./ci/github | md5sum
789a1b8a6f557c97a654a373d24f40b8  -
```

## Simplify the CUE

{{<todo "FIXME: lots of words introducing the DRYing up of the first file">}}

```cue { title="ci/github/test.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCmltcG9ydCAoCgkic3RyaW5ncyIKCSJjdWUuZGV2L3gvZ2l0aHViYWN0aW9ucyIKKQoKd29ya2Zsb3dzOiB0ZXN0OiB7CgluYW1lOiAiVGVzdCBQUnMiCglvbjogcHVsbF9yZXF1ZXN0OiBicmFuY2hlczogWyNkZWZhdWx0QnJhbmNoXQoJcGVybWlzc2lvbnM6ICJwdWxsLXJlcXVlc3RzIjogInJlYWQiCglqb2JzOiBidWlsZEFuZFRlc3Q6IHsKCQlzdGVwczogWwoJCQlfY2hlY2tvdXRDb2RlLAoJCQlfc2V0dXBHbywKCQkJX2luc3RhbGxHb0RlcGVuZGVuY2llcywKCQkJX3J1bkdvLnZldCwKCQkJX3J1bkdvLnRlc3QsCgkJCV9ydW5Hby5idWlsZCAmIHsKCQkJCSNmbGFnczogIi14IgoJCQl9LAoJCV0KCX0KfQoKd29ya2Zsb3dzOiBbX106IGdpdGh1YmFjdGlvbnMuI1dvcmtmbG93ICYgewoJam9iczogW19dOiAicnVucy1vbiI6ICJ1YnVudHUtbGF0ZXN0IgoJcGVybWlzc2lvbnM6IGNvbnRlbnRzOiAicmVhZCIKfQoKI2RlZmF1bHRCcmFuY2g6ICJtYWluIgojZ29WZXJzaW9uOiAgICAgIjEuMjQiCl9jaGVja291dENvZGU6IHVzZXM6ICJhY3Rpb25zL2NoZWNrb3V0QHY0Igpfc2V0dXBHbzogewoJbmFtZTogIlNldCB1cCBHbyIKCXVzZXM6ICJhY3Rpb25zL3NldHVwLWdvQHY1IgoJd2l0aDogImdvLXZlcnNpb24iOiAjZ29WZXJzaW9uCn0KX2luc3RhbGxHb0RlcGVuZGVuY2llczogewoJbmFtZTogIkluc3RhbGwgZGVwZW5kZW5jaWVzIgoJcnVuOiAgImdvIG1vZCB0aWR5Igp9Cl9ydW5Hbzoge3ZldDogXywgdGVzdDogXywgYnVpbGQ6IF99Cl9ydW5HbzogW0NvbW1hbmQ9X106IHsKCW5hbWU6ICAgICAgc3RyaW5ncy5Ub1RpdGxlKENvbW1hbmQpCgkjZmxhZ3M6ICAgICoiIiB8IHN0cmluZwoJI3BhY2thZ2VzOiAqIi4vLi4uIiB8IHN0cmluZwoJcnVuOiAgICAgICAiZ28gXChDb21tYW5kKSAtdiBcKCNmbGFncykgXCgjcGFja2FnZXMpIgp9Cg==" }
// filepath: ci/github/test.cue

package github

import (
	"strings"
	"cue.dev/x/githubactions"
)

workflows: test: {
	name: "Test PRs"
	on: pull_request: branches: [#defaultBranch]
	permissions: "pull-requests": "read"
	jobs: buildAndTest: {
		steps: [
			_checkoutCode,
			_setupGo,
			_installGoDependencies,
			_runGo.vet,
			_runGo.test,
			_runGo.build & {
				#flags: "-x"
			},
		]
	}
}

workflows: [_]: githubactions.#Workflow & {
	jobs: [_]: "runs-on": "ubuntu-latest"
	permissions: contents: "read"
}

#defaultBranch: "main"
#goVersion:     "1.24"
_checkoutCode: uses: "actions/checkout@v4"
_setupGo: {
	name: "Set up Go"
	uses: "actions/setup-go@v5"
	with: "go-version": #goVersion
}
_installGoDependencies: {
	name: "Install dependencies"
	run:  "go mod tidy"
}
_runGo: {vet: _, test: _, build: _}
_runGo: [Command=_]: {
	name:      strings.ToTitle(Command)
	#flags:    *"" | string
	#packages: *"./..." | string
	run:       "go \(Command) -v \(#flags) \(#packages)"
}
```

{{<todo "FIXME: intro the second file" >}}

```cue { title="ci/github/release.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCndvcmtmbG93czogcmVsZWFzZTogewoJbmFtZTogIlJlbGVhc2UiCglvbjogcHVzaDogdGFnczogWyJ2KiJdCglqb2JzOiByZWxlYXNlOiB7CgkJc3RlcHM6IFsKCQkJX2NoZWNrb3V0Q29kZSwKCQkJX3NldHVwR28sCgkJCV9pbnN0YWxsR29EZXBlbmRlbmNpZXMsCgkJCV9ydW5Hby52ZXQsCgkJCV9ydW5Hby50ZXN0ICYgewoJCQkJI2ZsYWdzOiAiLXJhY2UiCgkJCX0sCgkJCV9ydW5Hby5idWlsZCAmIHsKCQkJCSNmbGFnczogIi14IgoJCQl9LAoJCQl7CgkJCQluYW1lOiAiUmVsZWFzZSIKCQkJCXJ1bjogICJlY2hvIEFjdHVhbGx5IGZvbGxvdyB0aGUgcHJvamVjdCdzIHJlbGVhc2UgcHJvY2VzcyBoZXJlIC4uLiIKCQkJfSwKCQldCgl9Cn0K" }
// filepath: ci/github/release.cue

package github

workflows: release: {
	name: "Release"
	on: push: tags: ["v*"]
	jobs: release: {
		steps: [
			_checkoutCode,
			_setupGo,
			_installGoDependencies,
			_runGo.vet,
			_runGo.test & {
				#flags: "-race"
			},
			_runGo.build & {
				#flags: "-x"
			},
			{
				name: "Release"
				run:  "echo Actually follow the project's release process here ..."
			},
		]
	}
}
```

## Draw the rest of the owl
## Use cue trim?
## Check that your CUE still exports cleanly

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAuL2NpL2dpdGh1YiAtLW91dCB5YW1sCmN1ZSBleHBvcnQgLi9jaS9naXRodWIgfCBtZDVzdW0=" }
$ cue export ./ci/github --out yaml
workflows:
  release:
    name: Release
    "on":
      push:
        tags:
          - v*
    jobs:
      release:
        runs-on: ubuntu-latest
        steps:
          - uses: actions/checkout@v4
          - name: Set up Go
            uses: actions/setup-go@v5
            with:
              go-version: "1.24"
          - name: Install dependencies
            run: go mod tidy
          - name: Vet
            run: go vet -v  ./...
          - name: Test
            run: go test -v -race ./...
          - name: Build
            run: go build -v -x ./...
          - name: Release
            run: echo Actually follow the project's release process here ...
    permissions:
      contents: read
  test:
    jobs:
      buildAndTest:
        steps:
          - uses: actions/checkout@v4
          - name: Set up Go
            uses: actions/setup-go@v5
            with:
              go-version: "1.24"
          - name: Install dependencies
            run: go mod tidy
          - name: Vet
            run: go vet -v  ./...
          - name: Test
            run: go test -v  ./...
          - name: Build
            run: go build -v -x ./...
        runs-on: ubuntu-latest
    name: Test PRs
    "on":
      pull_request:
        branches:
          - main
    permissions:
      pull-requests: read
      contents: read
$ cue export ./ci/github | md5sum
c742188f173f1ecd926d23dbecd16e79  -
```

## Review the changes
## Next steps
