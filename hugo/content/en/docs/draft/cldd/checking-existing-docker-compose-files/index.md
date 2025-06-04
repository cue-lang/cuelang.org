---
title: Checking existing Docker Compose files using CUE
---

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files.
By adding this check to your development or deployment process
you can catch and fix errors before they affect downstream
systems.

This guide shows you how to use the `cue` command to validate a compose file
using
[a curated module](/getting-started/docker-compose/) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

<!--more-->

The latest pre-release of the `cue` command is required -- please
[upgrade to this version](/docs/installing-cue/) if it's not already installed:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.13.0
...
```

## Choose a compose file

This example is based on one from the
[`docker/awesome-compose`](https://github.com/docker/awesome-compose/tree/18f59bdb09ecf520dd5758fbf90dec314baec545/postgresql-pgadmin)
repository, but you should use any compose file that's relevant to your
situation.

```yml { title="compose.yml" codeToCopy="c2VydmljZXM6CiAgcG9zdGdyZXM6CiAgICBjb250YWluZXJfbmFtZTogcG9zdGdyZXMKICAgIGVudmlyb25tZW50OgogICAgICAtIFBPU1RHUkVTX1VTRVI9JHtQT1NUR1JFU19VU0VSfQogICAgICAtIFBPU1RHUkVTX1BBU1NXT1JEPSR7UE9TVEdSRVNfUFd9CiAgICAgIC0gUE9TVEdSRVNfREI9JHtQT1NUR1JFU19EQn0KICAgIGltYWdlOiBwb3N0Z3JlczpsYXRlc3QKICAgIHBvcnRzOgogICAgICAtICI1NDMyOjU0MzIiCiAgICByZXN0YXJ0OiBhbHdheXMKICBwZ2FkbWluOgogICAgY29udGFpbmVyX25hbWU6IHBnYWRtaW4KICAgIGVudmlyb25tZW50OgogICAgICAtIFBHQURNSU5fREVGQVVMVF9FTUFJTD0ke1BHQURNSU5fTUFJTH0KICAgICAgLSBQR0FETUlOX0RFRkFVTFRfUEFTU1dPUkQ9JHtQR0FETUlOX1BXfQogICAgaW1hZ2U6IGRwYWdlL3BnYWRtaW40OmxhdGVzdAogICAgcG9ydHM6CiAgICAgIC0gIjUwNTA6ODAiCiAgICByZXN0YXJ0OiBhbHdheXMK" }
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

## Validate the compose file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1NjaGVtYScgY3VlLmRldi94L2RvY2tlcmNvbXBvc2VAbGF0ZXN0IGNvbXBvc2UueW1s" }
$ cue vet -c -d '#Schema' cue.dev/x/dockercompose@latest compose.yml
```

This command uses the `#Schema` definition from the `dockercompose` package to
check the `compose.yml` file. Because `cue vet` doesn't display any errors, you
know that the curated module has validated your configuration file.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](https://cue.dev/docs/login-central-registry/)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Docker Compose + CUE]({{<relref"getting-started-with-docker-compose-cue">}})
...
