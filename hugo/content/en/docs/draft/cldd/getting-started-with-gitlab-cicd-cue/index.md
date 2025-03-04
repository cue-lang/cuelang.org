---
title: Getting started with GitHub Actions + CUE
draft: true
no_index: true
---

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[YAML workflow files](https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions)
used by [GitHub Actions](https://github.com/features/actions).

This guide shows you how to get started defining your GitHub Actions workflows in CUE.

## Login to the Central Registry
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its schemas.

## Initialise your local CUE module
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0" }
$ cue mod init
```
CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist
within its own CUE module. You can choose any module name you like - it's easy to
[change it later]({{<relref"docs/reference/command/cue-help-mod-rename">}}).

It makes sense for your CUE module to exist at the root of a git repository
that's hosted on GitHub. Other setups are possible, but this guide assumes that
you're running these commands from the top level directory of a git repository.

## Create a CUE workflow
{{< code-tabs >}}
{{< code-tab name="workflow.cue" language="cue" area="top-left" >}}
package gha

import "github.com/cue-tmp/jsonschema-pub/exp1/githubactions"

githubactions.#Workflow & {

	name:       "learn-github-actions"
	"run-name": "${{ github.actor }} is learning GitHub Actions"
	on: ["push"]
	jobs: "check-bats-version": {
		"runs-on": "ubuntu-latest"
		steps: [
			{uses: "actions/checkout@v4"},
			{uses: "actions/setup-node@v4", with: "node-version": "20"},
			{run: "npm install -g bats"},
			{run: "bats -v"},
		]
	}
}
{{< /code-tab >}}{{< /code-tabs >}}
The `import` at the top references the appropriate curated module for the workflow.
Its path is currently temporary, but only while its proper location is being decided.
The temporary path isn't a problem because one important property of the
[Central Registry](https://registry.cue.works)
is that, once a schema is published, it will always be
available at that location.
When the curated module’s location is finalised and versions are published
under the new path, you can use the
[`cue refactor imports`]({{<relref"docs/reference/command/cue-help-refactor-imports">}})
command to update your CUE easily, so it reflects the new location.

## Tidy your local CUE module
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`]({{<relref"docs/reference/command/cue-help-mod-tidy">}})
when you use a curated module for the first time.

## Validate your workflow
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYw==" }
$ cue vet -c
```
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your workflow.

## Export your workflow as YAML
Before exporting your workflow you'll need to create a directory to hold it, as expected by GitHub Actions:
```text { title="TERMINAL" type="terminal" codeToCopy="bWtkaXIgLXAgLmdpdGh1Yi93b3JrZmxvd3MvCmN1ZSBleHBvcnQgLS1vdXRmaWxlIC5naXRodWIvd29ya2Zsb3dzL3dvcmtmbG93LnltbA==" }
$ mkdir -p .github/workflows/
$ cue export --outfile .github/workflows/workflow.yml
```
If you used the example workflow from above, your validated YAML workflow will look like this:
{{< code-tabs >}}
{{< code-tab name=".github/workflows/workflow.yml" language="yml" area="top-left" >}}
jobs:
  check-bats-version:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
      - run: npm install -g bats
      - run: bats -v
name: learn-github-actions
run-name: ${{ github.actor }} is learning GitHub Actions
"on":
  - push
{{< /code-tab >}}{{< /code-tabs >}}
## Record your new files in git
These files need to be stored in your git repository:
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGFkZCAtdiBjdWUubW9kIC5naXRodWIvd29ya2Zsb3dzLyB3b3JrZmxvdy5jdWUKZ2l0IGNvbW1pdCAtcSAtbSAnQWRkIEdpdEh1YiBBY3Rpb25zIHdvcmtmbG93IHZhbGlkYXRlZCBieSBDVUUn" }
$ git add -v cue.mod .github/workflows/ workflow.cue
add '.github/workflows/workflow.yml'
add 'cue.mod/module.cue'
add 'workflow.cue'
$ git commit -q -m 'Add GitHub Actions workflow validated by CUE'
```
Each time you update your CUE workflow, re-run the `cue export` command from
above, and then use `git` to record any changes to these files.

## Run your workflow
Push your repository and its new workflow to GitHub:
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IHB1c2ggb3JpZ2lu" }
$ git push origin
```
The outcome of your workflow will be visible under the repository's "Actions" tab on GitHub.
