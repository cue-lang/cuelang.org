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

## Create a Go program using cuego

{{< step stepNumber="1" >}}
Create a Go module, or use an existing one if that's more suitable for your situation:

```text { title="TERMINAL" codeToCopy="Z28gbW9kIGluaXQgZ28uZXhhbXBsZQ==" }
$ go mod init go.example
...
```
{{< /step >}}

{{< step stepNumber="2" >}}
Create a main program that uses `cuego`:

```go { title="main.go" }
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
Run the program to see `cuego` in action:

```text { title="TERMINAL" codeToCopy="Z28gcnVuIC4=" }
$ go run .
good: ok
bad: Action: 2 errors in empty disjunction:
Action: conflicting values "Allow" and "Apples":
    <field:>:1:5
Action: conflicting values "Deny" and "Apples":
    <field:>:1:14
Level: invalid value 5 (out of bound >10):
    <field:>:1:1

```

{{< /step >}}
