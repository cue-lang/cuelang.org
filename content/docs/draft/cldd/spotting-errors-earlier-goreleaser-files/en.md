---
title: Spotting errors earlier in GoReleaser files
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

An easy first step with CUE is shown in
[Checking existing GoReleaser files using CUE](../checking-existing-goreleaser-files/index.md).
There, we see the happy path of using `cue vet` to confirm that one of our
existing GoReleaser configuration files is valid.
But what does it look like when one of our manually maintained configuration files
isn't valid?
How does CUE help us catch errors early, before they've had the chance to move
further downstream and waste time, resources, and focus?

This guide shows what happens when the `cue vet` command finds a problem with a
GoReleaser configuration file using a
[curated module](../curated-module-goreleaser.md) from the
CUE [Central Registry](https://registry.cue.works),
and how it highlights the data we need to fix.

<!--more-->

## A broken configuration file

This example is adapted from the
[`goreleaser/example`](https://github.com/goreleaser/example/blob/master/.goreleaser.yaml)
repository -- but the deliberate errors introduced here aren't part
of the original file, of course!

{{{with upload "en" "broken"}}}
-- .goreleaser.yml --
project_name: example
builds:
  - goos: [ linux, windows, darwin ]
    goarch: [ amd64, arm64 ]
    env:
      - CGO_ENABLED=0
docker:
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

We use `cue vet` to validate `.goreleaser.yml` against the `goreleaser` package's `#Project` definition:

{{{with script "en" "cue vet fail"}}}
! cue vet -c -d '#Project' cue.dev/x/goreleaser@latest .goreleaser.yml
{{{end}}}

The `cue vet` command shows us the error (`docker: field not allowed`)

If you see an error message mentioning "too many requests" while following this
guide, then
[login to the Central Registry](../login-central-registry.md)
and re-run the failing command.
The Central Registry allows more requests from authenticated users.

## Fix the configuration file

From the `cue vet` error message we know that the `docker` field isn't permitted.
We check the GoReleaser documentation (or perhaps we review the most recent
change made to the configuration file in our version control system) and discover
that the field should actually be named `dockers`.

We fix our configuration file by updating the highlighted line, so that the
file becomes:

{{{with upload "en" "fixed"}}}
#codetab(.goreleaser.yml) hl_lines="7"
#force
-- .goreleaser.yml --
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

## Re-validate the configuration file

{{{with script "en" "cue vet pass"}}}
cue vet -c -d '#Project' cue.dev/x/goreleaser@latest .goreleaser.yml
{{{end}}}

We know that the curated module has validated our file this time because `cue
vet` doesn't display any errors.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GoReleaser + CUE](../getting-started-with-goreleaser-cue/index.md)
...
