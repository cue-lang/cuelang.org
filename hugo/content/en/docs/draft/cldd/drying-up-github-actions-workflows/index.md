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
```cue { title="ci/github/test.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCmltcG9ydCAiY3VlLmRldi94L2dpdGh1YmFjdGlvbnMiCgp3b3JrZmxvd3M6IHRlc3Q6IGdpdGh1YmFjdGlvbnMuI1dvcmtmbG93ICYgewoJbmFtZTogIlRlc3QgUFJzIgoJb246IHB1bGxfcmVxdWVzdDogYnJhbmNoZXM6IFsibWFpbiJdCglwZXJtaXNzaW9uczogewoJCWNvbnRlbnRzOiAgICAgICAgInJlYWQiCgkJInB1bGwtcmVxdWVzdHMiOiAicmVhZCIKCX0KCWpvYnM6IHRlc3Q6IHsKCQkicnVucy1vbiI6ICJ1YnVudHUtbGF0ZXN0IgoJCXN0ZXBzOiBbewoJCQl1c2VzOiAiYWN0aW9ucy9jaGVja291dEB2NCIKCQl9LCB7CgkJCW5hbWU6ICJTZXQgdXAgR28iCgkJCXVzZXM6ICJhY3Rpb25zL3NldHVwLWdvQHY1IgoJCQl3aXRoOiAiZ28tdmVyc2lvbiI6ICIxLjI0IgoJCX0sIHsKCQkJbmFtZTogIkluc3RhbGwgZGVwZW5kZW5jaWVzIgoJCQlydW46ICAiZ28gbW9kIHRpZHkiCgkJfSwgewoJCQluYW1lOiAiVGVzdCIKCQkJcnVuOiAgImdvIHRlc3QgLXYgIC4vLi4uIgoJCX1dCgl9Cn0K" }
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
```
{{<columns-separator>}}
```cue { title="ci/github/release.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCmltcG9ydCAiY3VlLmRldi94L2dpdGh1YmFjdGlvbnMiCgp3b3JrZmxvd3M6IHJlbGVhc2U6IGdpdGh1YmFjdGlvbnMuI1dvcmtmbG93ICYgewoJbmFtZTogIlJlbGVhc2UiCglvbjogcHVzaDogdGFnczogWyJ2KiJdCglwZXJtaXNzaW9uczogY29udGVudHM6ICJyZWFkIgoJam9iczogcmVsZWFzZTogewoJCSJydW5zLW9uIjogInVidW50dS1sYXRlc3QiCgkJc3RlcHM6IFt7CgkJCXVzZXM6ICJhY3Rpb25zL2NoZWNrb3V0QHY0IgoJCX0sIHsKCQkJbmFtZTogIlNldCB1cCBHbyIKCQkJdXNlczogImFjdGlvbnMvc2V0dXAtZ29AdjUiCgkJCXdpdGg6ICJnby12ZXJzaW9uIjogIjEuMjQiCgkJfSwgewoJCQluYW1lOiAiSW5zdGFsbCBkZXBlbmRlbmNpZXMiCgkJCXJ1bjogICJnbyBtb2QgdGlkeSIKCQl9LCB7CgkJCW5hbWU6ICJUZXN0IgoJCQlydW46ICAiZ28gdGVzdCAtdiAtcmFjZSAuLy4uLiIKCQl9LCB7CgkJCW5hbWU6ICJSZWxlYXNlIgoJCQlydW46ICAiZWNobyBSZWxlYXNlIHByb2Nlc3MgaGVyZS4iCgkJfV0KCX0KfQo=" }
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
```
{{</columns>}}

## Tidy your local CUE module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

FIXME: words.

## Check that your CUE exports cleanly

We need to start by checking that our CUE is valid, and it produces the
config files we expect.

