---
title: "Working with incomplete CUE"
toc_hide: true
authors: [myitcv]
tags: [go api]
---

In general, CUE can handle references to fields that don't yet exist.
For example:

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
package example

A: _
B: A.x + 10
{{< /code-tab >}}{{< /code-tabs >}}

This is referred to as *incomplete* CUE.
Incomplete CUE can stil be valid, but it can't be exported:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCBleGFtcGxlLmN1ZQ==" }
$ cue export example.cue
A: incomplete value _
B: A.x undefined as A is incomplete (type _):
    ./example.cue:4:4
```

This happens because CUE uses "export" to mean "emit a configuration in a
data-only encoding (such as JSON or YAML) which cannot express anything less
than fully specified data".

However, incomplete CUE can be evaluated - because it's still valid CUE:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgZXhhbXBsZS5jdWU=" }
$ cue eval example.cue
A: _
B: A.x + 10
```

A configuration that includes incomplete CUE can be made *complete* by unifying
it with one or more values that "fill in the gaps".
Here, we add some YAML data to our example:

{{< code-tabs >}}
{{< code-tab name="data.yaml" language="yaml" area="top-left" >}}
A:
  x: 5
{{< /code-tab >}}{{< /code-tabs >}}

Unifying our incomplete CUE with this data makes the configuration complete,
and allows us to export the result:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCBleGFtcGxlLmN1ZSBkYXRhLnlhbWw=" }
$ cue export example.cue data.yaml
{
    "A": {
        "x": 5
    },
    "B": 15
}
```

### Using the Go API

The Go API is also able to handle incomplete CUE.

To demonstrate this we start by initializing a Go module:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gbW9kIGluaXQgZ28uZXhhbXBsZQ==" }
$ go mod init go.example
go: creating new go.mod: module go.example
```

We place this example Go code in `main.go`:

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

We fetch the latest version of CUE, and tidy our Go module:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjEwLjEKZ28gbW9kIHRpZHk=" }
$ go get cuelang.org/go@v0.10.1
...
$ go mod tidy
...
```

When we run our Go code, it behaves the same as the `cue export` command above
\- except that it also displays the interim `step1` and `step2` values:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gcnVuIC4=" }
$ go run .
step1: {
	A: _
	B: A.x + 10
}
step2: {
	A: {
		x: 5
	}
}
result: {
	A: {
		x: 5
	}
	B: 15
}
```
## Related content

- Tag: {{<tag "go api">}} -- Guides exploring CUE's Go API
