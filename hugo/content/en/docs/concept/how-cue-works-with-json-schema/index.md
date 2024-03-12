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

```json { title="schema.json" }
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
```

```json { title="good.json" }
{
    "name": "cueckoo"
}
```

```json { title="bad.json" }
{
    "name": 42
}
```

We use `cue import` to convert the JSON Schema to CUE:

```text { title="TERMINAL" codeToCopy="Y3VlIGltcG9ydCAtbCAnI3BlcnNvbjonIHNjaGVtYS5qc29u" }
$ cue import -l '#person:' schema.json
```
`cue import` recognises JSON Schema's signature fields and creates `schema.cue`:

```cue { title="schema.cue" }
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
```
```text { title="TERMINAL" codeToCopy="Y3VlIHZldCAtZCAnI3BlcnNvbicgc2NoZW1hLmN1ZSBnb29kLmpzb24=" }
$ cue vet -d '#person' schema.cue good.json
```

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCAtZCAnI3BlcnNvbicgc2NoZW1hLmN1ZSBiYWQuanNvbg==" }
$ cue vet -d '#person' schema.cue bad.json
name: conflicting values 42 and strings.MinRunes(1) (mismatched types int and string):
    ./bad.json:2:13
    ./schema.cue:10:8
```

## Converting JSON Schema with the Go API

CUE's
[`encoding/jsonschema`](https://pkg.go.dev/cuelang.org/go/encoding/jsonschema)
Go API can also convert JSON Schema to CUE.
```go { title="main.go" }
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
```
```text { title="TERMINAL" codeToCopy="Z28gcnVuIC4gc2NoZW1hLmpzb24gZ29vZC5qc29uCmdvIHJ1biAuIHNjaGVtYS5qc29uIGJhZC5qc29u" }
$ go run . schema.json good.json
{
	name: "cueckoo"
}
...
$ go run . schema.json bad.json
name: conflicting values strings.MinRunes(1) and 42 (mismatched types string and int):
    bad.json:2:13
    schema.json:13:13
exit status 1
```
