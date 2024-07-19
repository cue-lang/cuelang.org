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

{{{with _script_ "en" "cue mod registry"}}}
git config --global user.email 'cueckoo@cue.works'
git config --global user.name cueckoo

# TODO: this is inherently racey. But not a problem in practice...
# for now. When it does become a problem we can solve this properly
# using a nc-based wait loop or similar.
nohup cue mod registry localhost:5000 > /tmp/cue_mod_registry 2>&1 &
{{{end}}}

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

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

## Create the module for the schema code

In this tutorial we will focus on an imaginary application called `FrostyApp`,
which consumes its configuration in YAML format.
You will define the configuration in CUE and use a CUE schema to validate it.
We would like to be able to share the schema between several consumers.

{{{with step}}}

Create a directory to hold the schema code:
{{{with script "en" "create-frostyconfig"}}}
mkdir frostyconfig
cd frostyconfig
{{{end}}}

Each module described in this tutorial will live in a separate directory, which
you will create as they are needed.
{{{end}}}

{{{with step}}}

Initialize the directory as a git repository and a CUE  module:
{{{with script "en" "initialize-frostyconfig-module"}}}
git init -q
cue mod init --source=git glacial-tech.example/frostyconfig@v0
{{{end}}}

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

{{{end}}}

{{< info >}}
Modules are always named with the major version at the end of the module path.
This is independent from the naming restrictions detailed above: the same OCI
repository is used for all major and minor versions of a given module in a
registry.
{{< /info >}}

{{{with step}}}

Create the configuration schema:
{{{with upload "en" "schema-v0.0.1"}}}
-- frostyconfig/config.cue --
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
{{{end}}}

The details of the schema are not too important. For the purposes of this tutorial,
it represents the schema of the configuration data expected by `FrostyApp`.

{{{end}}}

## Choose an OCI registry

{{{with step}}}

If you do not have access to an OCI registry, start one locally:

{{{with script "en" "start-registry"}}}
#norun

cue mod registry localhost:5000
{{{end}}}

`cue mod registry` is a very simple in-memory OCI server.

