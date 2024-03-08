---
title: How CUE works with Go
tags:
- encodings
authors:
- myitcv
- jpluscplusm
toc_hide: true
---

CUE is designed to complement and work with the Go programming language.
It offers a powerful API that enables Go code to take advantage of CUE's
advanced capabilites.
Additionally, CUE makes it easy to use Go as your source of truth by using the
`cue` command to convert Go types to CUE.

In this guide we'll demonstrate importing some Kubernetes API code to generate
CUE schemas. We'll also use the API to convert both CUE and non-CUE data to
native Go values, and validate some Go data natively with CUE.

## Converting Go types to CUE
If you've already invested time developing Go types, you might need them to be
the source of truth in your system whilst also wanting to use CUE to validate
data that *matches* those types.

The `cue` command can help here, as it can convert arbitrary Go types to CUE.

Here, we fetch some Go source code published by the Kubernetes project, import
some types it defines, and show some of the CUE that gets produced.

{{< columns >}}
\
Let's use a specific version of the k8s.io/api module:
{{< columns-separator >}}
```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGs4cy5pby9hcGkvYXBwcy92MUB2MC4yOS4z" }
$ go get k8s.io/api/apps/v1@v0.29.3
...
```
{{< /columns >}}

{{< columns >}}
We use `cue get go` to generate CUE definitions from the Go types in the `k8s.io/api/apps/v1` package:
{{< columns-separator >}}
```text { title="TERMINAL" codeToCopy="Y3VlIGdldCBnbyBrOHMuaW8vYXBpL2FwcHMvdjE=" }
$ cue get go k8s.io/api/apps/v1
```
{{< /columns >}}

This generates some CUE files, placing them within our existing CUE module:

```text { title="TERMINAL" codeToCopy="dHJlZSBjdWUubW9kL2dlbi9rOHMuaW8=" }
$ tree cue.mod/gen/k8s.io
cue.mod/gen/k8s.io
|-- api
|   |-- apps
|   |   `-- v1
|   |       |-- register_go_gen.cue
|   |       `-- types_go_gen.cue
|   `-- core
|       `-- v1
|           |-- annotation_key_constants_go_gen.cue
|           |-- doc_go_gen.cue
|           |-- register_go_gen.cue
|           |-- types_go_gen.cue
|           |-- well_known_labels_go_gen.cue
|           `-- well_known_taints_go_gen.cue
`-- apimachinery
    `-- pkg
        |-- api
        |   `-- resource
        |       |-- amount_go_gen.cue
        |       |-- math_go_gen.cue
...
```

Within our main module, we can import and refer to the CUE definitions generated from the Go types:

{{< columns >}}
```cue { title="config.cue" }
package config

import (
	core "k8s.io/api/core/v1"
	apps "k8s.io/api/apps/v1"
)

service: [string]:     core.#Service
deployment: [string]:  apps.#Deployment
daemonSet: [string]:   apps.#DaemonSet
statefulSet: [string]: apps.#StatefulSet
```
{{< columns-separator >}}
```text { title="TERMINAL" codeToCopy="Y3VlIGV2YWw=" }
$ cue eval
service: {}
deployment: {}
daemonSet: {}
statefulSet: {}
```
{{< /columns >}}

