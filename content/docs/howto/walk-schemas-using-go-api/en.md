---
title: Walking schemas using the Go API
toc_hide: true
tags:
- go api
authors:
- myitcv
---

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

This guide demonstrates how to walk a CUE schema using the Go API,
programmatically inspecting its structure and types.

The Go code shown here is a limited code generator which produces Go structs
from simple CUE definitions.
It could be adapted to other schema-walking tasks - not just code generation.

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

The identifiers for the CUE and Go modules don't need to match, but it doesn't
matter if they're the same.
{{{end}}}

## Declare a CUE schema

{{{with step}}}
Declare the CUE schema that you wish to walk.
We'll use the following `example.cue` file,
but you should use some CUE that's specific to your situation.

{{{with upload "en" "schema"}}}
-- example.cue --
package example

#Person: {
	name!: string
	age?:  int & >=0
}

#Address: {
	line1!:   string
	line2?:   string
	line3?:   string
	country?: string
}

aPerson: #Person & {
	name: "John Adams"
}

anAddress: #Address & {
	line1:   "1600 Pennsylvania Ave NW"
	line2:   "Washington, DC 20500"
	country: "United States of America"
}

someData: aValue:      42
_aHiddenField: aValue: 139
{{{end}}}

Our `example.cue` file contains two
[definitions]({{< relref "docs/tour/types/defs/" >}}) that we want to process:
`#Person` and `#Address`.
It also includes concrete data fields and a hidden field,
which we don't consider as schema. The data and hidden fields are included in
order to demonstrate that they are *not* processed by the code presented below.
{{{end}}}

{{{with step}}}
Ensure there are no errors in our CUE:

{{{with script "en" "vet"}}}
cue vet
{{{end}}}

{{{end}}}

## Use a Go program to walk the schema

{{{with step}}}
Create the file `main.go` and add the following code:

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

	// Load CUE from the package in the current directory
	insts := load.Instances([]string{"."}, nil)
	v := ctx.BuildInstance(insts[0])
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

You can use `@latest` in place of a specific version.

{{{end}}}

{{{with step}}}
Run the Go program:

{{{with script "en" "run go program"}}}
go run .
{{{end}}}

As you can see from its output, this Go program is a very limited form of code
generator that takes each CUE definition and produces a matching Go struct type.
{{{end}}}

## Related content

- The [`cue`](https://pkg.go.dev/cuelang.org/go/cue) Go API
- The [`cue/cuecontext`](https://pkg.go.dev/cuelang.org/go/cue/cuecontext) Go API
- The [`cue/load`](https://pkg.go.dev/cuelang.org/go/cue/load) Go API
- {{< linkto/related/reference "command/cue-help-mod-init" >}}
- {{< linkto/related/reference "command/cue-help-vet" >}}
- {{< linkto/related/tour "types/defs" >}}
