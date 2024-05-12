---
title: Validating Go values using the cuego API
tags:
- go api
- validation
authors:
- myitcv
toc_hide: true
---

This guide demonstrates how to validate Go values using the
[`cuego`](https://pkg.go.dev/cuelang.org/go/cuego#section-documentation) API.

The API checks values against CUE constraints expressed in
[Go struct tags](https://go.dev/ref/spec#Struct_types) using the `cue` namespace.

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

You can use this example code as a starting point.
It uses `cuego` to check two instances of a simple struct type
against CUE constraints embedded in the type definition,
and prints a validation result for each instance:

```go { title="main.go" }
package main

import (
	"fmt"

	"cuelang.org/go/cue/errors"
	"cuelang.org/go/cuego"
)

type Policy struct {
	Level  int    `cue:">10"`
	Action string `cue:" \"Allow\" | \"Deny\" "`
}

func main() {
	check := func(p Policy) string {
		if err := cuego.Validate(p); err != nil {
			return errors.Details(err, nil)
		}
		return "✅ ok"
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
```
{{< /step >}}

{{< step stepNumber="3" >}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjguMgpnbyBtb2QgdGlkeQ==" }
$ go get cuelang.org/go@v0.8.2
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
Action: conflicting values "Allow" and "Apples":
    <field:>:1:2
Action: conflicting values "Deny" and "Apples":
    <field:>:1:12
Level: invalid value 5 (out of bound >10):
    <field:>:1:1

```
{{< /step >}}

## Related content

- The [`cuego`](https://pkg.go.dev/cuelang.org/go/cuego#section-documentation) API package documentation
- The [`cue/errors`](https://pkg.go.dev/cuelang.org/go/cue/errors#section-documentation) API package documentation
- Other pages explaining CUE's Go API: {{< tag "go api" >}}
