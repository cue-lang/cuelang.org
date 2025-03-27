---
title: Checking existing GoReleaser files using CUE
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

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files.
By adding this check to your development or deployment process
you can catch and fix errors before they affect downstream
systems.

This guide shows you how to use the `cue` command to validate a GoReleaser
configuration file using a
[curated module](https://cuelang.org/docs/draft/cldd/curated-modules-faq/) from the
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

## Choose a GoReleaser configuration file

This example is adapted from the
[`goreleaser/example`](https://github.com/goreleaser/example/blob/master/.goreleaser.yaml)
repository, but you should use any GoReleaser configuration file that's
relevant to your situation.

{{{with upload "en" "file"}}}
-- goreleaser.yml --
project_name: example
builds:
  - goos: [ linux, windows, darwin ]
    goarch: [ amd64, arm64 ]
    env:
      - CGO_ENABLED=0
dockers:
  - dockerfile: Dockerfile
    image_templates:
      - ghcr.io/goreleaser/example:{{ .Version }}
    build_flag_templates:
      - --label=org.opencontainers.image.title={{ .ProjectName }}
      - --label=org.opencontainers.image.url=https://github.com/goreleaser/example
nfpms:
  - formats: [ deb, rpm, apk ]
    homepage: https://github.com/caarlos0/tasktimer
    maintainer: Carlos A Becker <root@carlosbecker.dev>
    description: Sample project.
    license: MIT
{{{end}}}

## Validate the configuration file

{{{with script "en" "cue vet"}}}
cue vet -c -d '#Project' test.cue.works/x1/goreleaser@latest goreleaser.yml
{{{end}}}

This command uses the `#Project` definition from the `goreleaser` package to
check the `goreleaser.yml` file. Because `cue vet` doesn't display any errors,
you know that the curated module has validated your configuration file.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GoReleaser + CUE]({{<relref"getting-started-with-goreleaser-cue">}})
...
