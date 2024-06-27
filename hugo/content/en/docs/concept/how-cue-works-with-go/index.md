---
title: How CUE works with Go
tags:
- encodings
- go api
authors:
- jpluscplusm
- myitcv
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
If you've already invested time in developing Go types, you might need them to
be the source of truth in your system whilst also wanting to validate data that
*matches* those types against the more detailed constraints that CUE allows.

The `cue` command can help you achieve this as it can **convert arbitrary Go types to CUE**.
To demonstrate this, we're going to fetch some Go source code published by the
Kubernetes project, import some types it defines, and use some of the CUE that
gets produced.

Let's start by downloading a specific version of the `k8s.io/api` module:

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGs4cy5pby9hcGkvYXBwcy92MUB2MC4yOS4z" }
$ go get k8s.io/api/apps/v1@v0.29.3
...
```

We use `cue get go` to generate CUE definitions from the Go types in the `k8s.io/api/apps/v1` package:

```text { title="TERMINAL" codeToCopy="Y3VlIGdldCBnbyBrOHMuaW8vYXBpL2FwcHMvdjE=" }
$ cue get go k8s.io/api/apps/v1
```

This generates some CUE packages, placing them alongside our main CUE module:

```text { title="TERMINAL" codeToCopy="dHJlZSAtZCBjdWUubW9kL2dlbi9rOHMuaW8=" }
$ tree -d cue.mod/gen/k8s.io
cue.mod/gen/k8s.io
|-- api
|   |-- apps
|   |   `-- v1
|   `-- core
|       `-- v1
`-- apimachinery
    `-- pkg
        |-- api
        |   `-- resource
        |-- apis
        |   `-- meta
        |       `-- v1
...
```

[`cue get go`]({{< relref "docs/reference/cli/cue-get-go" >}})
also has a `--local` option that generates CUE alongside Go in a main module.

Within *our* main module, we can import and refer to the CUE definitions generated from the Go types:

{{< code-tabs >}}
{{< code-tab name="config.cue" language="cue" area="top-left" >}}
package config

import (
	core "k8s.io/api/core/v1"
	apps "k8s.io/api/apps/v1"
)

service: [string]:     core.#Service
deployment: [string]:  apps.#Deployment
daemonSet: [string]:   apps.#DaemonSet
statefulSet: [string]: apps.#StatefulSet
{{< /code-tab >}}{{< /code-tabs >}}

Our configuration is currently empty - but any
services, deployments, daemonSets, or statefulSets
that we add will be checked against the schema of the associated Kubernetes type:

```text { title="TERMINAL" codeToCopy="Y3VlIGV2YWw=" }
$ cue eval
service: {}
deployment: {}
daemonSet: {}
statefulSet: {}
```

A more in-depth example demonstrating how to drive Kubernetes configuration
using CUE can be found in *CUE By Example*, in
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

## Using CUE's Go API

The Go API injects the power and expressiveness of CUE into your Go programs,
allowing them to
**load and validate both CUE and non-CUE data** (such as JSON or YAML),
and to
**check data marshalled by Go**, wherever it comes from.

### Loading CUE data
In this example, we load some data from the following CUE file and display it:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

l: [1, 2, 3]
v: "hello"
message: (v): "world!"
{{< /code-tab >}}{{< /code-tabs >}}

The `cuelang.org/go/cue/load` package provides a similar interface to the `cue`
command for loading CUE.

Here, we use `load.Instances()` to load the package in the current directory:

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
package main

import (
	"fmt"

	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
)

func main() {
	ctx := cuecontext.New()
	insts := load.Instances([]string{"."}, nil)
	v := ctx.BuildInstance(insts[0])
	fmt.Printf("%v\n", v)
}
{{< /code-tab >}}{{< /code-tabs >}}

Before running, we add a dependency on the `cuelang.org/go` module and tidy:

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjkuMgpnbyBtb2QgdGlkeQ==" }
$ go get cuelang.org/go@v0.9.2
...
$ go mod tidy
...
```

Finally, running the Go program displays the CUE data:

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

CUE values have a default formatter that renders them sensibly.

### Loading non-CUE data
The API also makes it easy to validate data held in YAML and JSON files.

This example loads a CUE schema that's embedded in code,
then a YAML data file,
and then validates the data against the schema.

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
package main

import (
	"fmt"
	"log"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/encoding/yaml"
)

const cueSource = `
#Schema: {
	name?: string
	age?:  int
}
`

