---
title: How CUE works with OpenAPI
tags:
- encodings
- cue command
authors:
- jpluscplusm
- myitcv
toc_hide: true
---

CUE works with the
[OpenAPI 3.0.0 standard](https://github.com/OAI/OpenAPI-Specification/tree/3.0.0)
for the description of REST APIs by supporting the use and import of OpenAPI
`components.schemas` data schemas, and the export of CUE definitions into the
same namespace.

CUE is usually more clear and concise than the equivalent OpenAPI. However,
given that they meet different needs for different types of users, CUE's
ability to round-trip between CUE and OpenAPI's data schema subset acts as a
useful bridge between their two worlds.

## Reading and writing OpenAPI with the `cue` command

The `cue` command can convert CUE schemas into OpenAPI's `components.schemas`.
CUE files can be converted into OpenAPI so long as they only specify
definitions and metadata (`info`, `$version`, etc) at their top-level.

Let's start with a trivial CUE schema that we want to convert to OpenAPI:

```cue { title="schema.cue" }
// A schema for the pet API.
package api

$version: "v1.2.3"
// A Pet is a pet that we handle.
#Pet: {
	// A pet has a name.
	name!: string
	// We only handle certain kinds of pets.
	kind!: #Kind
	// Centenarian pets are not handled.
	age?: uint & <100 // TODO: increase limit if the tortoise proposal is accepted.
	...
}

// Kind encodes the different pets we handle.
#Kind: "cat" | "dog" | "goldfish"
```

The [`cue def`]({{< relref "docs/reference/cli/cue-def" >}}) command normalizes
the schema, and optionally converts it into another format:

```text { title="TERMINAL" codeToCopy="Y3VlIGRlZiBzY2hlbWEuY3VlIC1vIGFwaS5wZXQueWFtbCAtLW91dCBvcGVuYXBpK3lhbWw=" }
$ cue def schema.cue -o api.pet.yaml --out openapi+yaml
```
The OpenAPI `info.title` field can be extracted from the top-level CUE comment,
or can be specified directly.
The same goes for OpenAPI's `info.version` field, which is extracted from CUE's
top-level `$version` field if not specified directly.

Be aware of just how *long* an equivalent OpenAPI definition can become - not
all formats possess CUE's succinctness and economy of expression!
The `cue def` command creates this file:

```yaml { title="api.pet.yaml" }
openapi: 3.0.0
info:
  title: A schema for the pet API.
  version: v1.2.3
paths: {}
components:
  schemas:
    Kind:
      description: Kind encodes the different pets we handle.
      type: string
      enum:
        - cat
        - dog
        - goldfish
    Pet:
      description: A Pet is a pet that we handle.
      type: object
      required:
        - name
        - kind
      properties:
        name:
          description: A pet has a name.
          type: string
        kind:
          $ref: '#/components/schemas/Kind'
        age:
          description: Centenarian pets are not handled.
          type: integer
          minimum: 0
          maximum: 100
          exclusiveMaximum: true
```
Because CUE is more expressive than OpenAPI, it isn't possible to generate a
precise OpenAPI equivalent for *every* CUE schema. CUE does the best conversion
it can, limited by what OpenAPI's data schemas can represent.

[`cue import`]({{< relref "docs/reference/cli/cue-import" >}}) can perform the
reverse operation, taking the OpenAPI definition emitted above and converting
it back to CUE:

```text { title="TERMINAL" codeToCopy="Y3VlIGltcG9ydCAtcCBhcGkgYXBpLnBldC55YW1s" }
$ cue import -p api api.pet.yaml
```
This produces the following CUE, which is as close to the original `schema.cue`
as OpenAPI's capabilities currently permit:

```cue { title="api.pet.cue" }
// A schema for the pet API.
package api

info: {
	title:   *"A schema for the pet API." | string
	version: *"v1.2.3" | string
}
// Kind encodes the different pets we handle.
#Kind: "cat" | "dog" | "goldfish"

// A Pet is a pet that we handle.
#Pet: {
	// A pet has a name.
	name: string
	kind: #Kind

	// Centenarian pets are not handled.
	age?: int & >=0 & <100
	...
}
```
## Using CUE's Go API

CUE can also generate OpenAPI through its Go API.

Generating an OpenAPI definition can be as simple as this:
```go { title="main.go" }
package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"log"

	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/encoding/openapi"
)

func main() {
	ctx := cuecontext.New()
	bis := load.Instances([]string{"schema.cue"}, nil)
	v := ctx.BuildInstance(bis[0])

	// Generate the OpenAPI schema from the value loaded from schema.cue
	b, err := openapi.Gen(v, nil)
	if err != nil {
		log.Fatal(err)
	}

	// Render as indented JSON
	var out bytes.Buffer
	if err = json.Indent(&out, b, "", "  "); err != nil {
		log.Fatal(err)
	}
	fmt.Printf("%s\n", out.Bytes())
}
```
```text { title="TERMINAL" codeToCopy="Z28gcnVuIC4=" }
$ go run .
{
  "openapi": "3.0.0",
  "info": {
    "title": "A schema for the pet API.",
    "version": "v1.2.3"
  },
  "paths": {},
  "components": {
    "schemas": {
      "Kind": {
...
```

The [`encoding/openapi`](https://pkg.go.dev/cuelang.org/go/encoding/openapi)
package provides options to make a definition self-contained, to filter
constraints, and so on. The *expanding references* option enables the
"Structural OpenAPI" form required by CRDs targeting Kubernetes version 1.15
and later.

## Related content

- CUE supports OpenAPI's `components.schemas` namespace, and general `info` metadata --
  {{<issue 3133/>}} tracks the support of other namespaces defined by the OpenAPI standard
- The [OpenAPI 3.0.0 specification](https://github.com/OAI/OpenAPI-Specification/tree/3.0.0)
- {{< linkto/related/reference "cli/cue-def" >}}
- {{< linkto/related/reference "cli/cue-import" >}}
- The [`encoding/openapi`](https://pkg.go.dev/cuelang.org/go/encoding/openapi) package
