---
title: Placing data using the Go API
tags:
- go api
authors:
- myitcv
toc_hide: true
---

This tutorial demonstrates how to mimic the `--path` or `-l` flag for `cmd/cue` to "place" data using the Go API.

{{< step stepNumber="1" >}}
Initialize a CUE module to hold our configuration:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IG1vZC5leGFtcGxl" }
$ cue mod init mod.example
```

{{< /step >}}

{{< step stepNumber="2" >}}
Write some CUE code and JSON data:

{{< code-tabs >}}
{{< code-tab name="some.cue" language="cue" area="top-left" >}}
package example

// We will place the data here
input!: {
	name!: string
}

output: "Hello \(input.name)"
{{< /code-tab >}}{{< code-tab name="input.json" language="json" area="top-right" >}}
{
    "name": "cueckoo"
}
{{< /code-tab >}}{{< /code-tabs >}}

{{< /step >}}

{{< step stepNumber="3" >}}
Initialize a Go module to hold our program

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gbW9kIGluaXQgbW9kLmV4YW1wbGU=" }
$ go mod init mod.example
...
```

{{< /step >}}


{{< step stepNumber="4" >}}
Write our Go program to place the

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
	bis := load.Instances([]string{"."}, nil)
	v := ctx.BuildInstance(bis[0])

	// Load our input data
	jsonBytes, err := os.ReadFile("input.json")
	if err != nil {
		log.Fatal(err)
	}
	jsonData, err := json.Extract("input.json", jsonBytes)
	if err != nil {
		log.Fatal(err)
	}

	// Place as in the "input" field value
	complete := v.FillPath(cue.ParsePath("input"), jsonData)

	// Print the "output" field value
	fmt.Printf("%v\n", complete.LookupPath(cue.ParsePath("output")))
}
{{< /code-tab >}}{{< /code-tabs >}}

{{< /step >}}

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
Run our program:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gcnVuIC4=" }
$ go run .
"Hello cueckoo"
```

{{< /step >}}

