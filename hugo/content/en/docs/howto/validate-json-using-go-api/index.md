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

## Set up some schema and data files

{{< step stepNumber="1" >}}
Create a CUE schema.

You can use any schema that's relevant to your specific data, but our example uses this simple CUE:

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
#Schema: {
	name?: string
	age?:  int
}
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}


{{< step stepNumber="2" >}}
Create some known-good and known-bad test data.

You may already have some representative test data. This data is relevant to our example schema:

{{< code-tabs >}}
{{< code-tab name="good.json" language="json" area="top-left" >}}
{
    "name": "Charlie Cartwright",
    "age": 80
}
{{< /code-tab >}}{{< /code-tabs >}}

{{< code-tabs >}}
{{< code-tab name="bad.json" language="json" area="top-left" >}}
{
    "name": [
        "Moby",
        "Dick"
    ],
    "age": "173"
}
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

{{< step stepNumber="3" >}}
Verify that your schema accepts and rejects your test data appropriately.

Our example schema is contained in the `#Schema` definition, which we reference explicitly:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCBzY2hlbWEuY3VlIGdvb2QuanNvbiAtZCAnI1NjaGVtYScKY3VlIHZldCBzY2hlbWEuY3VlIGJhZC5qc29uIC1kICcjU2NoZW1hJw==" }
$ cue vet schema.cue good.json -d '#Schema'
$ cue vet schema.cue bad.json -d '#Schema'
age: conflicting values "173" and int (mismatched types string and int):
    ./bad.json:6:12
    ./schema.cue:3:9
name: conflicting values string and ["Moby","Dick"] (mismatched types string and list):
    ./bad.json:2:13
    ./schema.cue:2:9
```
{{< /step >}}

## Create a Go program

{{< step stepNumber="4" >}}
Initialize a Go module, or use an existing one if that's more suitable for your situation:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gbW9kIGluaXQgZ28uZXhhbXBsZQ==" }
$ go mod init go.example
...
```
{{< /step >}}

{{< step stepNumber="5" >}}
Create a main program.

You can use this example code as a starting point:

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

This example code embeds the CUE from `schema.cue` and uses it to validate a
single JSON file, printing the validation result to its standard output stream.
{{< /step >}}

{{< step stepNumber="6" >}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:
```text { title="TERMINAL" type="terminal" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjEwLjEKZ28gbW9kIHRpZHk=" }
$ go get cuelang.org/go@v0.10.1
...
$ go mod tidy
...
```
{{< /step >}}

## Run the Go program

{{< step stepNumber="7" >}}
Verify that the Go program accepts and rejects your test data as expected:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gcnVuIC4gZ29vZC5qc29uCmdvIHJ1biAuIGJhZC5qc29u" }
$ go run . good.json
✅ JSON: ok
$ go run . bad.json
❌ JSON: NOT ok
main.go:42: #Schema.name: conflicting values string and ["Moby","Dick"] (mismatched types string and list) (and 1 more errors)
exit status 1
```
{{< /step >}}
## Related content

- Go API: [`cue`](https://pkg.go.dev/cuelang.org/go/cue#section-documentation) -- package documentation
- Go API: [`cue/cuecontext`](https://pkg.go.dev/cuelang.org/go/cue/cuecontext#section-documentation) -- package documentation
- Go API: [`encoding/json`](https://pkg.go.dev/cuelang.org/go/encoding/json#section-documentation) -- package documentation
- Tag: {{< tag "go api" >}} -- pages explaining and exploring CUE's Go API
