---
title: Checking existing Azure Pipelines files using CUE
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files.
By adding this check to your development or deployment process
you can catch and fix errors before they affect downstream
systems.

This guide shows you how to use the `cue` command to validate an Azure pipeline
file using
[a curated module](../curated-module-azure-pipelines.md) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

<!--more-->

## Choose an Azure pipeline file

This example is adapted from
[the Azure Pipelines documentation](https://learn.microsoft.com/azure/devops/pipelines/process/run-stages),
but you should use any pipeline file that's relevant to your situation.

{{{with upload "en" "pipeline"}}}
-- pipeline.yml --
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
{{{end}}}

## Validate the pipeline file

{{{with script "en" "cue vet"}}}
cue vet -c -d '#Pipeline' cue.dev/x/azurepipelines@latest pipeline.yml
{{{end}}}

This command uses the `#Pipeline` definition from the `azurepipelines` package
to check the `pipeline.yml` file. Because `cue vet` doesn't display any errors,
you know that the curated module has validated your configuration file.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](../login-central-registry.md)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Azure Pipelines + CUE](../getting-started-with-azure-pipelines-cue/index.md)
...
