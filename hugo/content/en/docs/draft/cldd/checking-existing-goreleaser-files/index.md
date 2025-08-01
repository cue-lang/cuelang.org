---
title: Checking existing GoReleaser files using CUE
---

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files.
By adding this check to your development or deployment process
you can catch and fix errors before they affect downstream
systems.

This guide shows you how to use the `cue` command to validate a GoReleaser
configuration file using
[a curated module](../curated-module-goreleaser.md) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

<!--more-->

## Choose a GoReleaser configuration file

This example is adapted from the
[`goreleaser/example`](https://github.com/goreleaser/example/blob/master/.goreleaser.yaml)
repository, but you should use any GoReleaser configuration file that's
relevant to your situation.

``` { .yaml title="goreleaser.yml" }
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
```

## Validate the configuration file

``` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#Project&#39; cue.dev/x/goreleaser@latest goreleaser.yml" }
$ cue vet -c -d '#Project' cue.dev/x/goreleaser@latest goreleaser.yml
```

This command uses the `#Project` definition from the `goreleaser` package to
check the `goreleaser.yml` file. Because `cue vet` doesn't display any errors,
you know that the curated module has validated your configuration file.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](../login-central-registry.md)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GoReleaser + CUE](../getting-started-with-goreleaser-cue/index.md)
...
