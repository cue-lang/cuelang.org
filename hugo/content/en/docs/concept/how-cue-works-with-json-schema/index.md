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

CUE allows you to work with
[JSON Schema](https://json-schema.org/)
both as a first-class source of truth, using constraints stored as JSON Schema
to validate data directly, and as a format that can be converted to CUE's more
succinct and expressive form.

In this guide we'll see
[`cue import`]({{< relref "docs/reference/cli/cue-import" >}})
converting a JSON Schema to CUE;
[`cue vet`]({{< relref "docs/reference/cli/cue-vet" >}})
using JSON Schema constraints directly; and the
[`encoding/jsonschema`](https://pkg.go.dev/cuelang.org/go/encoding/jsonschema)
Go API validating data against a JSON Schema.

## Using JSON Schema with the `cue` CLI

The [`cue import`]({{< relref "docs/reference/cli/cue-import" >}}) command can
take JSON Schema and emit CUE.

Let's start with this JSON Schema:

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


We can use `cue import` to convert the JSON Schema to CUE:

```text { title="TERMINAL" codeToCopy="Y3VlIGltcG9ydCAtbCAnI3BlcnNvbjonIHNjaGVtYS5qc29u" }
$ cue import -l '#person:' schema.json
```
`cue import` recognises JSON Schema's signature fields and creates the shorter,
more readable `schema.cue`:

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
Now we can use the converted schema to validate some known-good data
(`good.json`) and known-bad data (`bad.json`):

```json { title="good.json" }
{
    "name": "Dorothy Cartwright",
    "address": "Ripon, North Yorkshire"
}
```

```json { title="bad.json" }
{
    "name": [
        "Charlie",
        "Cartwright"
    ],
    "address": "Ripon, North Yorkshire"
}
```

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCAtZCAnI3BlcnNvbicgc2NoZW1hLmN1ZSBnb29kLmpzb24gYmFkLmpzb24=" }
$ cue vet -d '#person' schema.cue good.json bad.json
name: conflicting values strings.MinRunes(1) and ["Charlie","Cartwright"] (mismatched types string and list):
    ./bad.json:2:13
    ./schema.cue:10:8
```

The `cue vet` command can also validate the data using the JSON Schema
directly, *without* first converting it to CUE:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCBzY2hlbWEuanNvbiBnb29kLmpzb24gYmFkLmpzb24=" }
$ cue vet schema.json good.json bad.json
name: conflicting values strings.MinRunes(1) and ["Charlie","Cartwright"] (mismatched types string and list):
    ./bad.json:2:13
    ./schema.json:13:13
```

When used directly, the `cue` command recognises JSON Schema's signature fields
and it treats the file's contents as data constraints - not just additional
data. This behaviour can be changed by using a qualifier to guide how the file
is treated, as outlined in
[`cue filetypes`]({{< relref "docs/reference/cli/cue-filetypes" >}}):

```text { title="TERMINAL" codeToCopy="Y3VlIGRlZiBqc29uOiBzY2hlbWEuanNvbg==" }
$ cue def json: schema.json
$schema:     "http://json-schema.org/draft-07/schema#"
type:        "object"
title:       "Main Person schema."
description: "This schema defines a person."
...
```

## Using JSON Schemas with the Go API
The
[`encoding/jsonschema`](https://pkg.go.dev/cuelang.org/go/encoding/jsonschema)
API
allows you to work with JSON Schema in Go code.

As with the `cue` command examples shown above, the API can be used to convert
JSON Schema to CUE, but here it's being used in a more fully-formed, end-to-end
context, controlling data validation at a lower level.

This Go program validates a JSON data file against a JSON Schema:

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
```
Running the command validates the data file in the second argument against the
JSON schema in the first argument - printing the data if it's valid and
displaying a validation error otherwise. Here we use it to validate the same
`good.json` and `bad.json` files from above:

```text { title="TERMINAL" codeToCopy="Z28gcnVuIC4gc2NoZW1hLmpzb24gZ29vZC5qc29uCmdvIHJ1biAuIHNjaGVtYS5qc29uIGJhZC5qc29u" }
$ go run . schema.json good.json
{
	name:    "Dorothy Cartwright"
	address: "Ripon, North Yorkshire"
}
$ go run . schema.json bad.json
name: conflicting values strings.MinRunes(1) and ["Charlie","Cartwright"] (mismatched types string and list):
    bad.json:2:13
    schema.json:13:13
exit status 1
```

## Future plans

The CUE project believes that its role can be one of *interlingua*: a
bidirectional bridge between all the formats that CUE speaks, linking the
sources of truth for constraints with data, no matter where they exist.

As part of this goal, CUE will gain the ability to **export native CUE
constraints as JSON Schema**, allowing their use by tools that aren't yet aware
of CUE. This is tracked in {{<issue 929/>}}.

## Related content

- {{< linkto/related/reference "cli/cue-import" >}}
- The [`encoding/jsonschema`](https://pkg.go.dev/cuelang.org/go/encoding/jsonschema) Go API
- {{< linkto/related/reference "cli/cue-vet" >}}
- {{< linkto/related/reference "cli/cue-filetypes" >}}
- {{< linkto/related/concept "how-cue-works-with-JSON" >}}
- {{<issue 929>}}Issue #929{{</issue>}} tracks the conversion of CUE to JSON Schema
