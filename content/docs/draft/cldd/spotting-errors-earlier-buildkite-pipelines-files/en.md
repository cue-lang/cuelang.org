---
title: Spotting errors earlier in Buildkite Pipelines files
draft: true
no_index: true
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD

# TODO(jm): revert to latest when it has evalv3 as default.
export PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH
{{{end}}}

An easy first step with CUE is shown in
[Checking existing Buildkite Pipelines files using CUE]({{<relref"checking-existing-buildkite-pipelines-files">}}).
There, we see the happy path of using `cue vet` to confirm that one of our
existing Buildkite pipeline files is valid.
But what does it look like when one of our manually maintained pipeline files
isn't valid?
How does CUE help us catch errors early, before they've had the chance to move
further downstream and waste time, resources, and focus?

This guide shows what happens when the `cue vet` command finds a problem with a
Buildkite pipeline file using a
[curated module](/getting-started/buildkite-pipelines/) from the
CUE [Central Registry](https://registry.cue.works),
and how it highlights the data we need to fix.

## Login to the Central Registry

{{{with script "en" "cue login"}}}
#norun
cue login # only during beta
{{{end}}}
The
[Central Registry](https://registry.cue.works)
requires authentication while it's in beta testing,
so we need to login before using its modules.

## A broken pipeline file

This example comes from the
[`buildkite/golang-example`](https://github.com/buildkite/golang-example)
repository -- but the deliberate errors introduced here aren't part of the
original file, of course!

{{{with upload "en" "broken"}}}
-- pipeline.yml --
step:
  - name: ":golang: test"
    command: "go test -v ./..."
  - name: ":golang: vet"
    command: "go vet ./..."
{{{end}}}

## Validate the pipeline file

We use `cue vet` to validate `pipeline.yml` against the `buildkite` package's `#Pipeline` definition:

{{{with script "en" "cue vet fail"}}}
! cue vet -c -d '#Pipeline' cue.dev/x/buildkite@latest pipeline.yml
{{{end}}}

The `cue vet` command shows us the error (`steps: field is required but not
present`).

## Fix the pipeline file

From the `cue vet` error message we know that the `steps` field is missing.
We check the Buildkite Pipelines documentation (or perhaps we review the most recent
change made to the pipeline file in our version control system) and discover
that our `step` field should actually be named `steps`.

We fix our pipeline file by updating the highlighted line, so that the file
becomes:

{{{with upload "en" "fixed"}}}
#codetab(pipeline.yml) hl_lines=3
#force
-- pipeline.yml --
steps:
  - name: ":golang: test"
    command: "go test -v ./..."
  - name: ":golang: vet"
    command: "go vet ./..."
{{{end}}}

## Re-validate the pipeline file

{{{with script "en" "cue vet pass"}}}
cue vet -c -d '#Pipeline' cue.dev/x/buildkite@latest pipeline.yml
{{{end}}}

We know that the curated module has validated our file this time because `cue
vet` doesn't display any errors.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Buildkite Pipelines + CUE]({{<relref"getting-started-with-buildkite-cue">}})
...
