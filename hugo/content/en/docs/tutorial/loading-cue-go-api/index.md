---
title: Loading CUE via the Go API
tags:
- go api
authors:
- myitcv
toc_hide: true
---

This tutorial demonstrates how to get started with [CUE's Go
API](https://pkg.go.dev/cuelang.org/go), and write a Go program to load and
evaluate some CUE.

## Prerequisites

- **A tool to edit text files**. Any text editor you have will be fine, for
  example [VSCode](https://code.visualstudio.com/).
- **A command terminal**. `cue` works on all platforms, so any terminal on Linux
  or macOS, and on PowerShell, `cmd.exe` or
  [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) in Windows.
- **An installed `go` binary**
  ([installation details](https://go.dev/doc/install))
- **An installed `cue` binary**
  ([installation details]({{< relref "/docs/introduction/installation" >}}))
- **Some awareness of CUE schemata**
  ([Constraints]({{< relref "/docs/tour/basics/constraints" >}}) and
   [Definitions]({{< relref "/docs/tour/basics/definitions" >}}) in the CUE tour)

This tutorial is written using the following versions of `go` and `cue`:

```text { title="TERMINAL" codeToCopy="Y3VlIHZlcnNpb24KZ28gdmVyc2lvbg==" }
$ cue version
cue version v0.9.0-rc.1
...
$ go version
go version go1.22.3 linux/amd64
```

## Create a CUE module

{{< step stepNumber="1" >}}
Initialize a CUE module to hold our configuration:

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBpbml0IGNvbXBhbnkuZXhhbXBsZS9jb25maWd1cmF0aW9u" }
$ cue mod init company.example/configuration
```

{{< /step >}}

{{< step stepNumber="2" >}}
Write some CUE code:

{{< code-tabs >}}
{{< code-tab name="some.cue" language="cue" area="top-left" >}}
package example

output: "Hello \(name)"
name:   "Joe"
{{< /code-tab >}}

{{< code-tab name="another_file.cue" language="cue" area="top-left" >}}
Some content
{{< /code-tab >}}

{{< /code-tabs >}}

{{< /step >}}

{{< step stepNumber="3" >}}
Verify that the configuration successfully evaluates:

```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydA==" }
$ cue export
{
    "output": "Hello Joe",
    "name": "Joe"
}
```

{{< /step >}}

## Create a Go module and program

{{< step stepNumber="4" >}}
Initialize a Go module to contain your program:

```text { title="TERMINAL" codeToCopy="Z28gbW9kIGluaXQgY29tcGFueS5leGFtcGxlL2NvbmZpZ3VyYXRpb24=" }
$ go mod init company.example/configuration
...
```

{{< /step >}}

{{< step stepNumber="5" >}}
Write a Go program to load the CUE and print a message based on the `output`
field:

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
package main

import (
	"fmt"
	"log"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
)

func main() {
	ctx := cuecontext.New()

	// Load the package "example" from the current directory.
	// We don't need to specify a config in this example.
	insts := load.Instances([]string{"."}, nil)

	// The current directory just has one file without any build tags,
	// and that file belongs to the example package.
	// So we get a single instance as a result.
	v := ctx.BuildInstance(insts[0])
	if err := v.Err(); err != nil {
		log.Fatal(err)
	}

	// Lookup the 'output' field and print it out
	output := v.LookupPath(cue.ParsePath("output"))
	fmt.Println(output)
}
{{< /code-tab >}}
{{< /code-tabs >}}

{{< /step >}}

{{< step stepNumber="6" >}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjguMgpnbyBtb2QgdGlkeQ==" }
$ go get cuelang.org/go@v0.8.2
...
$ go mod tidy
...
```

You can use `@latest` in place of a specified version.

{{< /step >}}

## Run the Go program

{{< step stepNumber="7" >}}
Run the Go program:

```text { title="TERMINAL" codeToCopy="Z28gcnVuIC4=" }
$ go run .
"Hello Joe"
```

{{< /step >}}

## Congratulations!

Well done - you've successfully written your first Go program to load and
evaluate CUE.

## Related content

- [`cuelang.org/go` API docs](https://pkg.go.dev/cuelang.org/go)
