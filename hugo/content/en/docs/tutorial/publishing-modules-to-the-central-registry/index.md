---
title: Publishing modules to the Central Registry
authors:
- myitcv
tags:
- modules
- tooling
- cue command
toc_hide: true
---

## Introduction

In this tutorial you will learn how to create and work with CUE modules,
publishing to the Central Registry. The guide is written from the perspective of
the GitHub user `cueckoo`, creating and publishing the module `github.com/cueckoo/frostyconfig`.
Substitute your username and repository to follow along.

## Prerequisites

- **A tool to edit text files**. Any text editor you have will be fine, for
  example [VSCode](https://code.visualstudio.com/).
- **A command terminal**. `cue` works on all platforms, so any terminal on Linux
  or macOS, and on PowerShell, `cmd.exe` or
  [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) in Windows.
- **An installed `cue` binary**
  ([installation details]({{< relref "/docs/introduction/installation" >}}))
- **Some awareness of CUE schemata**
  ([Constraints]({{< relref "/docs/tour/basics/constraints" >}}) and
   [Definitions]({{< relref "/docs/tour/basics/definitions" >}}) in the CUE tour)

This tutorial is written using the following version of `cmd/cue`:

```text { title="TERMINAL" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.9.0-alpha.1
...
```

It is based on on a similar tutorial that explains in more detail how to use
modules [with a custom registry]({{< relref
"/docs/tutorial/working-with-a-custom-module-registry" >}}).

## Create the module for the schema code

In this tutorial we will focus on an imaginary application called `FrostyApp`,
which consumes its configuration in YAML format.
You will define the configuration in CUE and use a CUE schema to validate it.
We would like to be able to share the schema between several consumers.

{{< step stepNumber="1" >}}

Create a directory to hold the schema code:
```text { title="TERMINAL" codeToCopy="bWtkaXIgZnJvc3R5Y29uZmlnCmNkIGZyb3N0eWNvbmZpZw==" }
$ mkdir frostyconfig
$ cd frostyconfig
```

{{< /step >}}

{{< step stepNumber="2" >}}

Enable the modules experiment:

```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9FWFBFUklNRU5UPW1vZHVsZXM=" }
$ export CUE_EXPERIMENT=modules
```

{{< /step >}}

{{< step stepNumber="3" >}}

Initialize the directory as a module:

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBpbml0IGdpdGh1Yi5jb20vY3VlY2tvby9mcm9zdHljb25maWdAdjA=" }
$ cue mod init github.com/cueckoo/frostyconfig@v0
```

Because we are writing this guide from the perspective of the GitHub user
`cueckoo`, we know the user can control `github.com/cueckoo/frostyconfig` and publish modules in
that namespace.

{{< /step >}}

{{< step stepNumber="4" >}}

Create the configuration schema:
```cue { title="frostyconfig/config.cue" }
package frostyconfig

// #Config defines the schema for the FrostyApp configuration.
#Config: {
	// appName defines the name of the application.
	appName!: string
	// port holds the port number the application listens on.
	port!: int
	// debug holds whether to enable debug mode.
	debug?: bool
	// features holds optional feature settings
	features?: {
		// logging enables or disables logging.
		logging?: bool
		// analytics enables or disables analytics.
		analytics?: bool
	}
}
```

{{< /step >}}

{{< step stepNumber="5" >}}

As a one-off, login to the Central Registry:

```text { title="TERMINAL" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```

{{< /step >}}

{{< info >}}
The CUE Labs Central Registry is in alpha testing. If you do not yet have access
please request access via the `#modules` channel in
[Slack](https://join.slack.com/t/cuelang/shared_invite/enQtNzQwODc3NzYzNTA0LTAxNWQwZGU2YWFiOWFiOWQ4MjVjNGQ2ZTNlMmIxODc4MDVjMDg5YmIyOTMyMjQ2MTkzMTU5ZjA1OGE0OGE1NmE)
or via [contact@cue.works](mailto:contact@cue.works).
{{< /info >}}


{{< step stepNumber="6" >}}

Ensure the `module.cue` file is tidy:
```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

{{< /step >}}

{{< step stepNumber="7" >}}

Publish the first version of this module:
```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBwdWJsaXNoIHYwLjAuMQ==" }
$ cue mod publish v0.0.1
published github.com/cueckoo/frostyconfig@v0.0.1
```

{{< /step >}}

## Create a new `frostyapp` module that depends on the first module

Define the actual `FrostyApp` configuration, constrained by the schema you just
published.

{{< step stepNumber="8" >}}

Create a directory for the new module and initalize it:
```text { title="TERMINAL" codeToCopy="bWtkaXIgLi4vZnJvc3R5YXBwCmNkIC4uL2Zyb3N0eWFwcApjdWUgbW9kIGluaXQgZ2l0aHViLmNvbS9jdWVja29vL2Zyb3N0eWFwcEB2MA==" }
$ mkdir ../frostyapp
$ cd ../frostyapp
$ cue mod init github.com/cueckoo/frostyapp@v0
```
{{< /step >}}

{{< step stepNumber="9" >}}

Create the code for the new module:
```cue { title="frostyapp/config.cue" }
package frostyapp

import "github.com/cueckoo/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
```

{{< /step >}}

{{< step stepNumber="10" >}}

Ensure the module is tidy, pulling all dependencies:
```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

We can see that the dependencies have now been added to the
`cue.mod/module.cue` file:

```text { title="TERMINAL" codeToCopy="Y2F0IGN1ZS5tb2QvbW9kdWxlLmN1ZQ==" }
$ cat cue.mod/module.cue
module: "github.com/cueckoo/frostyapp@v0"
language: {
	version: "v0.9.0-alpha.1"
}
deps: {
	"github.com/cueckoo/frostyconfig@v0": {
		v: "v0.0.1"
	}
}
```

{{< /step >}}

## Evaluate the configuration

{{< step stepNumber="11" >}}

Export the configuration as YAML:
```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" }
$ cue export --out yaml
config:
  appName: alpha
  port: 80
  features:
    logging: true
```

We can use this new module code just like any other CUE code.

{{< /step >}}

## Congratulations!

That's it! You have just created and published a module to the Central Registry,
and then created a module that depends on the newly published module.

## Related content

- {{< linkto/related/reference "modules" >}}
