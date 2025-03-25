---
title: Spotting errors earlier in Argo Workflows files
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

An easy first step with CUE is shown in
[Checking existing Argo Workflows files using CUE]({{<relref"checking-existing-argo-workflows-files">}}).
There, we see the happy path of using `cue vet` to confirm that one of our
existing Argo Workflows files is valid.
But what does it look like when one of our manually maintained workflow files
isn't valid?
How does CUE help us catch errors early, before they've had the chance to move
further downstream and waste time, resources, and focus?

This guide shows what happens when the `cue vet` command finds a problem with an
Argo workflow file using a
[curated module]({{<relref"curated-modules-faq">}}) from the
CUE [Central Registry](https://registry.cue.works),
and how it highlights the data we need to fix.

## Login to the Central Registry

{{{with script "en" "cue login"}}}
#norun
cue login
{{{end}}}
The
[Central Registry](https://registry.cue.works)
requires authentication, so we need to login before using its modules.

## A broken Argo workflow file

This example is adapted from
[the Argo Workflows project](https://github.com/argoproj/argo-workflows/blob/main/examples/arguments-parameters.yaml)
-- but the deliberate errors introduced here aren't part of the original file,
of course!

{{{with upload "en" "workflow broken"}}}
-- workflow.yml --
apiVersion: argoproj.io/v1alpha1
kind: workflow
metadata:
  generateName: arguments-parameters-
spec:
  entrypoint: print-message
  arguments:
    parameters:
    - name: message
      value: hello world
  templates:
  - name: print-message
    inputs:
      parameters:
      - name: message
    container:
      image: busybox
      command: [echo]
      args: ["{{inputs.parameters.message}}"]
{{{end}}}

## Validate the workflow file

We use `cue vet` to validate `workflow.yml` against the `githubactions` package's `#Workflow` definition:

{{{with script "en" "cue vet fail"}}}
! cue vet -c -d '#Workflow' github.com/cue-tmp/jsonschema-pub/exp3/argocd@latest workflow.yml
{{{end}}}

The `cue vet` command shows us the error (`job: field not allowed`), and tells
us the location of the problem (line 5 of our data file).

## Fix the workflow file

From the `cue vet` error message we know that the `job` field isn't permitted.
We check the GitHub Actions documentation (or perhaps we review the most recent
change made to the workflow file in our version control system) and discover
that the field should actually be named `jobs`.

We fix our workflow file by updating the highlighted line that `cue vet`
mentioned, so that the file becomes:

{{{with upload "en" "workflow fixed"}}}
#codetab(workflow.yml) hl_lines=7
#force
-- workflow.yml --
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
{{{end}}}

## Re-validate the workflow file

{{{with script "en" "cue vet pass"}}}
cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/githubactions@latest workflow.yml -d '#Workflow'
{{{end}}}

We know that the curated module has validated our file this time because `cue
vet` doesn't display any errors.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GitHub Actions + CUE]({{<relref"getting-started-with-github-actions-cue">}})
...
