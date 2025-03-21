---
title: Checking existing GitHub Actions files using CUE
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

# Use evalv3, as that's required for curated modules.
# TODO(jm): remove this after the site's cmd/cue tip version reaches a version
# which has evalv3 enabled by default.
export CUE_EXPERIMENT=evalv3=1
{{{end}}}

{{<info>}}
[Curated modules]({{<relref"curated-modules-faq">}})
are a work in progress and your feedback is important!
Please [report any issues]({{<report-issue-url>}}) you find.
{{</info>}}

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files that you normally update by hand.
By adding this check to your development or deployment process, manually
introduced data errors can be caught and fixed before they affect downstream
systems.

This guide shows you how to use the `cue` command to validate a GitHub Actions
workflow file using a
[curated module]({{<relref"docs/draft/cldd/curated-modules-faq">}}) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

## Login to the Central Registry

{{{with script "en" "cue login"}}}
#norun
cue login
{{{end}}}
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its modules.

## Choose a GitHub Actions workflow file

In this example we fetch
[a starter workflow](https://github.com/actions/starter-workflows/blob/main/ci/go.yml)
from GitHub's `actions/starter-workflows` repository, but you should use any
workflow file that's relevant to your situation.

{{{with script "en" "fetch workflow"}}}
#We choose to perform this fetch (instead of faking it with #norun) to ensure
#that the remote file is still live and we're not pointing to a dead URL.
#We perform the fetch instead of embedding & displaying the file inline as that
#would lengthen what can otherwise be a powerfully short and succinct guide.
curl -sl -o workflow.yml https://raw.githubusercontent.com/actions/starter-workflows/a413869948c7f5d5610b00346997272c4ba33f84/ci/go.yml
{{{end}}}

{{{with _upload_ "en" "known-good workflow content"}}}
-- workflow.want.yml --
# This workflow will build a golang project
# For more information see: https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-go

name: Go

on:
  push:
    branches: [ $default-branch ]
  pull_request:
    branches: [ $default-branch ]

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

{{{with _script_ "en" "check remote file is as expected"}}}
# Given we're fetching a static file, we can verify its contents against the known-good file.
diff -u workflow{.want,}.yml
{{{end}}}

## Validate the workflow file

{{{with script "en" "cue vet"}}}
cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/githubactions@latest workflow.yml -d '#Workflow'
{{{end}}}

Because `cue vet` doesn't display any errors,
you know that the curated module has validated your configuration file.

The module path used here is temporary, and will be given a proper home soon.
However, because one important property of the
[Central Registry](https://registry.cue.works) is that curated modules are
never removed, **you can rely on this "temporary" path for as long as you
need** -- it will not stop working and break your processes in the future.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
{{<linkto/inline"draft/cldd/getting-started-with-github-actions-cue">}} ...
