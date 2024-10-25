---
title: "Working with incomplete CUE"
toc_hide: true
authors: [myitcv]
tags: [go api]
---

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

In general, CUE can handle references to fields that don't yet exist.
CUE that contains such references is referred to as *incomplete* CUE.

In this example field `A` does not have a concrete value, which means that the
value of field `B` can't be calculated:

{{{with upload "en" "example.cue"}}}
-- example.cue --
package example

A: b: 2
B: A.x + 10
{{{end}}}

Incomplete CUE can still be valid, but it can't be exported:

{{{with script "en" "export example.cue"}}}
# The example is valid CUE ...
cue vet -c=false example.cue
# ... but it contains non-concrete values:
! cue vet example.cue
# This means that it cannot be exported:
! cue export example.cue
{{{end}}}

This happens because CUE uses "export" to mean "emit a configuration in a
data-only encoding (such as JSON or YAML) which cannot express anything less
than fully specified data".

However, incomplete CUE can be evaluated - because it's still valid CUE:

{{{with script "en" "eval example.cue"}}}
cue eval example.cue
{{{end}}}

A configuration that includes incomplete CUE can be made *complete* by unifying
it with one or more values that "fill in the gaps".
Here, we add some YAML data to our example:

{{{with upload "en" "data.yaml"}}}
-- data.yaml --
A:
  x: 5
{{{end}}}

Unifying our incomplete CUE with this data makes the configuration complete,
and allows us to export the result:

{{{with script "en" "export example.cue data.yaml"}}}
cue export example.cue data.yaml
{{{end}}}

### Using the Go API

The Go API is also able to handle incomplete CUE.

To demonstrate this we start by initializing a Go module:

{{{with script "en" "go mod init"}}}
go mod init go.example
{{{end}}}

We place this example Go code in `main.go`:

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
	// It contains only one file - the example.cue file shown earlier.
	bis := load.Instances([]string{"."}, nil)
	step1 := ctx.BuildInstance(bis[0])
	fmt.Printf("step1: %v\n", step1)

	// Step #2: load data.yaml.
	step2File, err := yaml.Extract("data.yaml", nil)
	if err != nil {
		log.Fatal(err)
	}
	step2 := ctx.BuildFile(step2File)
	fmt.Printf("step2: %v\n", step2)

	// Ensure that the result of unifying the two steps is both
	// valid and concrete, and thus could be exported as data:
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
\- except that it also displays the interim `step1` and `step2` values:

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
