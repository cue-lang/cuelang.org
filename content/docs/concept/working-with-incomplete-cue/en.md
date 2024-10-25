---
title: "Working with incomplete CUE"
toc_hide: true
authors: [myitcv]
---

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

{{< warning >}}
This draft is a WIP
{{< /warning >}}

In general, CUE can deal with references to fields that don't exist (yet)
e.g.

{{{with upload "en" "x.cue"}}}
-- x.cue --
package x

x: _
y: x.f
{{{end}}}

This is referred to as incomplete CUE.
Such CUE cannot be exported:

{{{with script "en" "export x.cue"}}}
! cue export x.cue
{{{end}}}

But it can be evaluated.

{{{with script "en" "eval x.cue"}}}
cue eval x.cue
{{{end}}}

The configuration can be made complete by unifying it with one or more values
that "fill in the gaps" In this case we use some Yaml to make the configuration
complete:

{{{with upload "en" "data.yaml"}}}
-- data.yaml --
x:
  f:
    5
{{{end}}}

Unifying the two allows us to export the result:

{{{with script "en" "export x.cue data.yaml"}}}
cue export x.cue data.yaml
{{{end}}}

We can also demonstrate this via the Go API:

{{{with script "en" "go mod init"}}}
go mod init mod.example
#ellipsis 0
go get cuelang.org/go@${CUELANG_CUE_LATEST}
{{{end}}}

{{{with upload "en" "main.go"}}}
-- main.go --
package main

import (
	"fmt"
	"log"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/encoding/yaml"
)

func main() {
	ctx := cuecontext.New()

	// Load the CUE package in the current directory.
	// It contains only one file, x.cue. This is step1.
	bis := load.Instances([]string{"."}, nil)
	step1 := ctx.BuildInstance(bis[0])
	fmt.Printf("step1: %v\n", step1)

	// Load data.yaml as step2.
	step2File, err := yaml.Extract("data.yaml", nil)
	if err != nil {
		log.Fatal(err)
	}
	step2 := ctx.BuildFile(step2File)
	fmt.Printf("step2: %v\n", step2)

	// Ensure the result of unifying the two steps is
	// valid and concrete, i.e. can be exported as data.
	res := step1.Unify(step2)
	if err := res.Validate(cue.Concrete(true)); err != nil {
		log.Fatal(err)
	}
	fmt.Printf("res: %v\n", res)
}
{{{end}}}

Running this Go code is identical in behaviour to the `cue export` command from
before:

{{{with script "en" "go run"}}}
#ellipsis 0
go mod tidy
go run .
{{{end}}}

The idea being that we can show how to work with incomplete values and
unification (the simplest of pipelines) to make things concrete.

