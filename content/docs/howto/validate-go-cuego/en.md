---
title: Validating Go values using the cuego API
tags:
- go api
- validation
authors:
- myitcv
toc_hide: true
---

This guide demonstrates how to use the
[`cuego`](https://pkg.go.dev/cuelang.org/go/cuego#section-documentation)
API to validate Go values against CUE constraints expressed in
[Go struct tags](https://go.dev/ref/spec#Struct_types).

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

## Create a Go program using cuego

{{{with step}}}
Initialize a Go module, or use an existing one if that's more suitable for your situation:

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init go.example
{{{end}}}
{{{end}}}

{{{with step}}}
Create a main program that uses the `cuego` API to perform the validation you require.

You can use this example code as a starting point:

{{{with upload "en" "main.go"}}}
-- main.go --
package main

import (
	"fmt"

	"cuelang.org/go/cue/errors"
	"cuelang.org/go/cuego"
)

// Policy contains fields with struct tags in the "cue" namespace.
// These tags are read by the cuego API, and define field-level CUE constraints.
type Policy struct {
	Level  int    `cue:">10"`
	Action string `cue:" \"Allow\" | \"Deny\" "`
}

func main() {
	// check uses the cuego API to validate an instance of a Policy against the
	// CUE constraints embedded in the type definition. It returns either a
	// success message, or one or more errors formatted as a string.
	check := func(p Policy) string {
		if err := cuego.Validate(p); err != nil {
			return errors.Details(err, nil)
		}
		return "✅ ok"
	}

	// good is an instance of a Policy that adheres to the type's CUE constraints.
	good := Policy{
		Level:  100,
		Action: "Allow",
	}
	// bad is an instance of a Policy that violates the type's CUE constraints.
	bad := Policy{
		Level:  5,
		Action: "Bypass",
	}

	// Display the validation result for each Policy instance.
	fmt.Printf("good: %v\n", check(good))
	fmt.Printf("bad: %v\n", check(bad))
}
{{{end}}}

This example code uses `cuego`
to check two instances of a simple struct type (`good` / `bad`)
against CUE constraints embedded in the type definition (`Policy`),
and prints the validation result for each instance.
{{{end}}}

{{{with step}}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

{{{with script "en" "tidy"}}}
#ellipsis 0
go get cuelang.org/go@${CUELANG_CUE_LATEST}
#ellipsis 0
go mod tidy
{{{end}}}
{{{end}}}


{{{with step}}}
Run the program:

{{{with script "en" "run"}}}
go run .
{{{end}}}
{{{end}}}

{{{with _script_ "en" "https://github.com/cue-lang/docs-and-content/issues/186 #1"}}}
go vet ./...
#ellipsis 0
go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./...
{{{end}}}

## Related content

- Go API: [`cuego`](https://pkg.go.dev/cuelang.org/go/cuego#section-documentation) -- package documentation
- Go API: [`cue/errors`](https://pkg.go.dev/cuelang.org/go/cue/errors#section-documentation) -- package documentation
- Tag: {{< tag "go api" >}} -- pages explaining and exploring CUE's Go API
