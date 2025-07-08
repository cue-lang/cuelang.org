---
title: Getting started with GitHub Actions + CUE
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[YAML workflow files](https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions)
used by [GitHub Actions](https://github.com/features/actions).
This guide shows you how to get started defining your GitHub Actions workflows in CUE using
[a curated module](/getting-started/github-actions-workflows/)
from
[the schema library](/getting-started/schema-library/).

<!--more-->

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

## Create a workflow

Declare a GitHub Actions workflow in CUE. This one is based on an example from
[GitHub's documentation](https://docs.github.com/en/actions/use-cases-and-examples/creating-an-example-workflow#creating-an-example-workflow):

{{{with upload "en" "1"}}}
-- workflow.cue --
package cicd

import "cue.dev/x/githubactions"

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
{{{end}}}

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

{{{with script "en" "tidy"}}}
cue mod tidy
{{{end}}}
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a curated module for the first time.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](../login-central-registry.md)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Validate your workflow

{{{with script "en" "vet"}}}
cue vet -c
{{{end}}}
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your workflow.

## Export your workflow as YAML

Before exporting your workflow you'll need to create a directory to hold it, as expected by GitHub Actions:
{{{with script "en" "export"}}}
mkdir -p .github/workflows/
cue export --outfile .github/workflows/workflow.yml -e workflows.example
{{{end}}}

If you chose to export the `workflows.example` shown above,
your validated YAML workflow will look like this:

{{{with upload "en" "yaml"}}}
#assert
-- .github/workflows/workflow.yml --
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
{{{end}}}

## Run your workflow

The `cue.mod` and `.github` directories need to be stored in your git
repository, along with your `workflow.cue` file.
After recording them in a commit you can push your branch to GitHub and trigger
the workflow.

Whenever you update your CUE workflow, re-run the `cue export` command shown
above, and then use `git` to record any changes to these files and directories.

## Next steps

CUE's powerful and unique language features are often used to reduce
boilerplate -- making sure that important differences stand out when you're
defining multiple configuration files.
Discover how CUE makes configurations clearer, more succinct, and easier to understand in
[DRYing up GitHub Actions workflows](../drying-up-github-actions-workflows/index.md).
