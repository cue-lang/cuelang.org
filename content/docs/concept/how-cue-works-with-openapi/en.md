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

CUE works with the [OpenAPI](https://github.com/OAI/OpenAPI-Specification/)
3.0.0 standard for the description of REST APIs, and its definition of data
schemas.

CUE is usually more clear and concise than the equivalent OpenAPI. However,
given that they meet different needs for different types of users, CUE's
ability to round-trip between CUE and OpenAPI's data schema subset acts as a
useful bridge between their two worlds.

## Reading and writing OpenAPI with the `cue` CLI

The `cue` CLI can convert CUE schemas into OpenAPI's "components" data schema form.
CUE files can be converted into OpenAPI so long as they only specify
definitions and metadata (`info`, `$version`, etc) at their top-level.

Let's start with a trivial CUE schema that we want to convert to OpenAPI:

{{{with upload "en" "schema.cue"}}}
-- schema.cue --
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
{{{end}}}

The [`cue def`]({{< relref "docs/reference/cli/cue-def" >}}) command normalizes
the schema, and optionally converts it into another format:

{{{with script "en" "cue def schema.cue"}}}
cue def schema.cue -o api.pet.yaml --out openapi+yaml
{{{end}}}

{{{with _script_ "en" "HIDDEN_ move api.pet.yaml sideways"}}}
mv api.pet.yaml .api.pet.yaml
{{{end}}}

The OpenAPI `info.title` field can be extracted from the top-level CUE comment
or can be specified directly.
The same goes for OpenAPI's `info.version` field, which is extracted from CUE's
top-level `$version` if not specified directly.

Be aware of how long an equivalent OpenAPI definition can get - not all formats
possess CUE's succinctness and economy of expression!  The result is the file
`api.pet.yaml`:

{{{with upload "en" "api.pet.yaml"}}}
-- api.pet.yaml --
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
{{{end}}}

{{{with _script_ "en" "HIDDEN_ diff api.pet.yaml"}}}
diff -wu api.pet.yaml .api.pet.yaml
rm .api.pet.yaml # tidy up
{{{end}}}

Because CUE is more expressive than OpenAPI, it isn't possible to generate a
precise OpenAPI equivalent for *every* CUE schema. CUE does the best conversion
it can, limited by what OpenAPI's data schemas can represent.

[`cue import`]({{< relref "docs/reference/cli/cue-import" >}}) can perform the
reverse operation, taking the OpenAPI definition emitted above and converting
it back to CUE:

{{{with script "en" "import openapi yaml"}}}
cue import -p api api.pet.yaml
{{{end}}}

{{{with _script_ "en" "HIDDEN_ move api.pet.cue sideways"}}}
mv api.pet.cue .api.pet.cue
{{{end}}}

This produces the following CUE, which is as close to the original `schema.cue`
as OpenAPI's capabilities currently permit:

{{{with upload "en" "api.pet.cue"}}}
-- api.pet.cue --
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
{{{end}}}

{{{with _script_ "en" "HIDDEN_ diff api.pet.cue"}}}
diff -wu api.pet.cue .api.pet.cue
rm .api.pet.cue # tidy up
{{{end}}}

Alternatively, because an OpenAPI definition is just data, it's easy to
serialise its data *representation* as CUE, and emit it as JSON or YAML.
Such an encoding wouldn't allow CUE to use any embedded schemas as constraints,
natively, but would permit CUE abstractions to generate and validate any
specific encoding.

## Using CUE's Go API

CUE can also generate OpenAPI through its Go API.

Generating an OpenAPI definition can be as simple as this:

{{{with _script_ "en" "go mod init"}}}
go mod init mod.example
{{{end}}}

{{{with upload "en" "go emit openapi main"}}}
-- main.go --
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
{{{end}}}

{{{with _script_ "en" "go mod tidy"}}}
#ellipsis 0
go get cuelang.org/go@${CUELANG_CUE_LATEST}
#ellipsis 0
go mod tidy
{{{end}}}

{{{with script "en" "go run"}}}
#ellipsis 10
go run .
{{{end}}}

The [`encoding/openapi`](https://pkg.go.dev/cuelang.org/go/encoding/openapi)
package provides options to make a definition self-contained, to filter
constraints, and so on. The *expanding references* option enables the
"Structural OpenAPI" form required by CRDs targeting Kubernetes version 1.15
and later.
