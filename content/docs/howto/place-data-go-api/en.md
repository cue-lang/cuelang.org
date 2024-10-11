---
title: Placing data using the Go API
tags: [go api]
authors: [myitcv,jpluscplusm]
toc_hide: true
---

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

The `cue` command allows non-CUE data to be "placed" at a specific location in
its evaluation with the `--path`/`-l` flag.
This guide demonstrates how to achieve the same result using the Go API.

## Set up the environment

{{{with step}}}
If you don't already have CUE or Go modules, initialize them:

{{{with script "en" "start modules"}}}
cue mod init cue.example
#ellipsis 0
go mod init go.example
{{{end}}}
{{{end}}}

## Create some data files

{{{with step}}}
Write some CUE code and JSON data
(if you don't already have some code that you want to update and use):

{{{with upload "en" "initial cue code"}}}
#location left right
-- some.cue --
package example

// The data will be placed at this location.
input: {
	name!:    string
	location: *"your part of the world" | string
}

output: """
    Hello, \(input.name)!
    How's the weather in \(input.location)?
    """
-- input.json --
{
    "name": "Charlie"
}
{{{end}}}
{{{end}}}

{{{with step}}}
Check that the data file can be combined successfully with the CUE:

{{{with script "en" "test cue"}}}
cue export . input.json --path input: -e output --out text
{{{end}}}
{{{end}}}

## Write some Go

{{{with step}}}
Write a Go program that places the data in the `input.json` file at a specific
location within its CUE evaluation
(or adapt your existing code to do the same):

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
	// Load the package in the current directory.
	bis := load.Instances([]string{"."}, nil)
	v := ctx.BuildInstance(bis[0])

	// Load the input data.
	jsonBytes, err := os.ReadFile("input.json")
	if err != nil {
		log.Fatal(err)
	}

	// Parse the input data to a CUE expression.
	jsonData, err := json.Extract("input.json", jsonBytes)
	if err != nil {
		log.Fatal(err)
	}

	// Place the parsed data as the value of the "input" field.
	complete := v.FillPath(cue.ParsePath("input"), jsonData)

	// Extract the string value of the "output" field and print it.
	output := complete.LookupPath(cue.ParsePath("output"))
	msg, _ := output.String() // We know that "output" is a string type.
	fmt.Printf("%v\n", msg)
}
{{{end}}}
{{{end}}}

## Run the program

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
Run the program,
printing the same multi-line string value that `cue` produced earlier:

{{{with script "en" "go run"}}}
go run .
{{{end}}}
{{{end}}}

{{{with _script_ "en" "https://github.com/cue-lang/docs-and-content/issues/186 #1"}}}
go vet ./...
go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./...
{{{end}}}

## Related content

- {{< linkto/related/concept "how-cue-works-with-go" >}}
- All pages tagged with {{< tag "go api" >}}
