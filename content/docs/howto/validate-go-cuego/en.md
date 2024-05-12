---
title: Validating Go values using the cuego API
tags:
- go api
- validation
authors:
- myitcv
toc_hide: true
---

This guide demonstrates how to validate Go values using the
[`cuego`](https://pkg.go.dev/cuelang.org/go/cuego#section-documentation) API.

The API checks values against CUE constraints expressed in
[Go struct tags](https://go.dev/ref/spec#Struct_types) using the `cue` namespace.

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

You can use this example code as a starting point.
It uses `cuego` to check two instances of a simple struct type
against CUE constraints embedded in the type definition,
and prints a validation result for each instance:

{{{with upload "en" "main.go"}}}
-- main.go --
package main

import (
	"fmt"

	"cuelang.org/go/cue/errors"
	"cuelang.org/go/cuego"
)

type Policy struct {
	Level  int    `cue:">10"`
	Action string `cue:" \"Allow\" | \"Deny\" "`
}

func main() {
	check := func(p Policy) string {
		if err := cuego.Validate(p); err != nil {
			return errors.Details(err, nil)
		}
		return "✅ ok"
	}
	good := Policy{
		Level:  100,
		Action: "Allow",
	}
	bad := Policy{
		Level:  5,
		Action: "Apples",
	}
	fmt.Printf("good: %v\n", check(good))
	fmt.Printf("bad: %v\n", check(bad))
}
{{{end}}}
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

## Related content

- The [`cuego`](https://pkg.go.dev/cuelang.org/go/cuego#section-documentation) API package documentation
- The [`cue/errors`](https://pkg.go.dev/cuelang.org/go/cue/errors#section-documentation) API package documentation
- Other pages explaining CUE's Go API: {{< tag "go api" >}}
