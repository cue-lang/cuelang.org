---
title: Spotting errors earlier in Docker Compose files
---

An easy first step with CUE is shown in
[Checking existing Docker Compose files using CUE]({{<relref"checking-existing-docker-compose-files">}}).
There, we see the happy path of using `cue vet` to confirm that one of our
existing compose files is valid.
But what does it look like when one of our manually maintained compose files
isn't valid?
How does CUE help us catch errors early, before they've had the chance to move
further downstream and waste time, resources, and focus?

This guide shows what happens when the `cue vet` command finds a problem with a
compose file using a
[curated module](/getting-started/docker-compose/) from the
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

## A broken compose file

This example is based on one from the
[`docker/awesome-compose`](https://github.com/docker/awesome-compose/tree/18f59bdb09ecf520dd5758fbf90dec314baec545/postgresql-pgadmin)
repository, -- but the deliberate errors introduced here aren't part of the
original file, of course!

```yml { title="compose.yml" codeToCopy="c2VydmljZXM6CiAgcG9zdGdyZXM6CiAgICBjb250YWluZXJfbmFtZTogcG9zdGdyZXMKICAgIGVudmlyb25tZW50OgogICAgICAtIFBPU1RHUkVTX1VTRVI9JHtQT1NUR1JFU19VU0VSfQogICAgICAtIFBPU1RHUkVTX1BBU1NXT1JEPSR7UE9TVEdSRVNfUFd9CiAgICAgIC0gUE9TVEdSRVNfREI9JHtQT1NUR1JFU19EQn0KICAgIGltYWdlOiBwb3N0Z3JlczpsYXRlc3QKICAgIHBvcnQ6CiAgICAgIC0gIjU0MzI6NTQzMiIKICAgIHJlc3RhcnQ6IGFsd2F5cwogIHBnYWRtaW46CiAgICBjb250YWluZXJfbmFtZTogcGdhZG1pbgogICAgZW52aXJvbm1lbnQ6CiAgICAgIC0gUEdBRE1JTl9ERUZBVUxUX0VNQUlMPSR7UEdBRE1JTl9NQUlMfQogICAgICAtIFBHQURNSU5fREVGQVVMVF9QQVNTV09SRD0ke1BHQURNSU5fUFd9CiAgICBpbWFnZTogZHBhZ2UvcGdhZG1pbjQ6bGF0ZXN0CiAgICBwb3J0OgogICAgICAtICI1MDUwOjgwIgogICAgcmVzdGFydDogYWx3YXlzCg==" }
# filepath: compose.yml

services:
  postgres:
    container_name: postgres
    environment:
      - POSTGRES_USER=${POSTGRES_USER}
      - POSTGRES_PASSWORD=${POSTGRES_PW}
      - POSTGRES_DB=${POSTGRES_DB}
    image: postgres:latest
    port:
      - "5432:5432"
    restart: always
  pgadmin:
    container_name: pgadmin
    environment:
      - PGADMIN_DEFAULT_EMAIL=${PGADMIN_MAIL}
      - PGADMIN_DEFAULT_PASSWORD=${PGADMIN_PW}
    image: dpage/pgadmin4:latest
    port:
      - "5050:80"
    restart: always
```

## Validate the compose file

We use `cue vet` to validate `compose.yml` against the `dockercompose` package's `#Schema` definition:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1NjaGVtYScgY3VlLmRldi94L2RvY2tlcmNvbXBvc2VAbGF0ZXN0IGNvbXBvc2UueW1s" }
$ cue vet -c -d '#Schema' cue.dev/x/dockercompose@latest compose.yml
services.pgadmin.port: field not allowed:
    ./compose.yml:18:5
services.postgres.port: field not allowed:
    ./compose.yml:9:5
```

The `cue vet` command shows us two errors (`...port: field not allowed`) and tells
us the locations of each problem (lines 18 and 9 of our data file).

## Fix the compose file

From the `cue vet` error message we know that the `port` field isn't permitted.
We check the Docker Compose documentation (or perhaps we review the most recent
change made to the compose file in our version control system) and discover
that the field should actually be named `ports`.

We fix our compose file by updating the highlighted line that `cue vet`
mentioned, so that the file becomes:

```yml { title="compose.yml" codeToCopy="c2VydmljZXM6CiAgcG9zdGdyZXM6CiAgICBjb250YWluZXJfbmFtZTogcG9zdGdyZXMKICAgIGVudmlyb25tZW50OgogICAgICAtIFBPU1RHUkVTX1VTRVI9JHtQT1NUR1JFU19VU0VSfQogICAgICAtIFBPU1RHUkVTX1BBU1NXT1JEPSR7UE9TVEdSRVNfUFd9CiAgICAgIC0gUE9TVEdSRVNfREI9JHtQT1NUR1JFU19EQn0KICAgIGltYWdlOiBwb3N0Z3JlczpsYXRlc3QKICAgIHBvcnRzOgogICAgICAtICI1NDMyOjU0MzIiCiAgICByZXN0YXJ0OiBhbHdheXMKICBwZ2FkbWluOgogICAgY29udGFpbmVyX25hbWU6IHBnYWRtaW4KICAgIGVudmlyb25tZW50OgogICAgICAtIFBHQURNSU5fREVGQVVMVF9FTUFJTD0ke1BHQURNSU5fTUFJTH0KICAgICAgLSBQR0FETUlOX0RFRkFVTFRfUEFTU1dPUkQ9JHtQR0FETUlOX1BXfQogICAgaW1hZ2U6IGRwYWdlL3BnYWRtaW40OmxhdGVzdAogICAgcG9ydHM6CiAgICAgIC0gIjUwNTA6ODAiCiAgICByZXN0YXJ0OiBhbHdheXMK" hl_lines=[11,20] }
# filepath: compose.yml

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

## Re-validate the compose file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1NjaGVtYScgY3VlLmRldi94L2RvY2tlcmNvbXBvc2VAbGF0ZXN0IGNvbXBvc2UueW1s" }
$ cue vet -c -d '#Schema' cue.dev/x/dockercompose@latest compose.yml
```

We know that the curated module has validated our file this time because `cue
vet` doesn't display any errors.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Docker Compose + CUE]({{<relref"getting-started-with-docker-compose-cue">}})
...
