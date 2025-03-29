---
title: Getting started with GoReleaser + CUE
---

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[the YAML configuration files](https://goreleaser.com/customization/)
used by [GoReleaser](https://goreleaser.com/).

This guide shows you how to get started defining your GoReleaser configurations using
[a curated module](/getting-started/goreleaser/)
from
[the schema library](/getting-started/schema-library/).

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its schemas.

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```
You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).
It makes sense for your CUE module to exist at the root of a source code
repository, but the commands in this guide will work in any setup.

## Create a configuration file

Declare a configuration file in CUE. This one is taken from
[`goreleaser/example`](https://github.com/goreleaser/example/blob/master/.goreleaser.yaml):

```cue { title="goreleaser.cue" codeToCopy="cGFja2FnZSBjaWNkCgppbXBvcnQgInRlc3QuY3VlLndvcmtzL3gxL2dvcmVsZWFzZXIiCgpmaWxlczogZXhhbXBsZTogZ29yZWxlYXNlci4jUHJvamVjdCAmIHsKCXByb2plY3RfbmFtZTogImV4YW1wbGUiCglidWlsZHM6IFt7CgkJZW52OiBbIkNHT19FTkFCTEVEPTAiXQoJCWdvb3M6IFsibGludXgiLCAid2luZG93cyIsICJkYXJ3aW4iXQoJCWdvYXJjaDogWyJhbWQ2NCIsICJhcm02NCJdCgl9XQoJZG9ja2VyczogW3sKCQlpbWFnZV90ZW1wbGF0ZXM6IFsiZ2hjci5pby9nb3JlbGVhc2VyL2V4YW1wbGU6e3sgLlZlcnNpb24gfX0iXQoJCWRvY2tlcmZpbGU6ICJEb2NrZXJmaWxlIgoJCWJ1aWxkX2ZsYWdfdGVtcGxhdGVzOiBbCgkJCSItLWxhYmVsPW9yZy5vcGVuY29udGFpbmVycy5pbWFnZS50aXRsZT17eyAuUHJvamVjdE5hbWUgfX0iLAoJCQkiLS1sYWJlbD1vcmcub3BlbmNvbnRhaW5lcnMuaW1hZ2UuZGVzY3JpcHRpb249e3sgLlByb2plY3ROYW1lIH19IiwKCQkJIi0tbGFiZWw9b3JnLm9wZW5jb250YWluZXJzLmltYWdlLnVybD1odHRwczovL2dpdGh1Yi5jb20vZ29yZWxlYXNlci9leGFtcGxlIiwKCQkJIi0tbGFiZWw9b3JnLm9wZW5jb250YWluZXJzLmltYWdlLnNvdXJjZT1odHRwczovL2dpdGh1Yi5jb20vZ29yZWxlYXNlci9leGFtcGxlIiwKCQkJIi0tbGFiZWw9b3JnLm9wZW5jb250YWluZXJzLmltYWdlLnZlcnNpb249e3sgLlZlcnNpb24gfX0iLAoJCQkiLS1sYWJlbD1vcmcub3BlbmNvbnRhaW5lcnMuaW1hZ2UuY3JlYXRlZD17eyB0aW1lIFwiMjAwNi0wMS0wMlQxNTowNDowNVowNzowMFwiIH19IiwKCQkJIi0tbGFiZWw9b3JnLm9wZW5jb250YWluZXJzLmltYWdlLnJldmlzaW9uPXt7IC5GdWxsQ29tbWl0IH19IiwKCQkJIi0tbGFiZWw9b3JnLm9wZW5jb250YWluZXJzLmltYWdlLmxpY2Vuc2VzPU1JVCIsCgkJXQoJfV0KCW5mcG1zOiBbewoJCW1haW50YWluZXI6ICAiQ2FybG9zIEEgQmVja2VyIDxyb290QGNhcmxvc2JlY2tlci5kZXY+IgoJCWRlc2NyaXB0aW9uOiAiU2FtcGxlIHByb2plY3QuIgoJCWhvbWVwYWdlOiAgICAiaHR0cHM6Ly9naXRodWIuY29tL2NhYXJsb3MwL3Rhc2t0aW1lciIKCQlsaWNlbnNlOiAgICAgIk1JVCIKCQlmb3JtYXRzOiBbImRlYiIsICJycG0iLCAiYXBrIl0KCX1dCn0K" }
// filepath: goreleaser.cue

package cicd

import "test.cue.works/x1/goreleaser"

files: example: goreleaser.#Project & {
	project_name: "example"
	builds: [{
		env: ["CGO_ENABLED=0"]
		goos: ["linux", "windows", "darwin"]
		goarch: ["amd64", "arm64"]
	}]
	dockers: [{
		image_templates: ["ghcr.io/goreleaser/example:{{ .Version }}"]
		dockerfile: "Dockerfile"
		build_flag_templates: [
			"--label=org.opencontainers.image.title={{ .ProjectName }}",
			"--label=org.opencontainers.image.description={{ .ProjectName }}",
			"--label=org.opencontainers.image.url=https://github.com/goreleaser/example",
			"--label=org.opencontainers.image.source=https://github.com/goreleaser/example",
			"--label=org.opencontainers.image.version={{ .Version }}",
			"--label=org.opencontainers.image.created={{ time \"2006-01-02T15:04:05Z07:00\" }}",
			"--label=org.opencontainers.image.revision={{ .FullCommit }}",
			"--label=org.opencontainers.image.licenses=MIT",
		]
	}]
	nfpms: [{
		maintainer:  "Carlos A Becker <root@carlosbecker.dev>"
		description: "Sample project."
		homepage:    "https://github.com/caarlos0/tasktimer"
		license:     "MIT"
		formats: ["deb", "rpm", "apk"]
	}]
}
```

In later guides we'll add more entries to the `files` struct.

The `import` at the top references the appropriate curated module for the file.
Its path is currently temporary, but only while its proper location is being decided.
The temporary path isn't a problem because one important property of the
[Central Registry](https://registry.cue.works)
is that, once a schema is published, it will always be
available at that location.
When the curated module’s location is finalised and versions are published
under the new path, you can use the
[`cue refactor imports`](https://cuelang.org/docs/reference/command/cue-help-refactor-imports/)
command to update your CUE easily, so it reflects the new location.

## Tidy your local CUE module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a curated module for the first time.

## Validate your configuration file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYw==" }
$ cue vet -c
```
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your configuration file.

## Export your configuration file as YAML

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgLmdvcmVsZWFzZXIueWFtbCAtZSBmaWxlcy5leGFtcGxl" }
$ cue export --outfile .goreleaser.yaml -e files.example
```
If you chose to export the `files.example` shown above,
your validated YAML file will look like this:
```yaml { title=".goreleaser.yaml" codeToCopy="cHJvamVjdF9uYW1lOiBleGFtcGxlCmJ1aWxkczoKICAtIGdvb3M6CiAgICAgIC0gbGludXgKICAgICAgLSB3aW5kb3dzCiAgICAgIC0gZGFyd2luCiAgICBnb2FyY2g6CiAgICAgIC0gYW1kNjQKICAgICAgLSBhcm02NAogICAgZW52OgogICAgICAtIENHT19FTkFCTEVEPTAKZG9ja2VyczoKICAtIGRvY2tlcmZpbGU6IERvY2tlcmZpbGUKICAgIGltYWdlX3RlbXBsYXRlczoKICAgICAgLSBnaGNyLmlvL2dvcmVsZWFzZXIvZXhhbXBsZTp7eyAuVmVyc2lvbiB9fQogICAgYnVpbGRfZmxhZ190ZW1wbGF0ZXM6CiAgICAgIC0gLS1sYWJlbD1vcmcub3BlbmNvbnRhaW5lcnMuaW1hZ2UudGl0bGU9e3sgLlByb2plY3ROYW1lIH19CiAgICAgIC0gLS1sYWJlbD1vcmcub3BlbmNvbnRhaW5lcnMuaW1hZ2UuZGVzY3JpcHRpb249e3sgLlByb2plY3ROYW1lIH19CiAgICAgIC0gLS1sYWJlbD1vcmcub3BlbmNvbnRhaW5lcnMuaW1hZ2UudXJsPWh0dHBzOi8vZ2l0aHViLmNvbS9nb3JlbGVhc2VyL2V4YW1wbGUKICAgICAgLSAtLWxhYmVsPW9yZy5vcGVuY29udGFpbmVycy5pbWFnZS5zb3VyY2U9aHR0cHM6Ly9naXRodWIuY29tL2dvcmVsZWFzZXIvZXhhbXBsZQogICAgICAtIC0tbGFiZWw9b3JnLm9wZW5jb250YWluZXJzLmltYWdlLnZlcnNpb249e3sgLlZlcnNpb24gfX0KICAgICAgLSAtLWxhYmVsPW9yZy5vcGVuY29udGFpbmVycy5pbWFnZS5jcmVhdGVkPXt7IHRpbWUgIjIwMDYtMDEtMDJUMTU6MDQ6MDVaMDc6MDAiIH19CiAgICAgIC0gLS1sYWJlbD1vcmcub3BlbmNvbnRhaW5lcnMuaW1hZ2UucmV2aXNpb249e3sgLkZ1bGxDb21taXQgfX0KICAgICAgLSAtLWxhYmVsPW9yZy5vcGVuY29udGFpbmVycy5pbWFnZS5saWNlbnNlcz1NSVQKbmZwbXM6CiAgLSBmb3JtYXRzOgogICAgICAtIGRlYgogICAgICAtIHJwbQogICAgICAtIGFwawogICAgaG9tZXBhZ2U6IGh0dHBzOi8vZ2l0aHViLmNvbS9jYWFybG9zMC90YXNrdGltZXIKICAgIG1haW50YWluZXI6IENhcmxvcyBBIEJlY2tlciA8cm9vdEBjYXJsb3NiZWNrZXIuZGV2PgogICAgZGVzY3JpcHRpb246IFNhbXBsZSBwcm9qZWN0LgogICAgbGljZW5zZTogTUlUCg==" }
# filepath: .goreleaser.yaml

project_name: example
builds:
  - goos:
      - linux
      - windows
      - darwin
    goarch:
      - amd64
      - arm64
    env:
      - CGO_ENABLED=0
dockers:
  - dockerfile: Dockerfile
    image_templates:
      - ghcr.io/goreleaser/example:{{ .Version }}
    build_flag_templates:
      - --label=org.opencontainers.image.title={{ .ProjectName }}
      - --label=org.opencontainers.image.description={{ .ProjectName }}
      - --label=org.opencontainers.image.url=https://github.com/goreleaser/example
      - --label=org.opencontainers.image.source=https://github.com/goreleaser/example
      - --label=org.opencontainers.image.version={{ .Version }}
      - --label=org.opencontainers.image.created={{ time "2006-01-02T15:04:05Z07:00" }}
      - --label=org.opencontainers.image.revision={{ .FullCommit }}
      - --label=org.opencontainers.image.licenses=MIT
nfpms:
  - formats:
      - deb
      - rpm
      - apk
    homepage: https://github.com/caarlos0/tasktimer
    maintainer: Carlos A Becker <root@carlosbecker.dev>
    description: Sample project.
    license: MIT
```
## Use your configuration file

Your validated `.goreleaser.yml` file can now be used by
[the various commands](https://goreleaser.com/cmd/goreleaser/) provided by the
`goreleaser` tool.

The `cue.mod` directory should be stored in your source code repository,
along with your `goreleaser.cue` and `.goreleaser.yaml` files.
Whenever you update your CUE file, re-run the `cue export` command shown above,
and then record any changes to these files and directories.
