---
title: Getting started with Azure Pipelines + CUE
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
[YAML pipeline files](https://learn.microsoft.com/azure/devops/pipelines/yaml-schema)
used by [Azure pipelines](https://learn.microsoft.com/azure/devops/pipelines).

This guide shows you how to get started defining your Azure pipelines in CUE using
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
[change it later]({{<relref"docs/reference/command/cue-help-mod-rename">}}).
It makes sense for your CUE module to exist at the root of a git repository that's
[supported by Azure Pipelines](https://learn.microsoft.com/azure/devops/pipelines/repos),
but the commands in this guide will work in any setup.

## Create a pipeline

Declare a Azure pipeline in CUE. This one is based on
[an example from GitHub](https://github.com/geekzter/azure-pipeline-examples/blob/main/install-dotnet-sdk.yml):

{{{with upload "en" "1"}}}
-- pipeline.cue --
package cicd

import "github.com/cue-tmp/jsonschema-pub/exp3/azurepipelines"

pipelines: example: azurepipelines.#Pipeline & {
	parameters: [{
		name:        "dotNetVersion"
		displayName: ".NET Version (e.g. 3.1.x, 6.x, 8.x)"
		type:        "string"
		default:     "8.x"
	}, {
		name:        "vmImage"
		displayName: "Agent image"
		type:        "string"
		default:     "windows-latest"
		values: [
			"macos-latest",
			"ubuntu-latest",
			"windows-latest",
		]
	}]
	trigger: "none"
	schedules: [{
		cron:        "0 1 * * *"
		displayName: "Nightly build (UTC)"
		always:      "true"
		branches: include: ["main"]
	}]
	name: "$(Date:yyyyMMdd)$(Rev:.r)-$(Build.DefinitionVersion)-${{ parameters.vmImage }}-dotnet-${{ parameters.dotNetVersion }}-$(SourceBranchName)-$(Build.BuildId)"
	jobs: [{
		job:         "usedotnet"
		displayName: "Use .NET SDK ${{ parameters.dotNetVersion }}"
		pool: {
			name:    "Azure Pipelines"
			vmImage: "${{ parameters.vmImage }}"
		}
		steps: [{
			pwsh:        "dotnet --list-sdks"
			displayName: "List .NET SDKs"
		}, {
			task:        "UseDotNet@2"
			displayName: "Use .NET SDK ${{ parameters.dotNetVersion }}"
			inputs: version: "${{ parameters.dotNetVersion }}"
		}, {
			pwsh:        "dotnet --list-sdks"
			displayName: "List .NET SDKs"
		}]
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
[`cue refactor imports`]({{<relref"docs/reference/command/cue-help-refactor-imports">}})
command to update your CUE easily, so it reflects the new location.

## Tidy your local CUE module

{{{with script "en" "tidy"}}}
cue mod tidy
{{{end}}}
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`]({{<relref"docs/reference/command/cue-help-mod-tidy">}})
when you use a curated module for the first time.

## Validate your pipeline

{{{with script "en" "vet"}}}
export CUE_EXPERIMENT=evalv3=1
cue vet -c
{{{end}}}
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your pipeline.

The `#Pipeline` schema that's referenced requires the use of CUE's new `v3`
evaluator via the `CUE_EXPERIMENT` environment variable.
{{<linkto/inline"concept/faq/upgrading-from-evalv2-to-evalv3">}} provides more
information about this evaluator version.

## Export your pipeline as YAML

{{{with script "en" "export"}}}
cue export --outfile pipeline.yml -e pipelines.example
{{{end}}}
{{{with _script_ "en" "HIDDEN: move before diff"}}}
mv pipeline.yml{,.got}
{{{end}}}

If you chose to export the `pipelines.example` shown above,
your validated YAML pipeline will look like this:
{{{with upload "en" "yaml"}}}
-- pipeline.yml --
parameters:
  - name: dotNetVersion
    displayName: .NET Version (e.g. 3.1.x, 6.x, 8.x)
    type: string
    default: 8.x
  - name: vmImage
    displayName: Agent image
    type: string
    default: windows-latest
    values:
      - macos-latest
      - ubuntu-latest
      - windows-latest
trigger: none
schedules:
  - cron: 0 1 * * *
    displayName: Nightly build (UTC)
    always: "true"
    branches:
      include:
        - main
name: $(Date:yyyyMMdd)$(Rev:.r)-$(Build.DefinitionVersion)-${{ parameters.vmImage }}-dotnet-${{ parameters.dotNetVersion }}-$(SourceBranchName)-$(Build.BuildId)
jobs:
  - job: usedotnet
    displayName: Use .NET SDK ${{ parameters.dotNetVersion }}
    pool:
      name: Azure Pipelines
      vmImage: ${{ parameters.vmImage }}
    steps:
      - pwsh: dotnet --list-sdks
        displayName: List .NET SDKs
      - task: UseDotNet@2
        displayName: Use .NET SDK ${{ parameters.dotNetVersion }}
        inputs:
          version: ${{ parameters.dotNetVersion }}
      - pwsh: dotnet --list-sdks
        displayName: List .NET SDKs
{{{end}}}
{{{with _script_ "en" "HIDDEN: diff"}}}
diff -u pipeline.yml{,.got}
{{{end}}}

## Run your pipeline

The `cue.mod` directory needs to be stored in your git repository, along with
your `pipeline.cue` and `pipeline.yml` files. After recording them in a commit
you can push your branch to your git remote and trigger the pipeline.

Whenever you update your CUE pipeline, re-run the `cue export` command shown
above, and then use `git` to record any changes to these files and directories.
