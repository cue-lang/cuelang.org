---
title: Placing data using the Go API
tags: [go api]
authors: [myitcv,jpluscplusm]
toc_hide: true
---

The `cue` command allows non-CUE data to be "placed" at a specific location in
its evaluation with the `--path`/`-l` flag.
This guide demonstrates how to achieve the same result using the Go API.

## Set up the environment

{{< step stepNumber="1" >}}
If you don't already have CUE or Go modules, initialize them:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxlCmdvIG1vZCBpbml0IGdvLmV4YW1wbGU=" }
$ cue mod init cue.example
$ go mod init go.example
...
```
{{< /step >}}

## Create some data files

{{< step stepNumber="2" >}}
Write some CUE code and JSON data
(if you don't already have some code that you want to update and use):

{{< code-tabs >}}
{{< code-tab name="some.cue" language="cue" area="left" >}}
package example

// The data will be placed at this location.
input: {
	name!:    string
	location: *"your part of the world" | string
}

output: """
    Hello, \(input.name)!
    How's the weather in \(input.location)?
    """
{{< /code-tab >}}{{< code-tab name="input.json" language="json" area="right" >}}
{
    "name": "Charlie"
}
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

{{< step stepNumber="3" >}}
Check that the data file can be combined successfully with the CUE:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAuIGlucHV0Lmpzb24gLS1wYXRoIGlucHV0OiAtZSBvdXRwdXQgLS1vdXQgdGV4dA==" }
$ cue export . input.json --path input: -e output --out text
Hello, Charlie!
How's the weather in your part of the world?
```
{{< /step >}}

## Write some Go

{{< step stepNumber="4" >}}
Write a Go program that places the data in the `input.json` file at a specific
location within its CUE evaluation
(or adapt your existing code to do the same):

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
package main

import (
	"fmt"
	"log"
	"os"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/encoding/json"
)

func main() {
	ctx := cuecontext.New()
	// Load the package in the current directory.
	bis := load.Instances([]string{"."}, nil)
	v := ctx.BuildInstance(bis[0])

	// Load the input data.
	jsonBytes, err := os.ReadFile("input.json")
	if err != nil {
		log.Fatal(err)
	}

	// Parse the input data to a CUE expression.
	jsonData, err := json.Extract("input.json", jsonBytes)
	if err != nil {
		log.Fatal(err)
	}

	// Place the parsed data as the value of the "input" field.
	complete := v.FillPath(cue.ParsePath("input"), jsonData)

	// Extract the string value of the "output" field and print it.
	output := complete.LookupPath(cue.ParsePath("output"))
	msg, _ := output.String() // We know that "output" is a string type.
	fmt.Printf("%v\n", msg)
}
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

## Run the program

{{< step stepNumber="5" >}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjEwLjAKZ28gbW9kIHRpZHk=" }
$ go get cuelang.org/go@v0.10.0
...
$ go mod tidy
...
```
{{< /step >}}

{{< step stepNumber="6" >}}
Run the program,
printing the same multi-line string value that `cue` produced earlier:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gcnVuIC4=" }
$ go run .
Hello, Charlie!
How's the weather in your part of the world?
```
{{< /step >}}

## Related content

- {{< linkto/related/concept "how-cue-works-with-go" >}}
- All pages tagged with {{< tag "go api" >}}
