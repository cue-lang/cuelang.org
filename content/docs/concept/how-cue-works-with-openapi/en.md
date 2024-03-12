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

The `cue` CLI can convert CUE schemas into OpenAPI's "components" data schema
form, so long as they only specify definitions and metadata (`info`,
`$version`, etc) at their top-level.

Here's [`cue def`]({{< relref "docs/reference/cli/cue-def" >}}) converting a
trivial CUE schema to OpenAPI. Do be mindful of how long OpenAPI equivalents
can get!

{{{with code "en" "cue def openapi"}}}
exec cue def schema.cue -o openapi+yaml:-
cmp stdout out
-- schema.cue --
// A schema for the pet API.
package api

$version: "v1.2.3"
// A Pet is a pet.
#Pet: {
	// Every pet has a name.
	name!: string
	kind!: #Kind
	// Unfortunately, pets can't live forever,
	// so age has an upper limit.
	age?: uint & <100
	...
}

// Kind encodes the different types of pet that exist.
#Kind: "cat" | "dog" | "goldfish"
-- out --
openapi: 3.0.0
info:
  title: A schema for the pet API.
  version: v1.2.3
paths: {}
components:
  schemas:
    Kind:
      description: Kind encodes the different types of pet that exist.
      type: string
      enum:
        - cat
        - dog
        - goldfish
    Pet:
      description: A Pet is a pet.
      type: object
      required:
        - name
        - kind
      properties:
        name:
          description: Every pet has a name.
          type: string
        kind:
          $ref: '#/components/schemas/Kind'
        age:
          description: |-
            Unfortunately, pets can't live forever,
            so age has an upper limit.
          type: integer
          minimum: 0
          maximum: 100
          exclusiveMaximum: true
{{{end}}}

The OpenAPI `info.title` field can be extracted from the top-level CUE comment
or can be specified directly. The same goes for OpenAPI's `info.version` field,
which is extracted from CUE's top-level `$version` if not specified directly.

Because CUE is more expressive than OpenAPI, it isn't possible to generate a
precise OpenAPI equivalent for *every* CUE schema. CUE does the best conversion
it can, limited by what OpenAPI's data schemas can represent.

Here's [`cue import`]({{< relref "docs/reference/cli/cue-import" >}}) doing the
reverse operation: taking the OpenAPI definition emitted above, and converting
it back to CUE:

{{{with code "en" "cue import openapi"}}}
exec cue import -p api openapi.yaml -o -
cmp stdout out
-- openapi.yaml --
openapi: 3.0.0
info:
  title: A schema for the pet API.
  version: v1.2.3
paths: {}
components:
  schemas:
    Kind:
      description: Kind encodes the different types of pet that exist.
      type: string
      enum:
        - cat
        - dog
        - goldfish
    Pet:
      description: A Pet is a pet.
      type: object
      required:
        - name
        - kind
      properties:
        name:
          description: Every pet has a name.
          type: string
        kind:
          $ref: '#/components/schemas/Kind'
        age:
          description: |-
            Unfortunately, pets can't live forever,
            so age has an upper limit.
          type: integer
          minimum: 0
          maximum: 100
          exclusiveMaximum: true
-- out --
// A schema for the pet API.
package api

info: {
	title:   *"A schema for the pet API." | string
	version: *"v1.2.3" | string
}
// Kind encodes the different types of pet that exist.
#Kind: "cat" | "dog" | "goldfish"

// A Pet is a pet.
#Pet: {
	// Every pet has a name.
	name: string
	kind: #Kind

	// Unfortunately, pets can't live forever,
	// so age has an upper limit.
	age?: int & >=0 & <100
	...
}
{{{end}}}

Because an OpenAPI definition is just data, it's easy to serialise its data
*representation* as CUE, and emit it as JSON or YAML. Such an encoding wouldn't
allow any embedded schemas to be used as such, natively, by CUE, but would
permit CUE abstractions to generate and validate any specific encoding.

## Using CUE's Go API

CUE can also generate OpenAPI through its Go API.

Generating an OpenAPI definition can be as simple as this:

{{< caution >}}
FIXME: Paul to supply MVP.
{{< /caution >}}

{{{with code "upload" "go emit openapi"}}}
-- file.go --
import "cuelang.org/go/encoding/openapi"

func genOpenAPI(inst *cue.Instance) ([]byte, error) {
	b, err := openapi.Gen(inst, nil)
	if err != nil {
		return nil, err
	}

	var out bytes.Buffer
	err = json.Indent(&out, b, "", "   ")
	if err != nil {
		return nil, err
	}

	return out.Bytes(), nil
}
{{{end}}}

The [`encoding/openapi`](https://pkg.go.dev/cuelang.org/go/encoding/openapi)
package provides options to make a definition self-contained, to filter
constraints, and so on. The *expanding references* option enables the
"Structural OpenAPI" form required by CRDs targeting Kubernetes version 1.15
and later.
