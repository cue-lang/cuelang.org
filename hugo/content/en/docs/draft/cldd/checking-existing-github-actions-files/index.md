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

<!--more-->

## Choose a GitHub Actions workflow file

This example is adapted from GitHub's
[`actions/starter-workflows`](https://github.com/actions/starter-workflows/blob/main/ci/go.yml)
repository, but you should use any GitHub Actions workflow file that's relevant
to your situation.

``` { .yaml title="workflow.yml" }
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

``` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#Workflow&#39; cue.dev/x/githubactions@latest workflow.yml" }
$ cue vet -c -d '#Workflow' cue.dev/x/githubactions@latest workflow.yml
```

This command uses the `#Workflow` definition from the `githubactions` package
to check the `workflow.yml` file. Because `cue vet` doesn't display any errors,
you know that the curated module has validated your configuration file.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](../login-central-registry.md)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Validate more workflow files

GitHub repositories often contain multiple workflow files whose jobs get
triggered by different events or perform different tasks. To check each
workflow you could repeat the `cue vet` command for one or more files, like
this:

``` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#Workflow&#39; cue.dev/x/githubactions@latest .github/workflows/test.yml&#10;cue vet -c -d &#39;#Workflow&#39; cue.dev/x/githubactions@latest .github/workflows/release.yml" }
$ cue vet -c -d '#Workflow' cue.dev/x/githubactions@latest .github/workflows/test.yml
$ cue vet -c -d '#Workflow' cue.dev/x/githubactions@latest .github/workflows/release.yml
```

However, an easy alternative is to set up a simple CUE file that *embeds* your
workflow files and validates them all with a single command.
Read more about this option in
[Validating multiple GitHub Actions workflow files](../validating-several-github-actions-files/index.md) ...

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GitHub Actions + CUE](../getting-started-with-github-actions-cue/index.md)
...
