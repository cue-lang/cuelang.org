---
title: Loading CUE via the Go API
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

This tutorial demonstrates how to get started with [CUE's Go
API](https://pkg.go.dev/cuelang.org/go), and write a Go program to load and
evaluate some CUE.

## Prerequisites

- **A tool to edit text files**. Any text editor you have will be fine, for
  example [VSCode](https://code.visualstudio.com/).
- **A command terminal**. `cue` works on all platforms, so any terminal on Linux
  or macOS, and on PowerShell, `cmd.exe` or
  [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) in Windows.
- **An installed `go` binary**
  ([installation details](https://go.dev/doc/install))
- **An installed `cue` binary**
  ([installation details]({{< relref "/docs/introduction/installation" >}}))
- **Some awareness of CUE schemata**
  ([Constraints]({{< relref "/docs/tour/basics/constraints" >}}) and
   [Definitions]({{< relref "/docs/tour/basics/definitions" >}}) in the CUE tour)

This tutorial is written using the following versions of `go` and `cue`:

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
go version
{{{end}}}

## Create a CUE module

{{{with step}}}
Initialize a CUE module to hold our configuration:

{{{with script "en" "start modules"}}}
cue mod init company.example/configuration
{{{end}}}

{{{end}}}

{{{with step}}}
Write some CUE code:

{{{with upload "en" "initial cue code"}}}
-- some.cue --
package example

output: "Hello \(name)"
name:   "Joe"
{{{end}}}

{{{end}}}

{{{with step}}}
Verify that the configuration successfully evaluates:

{{{with script "en" "cue export"}}}
cue export
{{{end}}}

{{{end}}}

## Create a Go module and program

{{{with step}}}
Initialize a Go module to contain your program:

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init company.example/configuration
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
	"log"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
)

func main() {
	ctx := cuecontext.New()

	// Load the package "example" from the current directory.
	// We don't need to specify a config in this example.
	insts := load.Instances([]string{"."}, nil)

	// The current directory just has one file without any build tags,
	// and that file belongs to the example package.
	// So we get a single instance as a result.
	v := ctx.BuildInstance(insts[0])
	if err := v.Err(); err != nil {
		log.Fatal(err)
	}

	// Lookup the 'output' field and print it out
	output := v.LookupPath(cue.ParsePath("output"))
	fmt.Println(output)
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

{{{with _script_ "en" "https://github.com/cue-lang/docs-and-content/issues/186 #1"}}}
go vet ./...
go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./...
{{{end}}}

## Congratulations!

Well done - you've successfully written your first Go program to load and
evaluate CUE.

## Related content

- [`cuelang.org/go` API docs](https://pkg.go.dev/cuelang.org/go)
