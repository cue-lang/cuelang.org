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

CUE has first class support for OpenAPI data schemas: the `cue` command
automatically recognises OpenAPI by its signature fields, and the Go API has
packages dedicated to the format.
Specifically, CUE supports the
[OpenAPI 3.0.0 standard](https://github.com/OAI/OpenAPI-Specification/tree/3.0.0)
through its `components.schemas` namespace for data schemas.

Constraints stored as OpenAPI data schemas are available for `cue` commands to
use as if they were expressed in CUE. This allows you to work with these
constraints directly, using them to validate data, and to represent them
natively in CUE’s significantly more concise form.

In this guide, we'll see:

- [`cue def`]({{< relref "docs/reference/command/cue-help-def" >}})
  generating an OpenAPI data schema from a CUE definition,
- [`cue import`]({{< relref "docs/reference/command/cue-help-import" >}})
  turning the generated OpenAPI back into CUE,
- [`cue vet`]({{< relref "docs/reference/command/cue-help-vet" >}})
  using an OpenAPI data schema directly, to validate some data,
- and the
  [`encoding/openapi`](https://pkg.go.dev/cuelang.org/go/encoding/openapi)
  API generating OpenAPI in Go code.

## Using OpenAPI with the `cue` command

The `cue` command can use OpenAPI constraints in various ways, through its
different subcommands.

Let's start with a simple CUE schema:

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

The [`cue def`]({{< relref "docs/reference/command/cue-help-def" >}}) command can
express CUE constraints as OpenAPI data schemas, in OpenAPI's
`components.schemas` namespace - but *only* so long as all the top-level
constraints are specified using CUE definitions.

The OpenAPI `info.title` field is extracted from the top-level CUE comment
unless the field is specified explicitly. The same goes for OpenAPI's
`info.version` field, which is extracted from CUE's top-level `$version` field
if `info.version` isn't present in the CUE.

Running `cue def` normalizes our CUE constraints, converting them into the
format specified by the `--out` parameter.
Be aware of just how *long* an equivalent OpenAPI definition can become - not
all formats possess CUE's succinctness and economy of expression!

```text { title="TERMINAL" codeToCopy="Y3VlIGRlZiBzY2hlbWEuY3VlIC1vIGFwaS5wZXQueWFtbCAtLW91dCBvcGVuYXBpK3lhbWw=" }
$ cue def schema.cue -o api.pet.yaml --out openapi+yaml
```
The `cue def` command creates the `api.pet.yaml` OpenAPI document:

{{< code-tabs >}}
{{< code-tab name="api.pet.yaml" language="yaml" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}
Because CUE is more expressive than OpenAPI,
it isn't possible to generate a precise OpenAPI equivalent for *every* CUE constraint.
CUE does the best conversion it can,
limited by what OpenAPI's data schemas can represent.

The [`cue import`]({{< relref "docs/reference/command/cue-help-import" >}}) command
can take constraints found in OpenAPI data schemas and express them as CUE.
Here we take the definition produced by `cue def`, above, and convert it back to CUE:

```text { title="TERMINAL" codeToCopy="Y3VlIGltcG9ydCAtcCBhcGkgYXBpLnBldC55YW1s" }
$ cue import -p api api.pet.yaml
```
This produces the following CUE, which is as close to the original `schema.cue`
as OpenAPI currently permits:

{{< code-tabs >}}
{{< code-tab name="api.pet.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}
The [`cue vet`]({{< relref "docs/reference/command/cue-help-vet" >}}) command can
directly use constraints from OpenAPI data schemas to validate data.

Let's check the details of a well-known animal,
[Jonathan the tortoise](https://en.wikipedia.org/wiki/Jonathan_(tortoise)):

{{< code-tabs >}}
{{< code-tab name="jonathan.yml" language="yml" area="top-left" >}}
name: Jonathan
kind: tortoise
website: https://en.wikipedia.org/wiki/Jonathan_(tortoise)
{{< /code-tab >}}{{< /code-tabs >}}

Let's validate Jonathan against the contents of our OpenAPI document, `api.pet.yaml`.
CUE automatically recognises the constraints in the `components.schemas` namespace,
making them available as the `#Pet` schema:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCBhcGkucGV0LnlhbWwgam9uYXRoYW4ueW1sIC1kICcjUGV0Jw==" }
$ cue vet api.pet.yaml jonathan.yml -d '#Pet'
kind: 3 errors in empty disjunction:
kind: conflicting values "cat" and "tortoise":
    ./api.pet.yaml:11:7
    ./api.pet.yaml:26:11
    ./jonathan.yml:2:7
kind: conflicting values "dog" and "tortoise":
    ./api.pet.yaml:26:11
    ./jonathan.yml:2:7
kind: conflicting values "goldfish" and "tortoise":
    ./api.pet.yaml:26:11
    ./jonathan.yml:2:7
```

Perhaps our `#Pet` schema should be updated to handle more animal types!

## Using OpenAPI with the Go API

CUE can also access and generate OpenAPI through its
[`encoding/openapi`](https://pkg.go.dev/cuelang.org/go/encoding/openapi)
Go API.

Generating an OpenAPI definition can be as simple as this:
{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
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
	insts := load.Instances([]string{"schema.cue"}, nil)
	v := ctx.BuildInstance(insts[0])

	// Generate the OpenAPI schema from the value loaded from schema.cue
	b, err := openapi.Gen(v, nil)
	if err != nil {
		log.Fatal(err)
	}

	// Render as indented JSON
	var out bytes.Buffer
	if err := json.Indent(&out, b, "", "  "); err != nil {
		log.Fatal(err)
	}
	fmt.Printf("%s\n", out.Bytes())
}
{{< /code-tab >}}{{< /code-tabs >}}
Running this code successfully expresses the constraints in our original
`schema.cue` file as an OpenAPI document:

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

## Future plans

One of CUE's goals is to act as an *interlingua*: a bidirectional bridge
between all the formats that CUE speaks, linking constraints with data sources
of truth, no matter where they exist.

For now, only OpenAPI's data schemas, in the `components.schemas` namespace,
are handled by CUE. More complete support is tracked in {{<issue 3133/>}}.

## Related content

- {{< linkto/related/reference "command/cue-help-def" >}}
- {{< linkto/related/reference "command/cue-help-import" >}}
- {{< linkto/related/reference "command/cue-help-vet" >}}
- The [`encoding/openapi`](https://pkg.go.dev/cuelang.org/go/encoding/openapi) package
- {{<issue 3133>}}Issue #3133{{</issue>}} tracks the support of other namespaces defined by
  [the OpenAPI standard](https://github.com/OAI/OpenAPI-Specification/tree/3.0.0)
