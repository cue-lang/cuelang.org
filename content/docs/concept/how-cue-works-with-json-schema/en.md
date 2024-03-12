---
title: How CUE works with JSON Schema
tags:
- encodings
- cue command
authors:
- jpluscplusm
- myitcv
toc_hide: true
---

{{{with _script_ "en" "HIDDEN_ set up caches"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

[JSON Schema](https://json-schema.org/) is a schema format encoded purely as
data, usually JSON. This means that any underlying JSON Schema file can be
processed, validated, or emitted by CUE's standard
[JSON capabilities]({{< relref "how-cue-works-with-JSON" >}}).
However, this doesn't implicitly allow schemas *represented* as JSON Schema to
be used as such, natively, in CUE.

To enable *native* support of schema information held as JSON Schema,
the schema needs to be converted to CUE.
The `cue` CLI tool can do this,
with CUE's Go API also understanding JSON Schema and producing CUE.

## Converting JSON Schema with the `cue` CLI

The [`cue import`]({{< relref "docs/reference/cli/cue-import" >}}) command can
take JSON Schema and emit CUE.

Let's start with this JSON Schema document:

{{{with upload "en" "schema.json"}}}
-- schema.json --
{
    "$schema": "http://json-schema.org/draft-07/schema#",
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

{{{with upload "en" "good"}}}
-- good.json --
{
    "name": "cueckoo"
}
{{{end}}}

{{{with upload "en" "bad"}}}
-- bad.json --
{
    "name": 42
}
{{{end}}}

We use `cue import` to convert the JSON Schema to CUE:

{{{with script "en" "cue import jsonschema"}}}
cue import -l '#person:' schema.json
{{{end}}}

{{{with _script_ "en" "HIDDEN_ move schema.cue sideways"}}}
mv schema.cue .schema.cue
{{{end}}}

`cue import` recognises JSON Schema's signature fields and creates `schema.cue`:

{{{with upload "en" "schema.cue"}}}
-- schema.cue --
import "strings"

#person: {
	// Main Person schema.
	//
	// This schema defines a person.
	@jsonschema(schema="http://json-schema.org/draft-07/schema#")

	// What is this person called?
	name: strings.MinRunes(1)

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

{{{with _script_ "en" "_HIDDEN diff schema.cue"}}}
diff -u schema.cue .schema.cue
{{{end}}}

{{{with script "en" "validate good"}}}
cue vet -d '#person' schema.cue good.json
{{{end}}}

{{{with script "en" "validate bad"}}}
! cue vet -d '#person' schema.cue bad.json
{{{end}}}

## Converting JSON Schema with the Go API

CUE's
[`encoding/jsonschema`](https://pkg.go.dev/cuelang.org/go/encoding/jsonschema)
Go API can also convert JSON Schema to CUE.

{{{with _script_ "en" "go mod init"}}}
go mod init mod.example
{{{end}}}


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

	// A cue.Context is used for building/compiling CUE at a low-level.  It
	// replaces cue.Runtime.
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

{{{with script "en" "go run"}}}
#ellipsis 10
go run . schema.json good.json
! go run . schema.json bad.json
{{{end}}}
