---
title: How CUE works with Go
tags:
- encodings
authors:
- myitcv
- jpluscplusm
toc_hide: true
---

{{{with _script "en" "set up caches"}}}
export LC_ALL=C
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

Go is supported by CUE through its Go API, and by features of the `cue` command
that understand Go source code.

CUE makes it easy to use Go as your source of truth by converting Go types to
CUE. It also offers a powerful API that enables your Go code to take advantage
of CUE's advanced capabilites.

In this guide we'll demonstrate importing some Kubernetes API code to generate
CUE schemas. We'll also use the API to convert both CUE and non-CUE data to
native Go values, and validate some Go data natively with CUE.

## Converting Go types to CUE

{{{with _script "en" "setup cue get go example"}}}
rm -rf $HOME/*
cue mod init cue.example
go mod init cue.example
{{{end}}}

If you've already invested time developing Go types, you might need them to be
the source of truth in your system whilst also wanting to use CUE to validate
data that *matches* those types.

The `cue` command can help here, as it can convert arbitrary Go types to CUE.
Here, we fetch some Go source code published by the Kubernetes project, import
some types it defines, and show some of the CUE that's produced.

For this demonstration, let's use a specific version of the `k8s.io/api`
module:

{{{with script "en" "go get k8s"}}}
#ellipsis 0
go get k8s.io/api/apps/v1@v0.29.3
{{{end}}}

We use `cue get go` to generate CUE definitions from the Go types in the
`k8s.io/api/apps/v1` package:

{{{with script "en" "cue get go"}}}
cue get go k8s.io/api/apps/v1
{{{end}}}

This generates some CUE files, placing them within our existing CUE module:

{{{with script "en" "find gen"}}}
#ellipsis 20
tree cue.mod/gen/k8s.io
{{{end}}}

Within our main module, we can import and refer to the CUE definitions generated
from the Go types:

{{{with upload "en" "main cue"}}}
-- config.cue --
package config

import (
	"k8s.io/api/core/v1"
	apps_v1 "k8s.io/api/apps/v1"
)

service: [string]:     v1.#Service
deployment: [string]:  apps_v1.#Deployment
daemonSet: [string]:   apps_v1.#DaemonSet
statefulSet: [string]: apps_v1.#StatefulSet
{{{end}}}

{{{with script "en" "cue eval"}}}
cue eval .
{{{end}}}

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

{{{with _script "en" "setup loading CUE data"}}}
rm -rf $HOME/*
go mod init cue.example
{{{end}}}

Here's an example of loading some data from a `.cue` file and FIXME'ing it.

{{{with upload "en" "cue load sample cue"}}}
-- x.cue --
package x

l: [1, 2, 3]
v: "hello"
{{{end}}}


The `cuelang.org/go/cue/load` package provides a similar interface to the `cue`
command for loading CUE. Here, we load the package in the current directory:

{{{with upload "en" "load cue main"}}}
-- main.go --
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
{{{end}}}

Before running, we add a dependency on the `cuelang.org/go` module and tidy:

{{{with script "en" "load cue get module"}}}
#ellipsis 0
go get cuelang.org/go@${CUELANG_CUE_LATEST}
#ellipsis 0
go mod tidy
{{{end}}}

CUE values have a default formatter that render them nicely:

{{{with script "en" "load cue go run"}}}
go run .
{{{end}}}

{{< caution >}}
TODO: Paul to provide code, so I can word around whatever it demonstrates.
{{< /caution >}}

### Loading non-CUE data (e.g. YAML)

{{{with _script "en" "setup loading non CUE"}}}
rm -rf $HOME/*
go mod init cue.example
{{{end}}}

The API also makes it easy to validate data held in `.yaml` and `.json` files.
Here's a FIXME.

{{{with upload "en" "load non cue yaml file"}}}
-- x.yaml --
name: CUEckoo
age: 99
{{{end}}}

{{{with upload "en" "load non cue main"}}}
-- main.go --
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
{{{end}}}

{{{with script "en" "load non cue get module"}}}
#ellipsis 0
go get cuelang.org/go@${CUELANG_CUE_LATEST}
#ellipsis 0
go mod tidy
{{{end}}}

Check that our Yaml is valid:

{{{with script "en" "load non cue go run"}}}
go run .
{{{end}}}

{{< caution >}}
TODO: Paul to provide code, so I can word around whatever it demonstrates.
{{< /caution >}}

The API also allows FIXME.

### Checking Go data with CUE schema

{{{with _script "en" "setup checking Go data"}}}
rm -rf $HOME/*
go mod init cue.example
{{{end}}}

CUE can also validate data that's only available inside Go. Perhaps it's only
fetched at runtime, over the network, or FIXME.

This time we have our schema in a separate CUE file:

{{{with upload "en" "checking go schema CUE"}}}
-- schema.cue --
package schema

#person: {
	name?: string
	age?:  int
}
{{{end}}}

We embed the schema file using [Go embed](https://pkg.go.dev/embed) and load as
a string:

{{{with upload "en" "checking go main"}}}
-- main.go --
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
{{{end}}}

{{{with script "en" "checking go get module"}}}
#ellipsis 0
go get cuelang.org/go@${CUELANG_CUE_LATEST}
#ellipsis 0
go mod tidy
{{{end}}}

Check that our Yaml is valid:

{{{with script "en" "checking go go run"}}}
go run .
{{{end}}}

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
