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

{{{with _script_ "en" "use prelrelease"}}}
git config --global user.email '{{{.githubUser}}}@cue.works'
git config --global user.name {{{.githubUser}}}

mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_COLLABORATOR_RW}","token_type":"Bearer"}}}
EOD
{{{end}}}
<!-- vim_ syntax highlighting hack -->

## Introduction

In this tutorial you will publish a module to the Central Registry and then
create a second module that depends on the first.

## Prerequisites

- **A [GitHub](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github#signing-up-for-a-new-personal-account) account** --
  this will let you authenticate to the Central Registry
  <!-- TODO: reword as&when a GH account isn't a strict requirement -->
- **A GitHub repository called `{{{.module1Repo}}}`** --
  create it under your personal GitHub account (it doesn't matter if it is public or private)
- **A [Central Registry](https://registry.cue.works/) account** --
  the Central Registry is in alpha testing: if you do not yet have access
  please request it in the
  [Slack `#modules` channel](https://join.slack.com/t/cuelang/shared_invite/enQtNzQwODc3NzYzNTA0LTAxNWQwZGU2YWFiOWFiOWQ4MjVjNGQ2ZTNlMmIxODc4MDVjMDg5YmIyOTMyMjQ2MTkzMTU5ZjA1OGE0OGE1NmE)
  or via email to
  <a href="mailto:contact@cue.works?subject=Joining the Central Registry experiment">contact@cue.works</a>
- **The `cue` binary** --
  follow the [installation instructions]({{< relref "/docs/introduction/installation" >}})
  if you don't already use `cue`
- **A tool to edit text files** --
  any text editor you have will be fine, such as
  [VSCode](https://code.visualstudio.com/),
  [Notepad](https://apps.microsoft.com/detail/9msmlrh6lzf3), or
  [Vim](https://www.vim.org/download.php)
- **A command terminal** --
  `cue` works on all platforms, so you can use any Linux or macOS terminal,
  or a Windows terminal such as PowerShell, cmd, or
  [WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
  to run commands.
- **Some awareness of CUE schemata** --
  the language tour's pages on
  [Constraints]({{< relref "/docs/tour/basics/constraints" >}}) and
  [Definitions]({{< relref "/docs/tour/basics/definitions" >}}) are a good refresher

This tutorial is written using the following version of `cue`:

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

## Create the module for the schema code

In this tutorial we will focus on an imaginary application called `FrostyApp`,
which consumes its configuration in YAML format.
You will define the configuration in CUE and use a CUE schema to validate it.
We would like to be able to share the schema between several consumers,
so we will publish it to the Central Registry.

{{{with step}}}

Create a directory to hold the schema code:
{{{with script "en" "create-module-1"}}}
mkdir {{{.module1Repo}}}
cd {{{.module1Repo}}}
{{{end}}}

{{{end}}}

{{< caution >}}
**You need to adapt the command shown in the next step.**

Don't simply paste the command into your terminal and run it.

Before running the command, replace the example username,
`{{{.githubUser}}}`,
with **the lower-cased form of YOUR GitHub username.**
For example:
if your GitHub username is `_TomHanks`
then you would replace `{{{.githubUser}}}` with `_tomhanks`.

**You need to make this replacement *everywhere* you see
the username `{{{.githubUser}}}` in this tutorial.**
{{< /caution >}}

{{{with step}}}
Initialize the directory as a git repository and a CUE module:

{{{with script "en" "initialize-module-1"}}}
git init -q

# Replace "{{{.githubUser}}}" with *your* GitHub username, lower-cased.
cue mod init --source=git {{{.MODULE1}}}@v0
{{{end}}}

The `--source=git` flag tells `cue` to use the same file-inclusion rules as
`git`, when publishing this module.

The GitHub user `{{{.githubUser}}}` controls all the repositories under
`github.com/{{{.githubUser}}}/`, so they can publish modules to the Central
Registry inside that namespace.  The same is true for your GitHub username.

{{{end}}}

{{{with step}}}

Create the configuration schema:
{{{with upload "en" "schema-v0.0.1"}}}
-- {{{.module1Repo}}}/config.cue --
package {{{.module1Repo}}}

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

The Central Registry is in alpha testing -
if you do not yet have access please request it in the
[Slack `#modules` channel](https://join.slack.com/t/cuelang/shared_invite/enQtNzQwODc3NzYzNTA0LTAxNWQwZGU2YWFiOWFiOWQ4MjVjNGQ2ZTNlMmIxODc4MDVjMDg5YmIyOTMyMjQ2MTkzMTU5ZjA1OGE0OGE1NmE)
or via email to
<a href="mailto:contact@cue.works?subject=Joining the Central Registry experiment">contact@cue.works</a>.

{{{end}}}

{{{with step}}}

Ensure the `module.cue` file is tidy:
{{{with script "en" "module-1-v0.0.1-tidy"}}}
cue mod tidy
{{{end}}}

{{{end}}}

{{{with step}}}

If you haven't already done so,
[create a repository](https://github.com/new?org=)
called `{{{.module1Repo}}}` under your personal username at GitHub.
It doesn't matter if the repository is public or private.

{{{end}}}

{{{with step}}}
Create a git commit:

{{{with script "en" "git commit"}}}
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
{{{with script "en" "module-1-v0.0.1-publish"}}}
#ellipsis 0
cue mod publish v0.0.1
{{{end}}}

{{{end}}}

{{< warning >}}
This command should mention **your** GitHub username,
and should publish the module successfully.

If the command fails with an error message that mentions *your* GitHub username
then you probably haven't created the `{{{.module1Repo}}}` repository under your GitHub username.
Create it, and try the step again.

If the command fails with an error message that mentions `{{{.githubUser}}}/{{{.module1Repo}}}`
then you probably forgot to adapt the command in step 3, above.
Don't worry - this **isn't** a serious problem!

The easiest way to fix this is to delete your `{{{.module1Repo}}}` directory
and restart the tutorial from step 1.
<!-- TODO: link to step 1 when https://cuelang.org/issue/2971 is resolved -->
{{< /warning >}}

## Create a new `frostyapp` module that depends on the first module

Define the `FrostyApp` configuration, constrained by the schema you just
published.

{{{with step}}}

Create a directory for the new module and initalize it,
changing `{{{.githubUser}}}` to *your* GitHub username, lower-cased:
<!-- Not strictly neccessary, but it might confuse if we don't point it out -->

{{{with script "en" "init-frostyapp"}}}
mkdir ../frostyapp
cd    ../frostyapp
git init -q
cue mod init --source=git {{{.MODULE2}}}@v0
{{{end}}}
{{{end}}}

{{{with step}}}

Create the code for the new module:

{{{with upload "en" "config.cue"}}}
#codetab(frostyapp/config.cue) linenos="table"
-- frostyapp/config.cue --
package frostyapp

// Adapt this line to your GitHub username, lower-cased.
import "{{{.MODULE1}}}@v0"

config: {{{.module1Repo}}}.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
{{{end}}}

**Remember to change `{{{.githubUser}}}` to *your* GitHub username, lower-cased, on line 4.**

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

<!-- TODO: prompt the reader to delete the authz-related repo from GitHub? -->

## Congratulations!

That's it! You have just created a module and published it to the Central
Registry, and then used the newly published module to check a concrete
configuration held in a different module.

## Related content

- {{< linkto/related/tutorial "working-with-the-central-registry" >}}
- {{< linkto/related/tutorial "working-with-a-custom-module-registry" >}}
- {{< linkto/related/reference "modules" >}}
