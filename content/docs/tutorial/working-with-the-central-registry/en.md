---
title: Working with modules and the Central Registry
authors: [myitcv]
tags: [modules]
toc_hide: true
---

{{{with _script_ "en" "HIDDEN: set up registry access"}}}
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

## Introduction

In this tutorial you will learn how to create and work with CUE modules,
using the [Central Registry](https://registry.cue.works).

Along the way you will:

- Create a module that depends on an existing, well-known module
- Use `cue mod tidy` to automatically add dependencies and their versions to the `module.cue` file

<!--more-->

## Create a module

{{{with step}}}
Initialize a local CUE module. We will not publish this module:

{{{with script "en" "cue mod init"}}}
cue mod init glacial-tech.example/frostyapp@v0
{{{end}}}

We refer to such a module as the main module. Because we won't publish this
module, its module path is not significant. The module path we have chosen makes
this guide consistent with its companion tutorial
{{< linkto/inline "tutorial/working-with-a-custom-module-registry" >}}.
{{{end}}}

{{{with step}}}
Create the code for the new module:

{{{with upload "en" "initial config.cue"}}}
-- config.cue --
package frostyapp

import "github.com/cue-labs/examples/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
{{{end}}}

This imports the `frostyconfig` package first introduced in the tutorial
{{< linkto/inline "tutorial/working-with-a-custom-module-registry" >}}.
Instead of depending on a version of that module published to a custom
registry, we have instead published a version to the Central Registry.
In our local module we define some concrete values for the configuration,
constrained by the `frostyconfig.#Config` schema.
{{{end}}}

{{{with step}}}
Ensure the module is tidy, pulling all dependencies:

{{{with script "en" "initial cue mod tidy"}}}
cue mod tidy
{{{end}}}

If you see an error message mentioning "too many requests" then
[login to the Central Registry](https://cue.dev/docs/login-central-registry/)
and re-run this command.
The Central Registry allows more requests from authenticated users.

We can see that the dependencies have now been added to the `cue.mod/module.cue` file:

{{{with script "en" "first check of module.cue"}}}
cat cue.mod/module.cue
{{{end}}}

{{{end}}}

## Evaluate the configuration

{{{with step}}}
Export the configuration as YAML:

{{{with script "en" "first export"}}}
cue export --out yaml
{{{end}}}

{{{end}}}

## Congratulations!

That's it, you have just created a local module that depends on a well-known
module from the Central Registry!

## Related content

- {{< linkto/related/tutorial "publishing-modules-to-the-central-registry" >}}
- {{< linkto/related/tutorial "working-with-a-custom-module-registry" >}}
- {{< linkto/related/reference "modules" >}}
