---
title: Checking existing GitHub Actions files using CUE
---

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files.
By adding this check to your development or deployment process
you can catch and fix errors before they affect downstream
systems.

This guide shows you how to use the `cue` command to validate a GitHub Actions
workflow file using
[a curated module](/getting-started/github-actions-workflows/) from the
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

## Choose a GitHub Actions workflow file

This example is adapted from GitHub's
[`actions/starter-workflows`](https://github.com/actions/starter-workflows/blob/main/ci/go.yml)
repository, but you should use any GitHub Actions workflow file that's relevant
to your situation.

```yml { title="workflow.yml" codeToCopy="bmFtZTogR28Kb246CiAgcHVsbF9yZXF1ZXN0OgogICAgYnJhbmNoZXM6IFsgbWFpbiBdCmpvYnM6CiAgYnVpbGQ6CiAgICBydW5zLW9uOiB1YnVudHUtbGF0ZXN0CiAgICBzdGVwczoKICAgIC0gdXNlczogYWN0aW9ucy9jaGVja291dEB2NAogICAgLSBuYW1lOiBTZXQgdXAgR28KICAgICAgdXNlczogYWN0aW9ucy9zZXR1cC1nb0B2NAogICAgICB3aXRoOgogICAgICAgIGdvLXZlcnNpb246ICcxLjIwJwogICAgLSBuYW1lOiBCdWlsZAogICAgICBydW46IGdvIGJ1aWxkIC12IC4vLi4uCiAgICAtIG5hbWU6IFRlc3QKICAgICAgcnVuOiBnbyB0ZXN0IC12IC4vLi4uCg==" }
# filepath: workflow.yml

name: Go
on:
  pull_request:
    branches: [ main ]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Set up Go
      uses: actions/setup-go@v4
      with:
        go-version: '1.20'
    - name: Build
      run: go build -v ./...
    - name: Test
      run: go test -v ./...
```

## Validate the workflow file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1dvcmtmbG93JyBjdWUuZGV2L3gvZ2l0aHViYWN0aW9uc0BsYXRlc3Qgd29ya2Zsb3cueW1s" }
$ cue vet -c -d '#Workflow' cue.dev/x/githubactions@latest workflow.yml
```

This command uses the `#Workflow` definition from the `githubactions` package
to check the `workflow.yml` file. Because `cue vet` doesn't display any errors,
you know that the curated module has validated your configuration file.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GitHub Actions + CUE]({{<relref"getting-started-with-github-actions-cue">}})
...
