---
title: Getting started with Azure Pipelines + CUE
---

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[YAML pipeline files](https://learn.microsoft.com/azure/devops/pipelines/yaml-schema)
used by [Azure pipelines](https://learn.microsoft.com/azure/devops/pipelines).
This guide shows you how to get started defining your Azure pipelines in CUE using
[a curated module](../curated-module-azure-pipelines.md)
from
[the schema library](/getting-started/schema-library/).

<!--more-->

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
``` { .text title="TERMINAL" data-copy="cue mod init cue.example" }
$ cue mod init cue.example
```
You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).
It makes sense for your CUE module to exist at the root of a git repository that's
[supported by Azure Pipelines](https://learn.microsoft.com/azure/devops/pipelines/repos),
but the commands in this guide will work in any setup.

## Create a pipeline

Declare a Azure pipeline in CUE. This one is based on an example from
[the Azure Pipelines documentation](https://learn.microsoft.com/azure/devops/pipelines/process/run-stages):

``` { .cue title="pipeline.cue" }
package cicd

import "cue.dev/x/azurepipelines"

pipelines: example: azurepipelines.#Pipeline & {
	trigger: ["main"]
	pool: vmImage: "ubuntu-latest"
	stages: [{
		stage:       "Build"
		displayName: "Build Stage"
		jobs: [{
			job:         "BuildJob"
			displayName: "Build Job"
			steps: [{
				script: """
					echo "Restoring project dependencies..."
					"""
				displayName: "Restore dependencies"
			}, {
				script: """
					echo "Running unit tests..."
					"""
				displayName: "Run unit tests"
			}]
		}]
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

``` { .text title="TERMINAL" data-copy="cue mod tidy" }
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

``` { .text title="TERMINAL" data-copy="cue vet -c" }
$ cue vet -c
```
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your pipeline.

## Export your pipeline as YAML

``` { .text title="TERMINAL" data-copy="cue export --outfile pipeline.yml -e pipelines.example" }
$ cue export --outfile pipeline.yml -e pipelines.example
```

If you chose to export the `pipelines.example` shown above,
your validated YAML pipeline will look like this:

``` { .yaml title="pipeline.yml" }
trigger:
  - main
pool:
  vmImage: ubuntu-latest
stages:
  - stage: Build
    displayName: Build Stage
    jobs:
      - job: BuildJob
        displayName: Build Job
        steps:
          - script: echo "Restoring project dependencies..."
            displayName: Restore dependencies
          - script: echo "Running unit tests..."
            displayName: Run unit tests
```

## Run your pipeline

The `cue.mod` directory needs to be stored in your git repository, along with
your `pipeline.cue` and `pipeline.yml` files. After recording them in a commit
you can push your branch to your git remote and trigger the pipeline.
Whenever you update your CUE pipeline, re-run the `cue export` command shown
above, and then use `git` to record any changes to these files and directories.
