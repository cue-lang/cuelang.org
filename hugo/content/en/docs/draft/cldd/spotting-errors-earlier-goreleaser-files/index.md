---
title: Spotting errors earlier in GoReleaser files
---

An easy first step with CUE is shown in
[Checking existing GoReleaser files using CUE]({{<relref"checking-existing-goreleaser-files">}}).
There, we see the happy path of using `cue vet` to confirm that one of our
existing GoReleaser configuration files is valid.
But what does it look like when one of our manually maintained configuration files
isn't valid?
How does CUE help us catch errors early, before they've had the chance to move
further downstream and waste time, resources, and focus?

This guide shows what happens when the `cue vet` command finds a problem with a
GoReleaser configuration file using a
[curated module](/getting-started/goreleaser/) from the
CUE [Central Registry](https://registry.cue.works),
and how it highlights the data we need to fix.

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2luICMgb25seSBkdXJpbmcgYmV0YQ==" }
$ cue login # only during beta
```
The
[Central Registry](https://registry.cue.works)
requires authentication while it’s in beta testing,
so we need to login before using its modules.

## A broken configuration file

This example is adapted from the
[`goreleaser/example`](https://github.com/goreleaser/example/blob/master/.goreleaser.yaml)
repository -- but the deliberate errors introduced here aren't part
of the original file, of course!

```yml { title=".goreleaser.yml" codeToCopy="cHJvamVjdF9uYW1lOiBleGFtcGxlCmJ1aWxkczoKICAtIGdvb3M6IFsgbGludXgsIHdpbmRvd3MsIGRhcndpbiBdCiAgICBnb2FyY2g6IFsgYW1kNjQsIGFybTY0IF0KICAgIGVudjoKICAgICAgLSBDR09fRU5BQkxFRD0wCmRvY2tlcjoKICAtIGRvY2tlcmZpbGU6IERvY2tlcmZpbGUKICAgIGltYWdlX3RlbXBsYXRlczoKICAgICAgLSBnaGNyLmlvL2dvcmVsZWFzZXIvZXhhbXBsZTp7eyAuVmVyc2lvbiB9fQogICAgYnVpbGRfZmxhZ190ZW1wbGF0ZXM6CiAgICAgIC0gLS1sYWJlbD1vcmcub3BlbmNvbnRhaW5lcnMuaW1hZ2UudGl0bGU9e3sgLlByb2plY3ROYW1lIH19CiAgICAgIC0gLS1sYWJlbD1vcmcub3BlbmNvbnRhaW5lcnMuaW1hZ2UudXJsPWh0dHBzOi8vZ2l0aHViLmNvbS9nb3JlbGVhc2VyL2V4YW1wbGUKbmZwbXM6CiAgLSBmb3JtYXRzOiBbIGRlYiwgcnBtLCBhcGsgXQogICAgaG9tZXBhZ2U6IGh0dHBzOi8vZ2l0aHViLmNvbS9jYWFybG9zMC90YXNrdGltZXIKICAgIG1haW50YWluZXI6IENhcmxvcyBBIEJlY2tlciA8cm9vdEBjYXJsb3NiZWNrZXIuZGV2PgogICAgZGVzY3JpcHRpb246IFNhbXBsZSBwcm9qZWN0LgogICAgbGljZW5zZTogTUlUCg==" }
# filepath: .goreleaser.yml

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
```

## Validate the configuration file

We use `cue vet` to validate `.goreleaser.yml` against the `goreleaser` package's `#Project` definition:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1Byb2plY3QnIGN1ZS5kZXYveC9nb3JlbGVhc2VyQGxhdGVzdCAuZ29yZWxlYXNlci55bWw=" }
$ cue vet -c -d '#Project' cue.dev/x/goreleaser@latest .goreleaser.yml
docker: field not allowed:
    .goreleaser.yml:7:1
```

The `cue vet` command shows us the error (`docker: field not allowed`)

## Fix the configuration file

From the `cue vet` error message we know that the `docker` field isn't permitted.
We check the GoReleaser documentation (or perhaps we review the most recent
change made to the configuration file in our version control system) and discover
that the field should actually be named `dockers`.

We fix our configuration file by updating the highlighted line, so that the
file becomes:

```yml { title=".goreleaser.yml" codeToCopy="cHJvamVjdF9uYW1lOiBleGFtcGxlCmJ1aWxkczoKICAtIGdvb3M6IFsgbGludXgsIHdpbmRvd3MsIGRhcndpbiBdCiAgICBnb2FyY2g6IFsgYW1kNjQsIGFybTY0IF0KICAgIGVudjoKICAgICAgLSBDR09fRU5BQkxFRD0wCmRvY2tlcnM6CiAgLSBkb2NrZXJmaWxlOiBEb2NrZXJmaWxlCiAgICBpbWFnZV90ZW1wbGF0ZXM6CiAgICAgIC0gZ2hjci5pby9nb3JlbGVhc2VyL2V4YW1wbGU6e3sgLlZlcnNpb24gfX0KICAgIGJ1aWxkX2ZsYWdfdGVtcGxhdGVzOgogICAgICAtIC0tbGFiZWw9b3JnLm9wZW5jb250YWluZXJzLmltYWdlLnRpdGxlPXt7IC5Qcm9qZWN0TmFtZSB9fQogICAgICAtIC0tbGFiZWw9b3JnLm9wZW5jb250YWluZXJzLmltYWdlLnVybD1odHRwczovL2dpdGh1Yi5jb20vZ29yZWxlYXNlci9leGFtcGxlCm5mcG1zOgogIC0gZm9ybWF0czogWyBkZWIsIHJwbSwgYXBrIF0KICAgIGhvbWVwYWdlOiBodHRwczovL2dpdGh1Yi5jb20vY2FhcmxvczAvdGFza3RpbWVyCiAgICBtYWludGFpbmVyOiBDYXJsb3MgQSBCZWNrZXIgPHJvb3RAY2FybG9zYmVja2VyLmRldj4KICAgIGRlc2NyaXB0aW9uOiBTYW1wbGUgcHJvamVjdC4KICAgIGxpY2Vuc2U6IE1JVAo=" hl_lines=9 }
# filepath: .goreleaser.yml

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

## Re-validate the configuration file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1Byb2plY3QnIGN1ZS5kZXYveC9nb3JlbGVhc2VyQGxhdGVzdCAuZ29yZWxlYXNlci55bWw=" }
$ cue vet -c -d '#Project' cue.dev/x/goreleaser@latest .goreleaser.yml
```

We know that the curated module has validated our file this time because `cue
vet` doesn't display any errors.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GoReleaser + CUE]({{<relref"getting-started-with-goreleaser-cue">}})
...
