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
[a curated module](/getting-started/goreleaser/) from the
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

## Choose a GoReleaser configuration file

This example is adapted from the
[`goreleaser/example`](https://github.com/goreleaser/example/blob/master/.goreleaser.yaml)
repository, but you should use any GoReleaser configuration file that's
relevant to your situation.

```yml { title="goreleaser.yml" codeToCopy="cHJvamVjdF9uYW1lOiBleGFtcGxlCmJ1aWxkczoKICAtIGdvb3M6IFsgbGludXgsIHdpbmRvd3MsIGRhcndpbiBdCiAgICBnb2FyY2g6IFsgYW1kNjQsIGFybTY0IF0KICAgIGVudjoKICAgICAgLSBDR09fRU5BQkxFRD0wCmRvY2tlcnM6CiAgLSBkb2NrZXJmaWxlOiBEb2NrZXJmaWxlCiAgICBpbWFnZV90ZW1wbGF0ZXM6CiAgICAgIC0gZ2hjci5pby9nb3JlbGVhc2VyL2V4YW1wbGU6e3sgLlZlcnNpb24gfX0KICAgIGJ1aWxkX2ZsYWdfdGVtcGxhdGVzOgogICAgICAtIC0tbGFiZWw9b3JnLm9wZW5jb250YWluZXJzLmltYWdlLnRpdGxlPXt7IC5Qcm9qZWN0TmFtZSB9fQogICAgICAtIC0tbGFiZWw9b3JnLm9wZW5jb250YWluZXJzLmltYWdlLnVybD1odHRwczovL2dpdGh1Yi5jb20vZ29yZWxlYXNlci9leGFtcGxlCm5mcG1zOgogIC0gZm9ybWF0czogWyBkZWIsIHJwbSwgYXBrIF0KICAgIGhvbWVwYWdlOiBodHRwczovL2dpdGh1Yi5jb20vY2FhcmxvczAvdGFza3RpbWVyCiAgICBtYWludGFpbmVyOiBDYXJsb3MgQSBCZWNrZXIgPHJvb3RAY2FybG9zYmVja2VyLmRldj4KICAgIGRlc2NyaXB0aW9uOiBTYW1wbGUgcHJvamVjdC4KICAgIGxpY2Vuc2U6IE1JVAo=" }
# filepath: goreleaser.yml

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

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1Byb2plY3QnIGN1ZS5kZXYveC9nb3JlbGVhc2VyQGxhdGVzdCBnb3JlbGVhc2VyLnltbA==" }
$ cue vet -c -d '#Project' cue.dev/x/goreleaser@latest goreleaser.yml
```

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
