---
title: DRYing up GitHub Actions workflows
---

If you've already started
[using CUE to define GitHub Actions workflows]({{<relref"getting-started-with-github-actions-cue">}})
then you might have several workflows that share common characteristics.
Some of CUE's most powerful features are designed to reduce repetition and
allow easy <dfn title="&quot;Don't Repeat Yourself&quot;">DRYing up</dfn>
of configuration and data sources.
This guide shows you how to use those features to simplify your GitHub Actions
workflows -- allowing their critical, unique elements to stand out.

To follow along with this guide you need to use the latest pre-release of the
`cue` command. Please [upgrade to this version](/docs/installing-cue/) if you
don't have it installed already:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.13.0-rc.1
...
```

The techniques and language features shown in this guide can be applied to any
CUE, but the changes we'll demonstrate are specific to the configurations
you'll see here -- you'll need to adapt those techniques to suit *your* CUE.

## Start with several workflows defined in CUE

In this example we start with a pair of GitHub Actions workflows that test and
release a Go module:

{{<columns>}}
```cue { title="ci/github/test.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCmltcG9ydCAiY3VlLmRldi94L2dpdGh1YmFjdGlvbnMiCgp3b3JrZmxvd3M6IHRlc3Q6IGdpdGh1YmFjdGlvbnMuI1dvcmtmbG93ICYgewoJbmFtZTogIlRlc3QgUFJzIgoJb246IHB1bGxfcmVxdWVzdDogYnJhbmNoZXM6IFsibWFpbiJdCglwZXJtaXNzaW9uczogewoJCWNvbnRlbnRzOiAgICAgICAgInJlYWQiCgkJInB1bGwtcmVxdWVzdHMiOiAicmVhZCIKCX0KCWpvYnM6IHRlc3Q6IHsKCQkicnVucy1vbiI6ICJ1YnVudHUtbGF0ZXN0IgoJCXN0ZXBzOiBbewoJCQl1c2VzOiAiYWN0aW9ucy9jaGVja291dEB2NCIKCQl9LCB7CgkJCXVzZXM6ICJhY3Rpb25zL3NldHVwLWdvQHY1IgoJCQl3aXRoOiAiZ28tdmVyc2lvbiI6ICIxLjI0IgoJCX0sIHsKCQkJbmFtZTogIlRlc3QiCgkJCXJ1bjogICJnbyB0ZXN0IC12ICAuLy4uLiIKCQl9XQoJfQp9Cg==" }
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
```cue { title="ci/github/release.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCmltcG9ydCAiY3VlLmRldi94L2dpdGh1YmFjdGlvbnMiCgp3b3JrZmxvd3M6IHJlbGVhc2U6IGdpdGh1YmFjdGlvbnMuI1dvcmtmbG93ICYgewoJbmFtZTogIlJlbGVhc2UiCglvbjogcHVzaDogdGFnczogWyJ2KiJdCglwZXJtaXNzaW9uczogY29udGVudHM6ICJyZWFkIgoJam9iczogcmVsZWFzZTogewoJCSJydW5zLW9uIjogInVidW50dS1sYXRlc3QiCgkJc3RlcHM6IFt7CgkJCXVzZXM6ICJhY3Rpb25zL2NoZWNrb3V0QHY0IgoJCX0sIHsKCQkJdXNlczogImFjdGlvbnMvc2V0dXAtZ29AdjUiCgkJCXdpdGg6ICJnby12ZXJzaW9uIjogIjEuMjQiCgkJfSwgewoJCQluYW1lOiAiVGVzdCIKCQkJcnVuOiAgImdvIHRlc3QgLXYgLXJhY2UgLi8uLi4iCgkJfSwgewoJCQluYW1lOiAiUmVsZWFzZSIKCQkJcnVuOiAgImVjaG8gUmVsZWFzZSBwcm9jZXNzIGhlcmUuIgoJCX1dCgl9Cn0K" }
// filepath: ci/github/release.cue

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

Always run
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
after you import a CUE module for the first time:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).

## Check that the CUE exports cleanly

We need to check that our CUE is valid, and that it produces the config files
we expect.
We use a pair of `cue export` commands that each target a named workflow to
create the specific YAML files that GitHub requires:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAuL2NpL2dpdGh1YiAtZiAtZSB3b3JrZmxvd3MudGVzdCAtbyAuZ2l0aHViL3dvcmtmbG93cy90ZXN0LnltbApjdWUgZXhwb3J0IC4vY2kvZ2l0aHViIC1mIC1lIHdvcmtmbG93cy5yZWxlYXNlIC1vIC5naXRodWIvd29ya2Zsb3dzL3JlbGVhc2UueW1s" }
$ cue export ./ci/github -f -e workflows.test -o .github/workflows/test.yml
$ cue export ./ci/github -f -e workflows.release -o .github/workflows/release.yml
```

