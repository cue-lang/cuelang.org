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

{{{with _script "en" "use prelrelease"}}}
export PATH="/cues/prerelease:$PATH"
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_COLLABORATOR_RW}","token_type":"Bearer"}}}
EOD
{{{end}}}

## Introduction

In this tutorial you will publish a module to the Central Registry, and then
create a second module that depends on the first.

## Prerequisites

- A [GitHub](https://github.com) account.
- A Central Registry account. _The Central Registry is in alpha testing. If you
  do not yet have access please request access via the `#modules` channel in
  [Slack](https://join.slack.com/t/cuelang/shared_invite/enQtNzQwODc3NzYzNTA0LTAxNWQwZGU2YWFiOWFiOWQ4MjVjNGQ2ZTNlMmIxODc4MDVjMDg5YmIyOTMyMjQ2MTkzMTU5ZjA1OGE0OGE1NmE)
  or via <a href="mailto:contact@cue.works?subject=Joining the Central Registry
  experiment">contact@cue.works</a>._
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

This tutorial is written using the following version of `cue`:

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

{{{end}}}

{{{with step}}}

Enable the modules experiment:

{{{with script "en" "init-environ"}}}
export CUE_EXPERIMENT=modules
{{{end}}}

{{{end}}}

{{{with step}}}

Initialize the directory as a module. Replace `cueckoo` with your GitHub
username in this and following steps:

{{{with script "en" "initialize-frostyconfig-module"}}}
cue mod init {{{.MODULE1}}}@v0
{{{end}}}

Because we are writing this guide from the perspective of the GitHub user
`cueckoo`, and because each GitHub user controls the repositories that live in
their personal namespace (e.g. `github.com/cueckoo`), we know that our `cueckoo`
user controls `{{{.MODULE1}}}` and can publish modules to the Central Registry
in that namespace.

{{{end}}}

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

{{{end}}}

{{{with step}}}

As a one-off, login to the Central Registry:

{{{with script "en" "#norun cue login"}}}
#norun
cue login
{{{end}}}

{{{end}}}

{{< info >}}
The Central Registry is in alpha testing. If you do not yet have access please
request access via the `#modules` channel in
[Slack](https://join.slack.com/t/cuelang/shared_invite/enQtNzQwODc3NzYzNTA0LTAxNWQwZGU2YWFiOWFiOWQ4MjVjNGQ2ZTNlMmIxODc4MDVjMDg5YmIyOTMyMjQ2MTkzMTU5ZjA1OGE0OGE1NmE)
or via <a href="mailto:contact@cue.works?subject=Joining the Central Registry
experiment">contact@cue.works</a>.
{{< /info >}}


{{{with step}}}

Ensure the `module.cue` file is tidy:
{{{with script "en" "frostyconfig-v0.0.1-tidy"}}}
cue mod tidy
{{{end}}}

{{{end}}}

{{{with step}}}

Publish the first version of this module:
{{{with script "en" "frostyconfig-v0.0.1-publish"}}}
cue mod publish v0.0.1
{{{end}}}

{{{end}}}

## Create a new `frostyapp` module that depends on the first module

Define the `FrostyApp` configuration, constrained by the schema you just
published.

{{{with step}}}

Create a directory for the new module and initalize it:
{{{with script "en" "init-frostyapp"}}}
mkdir ../frostyapp
cd    ../frostyapp
cue mod init {{{.MODULE2}}}@v0
{{{end}}}
{{{end}}}

{{{with step}}}

Create the code for the new module:
{{{with upload "en" "config.cue"}}}
-- frostyapp/config.cue --
package frostyapp

import "{{{.MODULE1}}}@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
{{{end}}}

{{{end}}}

{{{with step}}}

Ensure the module is tidy, adding missing dependencies:
{{{with script "en" "frostyapp-tidy-1"}}}
cue mod tidy
{{{end}}}

We can see that the dependencies have now been added to the
`cue.mod/module.cue` file:

{{{with script "en" "show frostyapp-tidy-result-1"}}}
cat cue.mod/module.cue
{{{end}}}

{{{end}}}

## Evaluate the configuration

{{{with step}}}

Export the configuration as YAML:
{{{with script "en" "frostyapp-export-1"}}}
cue export --out yaml
{{{end}}}

We can use this new module code just like any other CUE code.

{{{end}}}

## Congratulations!

That's it! You have just created a module and published it to the Central
Registry, and then used the newly published module to check a concrete
configuration held in a different module.

## Related content

- {{< linkto/related/reference "modules" >}}
- {{< linkto/related/tutorial "working-with-a-custom-module-registry" >}}
