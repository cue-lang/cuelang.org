---
title: Checking existing Buildkite Pipelines files using CUE
---

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files.
By adding this check to your development or deployment process
you can catch and fix errors before they affect downstream
systems.

This guide shows you how to use the `cue` command to validate a Buildkite
pipeline file using
[a curated module](/getting-started/buildkite-pipelines/) from the
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

## Choose a Buildkite pipeline file

This example comes from the
[`buildkite/golang-example`](https://github.com/buildkite/golang-example)
repository, but you should use any pipeline file that's relevant to your
situation.

```yml { title="pipeline.yml" codeToCopy="c3RlcHM6CiAgLSBuYW1lOiAiOmdvbGFuZzogdGVzdCIKICAgIGNvbW1hbmQ6ICJnbyB0ZXN0IC12IC4vLi4uIgogIC0gbmFtZTogIjpnb2xhbmc6IHZldCIKICAgIGNvbW1hbmQ6ICJnbyB2ZXQgLi8uLi4iCg==" }
# filepath: pipeline.yml

steps:
  - name: ":golang: test"
    command: "go test -v ./..."
  - name: ":golang: vet"
    command: "go vet ./..."
```

## Validate the pipeline file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1BpcGVsaW5lJyB0ZXN0LmN1ZS53b3Jrcy94MS9idWlsZGtpdGVAbGF0ZXN0IHBpcGVsaW5lLnltbA==" }
$ cue vet -c -d '#Pipeline' test.cue.works/x1/buildkite@latest pipeline.yml
```

This command uses the `#Pipeline` definition from the `buildkite` package to
check the `pipeline.yml` file. Because `cue vet` doesn't display any errors,
you know that the curated module has validated your configuration file.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Buildkite + CUE]({{<relref"getting-started-with-buildkite-cue">}})
...
