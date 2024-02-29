---
title: Using modules with the Go API
authors:
- myitcv
- jpluscplusm
tags:
- modules
- tooling
toc_hide: true
---

## Introduction

In this tutorial you will learn how to use CUE's Go API to work with CUE
modules, using a dependency from the [Central
Registry](https://registry.cue.works).

Along the way you will:

- Login to the Central Registry, and authenticate the `cue` command
- Create a module that depends on an existing, well-known module
- Use `cue mod tidy` to automatically add dependencies and their versions to the `module.cue` file
- Load that same CUE using the Go API, in a modules-aware mode

{{< info >}}
This tutorial describes an experimental feature. All details are subject to change.
{{< /info >}}

## Prerequisites

- **Access to the Central Registry**. Get started with [working with the Central
  Registry]({{< relref "docs/tutorial/working-with-the-central-registry" >}}),
  and ensure you have run `cue login`.
- **A tool to edit text files**. Any text editor you have will be fine, for
  example [VSCode](https://code.visualstudio.com/).
- **A command terminal**. `cue` works on all platforms, so any terminal on Linux
  or macOS, and on PowerShell, `cmd.exe` or
  [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) in Windows.

Note that this guide depends on a pre-release version of CUE:

```text { title="TERMINAL" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.9.0-alpha.3
...
```


{{< step stepNumber="1" >}}
Enable the modules experiment:

```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9FWFBFUklNRU5UPW1vZHVsZXM=" }
$ export CUE_EXPERIMENT=modules
```
{{< /step >}}

## Authenticate the `cue` command

{{< step stepNumber="2" >}}

Authenticate the `cue` command (a one-off process):

```text { title="TERMINAL" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```

In this tutorial, we use `cue` to first check that our CUE is valid, before
trying to load that same CUE using the Go API.

{{< /step >}}

## Create a module

{{< step stepNumber="3" >}}

Initialize a local CUE module. We will not publish this module:

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBpbml0IGdsYWNpYWwtdGVjaC5leGFtcGxlL2Zyb3N0eWFwcEB2MA==" }
$ cue mod init glacial-tech.example/frostyapp@v0
```

{{< /step >}}

{{< step stepNumber="4" >}}

Create the code for the new module:

```cue { title="config.cue" }
package frostyapp

import "github.com/cue-labs/examples/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
```

This imports the `frostyconfig` package first introduced in the tutorial on
[working with a custom registry]({{< relref
"docs/tutorial/working-with-a-custom-module-registry" >}}). Instead of depending
on a version of that module published to a custom registry, we have instead
published a version to the Central Registry. In our local module we define some
concrete values for the configuration, constrained by the `frostyconfig.#Config`
schema.

{{< /step >}}

{{< step stepNumber="5" >}}

Ensure the module is tidy, pulling all dependencies:
```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

{{< /step >}}

## Evaluate the configuration

{{< step stepNumber="6" >}}

Export the configuration as YAML:

```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" }
$ cue export --out yaml
config:
  appName: alpha
  port: 80
  features:
    logging: true
```

At this stage we know the CUE is valid and can be evaluated against a dependency
that lives in the Central Registry.

{{< /step >}}

## Create a Go module and program
{{< step stepNumber="7" >}}
Initialize a Go module to contain your program:

```text { title="TERMINAL" codeToCopy="Z28gbW9kIGluaXQgZ2xhY2lhbC10ZWNoLmV4YW1wbGUvZnJvc3R5YXBw" }
$ go mod init glacial-tech.example/frostyapp
...
```

{{< /step >}}

{{< step stepNumber="8" >}}
Write a Go program to load the CUE and print a message based on the `output`
field:

```go { title="main.go" }
package main

import (
	"fmt"
	"log"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/mod/modconfig"
)

func main() {
	ctx := cuecontext.New()

	// Create a registry client. Passing a nil config
	// will give us client that behaves like the cue command.
	reg, err := modconfig.NewRegistry(nil)
	if err != nil {
		log.Fatal(err)
	}

	// Load the package "example" from the current directory.
	// We don't need to specify a config in this example.
	insts := load.Instances([]string{"."}, &load.Config{
		Registry: reg,
	})

	// The current directory just has one file without any build tags,
	// and that file belongs to the example package.
	// So we get a single instance as a result.
	v := ctx.BuildInstance(insts[0])
	if err := v.Err(); err != nil {
		log.Fatal(err)
	}

	// Lookup the 'config' field and print it out
	config := v.LookupPath(cue.ParsePath("config"))
	fmt.Println(config)
}
```

{{< /step >}}

{{< step stepNumber="9" >}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjkuMC1hbHBoYS4zCmdvIG1vZCB0aWR5" }
$ go get cuelang.org/go@v0.9.0-alpha.3
...
$ go mod tidy
...
```

You can use `@latest` in place of a specified version.

{{< /step >}}

## Run the Go program

{{< step stepNumber="10" >}}
Run the Go program:

```text { title="TERMINAL" codeToCopy="Z28gcnVuIC4=" }
$ go run .
{
	appName: "alpha"
	port:    80
	features: {
		logging: true
	}
}
```

{{< /step >}}

## Congratulations!

That's it, you have just created a local module that depends on a well-known
module from the Central Registry, and loaded it via the Go API!

## Related content

- {{< linkto/related/reference "modules" >}}
