---
title: Working with a private module registry
authors:
- rogpeppe
---
## Introduction

This tutorial describes how to push modules to a private OCI artifact registry
and how to consume modules from such a registry.

{{{with step}}}
## Create the code that's going to live in the module

Suppose we have an application that requires some configuration data.
Let's call it "FrostyApp". We can write the configuration schema in CUE, but we'd like to share it
between several consumers.

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
{{{end}}}
{{{with step}}}

## Define it as a module

In order to publish to a registry, the code must hold a `cue.mod/module.cue`
file declaring its module path. This is the path that the module will be imported as.
Although we're going to use a private registry here, so there are less
restrictions on what module paths you can use, module paths are fully domain-name
qualified and it's good practice to place the module under a domain that you control
or under a github repository that you own. For this example, we'll assume that
we control the github organization "myorg".

Due to OCI registry naming restrictions, there are some other constraints on
the names you can choose for a module:
- it must contain only lower-case ASCII letters, ASCII digits, dots (U+002E), and dashes (U+002D)
- see [TODO](xxx) for full details

Note: modules are always named with the major version at the end of
the module path.

{{{with script "en" "mod-init"}}}
#norun
cd frostyconfig
cue mod init github.com/glacial-tech/frostyconfig@v0
{{{end}}}
{{{end}}}

{{{with step}}}
## Choose a registry to publish the module to

Most OCI registries are sufficient here, as the CUE tool uses the standard protocols.
For this example, we'll just run a local instance of the docker registry on port 5000.
You'll want to do this in a separate terminal so the docker instance remains running
while you run the rest of the commands in the tutorial.

{{{with script "en" "run-docker"}}}
#norun
docker run -p 5000:5000 registry
{{{end}}}
{{{end}}}

{{{with step}}}
## Publish the module

First we'll need to set up the appropriate environment variables.
The `CUE_EXPERIMENT` variable is necessary because the
modules registry support is currently considered to be in its
experimental phase.

All the modules will be stored in the registry under the prefix `cuemodules`.
In practice you'll want this prefix to be some place of your choice,
or you could leave it empty if you don't plan to use the registry
for any other purpose at the same time.

Before the module is published, it's good practice to run `cue mod tidy`.
This makes sure that all the dependencies are correct and listed
in the `cue.mod/module.cue` file. Although this module doesn't
have any dependencies, we'll run `cue mod tidy` anyway.

