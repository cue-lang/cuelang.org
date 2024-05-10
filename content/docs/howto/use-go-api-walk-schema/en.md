---
title: Walking schemas using Go API
toc_hide: true
tags:
- go api
authors:
- myitcv
---

{{< caution >}}
**Caution:** This guide is work in progress.
{{< /caution >}}

This guide demonstrates how to walk a CUE schema using the Go API.

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

## Initialize Go and CUE modules

{{{with step}}}
Create a Go module, or use an existing one if that's more suitable for your situation:

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init go.example
{{{end}}}
{{{end}}}

{{{with step}}}
Create a CUE module if you don't already have one:

{{{with script "en" "cue mod init"}}}
cue mod init cue.example
{{{end}}}
{{{end}}}

## Declare a CUE schema

{{{with step}}}
Declare a CUE schema that you wish to walk:

{{{with upload "en" "schema"}}}
-- example.cue --
package example

#person: {
	name!: string
	age?:  int
}

#address: {
	country?: string
}

data: {
	name: "cueckoo"
}

_hidden: {
	value: 5
}
{{{end}}}

This `.cue` file also includes hidden and data fields which we don't consider as
schema. They are included to demonstrate that they are _not_ walked.
{{{end}}}

{{{with step}}}
Ensure we have no errors in our CUE:

{{{with script "en" "vet"}}}
cue vet .
{{{end}}}

{{{end}}}

## Create a Go program to walk the schema

{{{with step}}}
Write the following Go code:

{{{with upload "en" "go program"}}}
-- main.go --
package main

import (
	"fmt"
	"log"
	"strings"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
)

func main() {
	ctx := cuecontext.New()

	// Load cue from the package in the current directory
	bis := load.Instances([]string{"."}, nil)
	v := ctx.BuildInstance(bis[0])
	if err := v.Err(); err != nil {
		log.Fatal(err)
	}

	// "Render" the top-level struct definitions as Go types
	fmt.Printf("package p\n\n")

	it, err := v.Fields(cue.Definitions(true))
	if err != nil {
		log.Fatal(err)
	}
	for it.Next() {
		v := it.Value()
		if !it.IsDefinition() || v.IncompleteKind() != cue.StructKind {
			continue
		}
		structToType(it.Selector(), it.Value())
	}
}

// structToType prints the top-level fields of a struct value
func structToType(name cue.Selector, val cue.Value) {
	fmt.Printf("type %v struct {\n", strings.TrimPrefix(name.String(), "#"))

	// Iterate through the fields of the struct
	it, _ := val.Fields(cue.Optional(true))
	for it.Next() {
		switch k := it.Value().IncompleteKind(); k {
		case cue.StringKind, cue.IntKind, cue.FloatKind, cue.BoolKind:
			fmt.Printf("\t%v %v\n", it.Selector().Unquoted(), it.Value().IncompleteKind())
		}
	}

	fmt.Printf("}\n")
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

You can use `@latest` in place of a specified version.

{{{end}}}

{{{with step}}}
Run the Go program:

{{{with script "en" "run go program"}}}
go run .
{{{end}}}

As you can see, our Go program is a very limited form of code generator, taking
a CUE definition and generating Go types from it.

{{{end}}}
