---
title: Validate Go values using cuego
toc_hide: true
tags:
- go api
authors:
- myitcv
---

This guide demonstrates how to validate Go values using `cuego`
and `cue` struct tags to express CUE constraints.

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

## Create a Go program using cuego

{{{with step}}}
Create a Go module, or use an existing one if that's more suitable for your situation:

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init go.example
{{{end}}}
{{{end}}}

{{{with step}}}
Create a main program that uses `cuego`:

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
	Action string `cue:"or([\"Allow\", \"Deny\"])"`
}

func main() {
	check := func(p Policy) string {
		if err := cuego.Validate(p); err != nil {
			return errors.Details(err, nil)
		}
		return "ok"
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
Run the program to see `cuego` in action:

{{{with script "en" "run"}}}
go run .
{{{end}}}

{{{end}}}
