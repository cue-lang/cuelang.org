---
title: Validating JSON using the Go API
tags:
- go api
- validation
- encodings
authors:
- myitcv
toc_hide: true
---

This guide demonstrates how to write a Go program that validates JSON files
using an embeded CUE schema.

<!--more-->

## Set up some schema and data files

[**:material-chevron-right-circle-outline: Step 1**](#step-1){id="step-1"}: Create a CUE schema.

You can use any schema that's relevant to your specific data, but our example uses this simple CUE:

```` { .cue title="schema.cue" }
#Schema: {
	name?: string
	age?:  int
}
````

---



[**:material-chevron-right-circle-outline: Step 2**](#step-2){id="step-2"}: Create some known-good and known-bad test data.

You may already have some representative test data. This data is relevant to our example schema:

```` { .json title="good.json" }
{
    "name": "Charlie Cartwright",
    "age": 80
}
````

```` { .json title="bad.json" }
{
    "name": [
        "Moby",
        "Dick"
    ],
    "age": "173"
}
````

---


[**:material-chevron-right-circle-outline: Step 3**](#step-3){id="step-3"}: Verify that your schema accepts and rejects your test data appropriately.

Our example schema is contained in the `#Schema` definition, which we reference explicitly:

```` { .text title="TERMINAL" data-copy="cue vet -c schema.cue good.json -d &#39;#Schema&#39;&#10;cue vet -c schema.cue bad.json -d &#39;#Schema&#39;" }
$ cue vet -c schema.cue good.json -d '#Schema'
$ cue vet -c schema.cue bad.json -d '#Schema'
age: conflicting values "173" and int (mismatched types string and int):
    ./bad.json:6:12
    ./schema.cue:3:9
name: conflicting values ["Moby","Dick"] and string (mismatched types list and string):
    ./bad.json:2:13
    ./schema.cue:2:9
````

---


## Create a Go program

[**:material-chevron-right-circle-outline: Step 4**](#step-4){id="step-4"}: Initialize a Go module, or use an existing one if that's more suitable for your situation:

```` { .text title="TERMINAL" data-copy="go mod init go.example" }
$ go mod init go.example
...
````

---


[**:material-chevron-right-circle-outline: Step 5**](#step-5){id="step-5"}: Create a main program.

You can use this example code as a starting point:

```` { .go title="main.go" }
package main

import (
	"fmt"
	"log"
	"os"

	_ "embed"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/encoding/json"
)

// Embed our schema in a Go string variable.
//
//go:embed schema.cue
var cueSource string

func main() {
	ctx := cuecontext.New()

	// Build the schema
	schema := ctx.CompileString(cueSource).LookupPath(cue.ParsePath("#Schema"))

	// Load the JSON file specified (the program's sole argument) as a CUE value
	dataFilename := os.Args[1]
	dataFile, err := os.ReadFile(dataFilename)
	if err != nil {
		log.Fatal(err)
	}
	dataExpr, err := json.Extract(dataFilename, dataFile)
	if err != nil {
		log.Fatal(err)
	}
	dataAsCUE := ctx.BuildExpr(dataExpr)

	// Validate the JSON data using the schema
	unified := schema.Unify(dataAsCUE)
	if err := unified.Validate(); err != nil {
		fmt.Println("❌ JSON: NOT ok")
		log.Fatal(err)
	}

	fmt.Println("✅ JSON: ok")
}
````

This example code embeds the CUE from `schema.cue` and uses it to validate a
single JSON file, printing the validation result to its standard output stream.

---


[**:material-chevron-right-circle-outline: Step 6**](#step-6){id="step-6"}: Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:
```` { .text title="TERMINAL" data-copy="go get cuelang.org/go@v0.14.1&#10;go mod tidy" }
$ go get cuelang.org/go@v0.14.1
...
$ go mod tidy
...
````

---


## Run the Go program

[**:material-chevron-right-circle-outline: Step 7**](#step-7){id="step-7"}: Verify that the Go program accepts and rejects your test data as expected:

```` { .text title="TERMINAL" data-copy="go run . good.json&#10;go run . bad.json" }
$ go run . good.json
✅ JSON: ok
$ go run . bad.json
❌ JSON: NOT ok
#Schema.name: conflicting values string and ["Moby","Dick"] (mismatched types string and list) (and 1 more errors)
exit status 1
````

---

## Related content

- Go API: [`cue`](https://pkg.go.dev/cuelang.org/go/cue#section-documentation) -- package documentation
- Go API: [`cue/cuecontext`](https://pkg.go.dev/cuelang.org/go/cue/cuecontext#section-documentation) -- package documentation
- Go API: [`encoding/json`](https://pkg.go.dev/cuelang.org/go/encoding/json#section-documentation) -- package documentation
- Tag: {{< tag "go api" >}} -- pages explaining and exploring CUE's Go API
