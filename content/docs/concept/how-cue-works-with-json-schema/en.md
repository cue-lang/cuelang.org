---
title: How CUE works with JSON Schema
tags:
- encodings
- cue command
- go api
authors:
- jpluscplusm
- myitcv
toc_hide: true
---

{{{with _script_ "en" "HIDDEN: set up caches"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

CUE has first class support for [JSON Schema](https://json-schema.org/):
both the `cue` command and the Go API understand the format.

Constraints stored as JSON Schema are available for `cue` commands to use as if
they were expressed in CUE.
This allows you to work with JSON Schema constraints directly, using them to
validate data, and to represent them natively in CUE's more succinct and
expressive form.

In this guide we'll see:
- [`cue import`]({{< relref "docs/reference/command/cue-help-import" >}}) converting a
  JSON Schema to CUE,
- [`cue vet`]({{< relref "docs/reference/command/cue-help-vet" >}}) using JSON Schema
  constraints directly,
- and the
  [`encoding/jsonschema`](https://pkg.go.dev/cuelang.org/go/encoding/jsonschema)
  Go API validating data against a JSON Schema.

The ability to export CUE constraints as JSON Schema is tracked in {{<issue 929/>}}.

## Using JSON Schema with the `cue` command

The [`cue import`]({{< relref "docs/reference/command/cue-help-import" >}}) command can
produce CUE from JSON Schema.

Let's start with this JSON Schema:

{{{with upload "en" "schema.json"}}}
-- schema.json --
{
    "$schema": "https://json-schema.org/draft/2019-09/schema",
    "type": "object",
    "title": "Main Person schema.",
    "description": "This schema defines a person.",
    "required": [
        "name"
    ],
    "properties": {
        "name": {
            "description": "What is this person called?",
            "type": "string",
            "minLength": 1
        },
        "address": {
            "description": "Where does this person live?",
            "type": "string",
            "minLength": 1,
            "maxLength": 200
        },
        "children": {
            "description": "This is a very long comment for some reason, which will keep going and going past the point where it should probably have stopped.",
            "type": "array",
            "items": {
                "type": "string"
            },
            "default": null
        },
        "home phone": {
            "type": "string",
            "deprecated": true
        }
    }
}
{{{end}}}


We use `cue import` to convert the JSON Schema to CUE:

{{{with script "en" "cue import jsonschema"}}}
cue import -l '#Person:' schema.json
{{{end}}}

{{{with _script_ "en" "HIDDEN: move schema.cue sideways"}}}
mv schema.cue .schema.cue
{{{end}}}

`cue import` recognises JSON Schema from its signature fields, and uses the
schema's constraints to create a shorter, more readable CUE representation.
Our `-l` parameter tells `cue` to place the constraints inside the `#Person`
definition:

{{{with upload "en" "schema.cue"}}}
-- schema.cue --
import "strings"

#Person: {
	// Main Person schema.
	//
	// This schema defines a person.
	@jsonschema(schema="https://json-schema.org/draft/2019-09/schema")

	// What is this person called?
	name!: strings.MinRunes(1)

	// Where does this person live?
	address?: strings.MinRunes(1) & strings.MaxRunes(200)

	// This is a very long comment for some reason, which will keep
	// going and going past the point where it should probably have
	// stopped.
	children?: [...string] | *null
	"home phone"?: string @deprecated()
	...
}
{{{end}}}

{{{with _script_ "en" "HIDDEN: diff schema.cue"}}}
diff -u schema.cue .schema.cue
{{{end}}}

We use the imported schema to validate some known-good data (`good.json`)
and known-bad data (`bad.json`):

{{{with upload "en" "good"}}}
-- good.json --
{
    "name": "Dorothy Cartwright",
    "address": "Ripon, North Yorkshire"
}
{{{end}}}

{{{with upload "en" "bad"}}}
-- bad.json --
{
    "name": [
        "Charlie",
        "Cartwright"
    ],
    "address": "Ripon, North Yorkshire"
}
{{{end}}}

The
[`cue vet`]({{< relref "docs/reference/command/cue-help-vet" >}})
command validates our data against the `#Person` constraint:

{{{with script "en" "validate against cue"}}}
! cue vet -d '#Person' schema.cue good.json bad.json
{{{end}}}

The `cue vet` command can also validate the data using the JSON Schema directly:

{{{with script "en" "validate against json schema"}}}
! cue vet schema.json good.json bad.json
{{{end}}}

The `cue` command normally recognises JSON Schema's signature fields and treats
the contents of JSON Schema as data constraints - not just additional data.
A qualifier can be used to change this behaviour, as outlined in
[`cue help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes" >}}):

{{{with script "en" "use json schema as json"}}}
#ellipsis 4
cue def json: schema.json
{{{end}}}

## Using JSON Schema with the Go API

{{{with _script_ "en" "go mod init"}}}
go mod init mod.example
{{{end}}}

The
[`encoding/jsonschema`](https://pkg.go.dev/cuelang.org/go/encoding/jsonschema)
API
allows you to work with JSON Schema in Go code.

As with the `cue` command examples shown above, the API can be used to convert
JSON Schema to CUE. However, in this next example, we'll use the API in a more
fully-formed context: controlling data validation at a lower level.

This Go program validates a JSON data file against a JSON Schema:

{{{with upload "en" "main go program"}}}
-- main.go --
package main

import (
	"flag"
	"fmt"
	"log"
	"os"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/errors"
	"cuelang.org/go/encoding/json"
	"cuelang.org/go/encoding/jsonschema"
)

func main() {
	log.SetFlags(0)
	flag.Parse()
	args := flag.Args()

	// A cue.Context is used for building/compiling CUE at a low-level.
	// It replaces cue.Runtime.
	ctx := cuecontext.New()

	if len(args) != 2 {
		log.Fatalf("usage:\n\t%s SCHEMA.json DATA.json\n", os.Args[0])
	}

	// Load the schema file JSON
	schemaFile, err := os.ReadFile(args[0])
	if err != nil {
		log.Fatal(err)
	}
	schemaJsonAst, err := json.Extract(args[0], schemaFile)
	if err != nil {
		log.Fatal(err)
	}
	schemaJson := ctx.BuildExpr(schemaJsonAst)

	// Extract JSON Schema from the JSON
	schemaAst, err := jsonschema.Extract(schemaJson, &jsonschema.Config{
		Strict: true,
	})
	if err != nil {
		log.Fatal(err)
	}

	// Build a cue.Value of the schema
	schema := ctx.BuildFile(schemaAst)

	// Load the data file JSON
	dataFile, err := os.ReadFile(args[1])
	if err != nil {
		log.Fatal(err)
	}
	dataAst, err := json.Extract(args[1], dataFile)
	if err != nil {
		log.Fatal(err)
	}

	// Build a cue.Value of the data
	data := ctx.BuildExpr(dataAst)

	// Unify the schema and data
	res := schema.Unify(data)

	// Validate whether the combined (unified) result has errors or not.
	if err := res.Validate(cue.Concrete(true)); err != nil {
		// If errors, report them and fail.
		log.Fatal(errors.Details(err, nil))
	}
	// If no errors, print the data value
	fmt.Printf("%v\n", res)
}
{{{end}}}

{{{with _script_ "en" "go mod tidy"}}}
#ellipsis 0
go get cuelang.org/go@${CUELANG_CUE_LATEST}
#ellipsis 0
go mod tidy
{{{end}}}

Running the command validates the data file in the second argument against the
JSON schema in the first argument - printing the data if it's valid and
displaying a validation error otherwise. Here we use it to validate the same
`good.json` and `bad.json` files from above:

{{{with script "en" "go run"}}}
go run . schema.json good.json
! go run . schema.json bad.json
{{{end}}}

## Future plans

One of CUE's goals is to act as an *interlingua*: a bidirectional bridge
between all the formats that CUE speaks, linking constraints and data sources
of truth, no matter where they exist.

To meet this goal, CUE will gain the ability to export native CUE constraints
as JSON Schema, enabling their use by tools that aren't aware of CUE. This is
tracked in {{<issue 929/>}}.

## Related content

- {{< linkto/related/reference "command/cue-help-import" >}}
- The [`encoding/jsonschema`](https://pkg.go.dev/cuelang.org/go/encoding/jsonschema) Go API
- {{< linkto/related/reference "command/cue-help-vet" >}}
- {{< linkto/related/reference "command/cue-help-filetypes" >}}
- {{<issue 929>}}Issue #929{{</issue>}} tracks the conversion of CUE to JSON Schema
