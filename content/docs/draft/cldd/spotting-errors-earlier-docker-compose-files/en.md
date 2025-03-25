---
title: Spotting errors earlier in Docker Compose files
draft: true
no_index: true
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD

# TODO(jm): revert to latest when it has evalv3 as default.
export PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH
{{{end}}}

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

{{{with script "en" "cue login"}}}
#norun
cue login # only during beta
{{{end}}}
The
[Central Registry](https://registry.cue.works)
requires authentication while it’s in beta testing,
so we need to login before using its modules.

## A broken compose file

This example is based on one from the
[`docker/awesome-compose`](https://github.com/docker/awesome-compose/tree/18f59bdb09ecf520dd5758fbf90dec314baec545/postgresql-pgadmin)
repository, -- but the deliberate errors introduced here aren't part of the
original file, of course!

{{{with upload "en" "broken"}}}
-- compose.yml --
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
{{{end}}}

## Validate the compose file

We use `cue vet` to validate `compose.yml` against the `dockercompose` package's `#Schema` definition:

{{{with script "en" "cue vet fail"}}}
! cue vet -c -d '#Schema' cue.dev/x/dockercompose@latest compose.yml
{{{end}}}

The `cue vet` command shows us two errors (`...port: field not allowed`) and tells
us the locations of each problem (lines 18 and 9 of our data file).

## Fix the compose file

From the `cue vet` error message we know that the `port` field isn't permitted.
We check the Docker Compose documentation (or perhaps we review the most recent
change made to the compose file in our version control system) and discover
that the field should actually be named `ports`.

We fix our compose file by updating the highlighted line that `cue vet`
mentioned, so that the file becomes:

{{{with upload "en" "fixed"}}}
#codetab(compose.yml) hl_lines=[11,20]
#force
-- compose.yml --
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
{{{end}}}

## Re-validate the compose file

{{{with script "en" "cue vet pass"}}}
cue vet -c -d '#Schema' cue.dev/x/dockercompose@latest compose.yml
{{{end}}}

We know that the curated module has validated our file this time because `cue
vet` doesn't display any errors.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Docker Compose + CUE]({{<relref"getting-started-with-docker-compose-cue">}})
...
