---
title: Spotting errors earlier in GitHub Actions files
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
[Checking existing GitHub Actions files using CUE]({{<relref"checking-existing-github-actions-files">}}).
There, we see the happy path of using `cue vet` to confirm that one of our
existing GitHub Actions workflow files is valid.
But what does it look like when one of our manually maintained workflow files
isn't valid?
How does CUE help us catch errors early, before they've had the chance to move
further downstream and waste time, resources, and focus?

This guide shows what happens when the `cue vet` command finds a problem with a
GitHub Actions workflow file using a
[curated module](/getting-started/github-actions-workflows/) from the
CUE [Central Registry](https://registry.cue.works),
and how it highlights the data we need to fix.

## Login to the Central Registry

{{{with script "en" "cue login"}}}
#norun
cue login # only during beta
{{{end}}}
The
[Central Registry](https://registry.cue.works)
requires authentication while it’s in beta testing,
so we need to login before using its modules.

## A broken workflow file

This example is adapted from GitHub's
[`actions/starter-workflows`](https://github.com/actions/starter-workflows/blob/main/ci/go.yml)
repository -- but the deliberate errors introduced here aren't part
of the original file, of course!

{{{with upload "en" "broken"}}}
-- workflow.yml --
name: Go
on:
  pull_request:
    branches: [ main ]
job:
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

## Validate the workflow file

We use `cue vet` to validate `workflow.yml` against the `githubactions` package's `#Workflow` definition:

{{{with script "en" "cue vet fail"}}}
! cue vet -c -d '#Workflow' cue.dev/x/githubactions@latest workflow.yml
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

{{{with upload "en" "fixed"}}}
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
cue vet -c -d '#Workflow' cue.dev/x/githubactions@latest workflow.yml
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
