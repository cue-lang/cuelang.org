---
title: Handling errors in the Go API
tags:
- go api
authors: [myitcv,jpluscplusm]
toc_hide: true
---

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

The CUE Go API contains several functions that might need to communicate
runtime errors to their caller, such as problems during evaluation or
validation. They do this using the
[`cue/errors.Error`](https://pkg.go.dev/cuelang.org/go/cue/errors#Error) type,
and the [`cue/errors`](https://pkg.go.dev/cuelang.org/go/cue/errors)
package contains functions that allow you to interrogate and manipulate these
errors.

This guide demonstrates how to catch these errors
and how to use the `cue/errors` package to examine their details.

## Set up some CUE code

{{{with step}}}
If you don't already have an existing CUE module,
initialize one to contain a configuration:

{{{with script "en" "start modules"}}}
cue mod init cue.example
{{{end}}}
{{{end}}}

{{{with step}}}
If you don't already have some known-bad CUE that contains evaluation or
validation errors, create some:

{{{with upload "en" "initial cue code"}}}
-- bad.cue --
package example

#Schema: {
	i: int
	s: string
}

val: #Schema & {
	i: "hello" // Not an int.
	s: 42      // Not a string.
}
{{{end}}}
{{{end}}}

{{{with step}}}
Verify that the configuration does not validate successfully, as expected:

{{{with script "en" "cue export"}}}
! cue vet
{{{end}}}
{{{end}}}

## Set up a Go program

{{{with step}}}
If you don't already have an existing Go module,
initialize one to contain a Go program:

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init go.example
{{{end}}}
{{{end}}}

{{{with step}}}
Write a Go program that loads the CUE, evalutes some of it, and then prints a
summary and details of any evaluation or validation errors that ocurr:

{{{with upload "en" "initial go code"}}}
-- main.go --
package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/errors"
	"cuelang.org/go/cue/load"
)

func main() {
	ctx := cuecontext.New()

	// Load the CUE package in the current directory and extract a value from it.
	insts := load.Instances([]string{"."}, nil)
	pkg := ctx.BuildInstance(insts[0])
	val := pkg.LookupPath(cue.ParsePath("val"))

	// Check if the value evaluates successfully.
	err := val.Validate(cue.Concrete(true))
	if err != nil {
		// Extract one or more errors from the evaluation.
		errs := errors.Errors(err)

		// Display information about the errors.
		fmt.Println(`# Error summary [err]:`)
		fmt.Printf("%v\n\n", err)

		fmt.Println(`# Error details [errors.Details(err)]:`)
		fmt.Printf("%v\n", errors.Details(err, nil))

		fmt.Println(`# Error count [len(errs)]:`)
		fmt.Printf("%d\n", len(errs))
	}
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

You can use `@latest` in place of the specific version mentioned here.
{{{end}}}

## Run the Go program

{{{with step}}}
Run the Go program:

{{{with script "en" "go run"}}}
go run .
{{{end}}}
{{{end}}}

Notice that
[`cue/errors.Details`](https://pkg.go.dev/cuelang.org/go/cue/errors#Details) is
simply a convenience function that returns the error texts of the underlying
errors, aggregated as a single string. The information and metadata contained
in each underlying error can be accessed by iterating through the slice of
individual errors returned by the
[`cue/errors.Errors`](https://pkg.go.dev/cuelang.org/go/cue/errors#Errors)
method.

{{{with _script_ "en" "https://github.com/cue-lang/docs-and-content/issues/186 #1"}}}
go vet ./...
#ellipsis 0
go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./...
{{{end}}}

## Related content

- Tag: {{< tag "go api" >}} -- pages documenting and using the Go API
- Go API: [`cue/errors`](https://pkg.go.dev/cuelang.org/go/cue/errors#section-documentation)
  -- package documentation
