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
multiple GitHub Actions workflows -- allowing their critical, unique elements
to stand out.

To follow along with this guide you need to use the latest pre-release of the
`cue` command. Please [upgrade to this version](/docs/installing-cue/) if you
don't have it installed already:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.13.0-alpha.4
...
```

The techniques and language features demonstrated in this guide can be applied
to any CUE, but the changes we'll make here are specific to the configurations
shown on this page -- you'll need to adapt them to suit *your* CUE.

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

In this example we start with a pair of GitHub Actions workflows that test and
release a Golang module:

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

## Tidy the local CUE module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

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

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAuL2NpL2dpdGh1YiAtZiAtZSB3b3JrZmxvd3MudGVzdCAtbyAuZ2l0aHViL3dvcmtmbG93cy90ZXN0LnltbApjdWUgZXhwb3J0IC4vY2kvZ2l0aHViIC1mIC1lIHdvcmtmbG93cy5yZWxlYXNlIC1vIC5naXRodWIvd29ya2Zsb3dzL3JlbGVhc2UueW1s" }
$ cue export ./ci/github -f -e workflows.test -o .github/workflows/test.yml
$ cue export ./ci/github -f -e workflows.release -o .github/workflows/release.yml
```

We could have chosen to use a single CUE
[workflow command](https://cuelang.org/docs/howto/use-your-first-cue-workflow-command/)
instead of these two commands. Workflow commands provide a scalable way to
define repeatable, data-driven tasks that can, for example, export different
parts of a CUE configuration into different data files.

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

We now DRY up and simplify our two CUE files as follows.
Don't worry if any parts don't make sense immediately - we'll explain what's
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
```cue { title="ci/github/release.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCndvcmtmbG93czogcmVsZWFzZTogewoJbmFtZTogIlJlbGVhc2UiCglvbjogcHVzaDogdGFnczogWyJ2KiJdCglqb2JzOiByZWxlYXNlOiB7CgkJc3RlcHM6IFsKCQkJX2NoZWNrb3V0Q29kZSwKCQkJX3NldHVwR28sCgkJCV9pbnN0YWxsR29EZXBlbmRlbmNpZXMsCgkJCV9nb1Rlc3QgJiB7CgkJCQkjZmxhZ3M6ICItcmFjZSIKCQkJfSwgewoJCQkJbmFtZTogIlJlbGVhc2UiCgkJCQlydW46ICAiZWNobyBSZWxlYXNlIHByb2Nlc3MgaGVyZS4iCgkJCX0sCgkJXQoJfQp9Cg==" }
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
			}, {
				name: "Release"
				run:  "echo Release process here."
			},
		]
	}
}
```
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

```cue { title="ci/github/workflows.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCmltcG9ydCAoCgkic3RyaW5ncyIKCSJjdWUuZGV2L3gvZ2l0aHViYWN0aW9ucyIKKQoKLy8gVGhlIGN1cmF0ZWQgI1dvcmtmbG93IHNjaGVtYSB2YWxpZGF0ZXMgZWFjaCB3b3JrZmxvdyB0aHJvdWdoIHRoZSB1c2Ugb2YgYSBwYXR0ZXJuIGNvbnN0cmFpbnQuCndvcmtmbG93czogW19dOiBnaXRodWJhY3Rpb25zLiNXb3JrZmxvdyAmIHsKCS8vIEV2ZXJ5IGpvYiBnZXRzIGEgZGVmYXVsdCB0YXNrIHJ1bm5lciAtIGFsc28gdXNpbmcgYSBwYXR0ZXJuIGNvbnN0cmFpbnQuCglqb2JzOiBbX106ICJydW5zLW9uIjogKiJ1YnVudHUtbGF0ZXN0IiB8IF8KCS8vIEVhY2ggd29ya2Zsb3cncyBqb2JzIGdldCByZWFkIGFjY2VzcyB0byB0aGUgcmVsZXZhbnQgcmVwbyBieSBkZWZhdWx0LgoJcGVybWlzc2lvbnM6IGNvbnRlbnRzOiAqInJlYWQiIHwgIndyaXRlIiB8ICJub25lIgp9CgojZGVmYXVsdEJyYW5jaDogIm1haW4iCiNnb1ZlcnNpb246ICAgICAiMS4yNCIKCi8vIFRoZXNlIHRocmVlIHN0ZXBzIGRlZmluZSBjb21tb24gdGFza3MgdGhhdCBvdXIgd29ya2Zsb3dzIGNhbiBpbmNsdWRlIHVzaW5nIGEgcmVmZXJlbmNlLgpfY2hlY2tvdXRDb2RlOiBnaXRodWJhY3Rpb25zLiNTdGVwICYge3VzZXM6ICJhY3Rpb25zL2NoZWNrb3V0QHY0In0KX3NldHVwR286IGdpdGh1YmFjdGlvbnMuI1N0ZXAgJiB7CgluYW1lOiAiU2V0IHVwIEdvIgoJdXNlczogImFjdGlvbnMvc2V0dXAtZ29AdjUiCgl3aXRoOiAiZ28tdmVyc2lvbiI6ICNnb1ZlcnNpb24KfQpfaW5zdGFsbEdvRGVwZW5kZW5jaWVzOiBnaXRodWJhY3Rpb25zLiNTdGVwICYgewoJbmFtZTogIkluc3RhbGwgZGVwZW5kZW5jaWVzIgoJcnVuOiAgImdvIG1vZCB0aWR5Igp9CgovLyBfZ29UZXN0IGRlZmluZXMgYSBzdGVwIHRoYXQgcnVucyBhICJnbyB0ZXN0IiBjb21tYW5kIGRyaXZlbiBieSBzZW5zaWJsZSBkZWZhdWx0cyBzcGVjaWZ5aW5nCi8vIHRoZSBzdGVwJ3MgbmFtZSwgaXRzIGNvbW1hbmQgbGluZSBmbGFncywgYW5kIGEgbGlzdCBvZiBHbyBwYWNrYWdlcyBpdCBzaG91bGQgdGVzdC4KX2dvVGVzdDogZ2l0aHViYWN0aW9ucy4jU3RlcCAmIHsKCW5hbWU6ICAgKiJUZXN0IiB8IF8KCSNmbGFnczogKiIiIHwgc3RyaW5nCgkjcGFja2FnZXM6ICpbIi4vLi4uIl0gfCBbLi4uc3RyaW5nXQoJbGV0IHBhY2thZ2VzID0gc3RyaW5ncy5Kb2luKCNwYWNrYWdlcywgIiAiKQoJcnVuOiAiZ28gdGVzdCAtdiBcKCNmbGFncykgXChwYWNrYWdlcykiCn0K" }
// filepath: ci/github/workflows.cue

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
```

## How are the workflows defined?

Now that we've seen how the common and shared elements are defined separately,
let's check back in and review the workflows that use these elements.

Here's the succinct `test` workflow, with a few comments added to explain the CUE:

```cue { title="ci/github/test.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCi8vIFRoZSByZWxlYXNlIHdvcmtmbG93IGFjY2VwdHMgYWxsIHRoZSBkZWZhdWx0cyBzcGVjaWZpZWQgaW4gd29ya2Zsb3dzLmN1ZS4Kd29ya2Zsb3dzOiB0ZXN0OiB7CgluYW1lOiAiVGVzdCBQUnMiCgkvLyBUaGVyZSdzIG5vIGRlZmF1bHQgZm9yIHRoZSB3b3JrZmxvdyB0cmlnZ2VyIHNvIHdlIG5lZWQgdG8gZGVmaW5lIGl0IGhlcmUuCglvbjogcHVsbF9yZXF1ZXN0OiBicmFuY2hlczogWyNkZWZhdWx0QnJhbmNoXQoJLy8gVGhpcyBhZGRzIHRvIHRoZSBkZWZhdWx0IHJlYWQgcGVybWlzc2lvbiBmb3IgdGhlIHJlcG8ncyBjb250ZW50cy4KCXBlcm1pc3Npb25zOiAicHVsbC1yZXF1ZXN0cyI6ICJyZWFkIgoJam9iczogdGVzdDogewoJCXN0ZXBzOiBbCgkJCS8vIFRoZXNlIHN0ZXBzIHRlbXBsYXRlIHRoZSBzaGFyZWQgc3RlcHMgYnkgcmVmZXJlbmNpbmcgdGhlbS4KCQkJX2NoZWNrb3V0Q29kZSwKCQkJX3NldHVwR28sCgkJCV9pbnN0YWxsR29EZXBlbmRlbmNpZXMsCgkJCV9nb1Rlc3QsCgkJXQoJfQp9Cg==" }
// filepath: ci/github/test.cue

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
```

The CUE defining the `release` workflow does a little more work to customise
the shared elements:

```cue { title="ci/github/release.cue" codeToCopy="cGFja2FnZSBnaXRodWIKCndvcmtmbG93czogcmVsZWFzZTogewoJbmFtZTogIlJlbGVhc2UiCgkvLyBUaGVyZSdzIG5vIGRlZmF1bHQgZm9yIHRoZSB3b3JrZmxvdyB0cmlnZ2VyIHNvIHdlIG5lZWQgdG8gZGVmaW5lIGl0IGhlcmUuCglvbjogcHVzaDogdGFnczogWyJ2KiJdCglqb2JzOiByZWxlYXNlOiB7CgkJc3RlcHM6IFsKCQkJLy8gVGhlc2UgcmVmZXJlbmNlcyB1c2UgdGhlIHN0ZXBzIGFzIHRlbXBsYXRlcywgd2l0aG91dCBtb2RpZmljYXRpb24uCgkJCV9jaGVja291dENvZGUsCgkJCV9zZXR1cEdvLAoJCQlfaW5zdGFsbEdvRGVwZW5kZW5jaWVzLAoJCQkvLyBUaGUgcmVsZWFzZSB3b3JrZmxvdyBuZWVkcyB0byBzcGVjaWZ5IHRoZSBzbG93ZXIsIHNhZmVyICItcmFjZSIgZmxhZywKCQkJLy8gc28gaXQgdXNlcyB0aGUgdGVtcGxhdGUncyBwYXJhbWV0ZXIgdG8gb3ZlcnJpZGUgdGhlIGRlZmF1bHQuCgkJCV9nb1Rlc3QgJiB7CgkJCQkjZmxhZ3M6ICItcmFjZSIKCQkJfSwgewoJCQkJbmFtZTogIlJlbGVhc2UiCgkJCQlydW46ICAiZWNobyBSZWxlYXNlIHByb2Nlc3MgaGVyZS4iCgkJCX0sCgkJXQoJfQp9Cg==" }
// filepath: ci/github/release.cue

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

Lastly, we review the newly-exported YAML files to confirm that our DRYing up
hasn't changed their contents:

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

You might use the `git diff` command on your YAML workflows to confirm that any
changes are purely cosmetic, and only contain harmless field reordering,
different (but consistent) whitespace indentation choices, and other trivial
changes.
