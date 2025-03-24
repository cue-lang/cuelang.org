---
title: Checking existing Docker Compose files using CUE
draft: true
no_index: true
---

{{<info>}}
[Curated modules]({{<relref"curated-modules-faq">}})
are a work in progress and your feedback is important!
Please [report any issues]({{<report-issue-url>}}) you find.
{{</info>}}

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files that you normally update by hand.
By adding this check to your development or deployment process, manually
introduced data errors can be caught and fixed before they affect downstream
systems.

This guide shows you how to use the `cue` command to validate a compose file
using a
[curated module]({{<relref"docs/draft/cldd/curated-modules-faq">}}) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its modules.

## Choose a compose file

This example is based on one from the
[`docker/awesome-compose`](https://github.com/docker/awesome-compose/tree/18f59bdb09ecf520dd5758fbf90dec314baec545/postgresql-pgadmin)
repository, but you should use any compose file that's relevant to your
situation.

{{< code-tabs >}}
{{< code-tab name="compose.yml" language="yml" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

## Validate the compose file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyBnaXRodWIuY29tL2N1ZS10bXAvanNvbnNjaGVtYS1wdWIvZXhwMy9kb2NrZXJjb21wb3NlQGxhdGVzdCBjb21wb3NlLnltbCAtZCAnI1NjaGVtYSc=" }
$ cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/dockercompose@latest compose.yml -d '#Schema'
```

Because `cue vet` doesn't display any errors,
you know that the curated module has validated your configuration file.

The module path used here is temporary, and will be given a proper home soon.
However, because one important property of the
[Central Registry](https://registry.cue.works) is that curated modules are
never removed, **you can rely on this "temporary" path for as long as you
need** -- it will not stop working and break your processes in the future.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
{{<linkto/inline"draft/cldd/getting-started-with-docker-compose-cue">}} ...
