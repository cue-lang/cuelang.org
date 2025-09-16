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

In this tutorial you will learn how to create and work with CUE modules,
using a custom module registry.

Along the way you will:

- Define a module containing a CUE schema
- Push the module to a custom registry
- Define a top level module that depends on the first module
- Use `cue mod tidy` to automatically add dependencies and their versions to the `module.cue` file
- Publish a module containing a CUE template that depends on the schema
- Update the top level module to depend on the template
- Update the schema and its version, and update the top level module to depend on the new version

<!--more-->

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

```` { .text title="TERMINAL" data-copy="cue version" }
$ cue version
cue version v0.14.1
...
````

## Create the module for the schema code

In this tutorial we will focus on an imaginary application called `FrostyApp`,
which consumes its configuration in YAML format.
You will define the configuration in CUE and use a CUE schema to validate it.
We would like to be able to share the schema between several consumers.

[**:material-chevron-right-circle-outline: Step 1**](#step-1){id="step-1"}: Create a directory to hold the schema code:
```` { .text title="TERMINAL" data-copy="mkdir frostyconfig&#10;cd frostyconfig" }
$ mkdir frostyconfig
$ cd frostyconfig
````

Each module described in this tutorial will live in a separate directory, which
you will create as they are needed.

---


[**:material-chevron-right-circle-outline: Step 2**](#step-2){id="step-2"}: Initialize the directory as a git repository and a CUE  module:
```` { .text title="TERMINAL" data-copy="git init -q&#10;cue mod init --source=git glacial-tech.example/frostyconfig@v0" }
$ git init -q
$ cue mod init --source=git glacial-tech.example/frostyconfig@v0
````

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
we control the domain name `glacial-tech.example`
and place all module paths under that.

There are some other constraints on the names
that can be used for a module, due to OCI restrictions.
The module name must contain only
lower-case ASCII letters, ASCII digits, dots (`.`), and dashes (`-`).
The
[OCI distribution spec](https://github.com/opencontainers/distribution-spec/blob/main/spec.md#pulling-manifests)
contains full details of the naming restrictions.

The `--source=git` flag tells `cue` to use the same file-inclusion rules as
`git`, when publishing this module.


---


{{< info >}}
Modules are always named with the major version at the end of the module path.
This is independent from the naming restrictions detailed above: the same OCI
repository is used for all major and minor versions of a given module in a
registry.
{{< /info >}}

[**:material-chevron-right-circle-outline: Step 3**](#step-3){id="step-3"}: Create the configuration schema:
```` { .cue title="frostyconfig/config.cue" }
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
````

The details of the schema are not too important. For the purposes of this tutorial,
it represents the schema of the configuration data expected by `FrostyApp`.


---


## Choose an OCI registry

[**:material-chevron-right-circle-outline: Step 4**](#step-4){id="step-4"}: If you do not have access to an OCI registry, start one locally:

```` { .text title="TERMINAL" data-copy="cue mod registry localhost:5001" }
$ cue mod registry localhost:5001
````

`cue mod registry` is a very simple in-memory OCI server.
If this command fails with a message mentioning "address already in use",
then some other program on your computer is already using port 5001.
To resolve this, select a different port number and re-run the command using the new value.
**You will also need to update any commands that use port 5001 as you follow this guide.**

CUE should work with all OCI-compatible artifact registries, such as
the [Google Artifact Registry](https://cloud.google.com/artifact-registry),
as CUE uses the standard OCI protocols spoken by such registries. For example,
here are some alternatives:

```` { .text title="TERMINAL" data-copy="docker run -p 5001:5000 registry&#10;podman run -p 5001:5000 registry" }
# running a local registry via docker
$ docker run -p 5001:5000 registry

# running a local registry via podman
$ podman run -p 5001:5000 registry
````

In our example we will run a local instance of the in-memory registry on port 5001.
If you need to run one locally, invoke the above `docker` command in a separate
terminal so the registry remains running while you follow the rest of this
tutorial.

---


## Publish the module

[**:material-chevron-right-circle-outline: Step 5**](#step-5){id="step-5"}: Set up a required environment variable:
```` { .text title="TERMINAL" data-copy="export CUE_REGISTRY=localhost:5001/cuemodules" }
$ export CUE_REGISTRY=localhost:5001/cuemodules
````

The `CUE_REGISTRY` variable tells the `cue` command which
registry to use when fetching and pushing modules.
In our example the modules will be stored in the registry under the prefix `cuemodules`.
In practice you would want this prefix to be some place of your choice -
or you could leave the prefix empty if you plan to dedicate the registry
to holding CUE modules.

---


[**:material-chevron-right-circle-outline: Step 6**](#step-6){id="step-6"}: Ensure the `module.cue` file is tidy:
```` { .text title="TERMINAL" data-copy="cue mod tidy" }
$ cue mod tidy
````
This command checks that modules for all imported packages
are present in the `cue.mod/module.cue` file and that their versions
are correct. It is good practice to run this before publishing
a module. So, although this module does not
have any dependencies, we will run `cue mod tidy` anyway.

---


[**:material-chevron-right-circle-outline: Step 7**](#step-7){id="step-7"}: Create a git commit:

```` { .text title="TERMINAL" data-copy="git add -A&#10;git commit -q -m &#39;Initial commit&#39;" }
$ git add -A
$ git commit -q -m 'Initial commit'
````

Earlier, you initialized this module with `--source=git`, which told the `cue`
command that it should publish only those files that `git` knows about. The git
commit you just created leaves the directory in a "clean" state, which is
necessary for `cue` to know exactly which files to include in the published
module.


---


[**:material-chevron-right-circle-outline: Step 8**](#step-8){id="step-8"}: Publish the first version of this module:
```` { .text title="TERMINAL" data-copy="cue mod publish v0.0.1" }
$ cue mod publish v0.0.1
...
````

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

---


## Create a new `frostyapp` module that depends on the first module

Define the actual `FrostyApp` configuration, constrained by the schema you just
published.

[**:material-chevron-right-circle-outline: Step 9**](#step-9){id="step-9"}: Create a directory and initalize a git repository and a new CUE
module within it:
```` { .text title="TERMINAL" data-copy="mkdir ../frostyapp&#10;cd ../frostyapp&#10;git init -q&#10;cue mod init --source=git glacial-tech.example/frostyapp@v0" }
$ mkdir ../frostyapp
$ cd ../frostyapp
$ git init -q
$ cue mod init --source=git glacial-tech.example/frostyapp@v0
````

---


[**:material-chevron-right-circle-outline: Step 10**](#step-10){id="step-10"}: Create the code for the new module:
```` { .cue title="frostyapp/config.cue" }
package frostyapp

import "glacial-tech.example/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
````

This imports the `frostyconfig` package from the first
module you published and
defines some concrete values for the configuration,
constrained by the `frostyconfig.#Config` schema.

---


[**:material-chevron-right-circle-outline: Step 11**](#step-11){id="step-11"}: Ensure the module is tidy, pulling all dependencies:
```` { .text title="TERMINAL" data-copy="cue mod tidy" }
$ cue mod tidy
````

We can see that the dependencies have now been added to the
`cue.mod/module.cue` file:

```` { .text title="TERMINAL" data-copy="cat cue.mod/module.cue" }
$ cat cue.mod/module.cue
module: "glacial-tech.example/frostyapp@v0"
language: {
	version: "v0.14.1"
}
source: {
	kind: "git"
}
deps: {
	"glacial-tech.example/frostyconfig@v0": {
		v: "v0.0.1"
	}
}
````

Our dependencies currently look like this:
{{< mermaid caption="Current dependencies" >}}
flowchart TD
    frostyapp--  v0.0.1 --> frostyconfig
{{< /mermaid >}}

---


## Evaluate the configuration

[**:material-chevron-right-circle-outline: Step 12**](#step-12){id="step-12"}: Export the configuration as YAML:
```` { .text title="TERMINAL" data-copy="cue export --out yaml" }
$ cue export --out yaml
config:
  appName: alpha
  port: 80
  features:
    logging: true
````

We can use this new module code just like any other CUE code.


---


## Publish a `frostytemplate` module

Suppose we want to define a module that encapsulates some
default values for `FrostyApp`. We _could_ just publish it as part of the
`frostyconfig` original module, but publishing it as a separate module will
be useful to demonstrate how dependencies work. Having different modules like
this can also be a useful separation of concerns when a schema comes from some
other source of truth.

[**:material-chevron-right-circle-outline: Step 13**](#step-13){id="step-13"}: Create a directory and initalize a git repository and a new CUE
module within it:
```` { .text title="TERMINAL" data-copy="mkdir ../frostytemplate&#10;cd ../frostytemplate&#10;git init -q&#10;cue mod init --source=git glacial-tech.example/frostytemplate@v0" }
$ mkdir ../frostytemplate
$ cd ../frostytemplate
$ git init -q
$ cue mod init --source=git glacial-tech.example/frostytemplate@v0
````

This defines another module. We have named it `frostytemplate`
because CUE uses the term "template" to mean code that
defines default values and derived data but is not intended to
be the final configuration.

---


[**:material-chevron-right-circle-outline: Step 14**](#step-14){id="step-14"}: Define the CUE template:
```` { .cue title="frostytemplate/template.cue" }
package frostytemplate

import "glacial-tech.example/frostyconfig@v0"

// Config defines a set of default values for frostyconfig.#Config.
Config: frostyconfig.#Config & {
	port:  *80 | _
	debug: *false | _
	features: {
		logging:   *true | _
		analytics: *true | _
	}
}
````

We import the schema to constrain the default values, just as we did with the
`frostyapp` module.

---


[**:material-chevron-right-circle-outline: Step 15**](#step-15){id="step-15"}: Tidy the module and create a git commit:

```` { .text title="TERMINAL" data-copy="cue mod tidy&#10;git add -A&#10;git commit -q -m &#39;Initial commit&#39;" }
$ cue mod tidy
$ git add -A
$ git commit -q -m 'Initial commit'
````


---


[**:material-chevron-right-circle-outline: Step 16**](#step-16){id="step-16"}: Publish the `frostytemplate` module:
```` { .text title="TERMINAL" data-copy="cue mod publish v0.0.1" }
$ cue mod publish v0.0.1
...
````

---


## Update the `frostyapp` module

[**:material-chevron-right-circle-outline: Step 17**](#step-17){id="step-17"}: Update the `frostyapp` module to make use of this new template
module:

```` { .text title="TERMINAL" data-copy="cd ../frostyapp" }
$ cd ../frostyapp
````

```` { .cue title="frostyapp/config.cue" }
package frostyapp

import "glacial-tech.example/frostytemplate@v0"

config: frostytemplate.Config & {
	appName: "alpha"
}
````

The `frostyapp` module now gains the benefit of the new defaults. We can remove
some fields because they are now provided by the template, satisfying the
requirements of the configuration.

---


[**:material-chevron-right-circle-outline: Step 18**](#step-18){id="step-18"}: Resolve dependencies in `frostyapp`:
```` { .text title="TERMINAL" data-copy="cue mod tidy" }
$ cue mod tidy
````

Re-running `cue mod tidy` updates the dependencies in `frostyapp` to
use `frostytemplate` as well as `frostyconfig`.

Here is what the `cue.mod/module.cue` file now looks like:

```` { .text title="TERMINAL" data-copy="cat cue.mod/module.cue" }
$ cat cue.mod/module.cue
module: "glacial-tech.example/frostyapp@v0"
language: {
	version: "v0.14.1"
}
source: {
	kind: "git"
}
deps: {
	"glacial-tech.example/frostyconfig@v0": {
		v: "v0.0.1"
	}
	"glacial-tech.example/frostytemplate@v0": {
		v: "v0.0.1"
	}
}
````

{{< mermaid caption="Current dependencies" >}}
flowchart TD
    frostyapp--  v0.0.1 --> frostytemplate
    frostytemplate--  v0.0.1 --> frostyconfig
{{< /mermaid >}}

---


[**:material-chevron-right-circle-outline: Step 19**](#step-19){id="step-19"}: Re-render the configuration as YAML:
```` { .text title="TERMINAL" data-copy="cue export --out yaml" }
$ cue export --out yaml
config:
  appName: alpha
  port: 80
  debug: false
  features:
    logging: true
    analytics: true
````

We can see that the values in the configuration reflect the new default values.


---


## Add a new field to the schema

Suppose that `FrostyApp` has gained the ability to limit the amount of
concurrency it uses, configured with a new `maxConcurrency` field.
We will add that field to the schema and update the app to use it.

[**:material-chevron-right-circle-outline: Step 20**](#step-20){id="step-20"}: Update the schema to add a new `maxConcurrency` field:
```` { .text title="TERMINAL" data-copy="cd ../frostyconfig" }
$ cd ../frostyconfig
````

```` { .cue title="frostyconfig/config.cue" }
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
````

The schema is unchanged except for the new `maxConcurrency` field.

---


[**:material-chevron-right-circle-outline: Step 21**](#step-21){id="step-21"}: Tidy the module and create a git commit:

```` { .text title="TERMINAL" data-copy="cue mod tidy&#10;git add -A&#10;git commit -q -m &#39;Second commit&#39;" }
$ cue mod tidy
$ git add -A
$ git commit -q -m 'Second commit'
````


---


[**:material-chevron-right-circle-outline: Step 22**](#step-22){id="step-22"}: Upload a new version of the `frostyconfig` schema:
```` { .text title="TERMINAL" data-copy="cue mod publish v0.1.0" }
$ cue mod publish v0.1.0
...
````

We incremented the minor version to signify that a backwardly
compatible feature has been added.

---


## Update the `frostyapp` module to use the new schema version

[**:material-chevron-right-circle-outline: Step 23**](#step-23){id="step-23"}: Use the new version of `glacial-tech.example/frostyconfig@v0`:

```` { .text title="TERMINAL" data-copy="cd ../frostyapp" }
$ cd ../frostyapp
````

```` { .text title="TERMINAL" data-copy="cue mod get glacial-tech.example/frostyconfig@v0.1.0" }
$ cue mod get glacial-tech.example/frostyconfig@v0.1.0
````

CUE modules "lock in" the versions of any dependencies, storing
their versions in `cue.mod/module.cue` file. This gives predictability
and dependability but does mean that our `frostyapp` application
will not use the new schema version until it is explicitly updated to do so.

{{< mermaid caption="Current dependencies" >}}
flowchart TD
    frostyapp--  v0.0.1 --> frostytemplate
    frostyapp--  v0.1.0 --> frostyconfig
    frostytemplate--  v0.0.1 --> frostyconfig
{{< /mermaid >}}

---


{{< info >}}
Here, you updated the version in the `module.cue` file manually, but in the
future the `cue` command will be able to perform this kind of update.
{{< /info >}}

[**:material-chevron-right-circle-outline: Step 24**](#step-24){id="step-24"}: Check that everything still works and that your configuration is still valid:
```` { .text title="TERMINAL" data-copy="cue mod tidy&#10;cue export --out yaml" }
$ cue mod tidy
$ cue export --out yaml
config:
  appName: alpha
  port: 80
  debug: false
  features:
    logging: true
    analytics: true
````

So exactly what happened above?

Recall that the `glacial-tech.example/frostytemplate` module remains unchanged:
its module still depends on the original `v0.0.1` version of the schema. By
changing the version at the top level (`frostyapp`), you caused the new version
to be used.

In general, we will end up with the the most recent version of all the major
versions mentioned in all dependencies. Put another way, there can be several
different major versions of a given module, but only one minor version. This is
the [MVS algorithm](https://research.swtch.com/vgo-mvs) used by CUE's
dependency resolution.

---


## Related content

- {{< linkto/related/tutorial "working-with-the-central-registry" >}}
- {{< linkto/related/tutorial "publishing-modules-to-the-central-registry" >}}
- {{< linkto/related/reference "modules" >}}