We use a pair of `cue export` commands that each target a named GitHub
Actions workflow, and create the specific YAML files that Github
requires:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAuL2NpL2dpdGh1YiAtZiAtZSB3b3JrZmxvd3MudGVzdCAtbyAuZ2l0aHViL3dvcmtmbG93cy90ZXN0LnltbApjdWUgZXhwb3J0IC4vY2kvZ2l0aHViIC1mIC1lIHdvcmtmbG93cy5yZWxlYXNlIC1vIC5naXRodWIvd29ya2Zsb3dzL3JlbGVhc2UueW1s" }
$ cue export ./ci/github -f -e workflows.test -o .github/workflows/test.yml
$ cue export ./ci/github -f -e workflows.release -o .github/workflows/release.yml
```

We could have chosen to use a single CUE
[workflow command](https://cuelang.org/docs/howto/use-your-first-cue-workflow-command/)
instead of these two commands. Workflow commands provide a scalable way to
encode repeatable, data-driven tasks that can, for example, export multiple
parts of a CUE configuration and place them into different data files.

We check that our exported YAML files look as expected:

```text { title="TERMINAL" type="terminal" codeToCopy="aGVhZCAtMTAgLmdpdGh1Yi93b3JrZmxvd3MvdGVzdC55bWw=" }
$ head -10 .github/workflows/test.yml
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
...
```

## Simplify the CUE

We now DRY out and simplify our two CUE files so that they look like this.
Don't worry if any pieces don't make sense immediately - we'll explain what's
going on later!

{{<columns>}}
```cue { title="ci/github/test.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCndvcmtmbG93czogdGVzdDogewoJbmFtZTogIlRlc3QgUFJzIgoJb246IHB1bGxfcmVxdWVzdDogYnJhbmNoZXM6IFsjZGVmYXVsdEJyYW5jaF0KCXBlcm1pc3Npb25zOiAicHVsbC1yZXF1ZXN0cyI6ICJyZWFkIgoJam9iczogdGVzdDogewoJCXN0ZXBzOiBbCgkJCV9jaGVja291dENvZGUsCgkJCV9zZXR1cEdvLAoJCQlfaW5zdGFsbEdvRGVwZW5kZW5jaWVzLAoJCQlfZ29UZXN0LAoJCV0KCX0KfQo=" }
// filepath: ci/github/test.cue

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
```
{{<columns-separator>}}
```cue { title="ci/github/release.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCndvcmtmbG93czogcmVsZWFzZTogewoJbmFtZTogIlJlbGVhc2UiCglvbjogcHVzaDogdGFnczogWyJ2KiJdCglqb2JzOiByZWxlYXNlOiB7CgkJc3RlcHM6IFsKCQkJX2NoZWNrb3V0Q29kZSwKCQkJX3NldHVwR28sCgkJCV9pbnN0YWxsR29EZXBlbmRlbmNpZXMsCgkJCV9nb1Rlc3QgJiB7CgkJCQkjZmxhZ3M6ICItcmFjZSIKCQkJfSwKCQkJewoJCQkJbmFtZTogIlJlbGVhc2UiCgkJCQlydW46ICAiZWNobyBSZWxlYXNlIHByb2Nlc3MgaGVyZS4iCgkJCX0sCgkJXQoJfQp9Cg==" }
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
			_goTest & {
				#flags: "-race"
			},
			{
				name: "Release"
				run:  "echo Release process here."
			},
		]
	}
}
```
{{</columns>}}

These workflows look much simpler and easier to understand, as they contain
just the critical or unique information that's needed to distiguish them from
each other.
But we haven't simply thrown the boilerplate away - it still needs to be
defined *somewhere!*

In fact, we've placed the common and shared elements of our workflows in a
third CUE file. CUE packages are composed of all CUE files that are in scope,
and CUE takes care of unifying them for us. This means that we can split out
the boilerplate without each workflow's file needing to keep track of the
location of the shared elements.

Here's the additional file that we've created, along with inline comments
explaining how it reduces our boilerplate:

```cue { title="ci/github/workflows.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCmltcG9ydCAoCgkic3RyaW5ncyIKCSJjdWUuZGV2L3gvZ2l0aHViYWN0aW9ucyIKKQoKLy8gRWFjaCBtZW1iZXIgb2YgdGhlIHdvcmtmbG93cyBzdHJ1Y3QgaXMgdmFsaWRhdGVkIGFnYWluc3QgdGhlIGN1cmF0ZWQgImdpdGh1YmFjdGlvbnMiCi8vIG1vZHVsZSdzICIjV29ya2Zsb3ciIHNjaGVtYS4Kd29ya2Zsb3dzOiBbX106IGdpdGh1YmFjdGlvbnMuI1dvcmtmbG93ICYgewoJLy8gRWFjaCBqb2IgaW5zaWRlIGVhY2ggd29ya2Zsb3cgaXMgZ2l2ZW4gYSBkZWZhdWx0IHRhc2sgcnVubmVyLCB3aGljaCBjYW4gYmUgb3ZlcnJpZGRlbi4KCWpvYnM6IFtfXTogInJ1bnMtb24iOiAqInVidW50dS1sYXRlc3QiIHwgXwoKCS8vIEVhY2ggd29ya2Zsb3cncyBqb2JzIGFyZSBncmFudGVkIHJlYWQgcGVybWlzc2lvbnMgb24gdGhlIGNvbnRlbnRzIG9mIHRoZSByZWxldmFudCByZXBvCgkvLyBieSBkZWZhdWx0LCBidXQgdGhpcyBjYW4gYmUgb3ZlcnJpZGRlbiB3aXRoIG1vcmUgb3IgbGVzcyBhY2Nlc3MgYXMgcmVxdWlyZWQuCglwZXJtaXNzaW9uczogY29udGVudHM6ICoicmVhZCIgfCAid3JpdGUiIHwgIm5vbmUiCn0KCi8vIERlZmluaXRpb25zIChmaWVsZHMgd2hvc2UgaWRlbnRpZmllcnMgc3RhcnQgd2l0aCAiIyIpIGFyZW4ndCBwYXJ0IG9mIHRoZSBkYXRhCi8vIG1vZGVsLCBidXQgYXJlIGF2YWlsYWJsZSB0aHJvdWdob3V0IHRoZSBwYWNrYWdlLCBhbmQgYXJlIGV4cG9ydGVkIGZvciB1c2UgYnkKLy8gb3RoZXIgcGFja2FnZXMgdGhhdCBpbXBvcnQgdGhpcyBwYWNrYWdlLgoKLy8gT3VyIHJlcG9zaXRvcnkncyBkZWZhdWx0IEdpdCBicmFuY2ggdGhhdCByZWxlYXNlcyBhcmUgY3V0IGZyb20gYW5kIHRoYXQgUFJzIHRhcmdldC4KI2RlZmF1bHRCcmFuY2g6ICJtYWluIgoKLy8gVGhlIHZlcnNpb24gb2YgR28gdGhhdCB3ZSB0ZXN0IGFuZCBidWlsZCBhZ2FpbnN0LgojZ29WZXJzaW9uOiAiMS4yNCIKCi8vIEhpZGRlbiBmaWVsZHMgKHRob3NlIHdob3NlIGlkZW50aWZpZXJzIHN0YXJ0IHdpdGggYW4gdW5xdW90ZWQgdW5kZXJzY29yZSkKLy8gYXJlbid0IHBhcnQgb2YgdGhlIGRhdGEgbW9kZSwgYnV0IGFyZSBhdmFpbGFibGUgdGhyb3VnaG91dCB0aGUgcGFja2FnZS4KLy8gVGhleSdyZSBub3QgZXhwb3J0ZWQgZm9yIHVzZSBieSBvdGhlciBwYWNrYWdlcy4KCi8vIFRoZXNlIHRocmVlIHN0ZXBzIGRlZmluZSBjb21tb24gY29tbWFuZCB0YXNrcyB0aGF0IG91ciB3b3JrZmxvd3MgbmVlZCB0byBwZXJmb3JtLgpfY2hlY2tvdXRDb2RlOiBnaXRodWJhY3Rpb25zLiNTdGVwICYge3VzZXM6ICJhY3Rpb25zL2NoZWNrb3V0QHY0In0KX3NldHVwR286IGdpdGh1YmFjdGlvbnMuI1N0ZXAgJiB7CgluYW1lOiAiU2V0IHVwIEdvIgoJdXNlczogImFjdGlvbnMvc2V0dXAtZ29AdjUiCgl3aXRoOiAiZ28tdmVyc2lvbiI6ICNnb1ZlcnNpb24KfQpfaW5zdGFsbEdvRGVwZW5kZW5jaWVzOiBnaXRodWJhY3Rpb25zLiNTdGVwICYgewoJbmFtZTogIkluc3RhbGwgZGVwZW5kZW5jaWVzIgoJcnVuOiAgImdvIG1vZCB0aWR5Igp9CgovLyBfZ29UZXN0IGRlZmluZXMgYSAiZ28gdGVzdCIgY29tbWFuZC4gSXQgaGFzIHNlbnNpYmxlIGRlZmF1bHRzIHRoYXQgY2FuIGJlIG92ZXJyaWRlbiBieSBhIHdvcmtmbG93Ci8vIHNwZWNpZnlpbmcgdGhlIHN0ZXAncyBuYW1lLCBjb21tYW5kIGxpbmUgZmxhZ3MsIG9yIGEgbGlzdCBvZiBHbyBwYWNrYWdlcyB0byBwcm9jZXNzLgpfZ29UZXN0OiBnaXRodWJhY3Rpb25zLiNTdGVwICYgewoJbmFtZTogICAqIlRlc3QiIHwgXwoJI2ZsYWdzOiAqIiIgfCBzdHJpbmcKCSNwYWNrYWdlczogKlsiLi8uLi4iXSB8IFsuLi5zdHJpbmddCglsZXQgcGFja2FnZXMgPSBzdHJpbmdzLkpvaW4oI3BhY2thZ2VzLCAiICIpCglydW46ICJnbyB0ZXN0IC12IFwoI2ZsYWdzKSBcKHBhY2thZ2VzKSIKfQo=" }
// filepath: ci/github/workflows.cue