Then we publish the module: it'll be published to the module
path we chose in `cue init` earlier - all we need to do here
is decide on the version. The version follows [semver syntax](https://semver.org),
and it's to follow semantic version conventions too - that is
to maintain compatability with earlier minor versions of the
same module.

Note that the major version of the version it's published as
must match the major version specified in the module file.
For example it would be an error to use `v1.0.1` here
because the module name ends in `@v0`.

{{{with script "en" "publish"}}}
#norun
export CUE_EXPERIMENT=modules
export CUE_REGISTRY=localhost:5000/cuemodules
cue mod tidy
cue publish v0.0.1
{{{end}}}

At this point, module has been published to the registry (you might have seen some output
in the terminal window running docker as it did so).
{{{end}}}

{{{with step}}}
## Use the module

Now that the module is present in the registry, we can use it.
Let's say we want to create an actual configuration that conforms
to the `frostyconfig.#Config` schema.

{{{with upload "en" "config.cue"}}}
-- frostyapp/config.cue --
package frostyapp

import "github.com/glacial-tech/frostyapp@v0"

config: frostyapp.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
{{{end}}}

We'll make it into a module by creating a `cue.mod/module.cue` file.
This could also be done by invoking `cue mod init` as above.

{{{with upload "en" "module.cue"}}}
-- frostyapp/cue.mod/module.cue --
module: "github.com/glacial-tech/frostyapp@v0"
{{{end}}}

The environment variables we set up before will also work
for consuming modules, so we won't do that again,
but before the code can be used,
we need to set up all the dependencies. We can use `cue mod tidy` for that.

{{{with script "en" "tidy"}}}
#norun
cd ../frostyapp
cue mod tidy
{{{end}}}

We can see that the dependencies have been added to the
`cue.mod/module.cue` file now:

```
TODO how best to show this?
```
{{{end}}}

{{{with step}}}
## Use the module

We can use the code just like any other CUE code.

{{{with script "en" "use-code"}}}
#norun
cue vet -c
cue export --out yaml .
{{{end}}}
{{{end}}}

{{{with step}}}
## Publish another module

Let's say we want to publish a module that builds on our original
schema by providing some default values for the configuration.
This is often known in CUE as a "template".
We will publish that as another module (of course, we _could_
just publish it as part of the original module, but doing it this way
will be useful to demonstrate how dependencies work.

Let's define this new module:

{{{with upload "en" "second-module-to-publish"}}}
-- frostytemplate/template.cue --
package myconfig

import "github.com/glacial-tech/frostyapp@v0"

// Config defines a set of default values for [frostyapp.#Config].
Config: myrepo.#Config & {
	port:  *80 | _
	debug: *false | _
	features: {
		logging:   *true | _
		analytics: *true | _
	}
}
{{{end}}}

We can publish this similarly to the way we did before:

{{{with script "en" "publish-template"}}}
#norun
cd ../frostytemplate
cue mod tidy
cue publish v0.0.1
{{{end}}}
{{{end}}}

{{{with step}}}
## Update the `frostyapp` module

Now let's update the `frostyapp` configuration to make use of this new template
module and gain the benefit of the new defaults. We can remove some fields
now because, although they're required by the configuration, they're provided
by the template.

{{{with upload "en" "update-frostyapp"}}}
-- frostyapp/config.cue --
package frostyapp

import "github.com/glacial-tech/frostytemplate@v0"

config: frostytemplate.Config & {
	appName: "alpha"
}
{{{end}}}

{{{with script "en" "update-frostyapp-deps"}}}
#norun
cue mod tidy
cue export .
{{{end}}}
{{{end}}}

{{{with step}}}
## Change the schema

Let's say the app gains the ability to limit the amount of concurrency it uses.
This requires a new field, so we need to add that to the schema. Here's
the updated schema.

{{{with upload "en" "schema-v0.0.2"}}}
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

We can upload that as a new version:

{{{with script "en" "upload-schema2"}}}
#norun
cd ../frostyconfig
cue mod tidy
cue mod publish v0.0.2
{{{end}}}
{{{end}}}

{{{with step}}}
## Update the `frostyapp` module to use the new schema version

CUE modules "lock in" the versions of any dependencies, storing
their versions in `cue.mod/module.cue` file. This gives predictability
and dependability, but does mean that our `frostyapp` application
won't use the new schema version until it's explicitly updated to do so.

We can do that by editing the version in the `module.cue` file.
(NOTE: in the future we will be able to do this kind of update
without manually editing the file).

{{{with upload "en" "edit-dependency-version"}}}
-- frostyapp/cue.mod/module.cue --
module: "github.com/glacial-tech/frostyapp@v0"

// TODO use more realistic contents for this file
deps: "github.com/glacial-tech/frostyconfig@v0": v: "v0.0.2"
{{{end}}}

We can make sure that it's all OK by running `cue mod tidy`
and looking at the rendered configuration:

{{{with script "en" "check-update-ok"}}}
#norun
cue mod tidy
cue export --out yaml
{{{end}}}

So exactly has happened above? Recall that the `github.com/glacial/frostytemplate`
module remains unchanged: its module still depends on the original `v0.0.1` version of
the schema. By changing the version at the top level (`frostyapp`), we cause the
new version to be used. In general, for each major version, we'll end up with the the most recent version of all the versions mentioned in all dependencies. That is, there can be several different major
versions of a given module, but only one minor version.

This is the [MVS algorithm](xxxx) used by CUE's
dependency resolution.
{{{end}}}
