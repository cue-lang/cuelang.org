---
title: Getting started with GitHub Actions + CUE
draft: true
no_index: true
---

{{<info>}}
Curated modules are a work in progress and your feedback is important!
Please [report any issues]({{<report-issue-url>}}) you find.
{{</info>}}

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[YAML workflow files](https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions)
used by [GitHub Actions](https://github.com/features/actions).

This guide shows you how to get started defining your GitHub Actions workflows in CUE using
[curated modules]({{<relref"curated-modules-faq">}}).

## Login to the Central Registry
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its schemas.

## Initialise your local CUE module
CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```
You can choose any module name you like - it's easy to
[change it later]({{<relref"docs/reference/command/cue-help-mod-rename">}}).
It makes sense for your CUE module to exist at the root of a git repository
that's hosted on GitHub, but the commands in this guide will work in any setup.

## Create a CUE workflow
{{< code-tabs >}}
{{< code-tab name="workflow.cue" language="cue" area="top-left" >}}
package gha

import "github.com/cue-tmp/jsonschema-pub/exp1/githubactions"

// Workflow taken from https://docs.github.com/en/actions/use-cases-and-examples/creating-an-example-workflow#creating-an-example-workflow
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
The `cue.mod` and `.github` directories need to be stored in your git
repository, along with your `workflow.cue` file.
After recording them in a commit you could then push your branch to GitHub and
watch as the workflow runs.

Each time you update your CUE workflow, re-run the `cue export` command shown
above, and then use `git` to record any changes to these files and directories.
