---
title: Getting started with Buildkite + CUE
---

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[YAML pipeline files](https://buildkite.com/docs/pipelines/configure/step-types)
used by [Buildkite pipelines](https://buildkite.com/docs/pipelines).
This guide shows you how to get started defining your Buildkite pipelines in CUE using
[a curated module](/getting-started/buildkite-pipelines/)
from
[the schema library](/getting-started/schema-library/).

<!--more-->

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
``` { .shell-session title="TERMINAL" data-copy="cue mod init cue.example" }
$ cue mod init cue.example
```
You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).
It makes sense for your CUE module to exist at the root of a git repository that's
[configured to trigger Buildkite](https://buildkite.com/docs/pipelines/source-control)
but the commands in this guide will work in any setup.

## Create a pipeline

Declare a Buildkite pipeline in CUE. This one is based on
[a Buildkite example](https://github.com/buildkite/bash-example):

``` { .cue title="pipeline.cue" }
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
```

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

``` { .shell-session title="TERMINAL" data-copy="cue mod tidy" }
$ cue mod tidy
```
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a curated module for the first time.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](../login-central-registry.md)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Validate your pipeline

``` { .shell-session title="TERMINAL" data-copy="cue vet -c" }
$ cue vet -c
```
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your pipeline.

## Export your pipeline as YAML

Before exporting your pipeline you'll need to create a directory to hold it, as expected by Buildkite:
``` { .shell-session title="TERMINAL" data-copy="mkdir .buildkite&#10;cue export --outfile .buildkite/pipeline.yml -e pipelines.example" }
$ mkdir .buildkite
$ cue export --outfile .buildkite/pipeline.yml -e pipelines.example
```

If you chose to export the `pipelines.example` shown above,
your validated YAML pipeline will look like this:

``` { .yml title=".buildkite/pipeline.yml" }
steps:
  - label: ':hammer: Example Script'
    command: "echo \"--- :package: Build job checkout directory\"\npwd\nls -la\necho \"--- :evergreen_tree: Build job environment\"\nenv\necho \"+++ :hammer: Example tests\"\necho \"Congratulations! You've successfully run your first build on Buildkite! \U0001F44D\""
```

## Run your pipeline

The `cue.mod` and `.buildkite` directories need to be stored in your git
repository, along with your `pipeline.cue` file.
After recording them in a commit you can push your branch to your git remote
and trigger the pipeline.
Whenever you update your CUE pipeline, re-run the `cue export` command shown
above, and then use `git` to record any changes to these files and directories.
