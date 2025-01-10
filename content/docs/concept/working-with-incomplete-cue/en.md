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

Here's an example of incomplete CUE. The value of `connectionString` can't be
calculated given the information in `database.cue` alone because the value of
the `password` field isn't concrete - it's only a `string` constraint.

{{{with upload "en" "cue"}}}
-- database.cue --
package database

connectionString: "\(system)://\(user):\(password)@\(host):\(port)/\(database)"

system:   "postgres"
host:     "prod.db.example.com"
user:     "alex"
port:     "5432"
database: "transactions"
password: string
{{{end}}}

CUE allows evaluations to be augmented by extra information introduced through
{{<linkto/inline "tour/basics/unification" >}}.
If we introduce information into an evaluation of the `database.cue` file and
provide a concrete `string` value for the `password` field then the value of
the `connectionString` field can be calculated.
But until that happens, this otherwise valid CUE is referred to as "incomplete"
because it doesn't contain sufficient information to permit a complete
evaluation by itself.

Note that because incomplete CUE is valid CUE it *can* be evaluated ...

<!-- TODO(jcm): replace eval with vet (x1? x2?) if the resolution of
https://cuelang.org/issue/2120 permits. -->
{{{with script "en" "cue eval succeeds"}}}
cue eval database.cue
{{{end}}}

... but it *can't* be exported:

{{{with script "en" "cue export fails"}}}
! cue export database.cue
{{{end}}}

The `cue vet` command spots that an export would fail (because it includes
incomplete regular fields) and lets us know with a general error message:

{{{with script "en" "cue vet fails"}}}
! cue vet database.cue
{{{end}}}

Discover which regular fields are incomplete with `cue vet -c=true`, or disable
incompleteness checks by telling `cue vet` to fail *only* when it encounters
invalid values by using `cue vet -c=false`.

## Fixing incomplete values

A configuration that results in incomplete values can be made *complete* by
unifying it with the right information. This means that every field that
contributes to the emitted configuration must be able to be resolved to a
concrete value.

Here's some YAML data that will do this for our example and "fill in the gaps"
in our incomplete CUE by providing the `password` secret:

{{{with upload "en" "data"}}}
-- secrets.yaml --
password: "Ch^ngeMeBef0r3GoL!ve"
{{{end}}}

Unifying our incomplete CUE with this data makes the configuration complete,
and allows us to export the result:

{{{with script "en" "cue export succeeds"}}}
cue export database.cue secrets.yaml
# Export just the data source name as a text value.
cue export database.cue secrets.yaml -e connectionString
{{{end}}}

### Using the Go API

The Go API is also able to handle incomplete CUE.

To demonstrate the Go API in action we start by initializing a Go module:

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init go.example
{{{end}}}

We place this example Go code in `main.go`.
Comments explain what is being done at each step.

{{{with upload "en" "go"}}}
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
	// It contains a single file - "database.cue", as shown above.
	bis := load.Instances([]string{"."}, nil)
	step1 := ctx.BuildInstance(bis[0])
	fmt.Printf("step1: %v\n", step1)

	// Step #2: load the "secrets.yaml" file shown above.
	step2File, err := yaml.Extract("secrets.yaml", nil)
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
