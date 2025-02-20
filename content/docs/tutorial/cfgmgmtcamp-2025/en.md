---
title: Config Management Camp 2025
authors: [rogpeppe, jpluscplusm]
toc_hide: true
no_index: true
---

{{{with _script_ "en" "HIDDEN: cue login"}}}
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD

# TODO: this is inherently racey. But not a problem in practice...
# for now. When it does become a problem we can solve this properly
# using a nc-based wait loop or similar.
nohup cue mod registry localhost:55443 > /tmp/cue_mod_registry 2>&1 &
{{{end}}}

Here's how we can use CUE with a registry, including:
- using CUE to validate existing non-CUE data files
- how we can use schemas in the Central Registry to do a better job of that
- how we can use CUE to define/generate configuration
- how we can abstract that into a reusable component (module)
- how we can publish that module to a registry

A lot of this is quite new, so don't be surprised if you find a few
rough edges. That said, it's reliable enough for us to dogfood it
in our own services.

# Scenario:

We're at a company that produces lots of different Docker images.
The maintainers of each image are expected to provide a `docker-compose.yaml`
file that is used for testing the service.

Here's an example. Create a new directory, and place this file as
`docker-compose.yaml` inside:

{{{with upload "en" "docker-compose.yml broken"}}}
-- docker-compose.yaml --
service:
  frontend:
    image: docker.io/library/nginx:latest
    ports:
      - "80:80"
    volume:
      - ./html:/usr/share/nginx/html
      - ./config/nginx.conf:/etc/nginx/nginx.conf:ro
  db:
    image: docker.ru/library/postgres:17.0
{{{end}}}

What aspects of this structured data do we care about?

1. it's a valid docker compose file
1. it exposes a service named "web" that exports the HTTP interface on port 8080
1. if there's a database service, it must be one of a few acceptable versions of Postgres
1. all our images come from our approved registry

Let's start by just checking the broad outline of what it means to be "a valid docker compose file", and that there's a web service specified.

Create this file as `schema.cue` alongside the `docker-compose.yaml` file:

{{{with upload "en" "schema"}}}
-- schema.cue --
package splotpolicy

#WebService: {
	services!: {
		web!: {
			ports!: ["8080:80"]
			...
		}
		db?: {
			image!: "docker.io/library/postgres:16.4" |
				"docker.io/library/postgres:16.5" |
				"docker.io/library/postgres:16.6"
			...
		}
		[string]: image!: =~"^docker\\.io/"
	}
	...
}
{{{end}}}

Validate your data file:

{{{with script "en" "vet 1"}}}
! cue vet .:splotpolicy docker-compose.yaml -d '#WebService'
{{{end}}}

Oh dear! We've definitely found at least one problem in our
`docker-compose.yaml` file: the top-level `services` field is missing. Correct
this in your YAML file, and re-run the `cue vet` command from above.

As you re-run `cue vet`, you'll find that there are more problems in your
`docker-compose.yaml` file. `cue vet` is only satisfied when it's completely
silent. Try and correct each problem as `cue vet` points it out.

{{<warning>}}
Don't worry if you can't figure out all the problems in our deliberately broken data file!

If you get stuck, here's a *corrected* `docker-compose.yaml` file - copying the
contents over from here to your file is absolutely fine ...
{{</warning>}}

Here's the corrected file that `cue vet` will have led you towards:
{{{with upload "en" "docker-compose.yaml fixed"}}}
#force
-- docker-compose.yaml --
services:
  web:
    image: docker.io/library/nginx:latest
    ports:
      - "8080:80"
    volume:
      - ./html:/usr/share/nginx/html
      - ./config/nginx.conf:/etc/nginx/nginx.conf:ro
  db:
    image: docker.io/library/postgres:16.4
{{{end}}}

There might be some minor differences, such as the specific version of Postgres that you chose, but anything that satisfies the schema is fine.

Check that it satisfies the schema with a final `cue vet`:

{{{with script "en" "vet 2"}}}
cue vet .:splotpolicy docker-compose.yaml -d '#WebService'
{{{end}}}

This is great - we can now assert some useful properties of the docker compose
files that the company's developers are handing to us. But we're not doing as
much checking as we could ...

