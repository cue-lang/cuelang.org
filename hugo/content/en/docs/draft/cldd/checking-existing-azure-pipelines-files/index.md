---
title: Checking existing Azure Pipelines files using CUE
---

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files.
By adding this check to your development or deployment process
you can catch and fix errors before they affect downstream
systems.

This guide shows you how to use the `cue` command to validate an Azure pipeline
file using
[a curated module](/getting-started/azure-pipelines/) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

The latest pre-release of the `cue` command is required -- please
[upgrade to this version](TODO) if it's not already installed:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.13.0-alpha.3
...
```

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2luICMgb25seSBkdXJpbmcgYmV0YQ==" }
$ cue login # only during beta
```
The
[Central Registry](https://registry.cue.works)
requires authentication while it's in beta testing,
so you need to login before you can use its schemas.

## Choose an Azure pipeline file

This example is adapted from
[the Azure Pipelines documentation](https://learn.microsoft.com/azure/devops/pipelines/process/run-stages),
but you should use any pipeline file that's relevant to your situation.

```yml { title="pipeline.yml" codeToCopy="dHJpZ2dlcjoKICAtIG1haW4KcG9vbDoKICB2bUltYWdlOiB1YnVudHUtbGF0ZXN0CnN0YWdlczoKICAtIHN0YWdlOiBCdWlsZAogICAgZGlzcGxheU5hbWU6IEJ1aWxkIFN0YWdlCiAgICBqb2JzOgogICAgICAtIGpvYjogQnVpbGRKb2IKICAgICAgICBkaXNwbGF5TmFtZTogQnVpbGQgSm9iCiAgICAgICAgc3RlcHM6CiAgICAgICAgICAtIHNjcmlwdDogZWNobyAiUmVzdG9yaW5nIHByb2plY3QgZGVwZW5kZW5jaWVzLi4uIgogICAgICAgICAgICBkaXNwbGF5TmFtZTogUmVzdG9yZSBkZXBlbmRlbmNpZXMKICAgICAgICAgIC0gc2NyaXB0OiBlY2hvICJSdW5uaW5nIHVuaXQgdGVzdHMuLi4iCiAgICAgICAgICAgIGRpc3BsYXlOYW1lOiBSdW4gdW5pdCB0ZXN0cwo=" }
# filepath: pipeline.yml

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

## Validate the pipeline file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1BpcGVsaW5lJyB0ZXN0LmN1ZS53b3Jrcy94MS9henVyZXBpcGVsaW5lc0BsYXRlc3QgcGlwZWxpbmUueW1s" }
$ cue vet -c -d '#Pipeline' test.cue.works/x1/azurepipelines@latest pipeline.yml
```

This command uses the `#Pipeline` definition from the `azurepipelines` package
to check the `pipeline.yml` file. Because `cue vet` doesn't display any errors,
you know that the curated module has validated your configuration file.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Azure Pipelines + CUE]({{<relref"getting-started-with-azure-pipelines-cue">}})
...
