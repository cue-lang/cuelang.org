---
title: Go API basics
tags:
- go api
authors:
- myitcv
toc_hide: true
---

This howto demonstrates getting started with CUE's Go API.

{{{with _script "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

{{{with script "en" "go version"}}}
go version
{{{end}}}

{{{with script "en" "start modules"}}}
cue mod init company.com/example
go mod init company.com/example
{{{end}}}

{{{with upload "en" "initial cue code"}}}
-- some.cue --
package example

output: "Hello \(name)"
name:   "Joe"
{{{end}}}


{{{with script "en" "cue export"}}}
cue export .
{{{end}}}


{{{with upload "en" "initial go code"}}}
-- main.go --
package main

import (
	"fmt"
	"log"
	"path/filepath"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
)

func main() {
	// Load the package "example" from the current directory.
	// We don't need to specify a config in this case.
	insts := load.Instances([]string{"."}, nil)

	// The current directory just has one file without any build tags,
	// and that file belongs to the example package.
	// So we get a single instance as a result.
	fmt.Println("Number of instances:", len(insts))
	inst := insts[0]
	if err := inst.Err; err != nil {
		log.Fatal(err)
	}
	fmt.Println("Instance module:", inst.Module)
	fmt.Println("Instance import path:", inst.ImportPath)
	fmt.Println()

	// Inspect the syntax trees.
	fmt.Println("Source files:")
	for _, file := range inst.Files {
		fmt.Println(filepath.Base(file.Filename), "with", len(file.Decls), "declarations")
	}
	fmt.Println()

	// Build the instance into a value.
	// We can also use BuildInstances for many instances at once.
	ctx := cuecontext.New()
	val := ctx.BuildInstance(inst)
	if err := val.Err(); err != nil {
		log.Fatal(err)
	}

	// Inspect the contents of the value, such as one string field.
	fieldStr, err := val.LookupPath(cue.MakePath(cue.Str("output"))).String()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("Field string:", fieldStr)
}
{{{end}}}

{{{with script "en" "go test"}}}
#ellipsis 0
go get cuelang.org/go@$CUELANG_CUE_PRERELEASE
#ellipsis 0
go mod tidy
go run .
{{{end}}}
