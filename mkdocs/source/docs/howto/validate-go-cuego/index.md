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

<!--more-->

## Create a Go program using cuego

[**:material-chevron-right-circle-outline: Step 1**](#step-1){id="step-1"}: Initialize a Go module, or use an existing one if that's more suitable for your situation:

```` { .text title="TERMINAL" data-copy="go mod init go.example" }
$ go mod init go.example
...
````

---


[**:material-chevron-right-circle-outline: Step 2**](#step-2){id="step-2"}: Create a main program that uses the `cuego` API to perform the validation you require.

You can use this example code as a starting point:

```` { .go title="main.go" }
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
````

This example code uses `cuego`
to check two instances of a simple struct type (`good` / `bad`)
against CUE constraints embedded in the type definition (`Policy`),
and prints the validation result for each instance.

---


[**:material-chevron-right-circle-outline: Step 3**](#step-3){id="step-3"}: Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

```` { .text title="TERMINAL" data-copy="go get cuelang.org/go@v0.14.1&#10;go mod tidy" }
$ go get cuelang.org/go@v0.14.1
...
$ go mod tidy
...
````

---



[**:material-chevron-right-circle-outline: Step 4**](#step-4){id="step-4"}: Run the program:

```` { .text title="TERMINAL" data-copy="go run ." }
$ go run .
good: ✅ ok
bad: Action: 2 errors in empty disjunction:
Action: conflicting values "Allow" and "Bypass":
    <field:>:1:2
Action: conflicting values "Deny" and "Bypass":
    <field:>:1:12
Level: invalid value 5 (out of bound >10):
    <field:>:1:1

````

---

## Related content

- Go API: [`cuego`](https://pkg.go.dev/cuelang.org/go/cuego#section-documentation) -- package documentation
- Go API: [`cue/errors`](https://pkg.go.dev/cuelang.org/go/cue/errors#section-documentation) -- package documentation
- Tag: {{< tag "go api" >}} -- pages explaining and exploring CUE's Go API