We check that our exported YAML files look as expected:

{{<columns>}}
```yml { title=".github/workflows/test.yml" codeToCopy="bmFtZTogVGVzdCBQUnMKIm9uIjoKICBwdWxsX3JlcXVlc3Q6CiAgICBicmFuY2hlczoKICAgICAgLSBtYWluCmpvYnM6CiAgdGVzdDoKICAgIHJ1bnMtb246IHVidW50dS1sYXRlc3QKICAgIHN0ZXBzOgogICAgICAtIHVzZXM6IGFjdGlvbnMvY2hlY2tvdXRAdjQKICAgICAgLSB1c2VzOiBhY3Rpb25zL3NldHVwLWdvQHY1CiAgICAgICAgd2l0aDoKICAgICAgICAgIGdvLXZlcnNpb246ICIxLjI0IgogICAgICAtIG5hbWU6IFRlc3QKICAgICAgICBydW46IGdvIHRlc3QgLXYgIC4vLi4uCnBlcm1pc3Npb25zOgogIGNvbnRlbnRzOiByZWFkCiAgcHVsbC1yZXF1ZXN0czogcmVhZAo=" }
# filepath: .github/workflows/test.yml

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
```yml { title=".github/workflows/release.yml" codeToCopy="bmFtZTogUmVsZWFzZQoib24iOgogIHB1c2g6CiAgICB0YWdzOgogICAgICAtIHYqCnBlcm1pc3Npb25zOgogIGNvbnRlbnRzOiByZWFkCmpvYnM6CiAgcmVsZWFzZToKICAgIHJ1bnMtb246IHVidW50dS1sYXRlc3QKICAgIHN0ZXBzOgogICAgICAtIHVzZXM6IGFjdGlvbnMvY2hlY2tvdXRAdjQKICAgICAgLSB1c2VzOiBhY3Rpb25zL3NldHVwLWdvQHY1CiAgICAgICAgd2l0aDoKICAgICAgICAgIGdvLXZlcnNpb246ICIxLjI0IgogICAgICAtIG5hbWU6IFRlc3QKICAgICAgICBydW46IGdvIHRlc3QgLXYgLXJhY2UgLi8uLi4KICAgICAgLSBuYW1lOiBSZWxlYXNlCiAgICAgICAgcnVuOiBlY2hvIFJlbGVhc2UgcHJvY2VzcyBoZXJlLgo=" }
# filepath: .github/workflows/release.yml

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
```cue { title="ci/github/test.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCndvcmtmbG93czogdGVzdDogewoJbmFtZTogIlRlc3QgUFJzIgoJb246IHB1bGxfcmVxdWVzdDogYnJhbmNoZXM6IFsjZGVmYXVsdEJyYW5jaF0KCXBlcm1pc3Npb25zOiAicHVsbC1yZXF1ZXN0cyI6ICJyZWFkIgoJam9iczogdGVzdDogc3RlcHM6IFsKCQlfY2hlY2tvdXRDb2RlLAoJCV9zZXR1cEdvLAoJCV9nb1Rlc3QsCgldCn0K" }
// filepath: ci/github/test.cue

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
```cue { title="ci/github/release.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCndvcmtmbG93czogcmVsZWFzZTogewoJbmFtZTogIlJlbGVhc2UiCglvbjogcHVzaDogdGFnczogWyJ2KiJdCglqb2JzOiByZWxlYXNlOiBzdGVwczogWwoJCV9jaGVja291dENvZGUsCgkJX3NldHVwR28sCgkJX2dvVGVzdCAmIHsKCQkJI2ZsYWdzOiAiLXJhY2UiCgkJfSwgewoJCQluYW1lOiAiUmVsZWFzZSIKCQkJcnVuOiAgImVjaG8gUmVsZWFzZSBwcm9jZXNzIGhlcmUuIgoJCX0sCgldCn0K" }
// filepath: ci/github/release.cue

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
third CUE file, along with inline comments explaining how it reduces our
individual workflows' boilerplate:

