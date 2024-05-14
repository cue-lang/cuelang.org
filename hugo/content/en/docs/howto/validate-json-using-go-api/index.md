---
title: Validate JSON using Go API
toc_hide: true
tags:
- go api
authors:
- myitcv
---

This guide demonstrates how to write a Go program to validate JSON using an
embeded CUE schema

## Create CUE schema

{{< step stepNumber="1" >}}
```cue { title="schema.cue" }
#Schema: {
	name?: string
	age?:  int
}
```
{{< /step >}}

{{< step stepNumber="2" >}}
Create some test "good" data:

```json { title="good.json" }
{
    "name": "Charlie Cartwright",
    "age": 99
}
```
{{< /step >}}

{{< step stepNumber="3" >}}
Create some test "bad" data:

```json { title="bad.json" }
{
    "name": "cueckoo",
    "age": false
}
```
{{< /step >}}

{{< step stepNumber="4" >}}
Verify that the data vets as we expect:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCAtZCAnI1NjaGVtYScgc2NoZW1hLmN1ZSBnb29kLmpzb24KY3VlIHZldCAtZCAnI1NjaGVtYScgc2NoZW1hLmN1ZSBiYWQuanNvbg==" }
$ cue vet -d '#Schema' schema.cue good.json
$ cue vet -d '#Schema' schema.cue bad.json
age: conflicting values false and int (mismatched types bool and int):
    ./bad.json:3:12
    ./schema.cue:3:9
```
{{< /step >}}

## Create Go program to load and validate JSON

{{< step stepNumber="5" >}}
Create a Go module, or use an existing one if that's more suitable for your situation:

```text { title="TERMINAL" codeToCopy="Z28gbW9kIGluaXQgZ28uZXhhbXBsZQ==" }
$ go mod init go.example
...
```
{{< /step >}}

{{< step stepNumber="6" >}}
Create a main program:

```go { title="main.go" }
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

	// Load the JSON file specificed as the only argument as a CUE value
	dataFilename := os.Args[1]
	dataFile, err := os.ReadFile(dataFilename)
	if err != nil {
		log.Fatal(err)
	}
	jsonExpr, err := json.Extract(dataFilename, dataFile)
	if err != nil {
		log.Fatal(err)
	}
	jsonAsCUE := ctx.BuildExpr(jsonExpr)

	// Validate the JSON data using the schema
	unified := schema.Unify(jsonAsCUE)
	if err := unified.Validate(); err != nil {
		fmt.Println("❌ JSON: NOT ok")
		log.Fatal(err)
	}

	fmt.Println("✅ JSON: ok")
}
```
{{< /step >}}

{{< step stepNumber="7" >}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:
```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjguMgpnbyBtb2QgdGlkeQ==" }
$ go get cuelang.org/go@v0.8.2
...
$ go mod tidy
...
```
{{< /step >}}

## Run the Go program

{{< step stepNumber="8" >}}
Verify the Go program works against your test data:
```text { title="TERMINAL" codeToCopy="Z28gcnVuIC4gZ29vZC5qc29uCmdvIHJ1biAuIGJhZC5qc29u" }
$ go run . good.json
✅ JSON: ok
$ go run . bad.json
❌ JSON: NOT ok
main.go:42: #Schema.age: conflicting values int and false (mismatched types int and bool)
exit status 1
```
{{< /step >}}


## Related content

- TBC
