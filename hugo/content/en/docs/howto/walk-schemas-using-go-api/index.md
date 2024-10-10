---
title: Walking schemas using the Go API
toc_hide: true
tags:
- go api
authors:
- myitcv
---

This guide demonstrates how to walk a CUE schema using the Go API,
programmatically inspecting its structure and types.
The Go code shown here is a limited code generator and,
as presented, it generates Go structs from simple CUE definitions.
It could be adapted to other schema-walking tasks - not just code generation.

## Initialize Go and CUE modules

{{< step stepNumber="1" >}}
Create a Go module, or use an existing one if that's more suitable for your situation:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gbW9kIGluaXQgZ28uZXhhbXBsZQ==" }
$ go mod init go.example
...
```
{{< /step >}}

{{< step stepNumber="2" >}}
Create a CUE module if you don't already have one:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```

The identifiers for the CUE and Go modules don't need to match, but it doesn't
matter if they're the same.
{{< /step >}}

## Declare a CUE schema

{{< step stepNumber="3" >}}
Declare the CUE schema that you wish to walk.
We'll use the following `example.cue` file,
but you should use some CUE that's specific to your situation.

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
package example

#Person: {
	name!: string
	age?:  int & >=0
}

#Address: {
	line1!:   string
	line2?:   string
	line3?:   string
	country?: string
}

aPerson: #Person & {
	name: "John Adams"
}

anAddress: #Address & {
	line1:   "1600 Pennsylvania Ave NW"
	line2:   "Washington, DC 20500"
	country: "United States of America"
}

someData: aValue:      42
_aHiddenField: aValue: 139
{{< /code-tab >}}{{< /code-tabs >}}

Our `example.cue` file contains two
[definitions]({{< relref "docs/tour/types/defs/" >}}) that we want to process:
`#Person` and `#Address`.
It also includes concrete data fields and a hidden field,
which we don't consider as schema. The data and hidden fields are included in
order to demonstrate that they are *not* processed by the code presented below.
{{< /step >}}

{{< step stepNumber="4" >}}
Ensure there are no errors in our CUE:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldA==" }
$ cue vet
```

{{< /step >}}

## Use a Go program to walk the schema

{{< step stepNumber="5" >}}
Create the file `main.go` and add the following code:

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
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

	// Load CUE from the package in the current directory
	insts := load.Instances([]string{"."}, nil)
	v := ctx.BuildInstance(insts[0])
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
		if !it.Selector().IsDefinition() || v.IncompleteKind() != cue.StructKind {
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

You can use `@latest` in place of a specific version.

{{< /step >}}

{{< step stepNumber="7" >}}
Run the Go program:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gcnVuIC4=" }
$ go run .
package p

type Person struct {
	name string
	age int
}
type Address struct {
	line1 string
	line2 string
	line3 string
	country string
}
```

As you can see from its output, this Go program is a very limited form of code
generator that takes each CUE definition and produces a matching Go struct type.
{{< /step >}}

## Related content

- The [`cue`](https://pkg.go.dev/cuelang.org/go/cue) Go API
- The [`cue/cuecontext`](https://pkg.go.dev/cuelang.org/go/cue/cuecontext) Go API
- The [`cue/load`](https://pkg.go.dev/cuelang.org/go/cue/load) Go API
- {{< linkto/related/reference "command/cue-help-mod-init" >}}
- {{< linkto/related/reference "command/cue-help-vet" >}}
- {{< linkto/related/tour "types/defs" >}}