CUE should work with all OCI-compatible artifact registries, such as
the [Google Artifact Registry](https://cloud.google.com/artifact-registry),
as CUE uses the standard OCI protocols spoken by such registries. For example,
here are some alternatives:

{{{with script "en" "start-registry alternatives"}}}
#norun

# running a local registry via docker
docker run -p 5000:5000 registry

# running a local registry via podman
podman run -p 5000:5000 registry
{{{end}}}

In our example we will run a local instance of the in-memory registry on port 5000.
If you need to run one locally, invoke the above `docker` command in a separate
terminal so the registry remains running while you follow the rest of this
tutorial.
{{{end}}}

## Publish the module

{{{with step}}}

Set up a required environment variable:
{{{with script "en" "init-environ"}}}
export CUE_REGISTRY=localhost:5000/cuemodules
{{{end}}}

The `CUE_REGISTRY` variable tells the `cue` command which
registry to use when fetching and pushing modules.
In our example the modules will be stored in the registry under the prefix `cuemodules`.
In practice you would want this prefix to be some place of your choice -
or you could leave the prefix empty if you plan to dedicate the registry
to holding CUE modules.
{{{end}}}

{{{with step}}}

Ensure the `module.cue` file is tidy:
{{{with script "en" "frostyconfig-v0.0.1-tidy"}}}
cue mod tidy
{{{end}}}
This command checks that modules for all imported packages
are present in the `cue.mod/module.cue` file and that their versions
are correct. It is good practice to run this before publishing
a module. So, although this module does not
have any dependencies, we will run `cue mod tidy` anyway.
{{{end}}}

{{{with step}}}
Create a git commit:

{{{with script "en" "git commit frostyconfig"}}}
git add -A
git commit -q -m 'Initial commit'
{{{end}}}

Earlier, you initialized this module with `--source=git`, which told the `cue`
command that it should publish only those files that `git` knows about. The git
commit you just created leaves the directory in a "clean" state, which is
necessary for `cue` to know exactly which files to include in the published
module.

{{{end}}}

{{{with step}}}

Publish the first version of this module:
{{{with script "en" "frostyconfig-v0.0.1-publish"}}}
#ellipsis 0
cue mod publish v0.0.1
{{{end}}}

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
{{{end}}}

## Create a new `frostyapp` module that depends on the first module

Define the actual `FrostyApp` configuration, constrained by the schema you just
published.

{{{with step}}}

Create a directory and initalize a git repository and a new CUE
module within it:
{{{with script "en" "init-frostyapp"}}}
mkdir ../frostyapp
cd    ../frostyapp
git init -q
cue mod init --source=git glacial-tech.example/frostyapp@v0
{{{end}}}
{{{end}}}

{{{with step}}}

Create the code for the new module:
{{{with upload "en" "config.cue"}}}
-- frostyapp/config.cue --
package frostyapp

import "glacial-tech.example/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
{{{end}}}

This imports the `frostyconfig` package from the first
module you published and
defines some concrete values for the configuration,
constrained by the `frostyconfig.#Config` schema.
{{{end}}}

{{{with step}}}

Ensure the module is tidy, pulling all dependencies:
{{{with script "en" "frostyapp-tidy-1"}}}
cue mod tidy
{{{end}}}

We can see that the dependencies have now been added to the
`cue.mod/module.cue` file:

{{{with script "en" "show frostyapp-tidy-result-1"}}}
cat cue.mod/module.cue
{{{end}}}

Our dependencies currently look like this:
{{< mermaid caption="Current dependencies" >}}
flowchart TD
    frostyapp--  v0.0.1 --> frostyconfig
{{< /mermaid >}}
{{{end}}}

## Evaluate the configuration

{{{with step}}}

Export the configuration as YAML:
{{{with script "en" "frostyapp-export-1"}}}
cue export --out yaml
{{{end}}}

We can use this new module code just like any other CUE code.

{{{end}}}

## Publish a `frostytemplate` module

Suppose we want to define a module that encapsulates some
default values for `FrostyApp`. We _could_ just publish it as part of the
`frostyconfig` original module, but publishing it as a separate module will
be useful to demonstrate how dependencies work. Having different modules like
this can also be a useful separation of concerns when a schema comes from some
other source of truth.

{{{with step}}}

Create a directory and initalize a git repository and a new CUE
module within it:
{{{with script "en" "init-frostytemplate"}}}
mkdir ../frostytemplate
cd    ../frostytemplate
git init -q
cue mod init --source=git glacial-tech.example/frostytemplate@v0
{{{end}}}

This defines another module. We have named it `frostytemplate`
because CUE uses the term "template" to mean code that
defines default values and derived data but is not intended to
be the final configuration.
{{{end}}}

{{{with step}}}

Define the CUE template:
{{{with upload "en" "second-module-to-publish"}}}
-- frostytemplate/template.cue --
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
{{{end}}}

We import the schema to constrain the default values, just as we did with the
`frostyapp` module.
{{{end}}}

{{{with step}}}
Tidy the module and create a git commit:

{{{with script "en" "git commit frostytemplate"}}}
cue mod tidy
git add -A
git commit -q -m 'Initial commit'
{{{end}}}

{{{end}}}

{{{with step}}}

Publish the `frostytemplate` module:
{{{with script "en" "frostytemplate-v0.0.1-publish"}}}
#ellipsis 0
cue mod publish v0.0.1
{{{end}}}
{{{end}}}

## Update the `frostyapp` module

{{{with step}}}

Update the `frostyapp` module to make use of this new template
module:

{{{with script "en" "back to frostyapp to use template"}}}
cd ../frostyapp
{{{end}}}

{{{with upload "en" "update-frostyapp"}}}
#force
-- frostyapp/config.cue --
package frostyapp

import "glacial-tech.example/frostytemplate@v0"

config: frostytemplate.Config & {
	appName: "alpha"
}
{{{end}}}

The `frostyapp` module now gains the benefit of the new defaults. We can remove
some fields because they are now provided by the template, satisfying the
requirements of the configuration.
{{{end}}}

{{{with step}}}

Resolve dependencies in `frostyapp`:
{{{with script "en" "frostyapp-tidy-2"}}}
cue mod tidy
{{{end}}}

Re-running `cue mod tidy` updates the dependencies in `frostyapp` to
use `frostytemplate` as well as `frostyconfig`.

Here is what the `cue.mod/module.cue` file now looks like:

{{{with script "en" "show frostyapp-tidy-result-2"}}}
cat cue.mod/module.cue
{{{end}}}

{{< mermaid caption="Current dependencies" >}}
flowchart TD
    frostyapp--  v0.0.1 --> frostytemplate
    frostytemplate--  v0.0.1 --> frostyconfig
{{< /mermaid >}}
{{{end}}}

{{{with step}}}

Re-render the configuration as YAML:
{{{with script "en" "rerender-config"}}}
cue export --out yaml
{{{end}}}

We can see that the values in the configuration reflect the new default values.

{{{end}}}

## Add a new field to the schema

Suppose that `FrostyApp` has gained the ability to limit the amount of
concurrency it uses, configured with a new `maxConcurrency` field.
We will add that field to the schema and update the app to use it.

{{{with step}}}

Update the schema to add a new `maxConcurrency` field:
{{{with script "en" "return to schema to add maxConcurrency field"}}}
cd ../frostyconfig
{{{end}}}

{{{with upload "en" "schema-v0.1.0"}}}
#force
-- frostyconfig/config.cue --
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
{{{end}}}

The schema is unchanged except for the new `maxConcurrency` field.
{{{end}}}

{{{with step}}}
Tidy the module and create a git commit:

{{{with script "en" "git commit frostyconfig 2"}}}
cue mod tidy
git add -A
git commit -q -m 'Second commit'
{{{end}}}

{{{end}}}

{{{with step}}}

Upload a new version of the `frostyconfig` schema:
{{{with script "en" "upload-schema2"}}}
#ellipsis 0
cue mod publish v0.1.0
{{{end}}}

We incremented the minor version to signify that a backwardly
compatible feature has been added.
{{{end}}}

## Update the `frostyapp` module to use the new schema version

{{{with step}}}

Use the new version of `glacial-tech.example/frostyconfig@v0`:

{{{with script "en" "return to app to use updated schema"}}}
cd ../frostyapp
{{{end}}}

{{{with script "en" "bump-dependency-version"}}}
cue mod get glacial-tech.example/frostyconfig@v0.1.0
{{{end}}}

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
{{{end}}}

{{< info >}}
Here, you updated the version in the `module.cue` file manually, but in the
future the `cue` command will be able to perform this kind of update.
{{< /info >}}

{{{with step}}}

Check that everything still works and that your configuration is still valid:
{{{with script "en" "check-update-ok"}}}
cue mod tidy
cue export --out yaml
{{{end}}}

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
{{{end}}}

## Related content

- {{< linkto/related/tutorial "working-with-the-central-registry" >}}
- {{< linkto/related/tutorial "publishing-modules-to-the-central-registry" >}}
- {{< linkto/related/reference "modules" >}}
