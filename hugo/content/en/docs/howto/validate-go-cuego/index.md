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

## Create a Go program using cuego

{{< step stepNumber="1" >}}
Initialize a Go module, or use an existing one if that's more suitable for your situation:

```text { title="TERMINAL" codeToCopy="Z28gbW9kIGluaXQgZ28uZXhhbXBsZQ==" }
$ go mod init go.example
...
```
{{< /step >}}

{{< step stepNumber="2" >}}
Create a main program that uses the `cuego` API to perform the validation you require.

You can use this example code as a starting point:

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

This example code uses `cuego`
to check two instances of a simple struct type (`good` / `bad`)
against CUE constraints embedded in the type definition (`Policy`),
and prints the validation result for each instance.
{{< /step >}}

{{< step stepNumber="3" >}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjkuMC1yYy4xLjAuMjAyNDA2MDUyMjA3NTAtYTIyOTIyNDE5ODViCmdvIG1vZCB0aWR5" }
$ go get cuelang.org/go@v0.9.0-rc.1.0.20240605220750-a2292241985b
...
$ go mod tidy
...
```
{{< /step >}}


{{< step stepNumber="4" >}}
Run the program:

```text { title="TERMINAL" codeToCopy="Z28gcnVuIC4=" }
$ go run .
good: ✅ ok
bad: Action: 2 errors in empty disjunction:
Action: conflicting values "Allow" and "Bypass":
    <field:>:1:2
Action: conflicting values "Deny" and "Bypass":
    <field:>:1:12
Level: invalid value 5 (out of bound >10):
    <field:>:1:1

```
{{< /step >}}

## Related content

- Go API: [`cuego`](https://pkg.go.dev/cuelang.org/go/cuego#section-documentation) -- package documentation
- Go API: [`cue/errors`](https://pkg.go.dev/cuelang.org/go/cue/errors#section-documentation) -- package documentation
- Tag: {{< tag "go api" >}} -- pages explaining and exploring CUE's Go API
