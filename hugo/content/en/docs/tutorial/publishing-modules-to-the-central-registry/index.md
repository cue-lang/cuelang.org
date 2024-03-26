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
`github.com/cueckoo`

```text { title="TERMINAL" codeToCopy="ZWNobyBnaXRodWIuY29tL2N1ZWNrb28=" }
$ echo github.com/cueckoo
github.com/cueckoo
```

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

Each module described in this tutorial will live in a separate directory, which
you will create as they are needed.
{{< /step >}}

{{< step stepNumber="2" >}}

Initialize the directory as a module:
```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBpbml0IGdpdGh1Yi5jb20vY3VlY2tvby9mcm9zdHljb25maWdAdjA=" }
$ cue mod init github.com/cueckoo/frostyconfig@v0
```

In order to publish the module to a registry, the code must hold a
`cue.mod/module.cue` file declaring its module path. This is the path prefix to
use when importing packages from within the module.

Module paths are fully domain-name qualified,
and it is good practice to place the module under a domain
or a GitHub repository that you control.

We will use a custom registry in this tutorial,
which has fewer restrictions on the module paths that can be used.
By contrast a central shared registry may
require proof of control of a domain
before allowing updates to a module in that domain.

In our example we will assume that
we control the domain name `github.com/cueckoo`
and place all module paths under that.

There are some other constraints on the names
that can be used for a module, due to OCI restrictions.
The module name must contain only
lower-case ASCII letters, ASCII digits, dots (`.`), and dashes (`-`).
The
[OCI distribution spec](https://github.com/opencontainers/distribution-spec/blob/main/spec.md#pulling-manifests)
contains full details of the naming restrictions.
{{< /step >}}

{{< info >}}
Modules are always named with the major version at the end of the module path.
This is independent from the naming restrictions detailed above: the same OCI
repository is used for all major and minor versions of a given module in a
registry.
{{< /info >}}

{{< step stepNumber="3" >}}

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

The details of the schema are not too important. For the purposes of this tutorial,
it represents the schema of the configuration data expected by `FrostyApp`.

{{< /step >}}

## Choose an OCI registry

{{< step stepNumber="4" >}}

If you do not have access to an OCI registry, start one locally:

```text { title="TERMINAL" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```

{{< /step >}}

## Publish the module

{{< step stepNumber="5" >}}

Set up some required envirionment variables:
```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9FWFBFUklNRU5UPW1vZHVsZXM=" }
$ export CUE_EXPERIMENT=modules
```

The `CUE_EXPERIMENT` variable is necessary because the modules registry
support is currently in its experimental phase.

The `CUE_REGISTRY` variable tells the `cue` command which
registry to use when fetching and pushing modules.
In our example the modules will be stored in the registry under the prefix `cuemodules`.
In practice you would want this prefix to be some place of your choice -
or you could leave the prefix empty if you plan to dedicate the registry
to holding CUE modules.
{{< /step >}}

{{< step stepNumber="6" >}}

Ensure the `module.cue` file is tidy:
```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```
This command checks that modules for all imported packages
are present in the `cue.mod/module.cue` file and that their versions
are correct. It is good practice to run this before publishing
a module. So, although this module does not
have any dependencies, we will run `cue mod tidy` anyway.
{{< /step >}}

{{< step stepNumber="7" >}}

Publish the first version of this module:
```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBwdWJsaXNoIHYwLjAuMQ==" }
$ cue mod publish v0.0.1
published github.com/cueckoo/frostyconfig@v0.0.1
```

This command uploads the module to the registry and publishes it
under version `v0.0.1`. It will be published to the module
path we chose in `cue mod init` earlier - all we need to do in this command
is to decide which version we will publish.
The version follows [semver syntax](https://semver.org),
and it is good practice to follow semantic version *conventions*, which include
maintaining compatability with earlier minor versions of the same module.

The major version under which it is published
**must** match the major version specified in the module file.
For example it would be an error to use `v1.0.1` here
because the module name ends in `@v0`.

The module has now been published to the registry. If you are running a
registry locally then you might have seen some output in the `docker` terminal
while the registry received and stored the module.
{{< /step >}}

