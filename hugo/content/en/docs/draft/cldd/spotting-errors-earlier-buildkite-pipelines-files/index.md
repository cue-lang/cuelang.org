---
title: Spotting errors earlier in Buildkite Pipelines files
---

An easy first step with CUE is shown in
[Checking existing Buildkite Pipelines files using CUE](../checking-existing-buildkite-pipelines-files/index.md).
There, we see the happy path of using `cue vet` to confirm that one of our
existing Buildkite pipeline files is valid.
But what does it look like when one of our manually maintained pipeline files
isn't valid?
How does CUE help us catch errors early, before they've had the chance to move
further downstream and waste time, resources, and focus?

This guide shows what happens when the `cue vet` command finds a problem with a
Buildkite pipeline file using a
[curated module](../curated-module-buildkite-pipelines.md) from the
CUE [Central Registry](https://registry.cue.works),
and how it highlights the data we need to fix.

<!--more-->

## A broken pipeline file

This example comes from the
[`buildkite/golang-example`](https://github.com/buildkite/golang-example)
repository -- but the deliberate errors introduced here aren't part of the
original file, of course!

``` { .yaml title="pipeline.yml" }
step:
  - name: ":golang: test"
    command: "go test -v ./..."
  - name: ":golang: vet"
    command: "go vet ./..."
```

## Validate the pipeline file

We use `cue vet` to validate `pipeline.yml` against the `buildkite` package's `#Pipeline` definition:

``` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#Pipeline&#39; cue.dev/x/buildkite@latest pipeline.yml" }
$ cue vet -c -d '#Pipeline' cue.dev/x/buildkite@latest pipeline.yml
steps: field is required but not present:
    .cache/cue/mod/extract/cue.dev/x/buildkite@v0.1.0/schema.cue:16:2
```

The `cue vet` command shows us the error (`steps: field is required but not
present`).

If you see an error message mentioning "too many requests" while following this
guide, then
[login to the Central Registry](../login-central-registry.md)
and re-run the failing command.
The Central Registry allows more requests from authenticated users.

## Fix the pipeline file

From the `cue vet` error message we know that the `steps` field is missing.
We check the Buildkite Pipelines documentation (or perhaps we review the most recent
change made to the pipeline file in our version control system) and discover
that our `step` field should actually be named `steps`.

We fix our pipeline file by updating the highlighted line, so that the file
becomes:

``` { .yaml title="pipeline.yml" hl_lines="1" }
steps:
  - name: ":golang: test"
    command: "go test -v ./..."
  - name: ":golang: vet"
    command: "go vet ./..."
```

## Re-validate the pipeline file

``` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#Pipeline&#39; cue.dev/x/buildkite@latest pipeline.yml" }
$ cue vet -c -d '#Pipeline' cue.dev/x/buildkite@latest pipeline.yml
```

We know that the curated module has validated our file this time because `cue
vet` doesn't display any errors.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Buildkite Pipelines + CUE](../getting-started-with-buildkite-cue/index.md)
...
