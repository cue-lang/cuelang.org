---
title: Getting started with GoReleaser + CUE
draft: true
no_index: true
---

{{<info>}}
Curated modules are a work in progress and your feedback is important!
Please [report any issues]({{<report-issue-url>}}) you find.
{{</info>}}

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[the YAML configuration files](https://goreleaser.com/customization/)
used by [GoReleaser](https://goreleaser.com/).

This guide shows you how to get started defining your GoReleaser configurations
in CUE using [curated modules]({{<relref"curated-modules-faq">}}).

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
[change it later]({{<relref"docs/reference/command/cue-help-mod-rename">}}).
It makes sense for your CUE module to exist at the root of a source code
repository, but the commands in this guide will work in any setup.

## Create a configuration file

Declare a configuration file in CUE. This one is taken from
[`goreleaser/example`](https://github.com/goreleaser/example/blob/master/.goreleaser.yaml):

```cue { title="goreleaser.cue" }
package cicd

import "github.com/cue-tmp/jsonschema-pub/exp3/goreleaser"

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
[`cue refactor imports`]({{<relref"docs/reference/command/cue-help-refactor-imports">}})
command to update your CUE easily, so it reflects the new location.

## Tidy your local CUE module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`]({{<relref"docs/reference/command/cue-help-mod-tidy">}})
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
```yaml { title=".goreleaser.yaml" }
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
