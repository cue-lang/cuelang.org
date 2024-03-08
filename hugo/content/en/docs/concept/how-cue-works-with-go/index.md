---
title: How CUE works with Go
tags:
- encodings
authors:
- myitcv
- jpluscplusm
toc_hide: true
---

CUE and Go work together by making it easy to use Go as your source of truth by
converting Go types to CUE with the `cue` CLI, as well as providing a powerful
API that enables your Go code to take advantage of CUE's advanced capabilites.

In this guide we'll demonstrate importing some Kubernetes API code to generate
CUE schemas. We'll also use the API to convert both CUE and non-CUE data to
native Go values, and validate some Go data natively with CUE.

## Converting Go types to CUE
If you've already invested time developing Go types, you might need them to be
the source of truth in your system whilst also wanting to use CUE to validate
data that *matches* those types.

The `cue` CLI tool can help here, as it can convert arbitrary Go types to CUE.
Here, we fetch some Go source code published by the Kubernetes project, import
some types it defines, and show some of the CUE that's produced:

For the purposes of this introduction, we use a specific version of the
`k8s.io/api` module:

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGs4cy5pby9hcGkvYXBwcy92MUB2MC4yOS4zCg==" }
$ go get k8s.io/api/apps/v1@v0.29.3
...
```

We use `cue get go` to generate CUE definitions from the Go types in the
`k8s.io/api/apps/v1` package:

```text { title="TERMINAL" codeToCopy="Y3VlIGdldCBnbyBrOHMuaW8vYXBpL2FwcHMvdjEK" }
$ cue get go k8s.io/api/apps/v1
```

This places some generated files within our existing CUE module:

```text { title="TERMINAL" codeToCopy="ZmluZCBjdWUubW9kL2dlbgo=" }
$ find cue.mod/gen
cue.mod/gen
cue.mod/gen/k8s.io
cue.mod/gen/k8s.io/api
cue.mod/gen/k8s.io/api/apps
cue.mod/gen/k8s.io/api/apps/v1
...
```

Within our main module, we can import and refer to the CUE definitions generated
from the Go types:

```cue { title="config.cue" }
package config

import (
	"k8s.io/api/core/v1"
	apps_v1 "k8s.io/api/apps/v1"
)

service: [string]:     v1.#Service
deployment: [string]:  apps_v1.#Deployment
daemonSet: [string]:   apps_v1.#DaemonSet
statefulSet: [string]: apps_v1.#StatefulSet
```

```text { title="TERMINAL" codeToCopy="Y3VlIGV2YWwgLgo=" }
$ cue eval .
service: {}
deployment: {}
daemonSet: {}
statefulSet: {}
```

A full example demonstrating how to drive your Kubernetes configuration using
CUE can be found in
https://github.com/cue-labs/cue-by-example/blob/main/003_kubernetes_tutorial/README.md.

<!--
TODO: Should we demo refining `_gen.cue` files via unification?
Does this approach still "work", with modules?
-->

Notice how the example here relies on generating code within the `cue.mod/gen`
directory of the CUE modules that holds our configuration. We are working on a
means of providing well-known schemas for well-known services at a well-known
location. See https://github.com/cue-lang/cue/discussions/2939 for more details.

To generate CUE alongside Go in a main module [`cue get go`]({{< relref
"docs/reference/cli/cue-get-go" >}})'s `--local` option has you covered.

## Using CUE's Go API

The Go API injects the power and expressiveness of CUE into your Go programs,
allowing them to load and validate both CUE and non-CUE data, and to check
data marshalled by Go, wherever it comes from.

### Loading CUE data
Here's an example of loading some data from a `.cue` file and FIXME'ing it.

```cue { title="x.cue" }
package x

l: [1, 2, 3]
v: "hello"
```


The `cuelang.org/go/cue/load` package provides a similar interface to the `cue`
command for loading CUE. Here, we load the package in the current directory:

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

Before running, we add a dependency on the `cuelang.org/go` module and tidy:

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjguMApnbyBtb2QgdGlkeQo=" }
$ go get cuelang.org/go@v0.8.0
...
$ go mod tidy
...
```

CUE values have a default formatter that render them nicely:

```text { title="TERMINAL" codeToCopy="Z28gcnVuIC4K" }
$ go run .
{
	l: [1, 2, 3]
	v: "hello"
}
```

{{< caution >}}
TODO: Paul to provide code, so I can word around whatever it demonstrates.
{{< /caution >}}

### Loading non-CUE data (e.g. YAML)
The API also makes it easy to validate data held in `.yaml` and `.json` files.
Here's a FIXME.

```yaml { title="x.yaml" }
name: CUEckoo
age: 99
```

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
#schema: {
	name?: string
	age?:  int
}
`

func main() {
	ctx := cuecontext.New()
	v := ctx.CompileString(source)
	schema := v.LookupPath(cue.ParsePath("#schema"))

	yamlFile, err := yaml.Extract("x.yaml", nil)
	if err != nil {
		log.Fatal(err)
	}

	yamlAsCUE := ctx.BuildFile(yamlFile)

	unified := schema.Unify(yamlAsCUE)
	if err := unified.Validate(); err != nil {
		log.Fatal(err)
	}

	fmt.Println("Your YAML was ok!")
}
```

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjguMApnbyBtb2QgdGlkeQo=" }
$ go get cuelang.org/go@v0.8.0
...
$ go mod tidy
...
```

Check that our Yaml is valid:

```text { title="TERMINAL" codeToCopy="Z28gcnVuIC4K" }
$ go run .
Your YAML was ok!
```

{{< caution >}}
TODO: Paul to provide code, so I can word around whatever it demonstrates.
{{< /caution >}}

The API also allows FIXME.

### Checking Go data with CUE schema
CUE can also validate data that's only available inside Go. Perhaps it's only
fetched at runtime, over the network, or FIXME.

This time we have our schema in a separate CUE file:

```cue { title="schema.cue" }
package schema

#person: {
	name?: string
	age?:  int
}
```

We embed the schema file using [Go embed](https://pkg.go.dev/embed) and load as
a string:

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
	name string
	age  int
}

//go:embed schema.cue
var schemaFile string

func main() {
	ctx := cuecontext.New()
	v := ctx.CompileString(schemaFile)
	schema := v.LookupPath(cue.ParsePath("#schema"))

	person := Person{
		name: "CUEckoo",
		age:  99,
	}

	personAsCUE := ctx.Encode(person)

	unified := schema.Unify(personAsCUE)
	if err := unified.Validate(); err != nil {
		log.Fatal(err)
	}

	fmt.Println("Your Person was ok!")
}
```

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjguMApnbyBtb2QgdGlkeQo=" }
$ go get cuelang.org/go@v0.8.0
...
$ go mod tidy
...
```

Check that our Yaml is valid:

```text { title="TERMINAL" codeToCopy="Z28gcnVuIC4K" }
$ go run .
Your Person was ok!
```

{{< caution >}}
TODO: Paul to provide code, so I can word around whatever it demonstrates.
{{< /caution >}}

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
