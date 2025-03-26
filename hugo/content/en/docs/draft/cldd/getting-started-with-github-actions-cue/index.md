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
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).
It makes sense for your CUE module to exist at the root of a git repository
that's hosted on GitHub, but the commands in this guide will work in any setup.

## Create a workflow

Declare a GitHub Actions workflow in CUE. This one is based on an example from
[GitHub's documentation](https://docs.github.com/en/actions/use-cases-and-examples/creating-an-example-workflow#creating-an-example-workflow):

```cue { title="workflow.cue" codeToCopy="cGFja2FnZSBjaWNkCgppbXBvcnQgImdpdGh1Yi5jb20vY3VlLXRtcC9qc29uc2NoZW1hLXB1Yi9leHAzL2dpdGh1YmFjdGlvbnMiCgp3b3JrZmxvd3M6IGV4YW1wbGU6IGdpdGh1YmFjdGlvbnMuI1dvcmtmbG93ICYgewoJbmFtZTogICAgICAgImxlYXJuLWdpdGh1Yi1hY3Rpb25zIgoJInJ1bi1uYW1lIjogIiR7eyBnaXRodWIuYWN0b3IgfX0gaXMgbGVhcm5pbmcgR2l0SHViIEFjdGlvbnMiCglvbjogWyJwdXNoIl0KCWpvYnM6ICJjaGVjay1iYXRzLXZlcnNpb24iOiB7CgkJInJ1bnMtb24iOiAidWJ1bnR1LWxhdGVzdCIKCQlzdGVwczogWwoJCQl7dXNlczogImFjdGlvbnMvY2hlY2tvdXRAdjQifSwKCQkJe3VzZXM6ICJhY3Rpb25zL3NldHVwLW5vZGVAdjQiLCB3aXRoOiAibm9kZS12ZXJzaW9uIjogIjIwIn0sCgkJCXtydW46ICJucG0gaW5zdGFsbCAtZyBiYXRzIn0sCgkJCXtydW46ICJiYXRzIC12In0sCgkJXQoJfQp9Cg==" }
// filepath: workflow.cue

package cicd

import "github.com/cue-tmp/jsonschema-pub/exp3/githubactions"

workflows: example: githubactions.#Workflow & {
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
```

In later guides we'll add more entries to the `workflows` struct.

The `import` at the top references the appropriate curated module for the workflow.
Its path is currently temporary, but only while its proper location is being decided.
The temporary path isn't a problem because one important property of the
[Central Registry](https://registry.cue.works)
is that, once a schema is published, it will always be
available at that location.
When the curated module’s location is finalised and versions are published
under the new path, you can use the
[`cue refactor imports`](https://cuelang.org/docs/reference/command/cue-help-refactor-imports/)
command to update your CUE easily, so it reflects the new location.

## Tidy your local CUE module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a curated module for the first time.

## Validate your workflow

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYw==" }
$ cue vet -c
```
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your workflow.

## Export your workflow as YAML

Before exporting your workflow you'll need to create a directory to hold it, as expected by GitHub Actions:
```text { title="TERMINAL" type="terminal" codeToCopy="bWtkaXIgLXAgLmdpdGh1Yi93b3JrZmxvd3MvCmN1ZSBleHBvcnQgLS1vdXRmaWxlIC5naXRodWIvd29ya2Zsb3dzL3dvcmtmbG93LnltbCAtZSB3b3JrZmxvd3MuZXhhbXBsZQ==" }
$ mkdir -p .github/workflows/
$ cue export --outfile .github/workflows/workflow.yml -e workflows.example
```
If you chose to export the `workflows.example` shown above,
your validated YAML workflow will look like this:
```yml { title=".github/workflows/workflow.yml" codeToCopy="bmFtZTogbGVhcm4tZ2l0aHViLWFjdGlvbnMKam9iczoKICBjaGVjay1iYXRzLXZlcnNpb246CiAgICBydW5zLW9uOiB1YnVudHUtbGF0ZXN0CiAgICBzdGVwczoKICAgICAgLSB1c2VzOiBhY3Rpb25zL2NoZWNrb3V0QHY0CiAgICAgIC0gdXNlczogYWN0aW9ucy9zZXR1cC1ub2RlQHY0CiAgICAgICAgd2l0aDoKICAgICAgICAgIG5vZGUtdmVyc2lvbjogIjIwIgogICAgICAtIHJ1bjogbnBtIGluc3RhbGwgLWcgYmF0cwogICAgICAtIHJ1bjogYmF0cyAtdgoib24iOgogIC0gcHVzaApydW4tbmFtZTogJHt7IGdpdGh1Yi5hY3RvciB9fSBpcyBsZWFybmluZyBHaXRIdWIgQWN0aW9ucwo=" }
# filepath: .github/workflows/workflow.yml

name: learn-github-actions
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
"on":
  - push
run-name: ${{ github.actor }} is learning GitHub Actions
```
## Run your workflow

The `cue.mod` and `.github` directories need to be stored in your git
repository, along with your `workflow.cue` file.
After recording them in a commit you can push your branch to GitHub and trigger
the workflow.

Whenever you update your CUE workflow, re-run the `cue export` command shown
above, and then use `git` to record any changes to these files and directories.
