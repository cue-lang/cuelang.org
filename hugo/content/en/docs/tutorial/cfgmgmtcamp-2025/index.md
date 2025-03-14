---
title: Config Management Camp 2025
authors: [rogpeppe, jpluscplusm]
toc_hide: true
no_index: true
---

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

{{< code-tabs >}}
{{< code-tab name="docker-compose.yaml" language="yaml" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

What aspects of this structured data do we care about?

1. it's a valid docker compose file
1. it exposes a service named "web" that exports the HTTP interface on port 8080
1. if there's a database service, it must be one of a few acceptable versions of Postgres
1. all our images come from our approved registry

Let's start by just checking the broad outline of what it means to be "a valid docker compose file", and that there's a web service specified.

Create this file as `schema.cue` alongside the `docker-compose.yaml` file:

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

Validate your data file:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAuOnNwbG90cG9saWN5IGRvY2tlci1jb21wb3NlLnlhbWwgLWQgJyNXZWJTZXJ2aWNlJw==" }
$ cue vet -c .:splotpolicy docker-compose.yaml -d '#WebService'
services: field is required but not present:
    ./schema.cue:4:2
```

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
{{< code-tabs >}}
{{< code-tab name="docker-compose.yaml" language="yaml" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

There might be some minor differences, such as the specific version of Postgres that you chose, but anything that satisfies the schema is fine.

Check that it satisfies the schema with a final `cue vet`:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAuOnNwbG90cG9saWN5IGRvY2tlci1jb21wb3NlLnlhbWwgLWQgJyNXZWJTZXJ2aWNlJw==" }
$ cue vet -c .:splotpolicy docker-compose.yaml -d '#WebService'
```

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

{{< code-tabs >}}
{{< code-tab name="moreschema.cue" language="cue" area="top-left" >}}
package splotpolicy

import (
	"github.com/cue-tmp/jsonschema-pub/exp2/dockercompose"
)

#WebService: dockercompose.#Schema & {
	...
}
{{< /code-tab >}}{{< /code-tabs >}}

All files in a directory with the same package name are unified together, so this CUE *unifies* the upstream schema, imported from the registry, with our local `#WebService` definition. This combines the company-specific policy validation (such the frontend web service being called `web`) with the more general docker compose schema.

You'll notice that the import path looks a bit temporary - as indeed it is. But one of the important properties of the CUE registry system is that of permanency: once a given version of a module is in the Central Registry, it will remain there indefinitely. When a final location is chosen, there is [CUE tooling that allows straightforward refactoring of code to alter import paths](https://github.com/cue-lang/cue/blob/7d7abffdb1787ad6610d9e8155b09ac406e81d41/cmd/cue/cmd/refactor_imports.go#L38-L98)

As a one-off, login to the Central Registry:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxlCmN1ZSBtb2QgdGlkeQ==" }
$ cue mod init cue.example
$ cue mod tidy
```

After `cue mod tidy` completes, check out the contents of `cue.mod/module.cue`:

```text { title="TERMINAL" type="terminal" codeToCopy="Y2F0IGN1ZS5tb2QvbW9kdWxlLmN1ZQ==" }
$ cat cue.mod/module.cue
module: "cue.example"
language: {
	version: "v0.13.0"
}
deps: {
	"github.com/cue-tmp/jsonschema-pub/exp2/dockercompose@v0": {
		v:       "v0.0.1"
		default: true
	}
}
```

Notice that `cue mod tidy` has found and added the latest version
of the `dockerconfig` module. The version declared in the `module.cue`
file acts as a kind of lock file.

Now let's re-run our `cue vet` command, taking advantage of the
more complete schema checking:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAuOnNwbG90cG9saWN5IGRvY2tlci1jb21wb3NlLnlhbWwgLWQgJyNXZWJTZXJ2aWNlJw==" }
$ cue vet -c .:splotpolicy docker-compose.yaml -d '#WebService'
services.web.volume: field not allowed:
    ./docker-compose.yaml:6:5
```

Whoops - it's spotted an error in our original YAML file: the `web` service's
`volume` key isn't allowed! Let's correct it to `volumes` so we end up with
this really *really* fixed data file:

{{< code-tabs >}}
{{< code-tab name="docker-compose.yaml" language="yaml" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

A quick `cue vet` shows us that we're -- at last! -- in possession of some properly formed data:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAuOnNwbG90cG9saWN5IGRvY2tlci1jb21wb3NlLnlhbWwgLWQgJyNXZWJTZXJ2aWNlJw==" }
$ cue vet -c .:splotpolicy docker-compose.yaml -d '#WebService'
```

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCByZWdpc3RyeSAxMjcuMC4wLjE6NTU0NDMgJg==" }
$ cue mod registry 127.0.0.1:55443 &
```
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBlZGl0IC0tc291cmNlIHNlbGYKY3VlIG1vZCByZW5hbWUgZ2l0aHViLmNvbS9jdWUtZXhhbXBsZXMvc3Bsb3Rwb2xpY3kKZXhwb3J0IENVRV9SRUdJU1RSWT1naXRodWIuY29tL2N1ZS1leGFtcGxlcz0xMjcuMC4wLjE6NTU0NDMKY3VlIG1vZCBwdWJsaXNoIHYwLjAuMQpjdWUgaW1wb3J0IC1wIHNwbG90c2VydmljZTEgLWwgJ2NvbnRlbnQ6JyBkb2NrZXItY29tcG9zZS55YW1sCmNhdCBkb2NrZXItY29tcG9zZS5jdWU=" }
$ cue mod edit --source self
$ cue mod rename github.com/cue-examples/splotpolicy
$ export CUE_REGISTRY=github.com/cue-examples=127.0.0.1:55443
$ cue mod publish v0.0.1
published github.com/cue-examples/splotpolicy@v0.0.1 to 127.0.0.1:55443/github.com/cue-examples/splotpolicy:v0.0.1
$ cue import -p splotservice1 -l 'content:' docker-compose.yaml
$ cat docker-compose.cue
package splotservice1

content: services: {
	web: {
		image: "docker.io/library/nginx:latest"
		ports: ["8080:80"]
		volumes: [
			"./html:/usr/share/nginx/html",
			"./config/nginx.conf:/etc/nginx/nginx.conf:ro",
		]
	}
	db: image: "docker.io/library/postgres:16.4"
}
```

{{< code-tabs >}}
{{< code-tab name="service1.cue" language="cue" area="top-left" >}}
package splotservice1

import "github.com/cue-examples/splotpolicy"

content: splotpolicy.#WebService
{{< /code-tab >}}{{< /code-tabs >}}

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAuOnNwbG90c2VydmljZTEKc2VkIC1pICdzL3Bvc3RncmVzOjE2LjQvcG9zdGdyZXM6MTcvJyBkb2NrZXItY29tcG9zZS5jdWUKY3VlIHZldCAtYyAuOnNwbG90c2VydmljZTEKc2VkIC1pICdzL3Bvc3RncmVzOjE3L3Bvc3RncmVzOjE2LjQvJyBkb2NrZXItY29tcG9zZS5jdWUKY3VlIHZldCAtYyAuOnNwbG90c2VydmljZTE=" }
$ cue vet -c .:splotservice1
$ sed -i 's/postgres:16.4/postgres:17/' docker-compose.cue
$ cue vet -c .:splotservice1
content.services.db.image: 3 errors in empty disjunction:
content.services.db.image: conflicting values "docker.io/library/postgres:16.4" and "docker.io/library/postgres:17":
    ./docker-compose.cue:12:13
    ./schema.cue:10:12
content.services.db.image: conflicting values "docker.io/library/postgres:16.5" and "docker.io/library/postgres:17":
    ./docker-compose.cue:12:13
    ./schema.cue:11:5
content.services.db.image: conflicting values "docker.io/library/postgres:16.6" and "docker.io/library/postgres:17":
    ./docker-compose.cue:12:13
    ./schema.cue:12:5
$ sed -i 's/postgres:17/postgres:16.4/' docker-compose.cue
$ cue vet -c .:splotservice1
```

This is basically as far as we managed to get during the CfgMgmtCamp 2025 demo
\- but there's so much more to CUE + Central Registry! Come and talk to Marcel
or Roger at the CUE workshop to get hands-on help with your specific use
cases.
