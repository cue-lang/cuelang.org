---
title: Publishing modules to the Central Registry
---

{{{with _script_ "en" "HIDDEN: setup"}}}
git config --global user.email '{{{.githubUser}}}@cue.works'
git config --global user.name {{{.githubUser}}}

mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_COLLABORATOR_RW}","token_type":"Bearer"}}}
EOD

# Opt in to CUE prerelease, for consistency with other CLDD pages.
export PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH
{{{end}}}

## Introduction

In this tutorial you will
publish a configuration module to the
[Central Registry](/products/central-registry/) (`{{{.module1Repo}}}`),
and then create an application module that depends on it (`frostyapp`).

## Prerequisites

- **A [GitHub](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github#signing-up-for-a-new-personal-account) account** --
  this allows you to authenticate with the Central Registry,
  which is required when publishing modules
- **A GitHub repository called `{{{.module1Repo}}}`** --
  create it as a public or private repo in your personal GitHub account
- **The `cue` command**
  [[install guide](/docs/installing-cue/)]
- **Some awareness of CUE schemas** --
  cuelang.org's pages on
  [Constraints](https://cuelang.org/docs/tour/basics/constraints)
  and
  [Definitions](https://cuelang.org/docs/tour/basics/definitions)
  are a good refresher

This tutorial demonstrates the following version of the `cue` command:

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

### Create a directory to hold the schema code

{{{with script "en" "create-module-1"}}}
mkdir {{{.module1Repo}}}
cd {{{.module1Repo}}}
{{{end}}}

### Adapt the commands and code in this tutorial

You **must** adapt the command shown in the next step, and throughout this
page. Don't simply paste the commands into your terminal and run them! For each
command that contains the example username `{{{.githubUser}}}`, replace
`{{{.githubUser}}}` with the lower-cased form of YOUR GitHub username.

For example: if your GitHub username is `_TomHanks` then you would replace
`{{{.githubUser}}}` with `_tomhanks`.

**You need to make this replacement *everywhere* you see the username
`{{{.githubUser}}}`** - in commands and in code.

### Initialize the directory

The `{{{.module1Repo}}}` directory
needs to be set up as both a git repository and a CUE module:
{{{with script "en" "initialize-module-1"}}}
git init -q

# Replace "{{{.githubUser}}}" with *your* GitHub username, lower-cased.
cue mod init --source=git {{{.MODULE1}}}@v0
{{{end}}}

The `--source=git` flag tells `cue` to use the same file-inclusion rules as
`git` when publishing this module.

The GitHub user `{{{.githubUser}}}` controls all the repositories under
`github.com/{{{.githubUser}}}/`, so the Central Registry allows that user to
publish modules inside that namespace. The same is true for your GitHub
username and its namespace.

### Create the configuration schema

Place this CUE in the file `{{{.module1Repo}}}/config.cue`:

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

### Login to the Central Registry

{{{with script "en" "#norun cue login"}}}
#norun
cue login
{{{end}}}

The Central Registry requires authentication to publish modules, but you only
need to login once on any computer.

### Tidy your CUE module
{{{with script "en" "module-1-v0.0.1-tidy"}}}
cue mod tidy
{{{end}}}

Tidying a CUE module manages the module's dependencies for you.

### Create a GitHub repository

If you haven't already done so,
[create a repository](https://github.com/new?org=)
called `{{{.module1Repo}}}` under your personal username at GitHub.
It doesn't matter if the repository is public or private.

### Create a git commit

{{{with script "en" "git commit"}}}
git add -A
git commit -q -m 'Initial commit'
{{{end}}}

Earlier, you initialized this module with `--source=git`, which told the `cue`
command that it should publish only those files that `git` knows about. The git
commit you just created leaves the directory in a "clean" state, which is
necessary for `cue` to know exactly which files to include in the published
module.

### Publish the module

Publish the first version of this module:
{{{with script "en" "module-1-v0.0.1-publish"}}}
#ellipsis 0
cue mod publish v0.0.1
{{{end}}}

The output from this command should mention **your** GitHub username,
and should publish the module successfully.

- If the command fails with an error message that mentions *your* GitHub
  username then you probably haven't created the `{{{.module1Repo}}}`
  repository under your GitHub username. Create it, and try the step again.

- If the command fails with an error message that mentions
  `{{{.githubUser}}}/{{{.module1Repo}}}` then you probably forgot to adapt the
  command in [Initialize the directory](#initialize-the-directory), above.
  - Don't worry - this **isn't** a serious problem!
  - The easiest way to fix this is to delete your `{{{.module1Repo}}}`
    directory and restart the tutorial from the beginning.

## Create a new `frostyapp` module that depends on the first module

Next we'll define the `FrostyApp` configuration, which will be constrained by
the schema you just published.

### Create a directory to hold the application code

Create a directory for the new module and initalize it,
changing `{{{.githubUser}}}` to *your* GitHub username, lower-cased:
{{{with script "en" "init-frostyapp"}}}
mkdir ../frostyapp
cd    ../frostyapp
git init -q
cue mod init --source=git {{{.MODULE2}}}@v0
{{{end}}}

### Create the application configuration

Create the CUE for the new module in the file
`frostyapp/config.cue`, adapting the highlighted line to *your* GitHub
username, lower-cased:

{{{with upload "en" "config.cue"}}}
#codetab(frostyapp/config.cue) hl_lines=6
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

### Tidy the module

{{{with script "en" "frostyapp-tidy-1"}}}
cue mod tidy
{{{end}}}

We can see that the dependencies have been added to the
`cue.mod/module.cue` file:
{{{with script "en" "show frostyapp-tidy-result-1"}}}
cat cue.mod/module.cue
{{{end}}}

## Evaluate the configuration

Export the configuration as YAML:
{{{with script "en" "frostyapp-export-1"}}}
cue export --out yaml
{{{end}}}

You can use this new module code just like any other CUE code.

## Well done!

That's it - you've just created a module and published it to the
[Central Registry](/products/central-registry/),
and then used the newly published module to check a concrete
configuration held in a different module.

The Central Registry already contains a rich set of schemas and curated content
you can use without needing to publish any modules. Get started with
[the Schema Library](/getting-started/schema-library/) ...
