---
title: Handle errors in the Go API
tags:
- go api
authors:
- myitcv
toc_hide: true
---

## Create a CUE module

{{< step stepNumber="1" >}}
Initialize a CUE module to hold our configuration:

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBpbml0IG1vZC5leGFtcGxl" }
$ cue mod init mod.example
```

{{< /step >}}

{{< step stepNumber="2" >}}
Write some CUE code:

{{< code-tabs >}}
{{< code-tab name="some.cue" language="cue" area="top-left" >}}
package example

#schema: {
	i: int
	s: string
}

val: #schema & {
	i: "hello"
	s: 1
}
{{< /code-tab >}}{{< /code-tabs >}}

{{< /step >}}

{{< step stepNumber="3" >}}
Verify that the configuration successfully evaluates:

```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydA==" }
$ cue export
val.i: conflicting values int and "hello" (mismatched types int and string):
    ./some.cue:4:5
    ./some.cue:9:5
val.s: conflicting values string and 1 (mismatched types string and int):
    ./some.cue:5:5
    ./some.cue:10:5
```

{{< /step >}}

## Create a Go module and program

{{< step stepNumber="4" >}}
Initialize a Go module to contain your program:

```text { title="TERMINAL" codeToCopy="Z28gbW9kIGluaXQgbW9kLmV4YW1wbGU=" }
$ go mod init mod.example
...
```

{{< /step >}}

{{< step stepNumber="5" >}}
Write a Go program to load the CUE and print a message based on the `output`
field:

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
	insts := load.Instances([]string{"."}, nil)
	pkg := ctx.BuildInstance(insts[0])
	val := pkg.LookupPath(cue.ParsePath("val"))
	err := val.Validate(cue.Concrete(true))
	errs := errors.Errors(err)

	fmt.Printf("err: %v\n", err)
	fmt.Printf("errors.Details(err): %v", errors.Details(err, nil))
	fmt.Printf("len(errs): %d\n", len(errs))
}
{{< /code-tab >}}{{< /code-tabs >}}

{{< /step >}}

{{< step stepNumber="6" >}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjkuMgpnbyBtb2QgdGlkeQ==" }
$ go get cuelang.org/go@v0.9.2
...
$ go mod tidy
...
```

You can use `@latest` in place of a specified version.

{{< /step >}}

## Run the Go program

{{< step stepNumber="7" >}}
Run the Go program:

```text { title="TERMINAL" codeToCopy="Z28gcnVuIC4=" }
$ go run .
err: val.i: conflicting values int and "hello" (mismatched types int and string) (and 1 more errors)
errors.Details(err): val.i: conflicting values int and "hello" (mismatched types int and string):
    /home/runner/some.cue:4:5
    /home/runner/some.cue:9:5
val.s: conflicting values string and 1 (mismatched types string and int):
    /home/runner/some.cue:5:5
    /home/runner/some.cue:10:5
len(errs): 2
```

{{< /step >}}

Notice that
[`errors.Details`](https://pkg.go.dev/cuelang.org/go/cue/errors#Details) is a
simply a convenience to return the error text (from the underlying errors) as a
string. [`errors.Errors`](https://pkg.go.dev/cuelang.org/go/cue/errors#Errors)
allows you to iterate through each individual error.