```cue { title="ci/github/workflows.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCmltcG9ydCAoCgkic3RyaW5ncyIKCSJjdWUuZGV2L3gvZ2l0aHViYWN0aW9ucyIKKQoKLy8gVGhpcyBkZWZpbml0aW9uIChhIGZpZWxkIHdob3NlIG5hbWUgc3RhcnRzIHdpdGggIiMiKSBjYW4gYmUgdXNlZCBhbnl3aGVyZSBpbnNpZGUKLy8gdGhlIGdpdGh1YiBwYWNrYWdlLCBhbmQgaXMgYWxzbyBhdmFpbGFibGUgdG8gQ1VFIHRoYXQgaW1wb3J0cyB0aGUgcGFja2FnZS4KI2RlZmF1bHRCcmFuY2g6ICJtYWluIgoKLy8gVGhlIGN1cmF0ZWQgI1dvcmtmbG93IHNjaGVtYSB2YWxpZGF0ZXMgZWFjaCB3b3JrZmxvdyB0aHJvdWdoIHRoZSB1c2Ugb2YgYSBwYXR0ZXJuIGNvbnN0cmFpbnQuCndvcmtmbG93czogW19dOiBnaXRodWJhY3Rpb25zLiNXb3JrZmxvdyAmIHsKCS8vIEV2ZXJ5IGpvYiBnZXRzIGEgZGVmYXVsdCB0YXNrIHJ1bm5lciAtIGFsc28gdXNpbmcgYSBwYXR0ZXJuIGNvbnN0cmFpbnQuCglqb2JzOiBbX106ICJydW5zLW9uIjogKiJ1YnVudHUtbGF0ZXN0IiB8IF8KCS8vIEVhY2ggd29ya2Zsb3cncyBqb2JzIGdldCByZWFkIGFjY2VzcyB0byB0aGUgcmVsZXZhbnQgcmVwbyBieSBkZWZhdWx0LgoJcGVybWlzc2lvbnM6IGNvbnRlbnRzOiAqInJlYWQiIHwgIndyaXRlIiB8ICJub25lIgp9Ci8vIFRoZXNlIHN0ZXBzIGRlZmluZSBjb21tb24gdGFza3MgdGhhdCBvdXIgd29ya2Zsb3dzIGNhbiBpbmNsdWRlIHVzaW5nIGEgcmVmZXJlbmNlLgpfY2hlY2tvdXRDb2RlOiBnaXRodWJhY3Rpb25zLiNTdGVwICYge3VzZXM6ICJhY3Rpb25zL2NoZWNrb3V0QHY0In0KX3NldHVwR286IGdpdGh1YmFjdGlvbnMuI1N0ZXAgJiB7Cgl1c2VzOiAiYWN0aW9ucy9zZXR1cC1nb0B2NSIKCXdpdGg6ICJnby12ZXJzaW9uIjogIjEuMjQiCn0KLy8gX2dvVGVzdCBkZWZpbmVzIGEgc3RlcCB0aGF0IHJ1bnMgYSAiZ28gdGVzdCIgY29tbWFuZCBkcml2ZW4gYnkgc2Vuc2libGUgZGVmYXVsdHMgc3BlY2lmeWluZwovLyB0aGUgc3RlcCdzIG5hbWUsIGl0cyBjb21tYW5kIGxpbmUgZmxhZ3MsIGFuZCBhIGxpc3Qgb2YgR28gcGFja2FnZXMgaXQgc2hvdWxkIHRlc3QuCl9nb1Rlc3Q6IGdpdGh1YmFjdGlvbnMuI1N0ZXAgJiB7CgluYW1lOiAgICoiVGVzdCIgfCBfCgkjZmxhZ3M6ICoiIiB8IHN0cmluZwoJI3BhY2thZ2VzOiAqWyIuLy4uLiJdIHwgWy4uLnN0cmluZ10KCWxldCBwYWNrYWdlcyA9IHN0cmluZ3MuSm9pbigjcGFja2FnZXMsICIgIikKCXJ1bjogImdvIHRlc3QgLXYgXCgjZmxhZ3MpIFwocGFja2FnZXMpIgp9Cg==" }
// filepath: ci/github/workflows.cue

package github

import (
	"strings"
	"cue.dev/x/githubactions"
)

// This definition (a field whose name starts with "#") can be used anywhere inside
// the github package, and is also available to CUE that imports the package.
#defaultBranch: "main"

// The curated #Workflow schema validates each workflow through the use of a pattern constraint.
workflows: [_]: githubactions.#Workflow & {
	// Every job gets a default task runner - also using a pattern constraint.
	jobs: [_]: "runs-on": *"ubuntu-latest" | _
	// Each workflow's jobs get read access to the relevant repo by default.
	permissions: contents: *"read" | "write" | "none"
}
// These steps define common tasks that our workflows can include using a reference.
_checkoutCode: githubactions.#Step & {uses: "actions/checkout@v4"}
_setupGo: githubactions.#Step & {
	uses: "actions/setup-go@v5"
	with: "go-version": "1.24"
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
```

Several of the common elements could easily be reused by other reposities, as
their definitions aren't specific to the repository and the code that they're
helping us test.

## How are the workflows defined?

Now that we've seen how the common and shared elements are defined separately,
let's check back in and review the workflows that use these elements.

Here's the succinct, DRYed up `test` workflow, with a few comments added to
explain the CUE:

```cue { title="ci/github/test.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCi8vIFRoZSB0ZXN0IHdvcmtmbG93IHVzZXMgYWxsIHRoZSBkZWZhdWx0cyBzcGVjaWZpZWQgaW4gd29ya2Zsb3dzLmN1ZS4Kd29ya2Zsb3dzOiB0ZXN0OiB7CgluYW1lOiAiVGVzdCBQUnMiCgkvLyBUaGVyZSdzIG5vIGRlZmF1bHQgZm9yIHRoZSB3b3JrZmxvdyB0cmlnZ2VyIHNvIHdlIG5lZWQgdG8gZGVmaW5lIGl0IGhlcmUuCglvbjogcHVsbF9yZXF1ZXN0OiBicmFuY2hlczogWyNkZWZhdWx0QnJhbmNoXQoJLy8gVGhpcyBhZGRzIHRvIHRoZSBkZWZhdWx0IHJlYWQgcGVybWlzc2lvbiBmb3IgdGhlIHJlcG8ncyBjb250ZW50cy4KCXBlcm1pc3Npb25zOiAicHVsbC1yZXF1ZXN0cyI6ICJyZWFkIgoJam9iczogdGVzdDogc3RlcHM6IFsKCQkvLyBUaGVzZSBzdGVwcyB0ZW1wbGF0ZSB0aGUgc2hhcmVkIHN0ZXBzIGJ5IHJlZmVyZW5jaW5nIHRoZW0uCgkJX2NoZWNrb3V0Q29kZSwKCQlfc2V0dXBHbywKCQlfZ29UZXN0LAoJXQp9Cg==" }
// filepath: ci/github/test.cue

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

```cue { title="ci/github/release.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCndvcmtmbG93czogcmVsZWFzZTogewoJbmFtZTogIlJlbGVhc2UiCgkvLyBUaGVyZSdzIG5vIGRlZmF1bHQgZm9yIHRoZSB3b3JrZmxvdyB0cmlnZ2VyIHNvIHdlIG5lZWQgdG8gZGVmaW5lIGl0IGhlcmUuCglvbjogcHVzaDogdGFnczogWyJ2KiJdCglqb2JzOiByZWxlYXNlOiBzdGVwczogWwoJCS8vIFRoZXNlIHN0ZXBzIHRlbXBsYXRlIHRoZSBzaGFyZWQgc3RlcHMgYnkgcmVmZXJlbmNpbmcgdGhlbS4KCQlfY2hlY2tvdXRDb2RlLAoJCV9zZXR1cEdvLAoJCS8vIFRoZSByZWxlYXNlIHdvcmtmbG93IG5lZWRzIHRvIHNwZWNpZnkgdGhlICJnbyB0ZXN0IiAiLXJhY2UiIGZsYWcsCgkJLy8gc28gaXQgdXNlcyB0aGUgdGVtcGxhdGUncyBwYXJhbWV0ZXIgdG8gb3ZlcnJpZGUgdGhlIGRlZmF1bHQuCgkJX2dvVGVzdCAmIHsKCQkJI2ZsYWdzOiAiLXJhY2UiCgkJfSwgewoJCQkvLyBUaGUgcmVsZWFzZSBwcm9jZXNzIGlzIHVuaXF1ZSB0byB0aGlzIHdvcmtmbG93LCBzbyB3ZSBsZWF2ZQoJCQkvLyBpdCBkZWZpbmVkIGlubGluZSBpbiBvcmRlciB0byBsZXQgaXQgc3RhbmQgb3V0IGNsZWFybHkuCgkJCW5hbWU6ICJSZWxlYXNlIgoJCQlydW46ICAiZWNobyBSZWxlYXNlIHByb2Nlc3MgaGVyZS4iCgkJfSwKCV0KfQo=" }
// filepath: ci/github/release.cue

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
		}, {
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
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAuL2NpL2dpdGh1YiAtZiAtZSB3b3JrZmxvd3MudGVzdCAtbyAuZ2l0aHViL3dvcmtmbG93cy90ZXN0LnltbApjdWUgZXhwb3J0IC4vY2kvZ2l0aHViIC1mIC1lIHdvcmtmbG93cy5yZWxlYXNlIC1vIC5naXRodWIvd29ya2Zsb3dzL3JlbGVhc2UueW1s" }
$ cue export ./ci/github -f -e workflows.test -o .github/workflows/test.yml
$ cue export ./ci/github -f -e workflows.release -o .github/workflows/release.yml
```
Because the `cue export` commands ran successfully, we know that the curated
schema used in `workflows.cue` validated the workflows.

## Review the changes

Lastly, we make sure that our DRYing up hasn't changed the exported YAML files'
contents:

```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGRpZmYgLmdpdGh1Yi93b3JrZmxvd3M=" }
$ git diff .github/workflows
```

If you're following along and simplifying your own workflows then do make sure
you understand any differences shown by the `git diff` command (after you've
finished DRYing up), and that the changes are as expected. In our example there
aren't any differences, so we know that our workflows will run identically to
before we started.