package github

import (
	"strings"
	"cue.dev/x/githubactions"
)

// Each member of the workflows struct is validated against the curated "githubactions"
// module's "#Workflow" schema.
workflows: [_]: githubactions.#Workflow & {
	// Each job inside each workflow is given a default task runner, which can be overridden.
	jobs: [_]: "runs-on": *"ubuntu-latest" | _

	// Each workflow's jobs are granted read permissions on the contents of the relevant repo
	// by default, but this can be overridden with more or less access as required.
	permissions: contents: *"read" | "write" | "none"
}

// Definitions (fields whose identifiers start with "#") aren't part of the data
// model, but are available throughout the package, and are exported for use by
// other packages that import this package.

// Our repository's default Git branch that releases are cut from and that PRs target.
#defaultBranch: "main"

// The version of Go that we test and build against.
#goVersion: "1.24"

// Hidden fields (those whose identifiers start with an unquoted underscore)
// aren't part of the data mode, but are available throughout the package.
// They're not exported for use by other packages.

// These three steps define common command tasks that our workflows need to perform.
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

// _goTest defines a "go test" command. It has sensible defaults that can be overriden by a workflow
// specifying the step's name, command line flags, or a list of Go packages to process.
_goTest: githubactions.#Step & {
	name:   *"Test" | _
	#flags: *"" | string
	#packages: *["./..."] | [...string]
	let packages = strings.Join(#packages, " ")
	run: "go test -v \(#flags) \(packages)"
}
```

## How the workflows are defined

Now that we've seen how the common and shared elements are defined separately,
let's check back in and review the workflows that use these elements.

Here's the succinct `test` workflow, with added comments explaining what it's
doing: FIXME: comments

```cue { title="ci/github/test.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCndvcmtmbG93czogdGVzdDogewoJbmFtZTogIlRlc3QgUFJzIgoJb246IHB1bGxfcmVxdWVzdDogYnJhbmNoZXM6IFsjZGVmYXVsdEJyYW5jaF0KCXBlcm1pc3Npb25zOiAicHVsbC1yZXF1ZXN0cyI6ICJyZWFkIgoJam9iczogdGVzdDogewoJCXN0ZXBzOiBbCgkJCV9jaGVja291dENvZGUsCgkJCV9zZXR1cEdvLAoJCQlfaW5zdGFsbEdvRGVwZW5kZW5jaWVzLAoJCQlfZ29UZXN0LAoJCV0KCX0KfQo=" }
// filepath: ci/github/test.cue

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
```

FIXME: preamble
FIXME: comments

```cue { title="ci/github/release.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCi8vIFRoZSByZWxlYXNlIHdvcmtmbG93IGFjY2VwdHMgYWxtb3N0IGFsbCB0aGUKLy8gZGVmYXVsdHMgc3BlY2lmaWVkIGluIHdvcmtmbG93cy5jdWUuCndvcmtmbG93czogcmVsZWFzZTogewoJbmFtZTogIlJlbGVhc2UiCgkvLyBUaGVyZSdzIG5vIGRlZmF1bHQgZm9yIHRoZSB3b3JrZmxvdyB0cmlnZ2VyLAoJLy8gc28gd2Ugc3BlY2lmeSBpdCBoZXJlLgoJb246IHB1c2g6IHRhZ3M6IFsidioiXQoJam9iczogcmVsZWFzZTogewoJCXN0ZXBzOiBbCgkJCS8vIFRoZXNlIHJlZmVyZW5jZXMgdXNlIHRoZSBzdGVwCgkJCS8vIGRlZmluaXRpb25zIHdpdGhvdXQgbW9kaWZpY2F0aW9uLgoJCQlfY2hlY2tvdXRDb2RlLAoJCQlfc2V0dXBHbywKCQkJX2luc3RhbGxHb0RlcGVuZGVuY2llcywKCgkJCS8vIFRoZSByZWxlYXNlIHdvcmtmbG93IG5lZWRzIHRvCgkJCS8vIHNwZWNpZnkgdGhlIHNsb3dlciwgc2FmZXIgIi1yYWNlIgoJCQkvLyBmbGFnLCBzbyBpdCB1c2VzIHRoZSB0ZW1wbGF0ZSdzCgkJCS8vIHBhcmFtZXRlciB0byBvdmVycmlkZSB0aGUgZGVmYXVsdC4KCQkJX2dvVGVzdCAmIHsKCQkJCSNmbGFnczogIi1yYWNlIgoJCQl9LAoJCQl7CgkJCQluYW1lOiAiUmVsZWFzZSIKCQkJCXJ1bjogICJlY2hvIFJlbGVhc2UgcHJvY2VzcyBoZXJlLiIKCQkJfSwKCQldCgl9Cn0K" }
// filepath: ci/github/release.cue

