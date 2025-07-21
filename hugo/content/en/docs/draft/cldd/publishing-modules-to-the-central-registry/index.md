---
note: This YAML header is only here to satisfy both Hugo and MkDocs.
---

# Publishing modules to the Central Registry

## Introduction

In this tutorial you will publish a module to the Central Registry and then
create a second module that depends on the first.

## Prerequisites

- **A [GitHub](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github#signing-up-for-a-new-personal-account) account** --
  this will let you authenticate to the Central Registry
  <!-- TODO: reword as&when a GH account isn't a strict requirement -->
- **A GitHub repository called `frostyconfig`** --
  create it under your personal GitHub account (it doesn't matter if it is public or private)
- **A [Central Registry](https://registry.cue.works/) account**
- **The `cue` binary** --
  follow the [installation instructions](../installing-cue.md)
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

This tutorial is written using the following version of `cue`:

``` { .text title="TERMINAL" data-copy="cue version" }
$ cue version
cue version v0.13.2
...
```

## Create the module for the schema code

In this tutorial we will focus on an imaginary application called `FrostyApp`,
which consumes its configuration in YAML format.
You will define the configuration in CUE and use a CUE schema to validate it.
We would like to be able to share the schema between several consumers,
so we will publish it to the Central Registry.

{{< step stepNumber="1" >}}
Create a directory to hold the schema code

``` { .text title="TERMINAL" data-copy="mkdir frostyconfig&#10;cd frostyconfig" }
$ mkdir frostyconfig
$ cd frostyconfig
```
{{< /step >}}

{{< step stepNumber="2" >}}
Initialize the directory as a git repository and a CUE module

!!! warning "You *must* adapt the command shown in this step!"

    Don't simply paste the command into your terminal and run it.

    Before running the command, replace the example username,
    `cueckoo`,
    with **the lower-cased form of YOUR GitHub username.**
    For example:
    if your GitHub username is `_TomHanks`
    then you would replace `cueckoo` with `_tomhanks`.

    **You need to make this replacement *everywhere* you see
    the username `cueckoo` in this tutorial.**

``` { .text title="TERMINAL" data-copy="git init -q&#10;cue mod init --source=git github.com/cueckoo/frostyconfig@v0" }
$ git init -q

# Replace "cueckoo" with *your* GitHub username, lower-cased.
$ cue mod init --source=git github.com/cueckoo/frostyconfig@v0
```

The `--source=git` flag tells `cue` to use the same file-inclusion rules as
`git`, when publishing this module.

The GitHub user `cueckoo` controls all the repositories under
`github.com/cueckoo/`, so they can publish modules to the Central
Registry inside that namespace.  The same is true for your GitHub username.
{{< /step >}}

{{< step stepNumber="3" >}}
Create the configuration schema

``` { .cue title="frostyconfig/config.cue" }
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

{{< step stepNumber="4" >}}
Login to the Central Registry

``` { .text title="TERMINAL" data-copy="cue login" }
$ cue login
```

This is only required once for each computer that accesses the Central Registry.

!!! info "The Central Registry is in beta testing"
    Please give us your feedback about the service in the `#modules` channels on
    [Slack](/s/slack) and [Discord](/s/discord).

{{< /step >}}

{{< step stepNumber="5" >}}
Ensure the module is tidy

``` { .text title="TERMINAL" data-copy="cue mod tidy" }
$ cue mod tidy
```
{{< /step >}}

{{< step stepNumber="6" >}}
Create a GitHub repository

If you haven't already done so,
[create a repository](https://github.com/new?org=)
called `frostyconfig` under your personal username at GitHub.
It doesn't matter if the repository is public or private.
{{< /step >}}

{{< step stepNumber="7" >}}
Create a git commit

``` { .text title="TERMINAL" data-copy="git add -A&#10;git commit -q -m &#39;Initial commit&#39;" }
$ git add -A
$ git commit -q -m 'Initial commit'
```

Earlier, you initialized this module with `--source=git`, which told the `cue`
command that it should publish only those files that `git` knows about. The git
commit you just created leaves the directory in a "clean" state, which is
necessary for `cue` to know exactly which files to include in the published
module.
{{< /step >}}

{{< step stepNumber="8" >}}
Publish the first version of this module

``` { .text title="TERMINAL" data-copy="cue mod publish v0.0.1" }
$ cue mod publish v0.0.1
...
```

!!! success

    The output from this command should mention **your** GitHub username,
    and should publish the module successfully.

    If the command fails with an error message that mentions *your* GitHub username
    then you probably haven't created the `frostyconfig` repository under your GitHub username.
    Create it, and try the step again.

    If the command fails with an error message that mentions `cueckoo/frostyconfig`
    then you probably forgot to adapt the command in step 3, above.
    Don't worry - this **isn't** a serious problem!

    The easiest way to fix this is to delete your `frostyconfig` directory
    and restart the tutorial from step 1.

{{< /step >}}

## Create a new `frostyapp` module that depends on the first module

Define the `FrostyApp` configuration, constrained by the schema you just
published.

{{< step stepNumber="9" >}}
Create a directory for the `frostyapp` module

Create a directory for the new module and initalize it,
changing `cueckoo` to *your* GitHub username, lower-cased:
<!-- Not strictly neccessary, but it might confuse if we don't point it out -->

``` { .text title="TERMINAL" data-copy="mkdir ../frostyapp&#10;cd ../frostyapp&#10;git init -q&#10;cue mod init --source=git github.com/cueckoo/frostyapp@v0" }
$ mkdir ../frostyapp
$ cd ../frostyapp
$ git init -q
$ cue mod init --source=git github.com/cueckoo/frostyapp@v0
```
{{< /step >}}

{{< step stepNumber="10" >}}
Create the code for the new module

!!! info "Make sure to change `cueckoo` to *your* GitHub username, lower-cased, on the highlighted line."

``` { .cue title="frostyapp/config.cue" hl_lines="4" }
package frostyapp

// Adapt this line to your GitHub username, lower-cased.
import "github.com/cueckoo/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
```
{{< /step >}}

{{< step stepNumber="11" >}}
Ensure the module is tidy

Tidy the module and add any missing dependencies:

``` { .text title="TERMINAL" data-copy="cue mod tidy" }
$ cue mod tidy
```

We can see that the dependencies have now been added to the
`cue.mod/module.cue` file:

``` { .text title="TERMINAL" data-copy="cat cue.mod/module.cue" }
$ cat cue.mod/module.cue
module: "github.com/cueckoo/frostyapp@v0"
language: {
	version: "v0.13.2"
}
source: {
	kind: "git"
}
deps: {
	"github.com/cueckoo/frostyconfig@v0": {
		v: "v0.0.1"
	}
}
```
{{< /step >}}

## Evaluate the configuration

{{< step stepNumber="12" >}}
Export the configuration as YAML

``` { .text title="TERMINAL" data-copy="cue export --out yaml" }
$ cue export --out yaml
config:
  appName: alpha
  port: 80
  features:
    logging: true
```

We can use this new module code just like any other CUE code.
{{< /step >}}

## Module published successfully!

Well done - you've finished!
You have just created a module and published it to the Central
Registry, and then used the newly published module to check a concrete
configuration held in a different module.
