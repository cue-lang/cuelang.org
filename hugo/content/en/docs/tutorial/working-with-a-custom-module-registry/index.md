---
title: Working with a custom module registry
authors:
- rogpeppe
tags:
- modules
- tooling
- cue command
toc_hide: true
---
## Introduction

In this tutorial, you will learn how to create and work with CUE modules,
using a custom module registry.

Along the way, you will:

- Define a module containing a CUE schema
- Push it to a custom registry
- Define a top level module that depends on the above module
- Use `cue mod tidy` to automatically add dependencies and their versions to the `module.cue` file
- Publish a module containing a CUE template that depends on the schema
- Update the top level module to depend on that
- Update the schema and its version and update the top level module to depend on the new version

{{< info >}}
This tutorial describes an experimental feature. All details are subject to change.
{{< /info >}}

## Prerequisites

- **A tool to edit text files**. Any text editor you have will be fine, for
  example [VSCode](https://code.visualstudio.com/).
- **A command terminal**. `cue` works on all platforms, so any terminal on Linux
  or macOS, and on PowerShell, `cmd.exe` or
  [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) in Windows.
- **The docker command** or an OCI registry that you have write access to.
- **An installed `cue` binary** ([installation details]({{< relref "/docs/introduction/installation" >}}))
- **Some awareness of CUE schemata** ([Constraints]({{< relref "/docs/tour/basics/constraints" >}}) and
   [Definitions]({{< relref "/docs/tour/basics/definitions" >}}) in the CUE tour)

## Create the module for the schema code

In this example, we will focus on an imaginary application, say "FrostyApp".
This will consume its configuration in YAML format, and we'll define
the configuration in CUE and use a CUE schema to validate it.
We would like to be able to share the schema between several consumers.

{{< step stepNumber="1" >}}
Create a directory for the schema code.
```text { title="TERMINAL" codeToCopy="bWtkaXIgZnJvc3R5Y29uZmlnCmNkIGZyb3N0eWNvbmZpZwo=" }
$ mkdir frostyconfig
$ cd frostyconfig
```

Each module described in this tutorial will live in a separate directory
which we create above.
{{< /step >}}

{{< step stepNumber="2" >}}
Initialize it as a module.
```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBpbml0IGdsYWNpYWwtdGVjaC5jb20vZnJvc3R5Y29uZmlnQHYwCg==" }
$ cue mod init glacial-tech.com/frostyconfig@v0
```

In order to publish the module a registry, the code must hold a `cue.mod/module.cue`
file declaring its module path - the path prefix used when importing packages within the module.

Although we are going to use a custom registry here, so there are less
restrictions on what module paths you can use, module paths are fully domain-name
qualified and it is good practice to place the module under a domain that you control
or under a GitHub repository that you own. For this example, we will assume that
we control the domain name "glacial-tech.com".

Due to OCI registry naming restrictions, there are some other constraints on
the names you can choose for a module:
- it must contain only lower-case ASCII letters, ASCII digits, dots (U+002E), and dashes (U+002D)
- see the [OCI distribution spec](https://github.com/opencontainers/distribution-spec/blob/main/spec.md#pulling-manifests) for full details

Note: modules are always named with the major version at the end of
the module path. This is independent of the naming restrictions above: the
same OCI repository is used for all major and minor versions of a given
module in a registry.
{{< /step >}}

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

```text { title="TERMINAL" codeToCopy="ZG9ja2VyIHJ1biAtcCA1MDAwOjUwMDAgcmVnaXN0cnkK" }
$ docker run -p 5000:5000 registry
```

CUE should work with all OCI-compatible artifact registries, such as
the [Google Artifact Registry](https://cloud.google.com/artifact-registry),
as CUE uses the standard OCI protocols spoken by such registries.

For this example, we will just run a local instance of the docker registry on port 5000.
You will want to do this in a separate terminal so the docker instance remains running
while you run the rest of the commands in the tutorial.
{{< /step >}}

## Publish the module

{{< step stepNumber="5" >}}
Set up the envirionment variables:
```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9FWFBFUklNRU5UPW1vZHVsZXMKZXhwb3J0IENVRV9SRUdJU1RSWT1sb2NhbGhvc3Q6NTAwMC9jdWVtb2R1bGVzCg==" }
$ export CUE_EXPERIMENT=modules
$ export CUE_REGISTRY=localhost:5000/cuemodules
```

The `CUE_EXPERIMENT` variable is necessary because the modules registry
support is currently in its experimental phase.

The `CUE_REGISTRY` variable tells the `cue` command what
registry to use when fetching and pushing modules.
In this example the modules will be stored in the registry under the prefix `cuemodules`.
In practice you will want this prefix to be some place of your choice,
or you could leave it empty if you do not plan to use the registry
for any other purpose at the same time.
{{< /step >}}

{{< step stepNumber="6" >}}
Ensure the `module.cue` file is tidy:

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCB0aWR5Cg==" }
$ cue mod tidy
```
This command checks that modules for all imported packages
are present in the `cue.mod/module.cue` file and that their versions
are correct. It is good practice to run this before publishing
a module. So, athough this module does not
have any dependencies, we will run `cue mod tidy` anyway.
{{< /step >}}

{{< step stepNumber="7" >}}
Publish the first version of this module:

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBwdWJsaXNoIHYwLjAuMQo=" }
$ cue mod publish v0.0.1
```

This command uploads the module to the registry and publishes it
under version `v0.0.1`. It will be published to the module
path we chose in `cue mod init` earlier - all we need to do here
is decide on the version. The version follows [semver syntax](https://semver.org),
and it is to follow semantic version conventions too - that is
to maintain compatability with earlier minor versions of the
same module.

Note that the major version of the version it is published as
must match the major version specified in the module file.
For example it would be an error to use `v1.0.1` here
because the module name ends in `@v0`.

At this point, the module has been published to the registry (you might have seen some output
in the terminal window running docker as it did so).
{{< /step >}}

## Create a new "frostyapp" module that depends on the other one

Now it is time to define the actual `FrostyApp` configuration itself,
constrained by the schema just published.

{{< step stepNumber="8" >}}
Create a directory for the new module and initalize it:
```text { title="TERMINAL" codeToCopy="Y2QgLi4KbWtkaXIgZnJvc3R5YXBwCmNkIGZyb3N0eWFwcApjdWUgbW9kIGluaXQgZ2xhY2lhbC10ZWNoLmNvbS9mcm9zdHlhcHBAdjAK" }
$ cd ..
$ mkdir frostyapp
$ cd frostyapp
$ cue mod init glacial-tech.com/frostyapp@v0
```
{{< /step >}}

{{< step stepNumber="9" >}}
Create the code for the new module:
```cue { title="frostyapp/config.cue" }
package frostyapp

import "glacial-tech.com/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
```

This imports the `frostyconfig` package from the
module we published earlier
and defines some actual values for the configuration,
constrained by the `frostyconfig.#Config` schema.
{{< /step >}}

{{< step stepNumber="10" >}}
Ensure the module is tidy, pulling all dependencies:

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCB0aWR5Cg==" }
$ cue mod tidy
```

We can see that the dependencies have been added to the
`cue.mod/module.cue` file now:

<!-- TODO: show actual file content -->
```cue { title="frostyapp/cue.mod/module.cue" }
module: "glacial-tech.com/frostyapp@v0"
deps: {
	"glacial-tech.com/frostyconfig@v0": {
		v: "v0.0.1"
	}
}
```

In diagrammatic form, this is what our dependencies look like currently:

{{< mermaid>}}
flowchart TD
    frostyapp--  v0.0.1 --> frostyconfig
{{< /mermaid >}}
{{< /step >}}

## Evaluate the configuration

{{< step stepNumber="11" >}}

Export the configuration as YAML:
```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1sCg==" }
$ cue export --out yaml
```

We can use this new module code just like any other CUE code.

<!-- TODO: show actual file content -->
Here is the output:
```
config:
  appName: alpha
  port: 80
  features:
    logging: true
```
{{< /step >}}

## Publish a "frostytemplate" module

Suppose we want to define a module that encapsulates some
default values for `FrostyApp`. We _could_ just publish it as part of
`frostyconfig` original module, but doing it as a separate module will
be useful to demonstrate how dependencies work, and can also be a useful
separation of concerns when the schema comes from some other source
of truth.
{{< step stepNumber="12" >}}

Create a directory for the new module and initalize it:
```text { title="TERMINAL" codeToCopy="Y2QgLi4KbWtkaXIgZnJvc3R5dGVtcGxhdGUKY2QgZnJvc3R5dGVtcGxhdGUKY3VlIG1vZCBpbml0IGdsYWNpYWwtdGVjaC5jb20vZnJvc3R5dGVtcGxhdGVAdjAK" }
$ cd ..
$ mkdir frostytemplate
$ cd frostytemplate
$ cue mod init glacial-tech.com/frostytemplate@v0
```

This defines another module. We have named it `frostytemplate`
because CUE uses the term "template" to mean code that
defines default values and derived data but is not intended to
be the final configuration.
{{< /step >}}

{{< step stepNumber="13" >}}

Define the CUE template:

```cue { title="frostytemplate/template.cue" }
package frostytemplate

import "glacial-tech.com/frostyconfig@v0"

// Config defines a set of default values for [frostyconfig.#Config].
Config: frostyconfig.#Config & {
	port:  *80 | _
	debug: *false | _
	features: {
		logging:   *true | _
		analytics: *true | _
	}
}
```

As with the `frostyapp` module, we import the schema to constrain
the default values.
{{< /step >}}

{{< step stepNumber="14" >}}
Publish the `frostytemplate` module:

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCB0aWR5CmN1ZSBtb2QgcHVibGlzaCB2MC4wLjEK" }
$ cue mod tidy
$ cue mod publish v0.0.1
```
{{< /step >}}

## Update the `frostyapp` module

{{< step stepNumber="15" >}}

Update the `frostyapp` module to make use of this new template
module:

```cue { title="frostyapp/config.cue" }
package frostyapp

import "glacial-tech.com/frostytemplate@v0"

config: frostytemplate.Config & {
	appName: "alpha"
}
```

The `frostyapp` module now gains the benefit of the new defaults. We can remove some fields
because, although they are required by the configuration, they are provided
by the template.
{{< /step >}}

{{< step stepNumber="16" >}}
Resolve dependencies in `frostyapp`:

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCB0aWR5Cg==" }
$ cue mod tidy
```

Re-running `cue mod tidy` updates the dependencies in `frostyapp` to
use `frostytemplate` too.

Here is what the `cue.mod/module.cue` file looks like now:

<!-- TODO: show actual file content -->
```cue { title="frostyapp/cue.mod/module.cue" }
module: "glacial-tech.com/frostyapp@v0"
deps: {
	"glacial-tech.com/frostyconfig@v0": {
		v: "v0.0.1"
	}
	"glacial-tech.com/frostytemplate@v0": {
		v: "v0.0.1"
	}
}
```

And as a diagram:

{{< mermaid>}}
flowchart TD
    frostyapp--  v0.0.1 --> frostytemplate
    frostytemplate--  v0.0.1 --> frostyconfig
{{< /mermaid >}}
{{< /step >}}

{{< step stepNumber="17" >}}
Render the configuration again:

```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1sCg==" }
$ cue export --out yaml
```

We can see that the values in the configuration reflect the new default values:

<!-- TODO: show actual file content -->
```
config:
  appName: alpha
  port: 80
  debug: false
  features:
    logging: true
    analytics: true
```
{{< /step >}}

## Add a new field to the schema

Suppose that `FrostyApp` has gained the ability to limit the amount of concurrency it uses,
configured with a new `maxConcurrency` field. We will add that to the schema
and update the app to use it.

{{< step stepNumber="18" >}}
Update the schema to add a new `maxConcurrency` field:

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
	// maxConcurrency specifies the maximum amount of
	// concurrent requests to process concurrently.
	maxConcurrency?: int & >=1
	// features holds optional feature settings
	features?: {
		// logging enables or disables logging.
		logging?: bool
		// analytics enables or disables analytics.
		analytics?: bool
	}
}
```

Here we are supposing that the app has gained the ability to limit the amount of concurrency it uses.
We have altered the schema to add a new `maxConcurrency` field - it is otherwise
exactly the same as before.
{{< /step >}}

{{< step stepNumber="19" >}}

Upload a new version of the `frostyconfig` schema:

```text { title="TERMINAL" codeToCopy="Y2QgLi4vZnJvc3R5Y29uZmlnCmN1ZSBtb2QgdGlkeQpjdWUgbW9kIHB1Ymxpc2ggdjAuMS4wCg==" }
$ cd ../frostyconfig
$ cue mod tidy
$ cue mod publish v0.1.0
```

We increment the minor version to signify that a backwardly
compatible feature has been added.
{{< /step >}}

## Update the `frostyapp` module to use the new schema version

{{< step stepNumber="20" >}}

Edit the `cue.mod/module.cue` file to use the new version:
```cue { title="frostyapp/cue.mod/module.cue" }
module: "glacial-tech.com/frostyapp@v0"
deps: {
	"glacial-tech.com/frostyconfig@v0": {
		v: "v0.1.0" // Note: this changed from before.
	}
	"glacial-tech.com/frostytemplate@v0": {
		v: "v0.0.1"
	}
}
```

CUE modules "lock in" the versions of any dependencies, storing
their versions in `cue.mod/module.cue` file. This gives predictability
and dependability, but does mean that our `frostyapp` application
will not use the new schema version until it is explicitly updated to do so.

We do that here by editing the version in the `module.cue` file.
(NOTE: in the future we will be able to do this kind of update
without manually editing the file).

And as a diagram , our dependency graph now looks like this:

{{< mermaid>}}
flowchart TD
    frostyapp--  v0.0.1 --> frostytemplate
    frostyapp--  v0.1.0 --> frostyconfig
    frostytemplate--  v0.0.1 --> frostyconfig
{{< /mermaid >}}
{{< /step >}}

{{< step stepNumber="21" >}}
Check everything still works:

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCB0aWR5CmN1ZSBleHBvcnQgLS1vdXQgeWFtbAo=" }
$ cue mod tidy
$ cue export --out yaml
```

We make sure that it is all OK by running `cue mod tidy`
and looking at the rendered configuration.

So exactly has happened above? Recall that the
`glacial-tech.com/frostytemplate` module remains unchanged: its module
still depends on the original `v0.0.1` version of the schema. By changing
the version at the top level (`frostyapp`), we cause the new version to be
used. In general, for each major version, we will end up with the the most
recent version of all the versions mentioned in all dependencies. That
is, there can be several different major versions of a given module,
but only one minor version.

This is the [MVS algorithm](https://research.swtch.com/vgo-mvs) used by CUE's
dependency resolution.
{{< /step >}}
