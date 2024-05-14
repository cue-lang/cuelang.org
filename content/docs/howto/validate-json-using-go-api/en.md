---
title: Validate JSON using Go API
toc_hide: true
tags:
- go api
authors:
- myitcv
---

This guide demonstrates how to write a Go program to validate JSON using an
embeded CUE schema

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

## Create CUE schema

{{{with step}}}
{{{with upload "en" "cue schema"}}}
-- schema.cue --
#Schema: {
	name?: string
	age?:  int
}
{{{end}}}
{{{end}}}

{{{with step}}}
Create some test "good" data:

{{{with upload "en" "good data"}}}
-- good.json --
{
    "name": "Charlie Cartwright",
    "age": 99
}
{{{end}}}
{{{end}}}

{{{with step}}}
Create some test "bad" data:

{{{with upload "en" "bad data"}}}
-- bad.json --
{
    "name": "cueckoo",
    "age": false
}
{{{end}}}
{{{end}}}

{{{with step}}}
Verify that the data vets as we expect:

{{{with script "en" "test schema"}}}
cue vet -d '#Schema' schema.cue good.json
! cue vet -d '#Schema' schema.cue bad.json
{{{end}}}
{{{end}}}

## Create Go program to load and validate JSON

{{{with step}}}
Create a Go module, or use an existing one if that's more suitable for your situation:

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init go.example
{{{end}}}
{{{end}}}

{{{with step}}}
Create a main program:

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

	// Load the JSON file specificed as the only argument as a CUE value
	dataFilename := os.Args[1]
	dataFile, err := os.ReadFile(dataFilename)
	if err != nil {
		log.Fatal(err)
	}
	jsonExpr, err := json.Extract(dataFilename, dataFile)
	if err != nil {
		log.Fatal(err)
	}
	jsonAsCUE := ctx.BuildExpr(jsonExpr)

	// Validate the JSON data using the schema
	unified := schema.Unify(jsonAsCUE)
	if err := unified.Validate(); err != nil {
		fmt.Println("❌ JSON: NOT ok")
		log.Fatal(err)
	}

	fmt.Println("✅ JSON: ok")
}
{{{end}}}
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
Verify the Go program works against your test data:
{{{with script "en" "verify go program"}}}
go run . good.json
! go run . bad.json
{{{end}}}
{{{end}}}


## Related content

- TBC
