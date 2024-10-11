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

## Set up some CUE code

{{< step stepNumber="1" >}}
If you don't already have an existing CUE module,
initialize one to contain a configuration:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```
{{< /step >}}

{{< step stepNumber="2" >}}
If you don't already have some known-bad CUE that contains evaluation or
validation errors, create some:

{{< code-tabs >}}
{{< code-tab name="bad.cue" language="cue" area="top-left" >}}
package example

#Schema: {
	i: int
	s: string
}

val: #Schema & {
	i: "hello" // Not an int.
	s: 42      // Not a string.
}
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

{{< step stepNumber="3" >}}
Verify that the configuration does not validate successfully, as expected:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldA==" }
$ cue vet
val.i: conflicting values int and "hello" (mismatched types int and string):
    ./bad.cue:4:5
    ./bad.cue:9:5
val.s: conflicting values string and 42 (mismatched types string and int):
    ./bad.cue:5:5
    ./bad.cue:10:5
```
{{< /step >}}

## Set up a Go program

{{< step stepNumber="4" >}}
If you don't already have an existing Go module,
initialize one to contain a Go program:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gbW9kIGluaXQgZ28uZXhhbXBsZQ==" }
$ go mod init go.example
...
```
{{< /step >}}

{{< step stepNumber="5" >}}
Write a Go program that loads the CUE, evalutes some of it, and then prints a
summary and details of any evaluation or validation errors that ocurr:

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

{{< step stepNumber="6" >}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjEwLjAKZ28gbW9kIHRpZHk=" }
$ go get cuelang.org/go@v0.10.0
...
$ go mod tidy
...
```

You can use `@latest` in place of the specific version mentioned here.
{{< /step >}}

## Run the Go program

{{< step stepNumber="7" >}}
Run the Go program:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gcnVuIC4=" }
$ go run .
# Error summary [err]:
val.i: conflicting values int and "hello" (mismatched types int and string) (and 1 more errors)

# Error details [errors.Details(err)]:
val.i: conflicting values int and "hello" (mismatched types int and string):
    /home/runner/bad.cue:4:5
    /home/runner/bad.cue:9:5
val.s: conflicting values string and 42 (mismatched types string and int):
    /home/runner/bad.cue:5:5
    /home/runner/bad.cue:10:5

# Error count [len(errs)]:
2
```
{{< /step >}}

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
