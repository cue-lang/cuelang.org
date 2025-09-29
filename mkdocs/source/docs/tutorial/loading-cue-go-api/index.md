---
title: Loading CUE via the Go API
tags:
- go api
authors:
- myitcv
toc_hide: true
---

This tutorial demonstrates how to get started with [CUE's Go
API](https://pkg.go.dev/cuelang.org/go), and write a Go program to load and
evaluate some CUE.

<!--more-->

## Prerequisites

- **A tool to edit text files**. Any text editor you have will be fine, for
  example [VSCode](https://code.visualstudio.com/).
- **A command terminal**. `cue` works on all platforms, so any terminal on Linux
  or macOS, and on PowerShell, `cmd.exe` or
  [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) in Windows.
- **An installed `go` binary**
  ([installation details](https://go.dev/doc/install))
- **An installed `cue` binary**
  ([installation details]({{< relref "docs/introduction/installation" >}}))
- **Some awareness of CUE schemata**
  ([Constraints]({{< relref "docs/tour/basics/constraints" >}}) and
   [Definitions]({{< relref "docs/tour/basics/definitions" >}}) in the CUE tour)

This tutorial is written using the following versions of `go` and `cue`:

```` { .text title="TERMINAL" data-copy="cue version&#10;go version" }
$ cue version
cue version v0.14.1
...
$ go version
go version go1.25.0 linux/amd64
````

## Create a CUE module

[**:material-chevron-right-circle-outline: Step 1**](#step-1){id="step-1"}: Initialize a CUE module to hold our configuration:

```` { .text title="TERMINAL" data-copy="cue mod init company.example/configuration" }
$ cue mod init company.example/configuration
````


---


[**:material-chevron-right-circle-outline: Step 2**](#step-2){id="step-2"}: Write some CUE code:

```` { .cue title="some.cue" }
package example

output: "Hello \(name)"
name:   "Joe"
````


---


[**:material-chevron-right-circle-outline: Step 3**](#step-3){id="step-3"}: Verify that the configuration successfully evaluates:

```` { .text title="TERMINAL" data-copy="cue export" }
$ cue export
{
    "output": "Hello Joe",
    "name": "Joe"
}
````


---


## Create a Go module and program

[**:material-chevron-right-circle-outline: Step 4**](#step-4){id="step-4"}: Initialize a Go module to contain your program:

```` { .text title="TERMINAL" data-copy="go mod init company.example/configuration" }
$ go mod init company.example/configuration
...
````


---


[**:material-chevron-right-circle-outline: Step 5**](#step-5){id="step-5"}: Write a Go program to load the CUE and print a message based on the `output`
field:

```` { .go title="main.go" }
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
````


---


[**:material-chevron-right-circle-outline: Step 6**](#step-6){id="step-6"}: Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

```` { .text title="TERMINAL" data-copy="go get cuelang.org/go@v0.14.1&#10;go mod tidy" }
$ go get cuelang.org/go@v0.14.1
...
$ go mod tidy
...
````

You can use `@latest` in place of a specified version.


---


## Run the Go program

[**:material-chevron-right-circle-outline: Step 7**](#step-7){id="step-7"}: Run the Go program:

```` { .text title="TERMINAL" data-copy="go run ." }
$ go run .
"Hello Joe"
````


---

## Congratulations!

Well done - you've successfully written your first Go program to load and
evaluate CUE.

## Related content

- [`cuelang.org/go` API docs](https://pkg.go.dev/cuelang.org/go)
