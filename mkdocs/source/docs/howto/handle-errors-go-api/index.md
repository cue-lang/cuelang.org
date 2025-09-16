---
title: Handling errors in the Go API
tags:
- go api
authors: [myitcv,jpluscplusm]
toc_hide: true
---

The CUE Go API contains several functions that might need to communicate
runtime errors to their caller, such as problems during evaluation or
validation. They do this using the
[`cue/errors.Error`](https://pkg.go.dev/cuelang.org/go/cue/errors#Error) type,
and the [`cue/errors`](https://pkg.go.dev/cuelang.org/go/cue/errors)
package contains functions that allow you to interrogate and manipulate these
errors.

This guide demonstrates how to catch these errors
and how to use the `cue/errors` package to examine their details.

<!--more-->

## Set up some CUE code

[**:material-chevron-right-circle-outline: Step 1**](#step-1){id="step-1"}: If you don't already have an existing CUE module,
initialize one to contain a configuration:

```` { .text title="TERMINAL" data-copy="cue mod init cue.example" }
$ cue mod init cue.example
````

---


[**:material-chevron-right-circle-outline: Step 2**](#step-2){id="step-2"}: If you don't already have some known-bad CUE that contains evaluation or
validation errors, create some:

```` { .cue title="bad.cue" }
package example

#Schema: {
	i: int
	s: string
}

val: #Schema & {
	i: "hello" // Not an int.
	s: 42      // Not a string.
}
````

---


[**:material-chevron-right-circle-outline: Step 3**](#step-3){id="step-3"}: Verify that the configuration does not validate successfully, as expected:

```` { .text title="TERMINAL" data-copy="cue vet -c" }
$ cue vet -c
val.i: conflicting values "hello" and int (mismatched types string and int):
    ./bad.cue:4:5
    ./bad.cue:9:5
val.s: conflicting values 42 and string (mismatched types int and string):
    ./bad.cue:5:5
    ./bad.cue:10:5
````

---


## Set up a Go program

[**:material-chevron-right-circle-outline: Step 4**](#step-4){id="step-4"}: If you don't already have an existing Go module,
initialize one to contain a Go program:

```` { .text title="TERMINAL" data-copy="go mod init go.example" }
$ go mod init go.example
...
````

---


[**:material-chevron-right-circle-outline: Step 5**](#step-5){id="step-5"}: Write a Go program that loads the CUE, evalutes some of it, and then prints a
summary and details of any evaluation or validation errors that ocurr:

```` { .go title="main.go" }
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
````

---


[**:material-chevron-right-circle-outline: Step 6**](#step-6){id="step-6"}: Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

```` { .text title="TERMINAL" data-copy="go get cuelang.org/go@v0.14.1&#10;go mod tidy" }
$ go get cuelang.org/go@v0.14.1
...
$ go mod tidy
...
````

You can use `@latest` in place of the specific version mentioned here.

---


## Run the Go program

[**:material-chevron-right-circle-outline: Step 7**](#step-7){id="step-7"}: Run the Go program:

```` { .text title="TERMINAL" data-copy="go run ." }
$ go run .
# Error summary [err]:
val.i: conflicting values "hello" and int (mismatched types string and int) (and 1 more errors)

# Error details [errors.Details(err)]:
val.i: conflicting values "hello" and int (mismatched types string and int):
    /home/runner/bad.cue:4:5
    /home/runner/bad.cue:9:5
val.s: conflicting values 42 and string (mismatched types int and string):
    /home/runner/bad.cue:5:5
    /home/runner/bad.cue:10:5

# Error count [len(errs)]:
2
````

---


Notice that
[`cue/errors.Details`](https://pkg.go.dev/cuelang.org/go/cue/errors#Details) is
simply a convenience function that returns the error texts of the underlying
errors, aggregated as a single string. The information and metadata contained
in each underlying error can be accessed by iterating through the slice of
individual errors returned by the
[`cue/errors.Errors`](https://pkg.go.dev/cuelang.org/go/cue/errors#Errors)
method.
## Related content

- Tag: {{< tag "go api" >}} -- pages documenting and using the Go API
- Go API: [`cue/errors`](https://pkg.go.dev/cuelang.org/go/cue/errors#section-documentation)
  -- package documentation