package github

// The release workflow accepts almost all the
// defaults specified in workflows.cue.
workflows: release: {
	name: "Release"
	// There's no default for the workflow trigger,
	// so we specify it here.
	on: push: tags: ["v*"]
	jobs: release: {
		steps: [
			// These references use the step
			// definitions without modification.
			_checkoutCode,
			_setupGo,
			_installGoDependencies,

			// The release workflow needs to
			// specify the slower, safer "-race"
			// flag, so it uses the template's
			// parameter to override the default.
			_goTest & {
				#flags: "-race"
			},
			{
				name: "Release"
				run:  "echo Release process here."
			},
		]
	}
}
```

## Check that your CUE still exports cleanly

FIXME: words
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAuL2NpL2dpdGh1YiAtZiAtZSB3b3JrZmxvd3MudGVzdCAtbyAuZ2l0aHViL3dvcmtmbG93cy90ZXN0LnltbApjdWUgZXhwb3J0IC4vY2kvZ2l0aHViIC1mIC1lIHdvcmtmbG93cy5yZWxlYXNlIC1vIC5naXRodWIvd29ya2Zsb3dzL3JlbGVhc2UueW1s" }
$ cue export ./ci/github -f -e workflows.test -o .github/workflows/test.yml
$ cue export ./ci/github -f -e workflows.release -o .github/workflows/release.yml
```
## Review the changes

In our example, we review the YAML files just exported to confirm that their
contents haven't changed from before we started DRYing up the CUE source:

```text { title="TERMINAL" type="terminal" codeToCopy="aGVhZCAtMTAgLmdpdGh1Yi93b3JrZmxvd3MvdGVzdC55bWw=" }
$ head -10 .github/workflows/test.yml
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
...
```

You might use the `git diff` command on your workflows to confirm that any
changes are purely cosmetic: field reordering, different (but consistent)
whitespace indentation choices, and so on.

## Next steps

FIXME
