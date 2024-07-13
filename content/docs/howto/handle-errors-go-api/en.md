---
title: Handle errors in the Go API
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

## Create a CUE module

{{{with step}}}
Initialize a CUE module to hold our configuration:

{{{with script "en" "start modules"}}}
cue mod init mod.example
{{{end}}}

{{{end}}}

{{{with step}}}
Write some CUE code:

{{{with upload "en" "initial cue code"}}}
-- some.cue --
package example

#schema: {
	i: int
	s: string
}

val: #schema & {
	i: "hello"
	s: 1
}
{{{end}}}

{{{end}}}

{{{with step}}}
Verify that the configuration successfully evaluates:

{{{with script "en" "cue export"}}}
! cue export
{{{end}}}

{{{end}}}

## Create a Go module and program

{{{with step}}}
Initialize a Go module to contain your program:

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init mod.example
{{{end}}}

{{{end}}}

{{{with step}}}
Write a Go program to load the CUE and print a message based on the `output`
field:

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
	insts := load.Instances([]string{"."}, nil)
	pkg := ctx.BuildInstance(insts[0])
	val := pkg.LookupPath(cue.ParsePath("val"))
	err := val.Validate(cue.Concrete(true))
	errs := errors.Errors(err)

	fmt.Printf("err: %v\n", err)
	fmt.Printf("errors.Details(err): %v", errors.Details(err, nil))
	fmt.Printf("len(errs): %d\n", len(errs))
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

## Run the Go program

{{{with step}}}
Run the Go program:

{{{with script "en" "go run"}}}
go run .
{{{end}}}

{{{end}}}

Notice that
[`errors.Details`](https://pkg.go.dev/cuelang.org/go/cue/errors#Details) is a
simply a convenience to return the error text (from the underlying errors) as a
string. [`errors.Errors`](https://pkg.go.dev/cuelang.org/go/cue/errors#Errors)
allows you to iterate through each individual error.