A more in-depth example demonstrating how to drive Kubernetes configuration
using CUE can be found in the *CUE By Example* repository:
[Controlling Kubernetes with CUE](https://github.com/cue-labs/cue-by-example/blob/main/003_kubernetes_tutorial/README.md).

<!--
TODO: Should we demo refining `_gen.cue` files via unification?
Does this approach still "work", with modules?
-->

The example above relies on generating CUE within the `cue.mod/gen` directory
of the CUE module that holds a configuration,
but we are working on a system for providing schemas for well-known services at
a well-known location.
This will remove the need to generate such CUE locally --
see {{<issue 2939>}}discussion #2939{{</issue>}} for more details.

[`cue get go`]({{< relref "docs/reference/cli/cue-get-go" >}})
also has a `--local` option that generates CUE *alongside* Go in a main module.

## Using CUE's Go API

The Go API injects the power and expressiveness of CUE into your Go programs,
allowing them to load and validate both CUE and non-CUE data, and to check
data marshalled by Go, wherever it comes from.

### Loading CUE data
{{< columns >}}
\
In this example, we load some data from the following CUE file and display it:
{{< columns-separator >}}
```cue { title="file.cue" }
package example

l: [1, 2, 3]
v: "hello"
message: (v): "world!"
```
{{< /columns >}}

{{< columns >}}
The `cuelang.org/go/cue/load` package provides a similar interface to the `cue`
command for loading CUE.

Here, we use `load.Instances()` to load the package in the current directory:
{{< columns-separator >}}
```go { title="main.go" }
package main

import (
	"fmt"

	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
)

func main() {
	ctx := cuecontext.New()
	bis := load.Instances([]string{"."}, nil)
	v := ctx.BuildInstance(bis[0])
	fmt.Printf("%v\n", v)
}
```
{{< /columns >}}

{{< columns >}}
Before running, we add a dependency on the `cuelang.org/go` module and tidy:
{{< columns-separator >}}

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjguMApnbyBtb2QgdGlkeQ==" }
$ go get cuelang.org/go@v0.8.0
...
$ go mod tidy
...
```
{{< /columns >}}

{{< columns >}}
```text { title="TERMINAL" codeToCopy="Z28gcnVuIC4=" }
$ go run .
{
	l: [1, 2, 3]
	v: "hello"
	message: {
		hello: "world!"
	}
}
```
{{< columns-separator >}}
\
Finally, running the Go program displays the CUE data.

CUE values have a default formatter that renders them nicely.
{{< /columns >}}

### Loading non-CUE data
The API also makes it easy to validate data held in YAML and JSON files.

{{< columns >}}
\
This example loads a CUE schema that's embedded in the code, then a YAML
data file, and then validates the data against the schema.
{{< columns-separator >}}
```go { title="main.go" }
package main

import (
	"fmt"
	"log"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/encoding/yaml"
)

const source = `
#S: {
	name?: string
	age?:  int
}
`

func main() {
	ctx := cuecontext.New()
	v := ctx.CompileString(source)
	schema := v.LookupPath(cue.ParsePath("#S"))

	yamlFile, err := yaml.Extract("data.yml", nil)
	if err != nil {
		log.Fatal(err)
	}

	yamlAsCUE := ctx.BuildFile(yamlFile)

	unified := schema.Unify(yamlAsCUE)
	if err := unified.Validate(); err != nil {
		log.Fatal(err)
	}

	fmt.Println("✅ YAML: ok")
}
```
{{< /columns >}}

{{< columns >}}
Here's the data we'll check against the schema `#S`:
{{< columns-separator >}}
```yml { title="data.yml" }
name: Charlie Cartwright
age: 99
```
{{< /columns >}}

{{< columns >}}
```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjguMApnbyBtb2QgdGlkeQpnbyBydW4gLg==" }
$ go get cuelang.org/go@v0.8.0
...
$ go mod tidy
...
$ go run .
✅ YAML: ok
```
{{< columns-separator >}}
\
We finish by adding a tidy dependency on the `cuelang.org/go` module, and running the program.
{{< /columns >}}

### Checking Go data with CUE schema
CUE can also validate data that's only available inside Go. Perhaps it's only
fetched at runtime, over the network, or from some remote service.

{{< columns >}}
\
This time we place our schema in a separate CUE file:
{{< columns-separator >}}
```cue { title="schema.cue" }
package example

#person: {
	name?: string
	age?:  int & <=150
}
```
{{< /columns >}}

{{< columns >}}
We embed the schema file with [Go embed](https://pkg.go.dev/embed),
and load it as a string.

The `#person` schema is then used to validate a Go `Person`, either logging a
fatal error or reporting a successful validation.
{{< columns-separator >}}
```go { title="main.go" }
package main

import (
	"fmt"
	"log"

	_ "embed"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
)

type Person struct {
	Name string `json:"name"`
	Age  int    `json:"age"`
}

//go:embed schema.cue
var schemaFile string

func main() {
	ctx := cuecontext.New()
	v := ctx.CompileString(schemaFile)
	schema :=
		v.LookupPath(cue.ParsePath("#person"))

	person := Person{
		Name: "Charlie Cartwright",
		Age:  99,
	}

	personAsCUE := ctx.Encode(person)

	unified := schema.Unify(personAsCUE)
	if err := unified.Validate(); err != nil {
		log.Fatal(err)
	}

	fmt.Println("✅ Person: ok")
}
```
{{< /columns >}}

{{< columns >}}
```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjguMApnbyBtb2QgdGlkeQpnbyBydW4gLg==" }
$ go get cuelang.org/go@v0.8.0
...
$ go mod tidy
...
$ go run .
✅ Person: ok
```
{{< columns-separator >}}
\
This time we see that CUE correctly caught a problem in our data ...
{{< /columns >}}

<!-- TODO
  - Checking Go data with CUE schema
    - "CUE that validates that a struct have only keys beginning with "a" and values that are either `5 | string`"
    - Check if we should demo (i.e. push folks towards) gocodec or not.
-->

## Future plans

The CUE project believes that its role can be one of *interlingua* - a
bi-direction bridge between all the formats it speaks, linking sources of truth
to data, whevever it exists.

To serve that goal, the project has plans not only to extend CUE so that it can
*generate* Go types and Go code directly, but also FIXME.
