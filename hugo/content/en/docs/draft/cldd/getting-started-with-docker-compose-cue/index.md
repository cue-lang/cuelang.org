---
title: Getting started with Docker Compose + CUE
---

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[compose files](https://github.com/compose-spec/compose-spec/blob/main/spec.md#compose-file)
used by [Docker Compose](https://docs.docker.com/compose/) and
[podman-compose](https://github.com/containers/podman-compose).
This guide shows you how to get started defining your compose files in CUE using
[a curated module](/getting-started/docker-compose/)
from
[the schema library](/getting-started/schema-library/).

<!--more-->

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

## Create a compose file

Declare a compose file in CUE. This one is based on a PostgreSQL example from
[`docker/awesome-compose`](https://github.com/docker/awesome-compose/tree/18f59bdb09ecf520dd5758fbf90dec314baec545/postgresql-pgadmin):

```cue { title="compose.cue" codeToCopy="cGFja2FnZSBkZXYKCmltcG9ydCAiY3VlLmRldi94L2RvY2tlcmNvbXBvc2UiCgpmaWxlczogZXhhbXBsZTogZG9ja2VyY29tcG9zZS4jU2NoZW1hICYgewoJc2VydmljZXM6IHsKCQlwb3N0Z3JlczogewoJCQljb250YWluZXJfbmFtZTogInBvc3RncmVzIgoJCQlpbWFnZTogICAgICAgICAgInBvc3RncmVzOmxhdGVzdCIKCQkJZW52aXJvbm1lbnQ6IFsKCQkJCSJQT1NUR1JFU19VU0VSPSR7UE9TVEdSRVNfVVNFUn0iLAoJCQkJIlBPU1RHUkVTX1BBU1NXT1JEPSR7UE9TVEdSRVNfUFd9IiwKCQkJCSJQT1NUR1JFU19EQj0ke1BPU1RHUkVTX0RCfSIsCgkJCV0KCQkJcG9ydHM6IFsiNTQzMjo1NDMyIl0KCQkJcmVzdGFydDogImFsd2F5cyIKCQl9CgkJcGdhZG1pbjogewoJCQljb250YWluZXJfbmFtZTogInBnYWRtaW4iCgkJCWltYWdlOiAgICAgICAgICAiZHBhZ2UvcGdhZG1pbjQ6bGF0ZXN0IgoJCQllbnZpcm9ubWVudDogWwoJCQkJIlBHQURNSU5fREVGQVVMVF9FTUFJTD0ke1BHQURNSU5fTUFJTH0iLAoJCQkJIlBHQURNSU5fREVGQVVMVF9QQVNTV09SRD0ke1BHQURNSU5fUFd9IiwKCQkJXQoJCQlwb3J0czogWyI1MDUwOjgwIl0KCQkJcmVzdGFydDogImFsd2F5cyIKCQl9Cgl9Cn0K" }
// filepath: compose.cue

package dev

import "cue.dev/x/dockercompose"

files: example: dockercompose.#Schema & {
	services: {
		postgres: {
			container_name: "postgres"
			image:          "postgres:latest"
			environment: [
				"POSTGRES_USER=${POSTGRES_USER}",
				"POSTGRES_PASSWORD=${POSTGRES_PW}",
				"POSTGRES_DB=${POSTGRES_DB}",
			]
			ports: ["5432:5432"]
			restart: "always"
		}
		pgadmin: {
			container_name: "pgadmin"
			image:          "dpage/pgadmin4:latest"
			environment: [
				"PGADMIN_DEFAULT_EMAIL=${PGADMIN_MAIL}",
				"PGADMIN_DEFAULT_PASSWORD=${PGADMIN_PW}",
			]
			ports: ["5050:80"]
			restart: "always"
		}
	}
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

If you see an error message mentioning "too many requests" then
[login to the Central Registry](https://cue.dev/docs/login-central-registry/)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Validate your compose file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYw==" }
$ cue vet -c
```
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your compose file.

## Export your compose file as YAML

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgY29tcG9zZS55YW1sIC1lIGZpbGVzLmV4YW1wbGU=" }
$ cue export --outfile compose.yaml -e files.example
```

If you chose to export the `files.example` shown above,
your validated YAML file will look like this:

```yaml { title="compose.yaml" codeToCopy="c2VydmljZXM6CiAgcG9zdGdyZXM6CiAgICBjb250YWluZXJfbmFtZTogcG9zdGdyZXMKICAgIGVudmlyb25tZW50OgogICAgICAtIFBPU1RHUkVTX1VTRVI9JHtQT1NUR1JFU19VU0VSfQogICAgICAtIFBPU1RHUkVTX1BBU1NXT1JEPSR7UE9TVEdSRVNfUFd9CiAgICAgIC0gUE9TVEdSRVNfREI9JHtQT1NUR1JFU19EQn0KICAgIGltYWdlOiBwb3N0Z3JlczpsYXRlc3QKICAgIHBvcnRzOgogICAgICAtICI1NDMyOjU0MzIiCiAgICByZXN0YXJ0OiBhbHdheXMKICBwZ2FkbWluOgogICAgY29udGFpbmVyX25hbWU6IHBnYWRtaW4KICAgIGVudmlyb25tZW50OgogICAgICAtIFBHQURNSU5fREVGQVVMVF9FTUFJTD0ke1BHQURNSU5fTUFJTH0KICAgICAgLSBQR0FETUlOX0RFRkFVTFRfUEFTU1dPUkQ9JHtQR0FETUlOX1BXfQogICAgaW1hZ2U6IGRwYWdlL3BnYWRtaW40OmxhdGVzdAogICAgcG9ydHM6CiAgICAgIC0gIjUwNTA6ODAiCiAgICByZXN0YXJ0OiBhbHdheXMK" }
# filepath: compose.yaml

services:
  postgres:
    container_name: postgres
    environment:
      - POSTGRES_USER=${POSTGRES_USER}
      - POSTGRES_PASSWORD=${POSTGRES_PW}
      - POSTGRES_DB=${POSTGRES_DB}
    image: postgres:latest
    ports:
      - "5432:5432"
    restart: always
  pgadmin:
    container_name: pgadmin
    environment:
      - PGADMIN_DEFAULT_EMAIL=${PGADMIN_MAIL}
      - PGADMIN_DEFAULT_PASSWORD=${PGADMIN_PW}
    image: dpage/pgadmin4:latest
    ports:
      - "5050:80"
    restart: always
```

## Run your compose file

Start the compose-based services by using the `docker compose up` or `podman
compose up` commands. (This example requires
[a couple of environment variables](https://github.com/docker/awesome-compose/tree/18f59bdb09ecf520dd5758fbf90dec314baec545/postgresql-pgadmin#env)
to be specified beforehand.)

The `cue.mod` directory should be stored in your source code repository,
along with your `compose.cue` and `compose.yaml` files.
Whenever you update your CUE file, re-run the `cue export` command shown above,
and then record any changes to these files and directories.
