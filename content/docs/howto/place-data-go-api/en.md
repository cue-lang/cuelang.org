---
title: Placing data using the Go API
tags:
- go api
authors:
- myitcv
toc_hide: true
---

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

This tutorial demonstrates how to mimic the `--path` or `-l` flag for `cmd/cue` to "place" data using the Go API.

{{{with step}}}
Initialize a CUE module to hold our configuration:

{{{with script "en" "start modules"}}}
cue mod init mod.example
{{{end}}}

{{{end}}}

{{{with step}}}
Write some CUE code and JSON data:

{{{with upload "en" "initial cue code"}}}
#location top-left top-right
-- some.cue --
package example

// We will place the data here
input!: {
	name!: string
}

output: "Hello \(input.name)"
-- input.json --
{
    "name": "cueckoo"
}
{{{end}}}

{{{end}}}

{{{with step}}}
Initialize a Go module to hold our program

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init mod.example
{{{end}}}

{{{end}}}


{{{with step}}}
Write our Go program to place the

{{{with upload "en" "go program"}}}
#location top-left
-- main.go --
package main

import (
	"fmt"
	"log"
	"os"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/encoding/json"
)

func main() {
	ctx := cuecontext.New()
	bis := load.Instances([]string{"."}, nil)
	v := ctx.BuildInstance(bis[0])

	// Load our input data
	jsonBytes, err := os.ReadFile("input.json")
	if err != nil {
		log.Fatal(err)
	}
	jsonData, err := json.Extract("input.json", jsonBytes)
	if err != nil {
		log.Fatal(err)
	}

	// Place as in the "input" field value
	complete := v.FillPath(cue.ParsePath("input"), jsonData)

	// Print the "output" field value
	fmt.Printf("%v\n", complete.LookupPath(cue.ParsePath("output")))
}
{{{end}}}

{{{end}}}

{{{with step}}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

{{{with script "en" "go test"}}}
#ellipsis 0
go get cuelang.org/go@$CUELANG_CUE_LATEST
#ellipsis 0
go mod tidy
{{{end}}}

{{{end}}}

{{{with step}}}
Run our program:

{{{with script "en" "go run"}}}
go run .
{{{end}}}

{{{end}}}

