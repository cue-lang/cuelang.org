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

<!-- vim_ syntax highlighting hack -->

## Introduction

In this tutorial you will publish a module to the Central Registry and then
create a second module that depends on the first.

## Prerequisites

- **A [GitHub](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github#signing-up-for-a-new-personal-account) account** --
  this will let you authenticate to the Central Registry
  <!-- TODO: reword as&when a GH account isn't a strict requirement -->
- **A GitHub repository called `frostyconfig`** --
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

```text { title="TERMINAL" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.9.0-alpha.1
...
```

## Create the module for the schema code

In this tutorial we will focus on an imaginary application called `FrostyApp`,
which consumes its configuration in YAML format.
You will define the configuration in CUE and use a CUE schema to validate it.
We would like to be able to share the schema between several consumers,
so we will publish it to the Central Registry.

{{< step stepNumber="1" >}}

Create a directory to hold the schema code:
```text { title="TERMINAL" codeToCopy="bWtkaXIgZnJvc3R5Y29uZmlnCmNkIGZyb3N0eWNvbmZpZw==" }
$ mkdir frostyconfig
$ cd frostyconfig
```

{{< /step >}}

{{< step stepNumber="2" >}}

Enable the modules experiment:

```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9FWFBFUklNRU5UPW1vZHVsZXM=" }
$ export CUE_EXPERIMENT=modules
```

{{< /step >}}

---

{{< caution >}}
**You need to adapt the command shown in the next step.**

Don't simply paste the command into your terminal and run it.

Before running the command, replace the example username,
`cueckoo`,
with **the lower-cased form of YOUR GitHub username.**
For example:
if your GitHub username is `_TomHanks`
then you would replace `cueckoo` with `_tomhanks`.

**You need to make this replacement *everywhere* you see
the username `cueckoo` in this tutorial.**
{{< /caution >}}

{{< step stepNumber="3" >}}
Initialize the directory as a module:

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBpbml0IGdpdGh1Yi5jb20vY3VlY2tvby9mcm9zdHljb25maWdAdjA=" }
# Replace "cueckoo" with *your* GitHub username, lower-cased.
$ cue mod init github.com/cueckoo/frostyconfig@v0
```

The GitHub user `cueckoo` controls all the repositories under `github.com/cueckoo/`,
so they can publish modules to the Central Registry inside that namespace.
The same is true for your GitHub username.

{{< /step >}}

{{< step stepNumber="4" >}}

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

{{< /step >}}

{{< step stepNumber="5" >}}

As a one-off, login to the Central Registry:

```text { title="TERMINAL" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```

The Central Registry is in alpha testing -
if you do not yet have access please request it in the
[Slack `#modules` channel](https://join.slack.com/t/cuelang/shared_invite/enQtNzQwODc3NzYzNTA0LTAxNWQwZGU2YWFiOWFiOWQ4MjVjNGQ2ZTNlMmIxODc4MDVjMDg5YmIyOTMyMjQ2MTkzMTU5ZjA1OGE0OGE1NmE)
or via email to
<a href="mailto:contact@cue.works?subject=Joining the Central Registry experiment">contact@cue.works</a>.

{{< /step >}}

{{< step stepNumber="6" >}}

Ensure the `module.cue` file is tidy:
```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

{{< /step >}}

{{< step stepNumber="7" >}}

If you haven't already done so,
[create a repository](https://github.com/new?org=)
called `frostyconfig` under your personal username at GitHub.
It doesn't matter if the repository is public or private.

{{< /step >}}


{{< step stepNumber="8" >}}

Publish the first version of this module:
```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBwdWJsaXNoIHYwLjAuMQ==" }
$ cue mod publish v0.0.1
published github.com/cueckoo/frostyconfig@v0.0.1
```

{{< /step >}}

{{< warning >}}
This command should mention **your** GitHub username,
and should publish the module successfully.

If the command fails with an error message that mentions *your* GitHub username
then you probably haven't created the `frostyconfig` repository under your GitHub username.
Create it, and try the step again.

If the command fails with an error message that mentions `cueckoo/frostyconfig`
then you probably forgot to adapt the command in step 3, above.
Don't worry - this **isn't** a serious problem!

The easiest way to fix this is to delete your `frostyconfig` directory
and restart the tutorial from step 1.
<!-- TODO: link to step 1 when https://cuelang.org/issue/2971 is resolved -->
{{< /warning >}}

## Create a new `frostyapp` module that depends on the first module

Define the `FrostyApp` configuration, constrained by the schema you just
published.

{{< step stepNumber="9" >}}

Create a directory for the new module and initalize it,
changing `cueckoo` to *your* GitHub username, lower-cased:
<!-- Not strictly neccessary, but it might confuse if we don't point it out -->

```text { title="TERMINAL" codeToCopy="bWtkaXIgLi4vZnJvc3R5YXBwCmNkIC4uL2Zyb3N0eWFwcApjdWUgbW9kIGluaXQgZ2l0aHViLmNvbS9jdWVja29vL2Zyb3N0eWFwcEB2MA==" }
$ mkdir ../frostyapp
$ cd ../frostyapp
$ cue mod init github.com/cueckoo/frostyapp@v0
```
{{< /step >}}

{{< step stepNumber="10" >}}

Create the code for the new module:

```cue { title="frostyapp/config.cue" linenos="table" }
package frostyapp

// Adapt this line to your GitHub username, lower-cased.
import "github.com/cueckoo/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
```

**Remember to change `cueckoo` to *your* GitHub username, lower-cased, on line 4.**

{{< /step >}}

{{< step stepNumber="11" >}}

Ensure the module is tidy, adding missing dependencies:
```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

We can see that the dependencies have now been added to the
`cue.mod/module.cue` file:

```text { title="TERMINAL" codeToCopy="Y2F0IGN1ZS5tb2QvbW9kdWxlLmN1ZQ==" }
$ cat cue.mod/module.cue
module: "github.com/cueckoo/frostyapp@v0"
language: {
	version: "v0.9.0-alpha.1"
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

Export the configuration as YAML:
```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" }
$ cue export --out yaml
config:
  appName: alpha
  port: 80
  features:
    logging: true
```

We can use this new module code just like any other CUE code.

{{< /step >}}

<!-- TODO: prompt the reader to delete the authz-related repo from GitHub? -->

## Congratulations!

That's it! You have just created a module and published it to the Central
Registry, and then used the newly published module to check a concrete
configuration held in a different module.

## Related content

- {{< linkto/related/reference "modules" >}}
- {{< linkto/related/tutorial "working-with-a-custom-module-registry" >}}
