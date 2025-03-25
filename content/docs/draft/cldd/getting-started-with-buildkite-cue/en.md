---
title: Getting started with Buildkite + CUE
draft: true
no_index: true
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD

# Switch to CUE tip, as this page will only be seen on tip.cuelang.org
# and it's easiest to align behaviours here, inline, rather than using
# the internal/patch/tip.diff mechanism.
export PATH=/cues/$CUELANG_CUE_TIP:$PATH
{{{end}}}

{{<info>}}
Curated modules are a work in progress and your feedback is important!
Please [report any issues]({{<report-issue-url>}}) you find.
{{</info>}}

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[YAML pipeline files](https://buildkite.com/docs/pipelines/configure/step-types)
used by [Buildkite pipelines](https://buildkite.com/docs/pipelines).

This guide shows you how to get started defining your Buildkite pipelines in CUE using
[curated modules]({{<relref"curated-modules-faq">}}).

## Login to the Central Registry

{{{with script "en" "cue login"}}}
#norun
cue login
{{{end}}}
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its schemas.

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
{{{with script "en" "cue mod init"}}}
cue mod init cue.example
{{{end}}}
You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).
It makes sense for your CUE module to exist at the root of a git repository that's
[configured to trigger Buildkite](https://buildkite.com/docs/pipelines/source-control)
but the commands in this guide will work in any setup.

## Create a pipeline

Declare a Buildkite pipeline in CUE. This one is based on
[a Buildkite example](https://github.com/buildkite/bash-example):

{{{with upload "en" "1"}}}
-- pipeline.cue --
package cicd

import "github.com/cue-tmp/jsonschema-pub/exp1/buildkite"

pipelines: example: buildkite.#Pipeline & {
	steps: [{
		label: ":hammer: Example Script"
		command: """
			echo "--- :package: Build job checkout directory"
			pwd
			ls -la
			echo "--- :evergreen_tree: Build job environment"
			env
			echo "+++ :hammer: Example tests"
			echo "Congratulations! You've successfully run your first build on Buildkite! 👍"
			"""
	}]
}
{{{end}}}

In later guides we'll add more entries to the `pipelines` struct.

The `import` at the top references the appropriate curated module for the pipeline.
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

## Validate your pipeline

{{{with script "en" "vet"}}}
cue vet -c
{{{end}}}
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your pipeline.

## Export your pipeline as YAML

Before exporting your pipeline you'll need to create a directory to hold it, as expected by Buildkite:
{{{with script "en" "export"}}}
mkdir .buildkite
cue export --outfile .buildkite/pipeline.yml -e pipelines.example
{{{end}}}
{{{with _script_ "en" "HIDDEN: move before diff"}}}
mv .buildkite/pipeline.yml{,.got}
{{{end}}}

If you chose to export the `pipelines.example` shown above,
your validated YAML pipeline will look like this:
{{{with upload "en" "yaml"}}}
-- .buildkite/pipeline.yml --
steps:
  - label: ':hammer: Example Script'
    command: "echo \"--- :package: Build job checkout directory\"\npwd\nls -la\necho \"--- :evergreen_tree: Build job environment\"\nenv\necho \"+++ :hammer: Example tests\"\necho \"Congratulations! You've successfully run your first build on Buildkite! \U0001F44D\""
{{{end}}}
{{{with _script_ "en" "HIDDEN: diff"}}}
diff -u .buildkite/pipeline.yml{,.got}
{{{end}}}

## Run your pipeline

The `cue.mod` and `.buildkite` directories need to be stored in your git
repository, along with your `pipeline.cue` file.
After recording them in a commit you can push your branch to your git remote
and trigger the pipeline.
Whenever you update your CUE pipeline, re-run the `cue export` command shown
above, and then use `git` to record any changes to these files and directories.