func main() {
	ctx := cuecontext.New()
	schema := ctx.CompileString(cueSource).LookupPath(cue.ParsePath("#Schema"))

	yamlFile, err := yaml.Extract("data.yml", nil)
	if err != nil {
		log.Fatal(err)
	}

	yamlAsCUE := ctx.BuildFile(yamlFile)

	unified := schema.Unify(yamlAsCUE)
	if err := unified.Validate(); err != nil {
		fmt.Println("❌ YAML: NOT ok")
		log.Fatal(err)
	}

	fmt.Println("✅ YAML: ok")
}
{{< /code-tab >}}{{< /code-tabs >}}

Here's the data we'll check against `#Schema`:

{{< code-tabs >}}
{{< code-tab name="data.yml" language="yml" area="top-left" >}}
name: Charlie Cartwright
age: 99
{{< /code-tab >}}{{< /code-tabs >}}

We finish by adding a dependency on the `cuelang.org/go` module, tidying,
and running the program:

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjkuMgpnbyBtb2QgdGlkeQpnbyBydW4gLg==" }
$ go get cuelang.org/go@v0.9.2
...
$ go mod tidy
...
$ go run .
✅ YAML: ok
```

### Checking Go data with CUE schema
CUE can also validate data that's only available inside Go.
Perhaps it's only fetched at runtime, from some file;
or from some remote service over the network.

This time we place our schema in a separate CUE file:

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
package example

#Person: {
	name?: string
	age?:  int & <=150
}
{{< /code-tab >}}{{< /code-tabs >}}

We embed the schema file using [Go embedding](https://pkg.go.dev/embed),
and load it via a string.
Then we use the `#Person` schema to validate a Go `Person`,
either logging a fatal error or reporting a successful validation.

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
package main

import (
	_ "embed"
	"fmt"
	"log"

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
	schema := ctx.CompileString(schemaFile).LookupPath(cue.ParsePath("#Person"))

	person := Person{
		Name: "Charlie Cartwright",
		Age:  999,
	}

	personAsCUE := ctx.Encode(person)

	unified := schema.Unify(personAsCUE)
	if err := unified.Validate(); err != nil {
		fmt.Println("❌ Person: NOT ok")
		log.Fatal(err)
	}

	fmt.Println("✅ Person: ok")
}
{{< /code-tab >}}{{< /code-tabs >}}

This time we see that CUE correctly caught a problem in our data:

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjkuMgpnbyBtb2QgdGlkeQpnbyBydW4gLg==" }
$ go get cuelang.org/go@v0.9.2
...
$ go mod tidy
...
$ go run .
❌ Person: NOT ok
main.go:34: #Person.age: invalid value 999 (out of bound <=150)
exit status 1
```

<!-- TODO
  - Checking Go data with CUE schema
    - "CUE that validates that a struct have only keys beginning with "a" and values that are either `5 | string`"
    - Check if we should demo (i.e. push folks towards) gocodec or not.
-->

## Future plans

The CUE project believes that its role can be one of *interlingua*:
a **bidirectional bridge** between all the formats that CUE speaks,
linking sources of truth with data - wherever they exist.

On the way towards that goal, the project has plans to extend CUE to
**directly generate code in Go** (and other languages),
beginning with the ability to
**declare native types that mirror CUE counterparts**.

Looking further forward, the project plans to expand CUE's generation
capabilities to include
**producing *native code* that implements CUE constraints**,
which will enable non-CUE languages to gain highly efficient implementations of
CUE features such as data validation, policy enforcement, and more.

## Related content

- {{< linkto/related/reference "cli/cue-get-go" >}}
- Go API:
    [`cue`](https://pkg.go.dev/cuelang.org/go/cue#section-documentation)
  | [`cue/load`](https://pkg.go.dev/cuelang.org/go/cue/load#section-documentation)
  | [`cue/cuecontext`](https://pkg.go.dev/cuelang.org/go/cue/cuecontext#section-documentation)
  | [`encoding/yaml`](https://pkg.go.dev/cuelang.org/go/encoding/yaml#section-documentation)
  | [`encoding/json`](https://pkg.go.dev/cuelang.org/go/encoding/json#section-documentation)
- CUE By Example:
  [Controlling Kubernetes with CUE](https://github.com/cue-labs/cue-by-example/blob/main/003_kubernetes_tutorial/README.md)
- Discussion {{<issue 2939>}}#2939{{</issue>}}: Modules and package management proposal
