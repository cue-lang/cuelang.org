+++
title = "Go"
weight = 430
description = "How CUE integrates with the Go Programming Language."
+++

CUE is not specific to Go, or to cloud applications, but like many of
new cloud technologies, CUE is written in Go. It has a rich set of APIs
available to Go developers and interacts with CUE in various ways.

## The CUE APIs

The CUE APIs in the main repo are organized as follows:

- [**cmd**](https://pkg.go.dev/cuelang.org/go/cmd):
  The CUE command line tool.
- [**cue**](https://pkg.go.dev/cuelang.org/go/cue):
  core APIs related to parsing, formatting, loading and running CUE programs.
  These packages are used by all other packages, including the command line tool.
- [**encoding**](https://pkg.go.dev/cuelang.org/go/encoding):
  Packages for converting to and from CUE, including adaptors for YAML, JSON,
  Go, Protobuf, and OpenAPI.
- [**pkg**](https://pkg.go.dev/cuelang.org/go/pkg):
  Builtin packages that are available from within _CUE_ programs.
  These are typically not used in Go code.


## Extract CUE from Go

### Download CUE definitions from Go packages

Many of today's cloud-related projects are written in Go.
The `cue get go` fetches Go packages using Go's package manager
and makes their definitions available through the CUE module's `pkg` directory
using the same package naming conventions as in Go.

For example, to download the CUE definitions for the core Kubernetes types, run

{{< highlight go >}}
cue get go k8s.io/api/core/v1
{{< /highlight >}}

From the root of your CUE module<!--TODO(ref)-->, you will now see
`./pkg/k8s.io/api/core` populated with the extracted CUE definitions.
Projects, like Kubernetes, do not have to support such conversions.
CUE derives the interpretation by analyzing how the Go types convert
with `encoding/json`.

{{< alert color="info" title="Mixing manually created with generated files">}}
The files that the `cue` tool generates all end with `_go_gen.cue`.
The `cue` tool will never create, remove, or modify
files `not` ending with `_gen.go`,
so it safe to add such files in these directories to further tighten down
definitions.
Remember that the order in which files get merged is irrelevant for CUE.
{{< /alert >}}

The generated package can be used in CUE using the same import path.
In this CUE file, we import the generated definitions and specify that
all services in our configuration are of type `v1.Service`.

{{< highlight go >}}
import "k8s.io/api/core/v1"

services: [string]: v1.#Service
{{< /highlight >}}

You can download definitions from any Go project like this.
For example, try
`k8s.io/api/extensions/v1beta1`
or
`github.com/prometheus/prometheus/pkg/rulefmt`.



## Processing CUE in Go

### Load CUE into Go

There are two primary ways to load CUE into Go.
To load entire packages, consistent with the `cue` tool,
use the
[`cuelang.org/go/cue/load`](https://pkg.go.dev/cuelang.org/go/cue/load)
package.
To load CUE parse trees or raw CUE text, use a
[`cuelang.org/go/cue.Runtime`](https://pkg.go.dev/cuelang.org/go/cue#Runtime).

{{< alert color="warning" title="Use a single Runtime">}}
For any operation that involves two CUE values these two values must have
been created using the same Runtime.
{{< /alert >}}

The following code loads an embedded CUE configuration,
evaluates one of its fields, and prints the result.

{{< highlight go >}}
const config = `
msg:   "Hello \(place)!"
place: string | *"world" // "world" is the default.
`

var r cue.Runtime

instance, _ := r.Compile("test", config)

str, _ := instance.Lookup("msg").String()

fmt.Println(str)

// Output:
// Hello world!
{{< /highlight >}}

The names passed to Compile get recorded as references in token positions.


### Validate Go values

The `Codec` type in package
[`cuelang.org/go/encoding/gocode/gocodec`](https://pkg.go.dev/cuelang.org/go/encoding/gocode/gocodec)
 provides the `Validate`
method for validating Go values.

{{< highlight go >}}
var codec = gocodec.New(r, nil)
var myValueConstraints cue.Value

func (x *MyValue) Validate() error {
    return codec.Validate(myValueConstraints, x)
}
{{< /highlight >}}

Package
[`cuelang.org/go/encoding/gocode`](https://pkg.go.dev/cuelang.org/go/encoding/gocode),
discussed below,
can generate these kind of stubs to make life a bit easier.


### Complete Go values

A `gocodec.Codec` also defines a `Complete` method, which is similar to
`Validate`, but fills in missing values if these can be derived from the
CUE definitions.


### Combine CUE values

The `cue.Value`'s `Unify` method can be used to merge two values.
It is the programmatic equivalent of the `&` operation in the CUE language.

With `Unify` one can combine constraints from multiple sources programmatically.
For instance, one could add some context-dependent policy constraints to
a set of base constraints.


### Copy CUE values into Go values

The simplest way to set a Go value to the contents of a CUE value
is to use the Decode method of the later.

{{< highlight go >}}
type ab struct { A, B int }

var r cue.Runtime

var x ab

i, _ := r.Compile("test", `{A: 2, B: 4}`)
_ = i.Value().Decode(&x)
fmt.Println(x)

i, _ = r.Compile("test", `{B: "foo"}`)
_ = i.Value().Decode(&x)
fmt.Println(x)

// Output:
// {2 4}
// json: cannot unmarshal string into Go struct field ab.B of type int
{{< /highlight >}}

Package
[`cuelang.com/go/encoding/gocode/gocodec`](https://pkg.go.dev/cuelang.org/go/encoding/gocode/gocodec)
 gives a bit more control
over encoding and allows incorporating Go field tags with constraints as
well as deriving unspecified values from constraints.


### Modify CUE values

A field in a CUE instance can be set to a Go value that conforms to the
constraints of this instance using the `Fill` method.
Building on the example of the "Load CUE into Go" section, we can write

```go
inst, _ := instance.Fill("you", "place")
str, _ = inst.Lookup("msg").String()

fmt.Println(str)

// Output:
// Hello you!

```

To ensure the integrity of references with the CUE instance,
modifications are only allowed at the whole-instance level.


## Generate Go code

### Programmatically

The [`Generate`](https://pkg.go.dev/cuelang.org/go/encoding/gocode#Generate)
function in package
[`cuelang.org/go/encoding/gocode`](https://pkg.go.dev/cuelang.org/go/encoding/gocode)
generates stubs for validation functions and method from a given CUE instance.
It does so by lining up the top-level CUE names with Go definitions.
The CUE code can use field tags, similar to those used in Go,
to override the naming.
```go
b, err := gocode.Generate("path/to/go/pkg", instance, nil)
if err != nil {
    // handle error
}

err = os.WriteFile("cue_gen.go", b, 0644)
```
