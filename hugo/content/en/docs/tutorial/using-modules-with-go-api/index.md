---
title: Using modules with the Go API
authors: [myitcv, jpluscplusm]
tags: [go api, modules]
toc_hide: true
---

## Introduction

In this tutorial you will
use CUE's Go API to work with a CUE module dependency fetched from the Central Registry.

Along the way you will:

- Create a CUE module that depends on an existing, well-known module
- Use `cue mod tidy` to fetch and organise your module's dependencies
- Load your CUE using the Go API working in a modules-aware mode

<!--more-->

## Prerequisites

- **Access to the [Central Registry](https://registry.cue.works)** -- if you
  need to practise using the Central Registry, then first follow the
  tutorial {{< linkto/inline "tutorial/working-with-the-central-registry" >}}
- **A tool to edit text files** -- any text editor you have will be fine;
    for example: [VSCode](https://code.visualstudio.com/) or [Vim](https://neovim.io/)
- **A command terminal** -- the `cue` command works on all platforms;
  use any terminal on Linux or macOS, or PowerShell, `cmd.exe` or
  [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) on Windows.
- **An installed `go` binary** -- [installation details](https://go.dev/doc/install)
- **An installed `cue` binary** -- [installation details]({{< relref "/docs/introduction/installation" >}})

This tutorial uses the following version of CUE:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.14.0
...
```

## Create a CUE module

{{< step stepNumber="1" >}}
Initialize a new main CUE module in an empty directory:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGFuLmV4YW1wbGUvY29uZmlnQHYw" }
$ cue mod init an.example/config@v0
```

You won't publish this module, so the name you give it is unimportant.
{{< /step >}}

{{< step stepNumber="2" >}}
Create the file `main.cue`, holding the code for the main module:

{{< code-tabs >}}
{{< code-tab name="main.cue" language="cue" area="top-left" >}}
package config

import "github.com/cue-labs/examples/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
{{< /code-tab >}}{{< /code-tabs >}}

Your main module defines some concrete values for a configuration,
constrained by the `frostyconfig.#Config` schema.
{{< /step >}}

{{< info >}}
Your module imports and uses the `frostyconfig` package first introduced in the tutorial
{{< linkto/inline "tutorial/working-with-a-custom-module-registry" >}}.
You don't need to follow that tutorial right now - it's only mentioned for context.
{{< /info >}}

{{< step stepNumber="3" >}}
Ensure the CUE module is tidy:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

This fetches the `frostyconfig` module (and any dependencies it might have)
from the Central Registry.

If you see an error message mentioning "too many requests"
(here, or at any point as you follow this tutorial),
then
[login to the Central Registry](https://cue.dev/docs/login-central-registry/)
and re-run the failing command.
The Central Registry allows more requests from authenticated users.
{{< /step >}}

{{< step stepNumber="4" >}}
Export the configuration from your CUE module:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydA==" }
$ cue export
{
    "config": {
        "appName": "alpha",
        "port": 80,
        "features": {
            "logging": true
        }
    }
}
```

This export shows that your CUE is valid and you can successfully use a
dependency from the Central Registry.
{{< /step >}}

## Create a Go module and program

{{< step stepNumber="5" >}}
Initialize a Go module for your program:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gbW9kIGluaXQgYW4uZXhhbXBsZS9jb25maWc=" }
$ go mod init an.example/config
...
```

You won't publish this module, so the name you give it is unimportant.
{{< /step >}}

{{< step stepNumber="6" >}}
Create the file `main.go` containing this Go program:

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
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

	// Load the package from the current directory.
	// We don't need to specify a Config in this example.
	insts := load.Instances([]string{"."}, &load.Config{
		Registry: reg,
	})

	// The current directory just has one file without any build tags,
	// and that file belongs to the example package, so we get a single
	// instance as a result.
	v := ctx.BuildInstance(insts[0])
	if err := v.Err(); err != nil {
		log.Fatal(err)
	}

	// Lookup the 'config' field and print it out
	config := v.LookupPath(cue.ParsePath("config"))
	fmt.Println(config)
}
{{< /code-tab >}}{{< /code-tabs >}}

This program loads the CUE package in the current directory,
and then prints a message based on the `config` field.
{{< /step >}}

{{< step stepNumber="7" >}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjE0LjAKZ28gbW9kIHRpZHk=" }
$ go get cuelang.org/go@v0.14.0
...
$ go mod tidy
...
```

You can use `@latest` in place of the specific version mentioned here.
{{< /step >}}

## Run the Go program

{{< step stepNumber="8" >}}
Run the Go program:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gcnVuIC4=" }
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
## Summary

Well done - you've finished this tutorial! In completing it, you:

- **created a main module** that depends on a well-known module from the Central Registry, and
- **used the Go API to load the main module**, transparently using the module's dependencies.

## Related content

- {{< linkto/related/reference "modules" >}}
- {{< linkto/related/tutorial "working-with-a-custom-module-registry" >}}
