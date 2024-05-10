---
title: Walking schemas using Go API
toc_hide: true
tags:
- go api
authors:
- myitcv
---

{{< caution >}}
**Caution:** This guide is work in progress.
{{< /caution >}}

This guide demonstrates how to walk a CUE schema using the Go API.

## Initialize Go and CUE modules

{{< step stepNumber="1" >}}
Create a Go module, or use an existing one if that's more suitable for your situation:

```text { title="TERMINAL" codeToCopy="Z28gbW9kIGluaXQgZ28uZXhhbXBsZQ==" }
$ go mod init go.example
...
```
{{< /step >}}

{{< step stepNumber="2" >}}
Create a CUE module if you don't already have one:

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```
{{< /step >}}

## Declare a CUE schema

{{< step stepNumber="3" >}}
Declare a CUE schema that you wish to walk:

```cue { title="example.cue" }
package example

#person: {
	name!: string
	age?:  int
}

#address: {
	country?: string
}

data: {
	name: "cueckoo"
}

_hidden: {
	value: 5
}
```

This `.cue` file also includes hidden and data fields which we don't consider as
schema. They are included to demonstrate that they are _not_ walked.
{{< /step >}}

{{< step stepNumber="4" >}}
Ensure we have no errors in our CUE:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCAu" }
$ cue vet .
```

{{< /step >}}

## Create a Go program to walk the schema

{{< step stepNumber="5" >}}
Write the following Go code:

```go { title="main.go" }
package main

import (
	"fmt"
	"log"
	"strings"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
)

func main() {
	ctx := cuecontext.New()

	// Load cue from the package in the current directory
	bis := load.Instances([]string{"."}, nil)
	v := ctx.BuildInstance(bis[0])
	if err := v.Err(); err != nil {
		log.Fatal(err)
	}

	// "Render" the top-level struct definitions as Go types
	fmt.Printf("package p\n\n")

	it, err := v.Fields(cue.Definitions(true))
	if err != nil {
		log.Fatal(err)
	}
	for it.Next() {
		v := it.Value()
		if !it.IsDefinition() || v.IncompleteKind() != cue.StructKind {
			continue
		}
		structToType(it.Selector(), it.Value())
	}
}

// structToType prints the top-level fields of a struct value
func structToType(name cue.Selector, val cue.Value) {
	fmt.Printf("type %v struct {\n", strings.TrimPrefix(name.String(), "#"))

	// Iterate through the fields of the struct
	it, _ := val.Fields(cue.Optional(true))
	for it.Next() {
		switch k := it.Value().IncompleteKind(); k {
		case cue.StringKind, cue.IntKind, cue.FloatKind, cue.BoolKind:
			fmt.Printf("\t%v %v\n", it.Selector().Unquoted(), it.Value().IncompleteKind())
		}
	}

	fmt.Printf("}\n")
}
```
{{< /step >}}

{{< step stepNumber="6" >}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjguMgpnbyBtb2QgdGlkeQ==" }
$ go get cuelang.org/go@v0.8.2
...
$ go mod tidy
...
```

You can use `@latest` in place of a specified version.

{{< /step >}}

{{< step stepNumber="7" >}}
Run the Go program:

```text { title="TERMINAL" codeToCopy="Z28gcnVuIC4=" }
$ go run .
package p

type person struct {
	name string
	age int
}
type address struct {
	country string
}
```

As you can see, our Go program is a very limited form of code generator, taking
a CUE definition and generating Go types from it.

{{< /step >}}
