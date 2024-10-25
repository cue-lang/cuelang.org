---
title: "Working with incomplete CUE"
toc_hide: true
authors: [myitcv]
---

{{< warning >}}
This draft is a WIP
{{< /warning >}}

In general, CUE can deal with references to fields that don't exist (yet)
e.g.

{{< code-tabs >}}
{{< code-tab name="x.cue" language="cue" area="top-left" >}}
package x

x: _
y: x.f
{{< /code-tab >}}{{< /code-tabs >}}

This is referred to as incomplete CUE.
Such CUE cannot be exported:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCB4LmN1ZQ==" }
$ cue export x.cue
x: incomplete value _
y: x.f undefined as x is incomplete (type _):
    ./x.cue:4:4
```

But it can be evaluated.

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgeC5jdWU=" }
$ cue eval x.cue
x: _
y: x.f
```

The configuration can be made complete by unifying it with one or more values
that "fill in the gaps" In this case we use some Yaml to make the configuration
complete:

{{< code-tabs >}}
{{< code-tab name="data.yaml" language="yaml" area="top-left" >}}
x:
  f:
    5
{{< /code-tab >}}{{< /code-tabs >}}

Unifying the two allows us to export the result:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCB4LmN1ZSBkYXRhLnlhbWw=" }
$ cue export x.cue data.yaml
{
    "x": {
        "f": 5
    },
    "y": 5
}
```

We can also demonstrate this via the Go API:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gbW9kIGluaXQgbW9kLmV4YW1wbGUKZ28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjEwLjE=" }
$ go mod init mod.example
go: creating new go.mod: module mod.example
$ go get cuelang.org/go@v0.10.1
...
```

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
{{< /code-tab >}}{{< /code-tabs >}}

Running this Go code is identical in behaviour to the `cue export` command from
before:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gbW9kIHRpZHkKZ28gcnVuIC4=" }
$ go mod tidy
...
$ go run .
step1: {
	x: _
	y: x.f
}
step2: {
	x: {
		f: 5
	}
}
res: {
	x: {
		f: 5
	}
	y: 5
}
```

The idea being that we can show how to work with incomplete values and
unification (the simplest of pipelines) to make things concrete.

