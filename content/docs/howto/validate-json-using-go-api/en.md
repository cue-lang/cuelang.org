---
title: Validate JSON using the Go API
tags:
- go api
- validation
- encodings
authors:
- myitcv
toc_hide: true
---

This guide demonstrates how to write a Go program that validates JSON files
using an embeded CUE schema.

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

## Set up some schema and data files

{{{with step}}}
Create a CUE schema.

You can use any schema that's relevant to your specific data, but our example uses this simple CUE:

{{{with upload "en" "cue schema"}}}
-- schema.cue --
#Schema: {
	name?: string
	age?:  int
}
{{{end}}}
{{{end}}}


{{{with step}}}
Create some known-good and known-bad test data.

You may already have some representative test data. This data is relevant to our example schema:

{{{with upload "en" "good data"}}}
-- good.json --
{
    "name": "Charlie Cartwright",
    "age": 80
}
{{{end}}}

{{{with upload "en" "bad data"}}}
-- bad.json --
{
    "name": [
        "Moby",
        "Dick"
    ],
    "age": "173"
}
{{{end}}}
{{{end}}}

{{{with step}}}
Verify that your schema accepts and rejects your test data appropriately.

Our example schema is contained in the `#Schema` definition, which we reference explicitly:

{{{with script "en" "test schema"}}}
cue vet   schema.cue good.json -d '#Schema'
! cue vet schema.cue bad.json  -d '#Schema'
{{{end}}}
{{{end}}}

## Create a Go program

{{{with step}}}
Initialize a Go module, or use an existing one if that's more suitable for your situation:

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init go.example
{{{end}}}
{{{end}}}

{{{with step}}}
Create a main program.

You can use this example code as a starting point:

{{{with upload "en" "main go"}}}
-- main.go --
package main

import (
	"fmt"
	"log"
	"os"

	_ "embed"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/encoding/json"
)

// Embed our schema in a Go string variable.
//
//go:embed schema.cue
var cueSource string

func main() {
	ctx := cuecontext.New()

	// Build the schema
	schema := ctx.CompileString(cueSource).LookupPath(cue.ParsePath("#Schema"))

	// Load the JSON file specified (the program's sole argument) as a CUE value
	dataFilename := os.Args[1]
	dataFile, err := os.ReadFile(dataFilename)
	if err != nil {
		log.Fatal(err)
	}
	dataExpr, err := json.Extract(dataFilename, dataFile)
	if err != nil {
		log.Fatal(err)
	}
	dataAsCUE := ctx.BuildExpr(dataExpr)

	// Validate the JSON data using the schema
	unified := schema.Unify(dataAsCUE)
	if err := unified.Validate(); err != nil {
		fmt.Println("❌ JSON: NOT ok")
		log.Fatal(err)
	}

	fmt.Println("✅ JSON: ok")
}
{{{end}}}

This example code embeds the CUE from `schema.cue` and uses it to validate a
single JSON file, printing the validation result to its standard output stream.
{{{end}}}

{{{with step}}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:
{{{with script "en" "deps and tidy"}}}
#ellipsis 0
go get cuelang.org/go@${CUELANG_CUE_LATEST}
#ellipsis 0
go mod tidy
{{{end}}}
{{{end}}}

## Run the Go program

{{{with step}}}
Verify that the Go program accepts and rejects your test data as expected:

{{{with script "en" "verify go program"}}}
go run . good.json
! go run . bad.json
{{{end}}}
{{{end}}}

## Related content

- Go API: [`cue`](https://pkg.go.dev/cuelang.org/go/cue#section-documentation) -- package documentation
- Go API: [`cue/cuecontext`](https://pkg.go.dev/cuelang.org/go/cue/cuecontext#section-documentation) -- package documentation
- Go API: [`encoding/json`](https://pkg.go.dev/cuelang.org/go/encoding/json#section-documentation) -- package documentation
- Tag: {{< tag "go api" >}} -- pages explaining and exploring CUE's Go API
