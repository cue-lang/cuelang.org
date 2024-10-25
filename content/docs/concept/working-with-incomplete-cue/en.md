---
title: "Working with incomplete CUE"
toc_hide: true
authors: [myitcv, jpluscplusm]
tags: [go api]
---

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

In general, CUE can handle references to fields that don't yet exist, or where
a value can't be calculated because there's insufficient information.
CUE that contains such references or values is referred to as *incomplete* CUE
 -- but only if it's otherwise *valid* CUE.

Here's an example of incomplete CUE. In `example.cue`, field `A.o` doesn't
exist, which means that the value of field `B` can't be calculated given the
information in this file alone:

{{{with upload "en" "example.cue"}}}
-- example.cue --
package example

A: x: 2
B: A.x + A.o + 100
{{{end}}}

CUE permits unlimited sources of extra information to be introduced to augment
an evaluation, through {{<linkto/inline "tour/basics/unification" >}}.
If the *correct* kind of information is introduced into an evaluation involving
this `example.cue` file, then the value of field `B` could be calculated.
But until that happens, this otherwise valid CUE is referred to as "incomplete"
because (in isolation) it doesn't contain sufficient information to perform a
complete evaluation.

Because incomplete CUE is valid CUE it *can* be evaluated ...

{{{with script "en" "cue eval"}}}
cue eval example.cue
{{{end}}}

... but it *can't* be exported:

{{{with script "en" "cue export"}}}
! cue export example.cue
{{{end}}}

A configuration that includes incomplete CUE can be made *complete* by unifying
it with the right data. This means that every field that contributes to the
configuration being emitted must be  able to be calculated.

Here's some YAML data that will do this for our example, by "filling in the
gaps" in our incomplete CUE:

{{{with upload "en" "data.yaml"}}}
-- data.yaml --
A:
  o: 5
{{{end}}}

Unifying our incomplete CUE with this data makes the configuration complete,
and allows us to export the result:

{{{with script "en" "export example.cue data.yaml"}}}
cue export example.cue data.yaml
{{{end}}}

### Using the Go API

The Go API is also able to handle incomplete CUE.

To demonstrate the Go API in action we start by initializing a Go module:

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init go.example
{{{end}}}

We place this example Go code in `main.go`.
Its comments explain what is being done at each step.

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

	// Step #1: load the CUE package in the current directory.
	// It contains a single file - "example.cue", as shown above.
	bis := load.Instances([]string{"."}, nil)
	step1 := ctx.BuildInstance(bis[0])
	fmt.Printf("step1: %v\n", step1)

	// Step #2: load the "data.yaml" file shown above.
	step2File, err := yaml.Extract("data.yaml", nil)
	if err != nil {
		log.Fatal(err)
	}
	step2 := ctx.BuildFile(step2File)
	fmt.Printf("step2: %v\n", step2)

	// Ensure that the result of unifying the two steps is both
	// valid and concrete - and thus could be exported as data:
	result := step1.Unify(step2)
	if err := result.Validate(cue.Concrete(true)); err != nil {
		log.Fatal(err)
	}

	// Display the resulting CUE:
	fmt.Printf("result: %v\n", result)
}
{{{end}}}

We fetch the latest version of CUE, and tidy our Go module:

{{{with script "en" "go get etc"}}}
#ellipsis 0
go get cuelang.org/go@${CUELANG_CUE_LATEST}
#ellipsis 0
go mod tidy
{{{end}}}

When we run our Go code, it behaves the same as the `cue export` command above
\- except that it *also* displays the interim `step1` and `step2` values:

{{{with script "en" "go run"}}}
go run .
{{{end}}}

{{{with _script_ "en" "https://github.com/cue-lang/cue/issues/3496"}}}
go vet ./...
#ellipsis 0
go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./...
{{{end}}}

## Related content

- Tag: {{<tag "go api">}} -- Guides exploring CUE's Go API