Wouldn't it be nice if someone had done lots of the work for us already,
assembling a schema that validates the general *shape* of a docker compose
file?

**Enter the Central Registry**

The CUE Central Registry is a place where schemas are published that we can
tell the `cue` command to use, seamlessly.

Place this CUE code in `moreschema.cue`:

{{{with upload "en" "moreschema.cue"}}}
-- moreschema.cue --
package splotpolicy

import (
	"github.com/cue-tmp/jsonschema-pub/exp2/dockercompose"
)

#WebService: dockercompose.#Schema & {
	...
}
{{{end}}}

All files in a directory with the same package name are unified together, so this CUE *unifies* the upstream schema, imported from the registry, with our local `#WebService` definition. This combines the company-specific policy validation (such the frontend web service being called `web`) with the more general docker compose schema.

You'll notice that the import path looks a bit temporary - as indeed it is. But one of the important properties of the CUE registry system is that of permanency: once a given version of a module is in the Central Registry, it will remain there indefinitely. When a final location is chosen, there is [CUE tooling that allows straightforward refactoring of code to alter import paths](https://github.com/cue-lang/cue/blob/7d7abffdb1787ad6610d9e8155b09ac406e81d41/cmd/cue/cmd/refactor_imports.go#L38-L98)

As a one-off, login to the Central Registry:

{{{with script "en" "#norun cue login"}}}
#norun
cue login
{{{end}}}

{{{with script "en" "mod init tidy"}}}
cue mod init cue.example
cue mod tidy
{{{end}}}

After `cue mod tidy` completes, check out the contents of `cue.mod/module.cue`:

{{{with script "en" "module.cue"}}}
cat cue.mod/module.cue
{{{end}}}

Notice that `cue mod tidy` has found and added the latest version
of the `dockerconfig` module. The version declared in the `module.cue`
file acts as a kind of lock file.

Now let's re-run our `cue vet` command, taking advantage of the
more complete schema checking:

{{{with script "en" "cue vet against imported module fail"}}}
! cue vet .:splotpolicy docker-compose.yaml -d '#WebService'
{{{end}}}

Whoops - it's spotted an error in our original YAML file: the `web` service's
`volume` key isn't allowed! Let's correct it to `volumes` so we end up with
this really *really* fixed data file:

{{{with upload "en" "docker-compose.yaml really fixed"}}}
#force
-- docker-compose.yaml --
services:
  web:
    image: docker.io/library/nginx:latest
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html
      - ./config/nginx.conf:/etc/nginx/nginx.conf:ro
  db:
    image: docker.io/library/postgres:16.4
{{{end}}}

A quick `cue vet` shows us that we're -- at last! -- in possession of some properly formed data:

{{{with script "en" "cue vet against imported module pass"}}}
cue vet .:splotpolicy docker-compose.yaml -d '#WebService'
{{{end}}}

{{{with script "en" "start local registry"}}}
#norun
cue mod registry 127.0.0.1:55443 &
{{{end}}}
{{{with script "en" "break this out into steps"}}}
cue mod edit --source self
cue mod rename github.com/cue-examples/splotpolicy
export CUE_REGISTRY=github.com/cue-examples=127.0.0.1:55443
cue mod publish v0.0.1
cue import -p splotservice1 -l 'content:' docker-compose.yaml
cat docker-compose.cue
{{{end}}}

{{{with upload "en" "link splotpolicy and splotservice1"}}}
-- service1.cue --
package splotservice1

import "github.com/cue-examples/splotpolicy"

content: splotpolicy.#WebService
{{{end}}}

{{{with script "en" "cue vet of consumer module"}}}
cue vet .:splotservice1
sed -i 's/postgres:16.4/postgres:17/' docker-compose.cue
! cue vet .:splotservice1
sed -i 's/postgres:17/postgres:16.4/' docker-compose.cue
cue vet .:splotservice1
{{{end}}}

This is basically as far as we managed to get during the CfgMgmtCamp 2025 demo
\- but there's so much more to CUE + Central Registry! Come and talk to Marcel
or Roger at the CUE workshop to get hands-on help with your specific use
cases.
