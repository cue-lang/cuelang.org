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
[a curated module](../curated-module-docker-compose/index.md) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

<!--more-->

## Choose a compose file

This example is based on one from the
[`docker/awesome-compose`](https://github.com/docker/awesome-compose/tree/18f59bdb09ecf520dd5758fbf90dec314baec545/postgresql-pgadmin)
repository, but you should use any compose file that's relevant to your
situation.

``` { .yaml title="compose.yml" }
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

``` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#Schema&#39; cue.dev/x/dockercompose@latest compose.yml" }
$ cue vet -c -d '#Schema' cue.dev/x/dockercompose@latest compose.yml
```

This command uses the `#Schema` definition from the `dockercompose` package to
check the `compose.yml` file. Because `cue vet` doesn't display any errors, you
know that the curated module has validated your configuration file.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](../login-central-registry/index.md)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Docker Compose + CUE](../getting-started-with-docker-compose-cue/index.md)
...
