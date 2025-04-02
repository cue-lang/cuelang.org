---
title: Publishing modules to the Central Registry
---

## Introduction

In this tutorial you will
publish a configuration module to the Central Registry (`frostyconfig`),
and then create a application module that depends on it (`frostyapp`).

## Prerequisites

- **A [GitHub](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github#signing-up-for-a-new-personal-account) account** --
  this will let you authenticate to the Central Registry,
  which is required when publishing modules
- **A GitHub repository called `frostyconfig`** --
  create it as a public or private repo in your personal GitHub account
- **A [Central Registry](https://registry.cue.works/) account**
- **The `cue` command**
  [[install guide](/docs/installing-cue/)]
- **Some awareness of CUE schemas** --
  cuelang.org's pages on
  [Constraints](https://cuelang.org/docs/tour/basics/constraints)
  and
  [Definitions](https://cuelang.org/docs/tour/basics/definitions)
  are a good refresher

This tutorial demonstrates the following version of the `cue` command:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.13.0-alpha.3
...
```

## Create the module for the schema code

In this tutorial we will focus on an imaginary application called `FrostyApp`,
which consumes its configuration in YAML format.
You will define the configuration in CUE and use a CUE schema to validate it.
We would like to be able to share the schema between several consumers,
so we will publish it to the Central Registry.

### Create a directory to hold the schema code

```text { title="TERMINAL" type="terminal" codeToCopy="bWtkaXIgZnJvc3R5Y29uZmlnCmNkIGZyb3N0eWNvbmZpZw==" }
$ mkdir frostyconfig
$ cd frostyconfig
```

### Adapt the commands and code in this tutorial

You **must** adapt the command shown in the next step, and throughout this
page. Don't simply paste the commands into your terminal and run them! For each
command that contains the example username `cueckoo`, replace
`cueckoo` with the lower-cased form of YOUR GitHub username.

For example: if your GitHub username is `_TomHanks` then you would replace
`cueckoo` with `_tomhanks` each time.

**You need to make this replacement *everywhere* you see the username
`cueckoo`** - both in commands and in code.

### Initialize the directory

The `frostyconfig` directory
needs to be set up as both a git repository and a CUE module:
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGluaXQgLXEKY3VlIG1vZCBpbml0IC0tc291cmNlPWdpdCBnaXRodWIuY29tL2N1ZWNrb28vZnJvc3R5Y29uZmlnQHYw" }
$ git init -q

# Replace "cueckoo" with *your* GitHub username, lower-cased.
$ cue mod init --source=git github.com/cueckoo/frostyconfig@v0
```

The `--source=git` flag tells `cue` to use the same file-inclusion rules as
`git` when publishing this module.

The GitHub user `cueckoo` controls all the repositories under
`github.com/cueckoo/`, so the Central Registry allows that user to
publish modules inside that namespace. The same is true for your GitHub
username and its namespace.

### Create the configuration schema

Place this CUE in the file `frostyconfig/config.cue`:

```cue { title="frostyconfig/config.cue" codeToCopy="cGFja2FnZSBmcm9zdHljb25maWcKCi8vICNDb25maWcgZGVmaW5lcyB0aGUgc2NoZW1hIGZvciB0aGUgRnJvc3R5QXBwIGNvbmZpZ3VyYXRpb24uCiNDb25maWc6IHsKCS8vIGFwcE5hbWUgZGVmaW5lcyB0aGUgbmFtZSBvZiB0aGUgYXBwbGljYXRpb24uCglhcHBOYW1lITogc3RyaW5nCgkvLyBwb3J0IGhvbGRzIHRoZSBwb3J0IG51bWJlciB0aGUgYXBwbGljYXRpb24gbGlzdGVucyBvbi4KCXBvcnQhOiBpbnQKCS8vIGRlYnVnIGhvbGRzIHdoZXRoZXIgdG8gZW5hYmxlIGRlYnVnIG1vZGUuCglkZWJ1Zz86IGJvb2wKCS8vIGZlYXR1cmVzIGhvbGRzIG9wdGlvbmFsIGZlYXR1cmUgc2V0dGluZ3MKCWZlYXR1cmVzPzogewoJCS8vIGxvZ2dpbmcgZW5hYmxlcyBvciBkaXNhYmxlcyBsb2dnaW5nLgoJCWxvZ2dpbmc/OiBib29sCgkJLy8gYW5hbHl0aWNzIGVuYWJsZXMgb3IgZGlzYWJsZXMgYW5hbHl0aWNzLgoJCWFuYWx5dGljcz86IGJvb2wKCX0KfQo=" }
// filepath: frostyconfig/config.cue

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

### Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```

The Central Registry requires authentication to publish modules, but you only
need to login once on any computer.

### Tidy your CUE module
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

Tidying a CUE module manages the module's dependencies for you.

### Create a GitHub repository

If you haven't already done so,
[create a repository](https://github.com/new?org=)
called `frostyconfig` under your personal username at GitHub.
It doesn't matter if the repository is public or private.

### Create a git commit

```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGFkZCAtQQpnaXQgY29tbWl0IC1xIC1tICdJbml0aWFsIGNvbW1pdCc=" }
$ git add -A
$ git commit -q -m 'Initial commit'
```

Earlier, you initialized this module with `--source=git`, which told the `cue`
command that it should publish only those files that `git` knows about. The git
commit you just created leaves the directory in a "clean" state, which is
necessary for `cue` to know exactly which files to include in the published
module.

### Publish the module

Publish the first version of this module:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBwdWJsaXNoIHYwLjAuMQ==" }
$ cue mod publish v0.0.1
...
```

The output from this command should mention **your** GitHub username,
and should publish the module successfully.

- If the command fails with an error message that mentions *your* GitHub
  username then you probably haven't created the `frostyconfig`
  repository under your GitHub username. Create it, and try the step again.

- If the command fails with an error message that mentions
  `cueckoo/frostyconfig` then you probably forgot to adapt the
  command in [Initialize the directory](#initialize-the-directory), above.
  - Don't worry - this **isn't** a serious problem!
  - The easiest way to fix this is to delete your `frostyconfig`
    directory and restart the tutorial from the beginning.

## Create a new `frostyapp` module that depends on the first module

Next we'll define the `FrostyApp` configuration, which will be constrained by
the schema you just published.

### Create a directory to hold the application code

Create a directory for the new module and initalize it,
changing `cueckoo` to *your* GitHub username, lower-cased:
```text { title="TERMINAL" type="terminal" codeToCopy="bWtkaXIgLi4vZnJvc3R5YXBwCmNkIC4uL2Zyb3N0eWFwcApnaXQgaW5pdCAtcQpjdWUgbW9kIGluaXQgLS1zb3VyY2U9Z2l0IGdpdGh1Yi5jb20vY3VlY2tvby9mcm9zdHlhcHBAdjA=" }
$ mkdir ../frostyapp
$ cd ../frostyapp
$ git init -q
$ cue mod init --source=git github.com/cueckoo/frostyapp@v0
```

### Create the application configuration

Create the CUE for the new module in the file
`frostyapp/config.cue`, adapting the highlighted line to *your* GitHub
username, lower-cased:

```cue { title="frostyapp/config.cue" codeToCopy="cGFja2FnZSBmcm9zdHlhcHAKCi8vIEFkYXB0IHRoaXMgbGluZSB0byB5b3VyIEdpdEh1YiB1c2VybmFtZSwgbG93ZXItY2FzZWQuCmltcG9ydCAiZ2l0aHViLmNvbS9jdWVja29vL2Zyb3N0eWNvbmZpZ0B2MCIKCmNvbmZpZzogZnJvc3R5Y29uZmlnLiNDb25maWcgJiB7CglhcHBOYW1lOiAiYWxwaGEiCglwb3J0OiAgICA4MAoJZmVhdHVyZXM6IGxvZ2dpbmc6IHRydWUKfQo=" hl_lines=6 }
// filepath: frostyapp/config.cue

package frostyapp

// Adapt this line to your GitHub username, lower-cased.
import "github.com/cueckoo/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
```

### Tidy the module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

We can see that the dependencies have been added to the
`cue.mod/module.cue` file:
```text { title="TERMINAL" type="terminal" codeToCopy="Y2F0IGN1ZS5tb2QvbW9kdWxlLmN1ZQ==" }
$ cat cue.mod/module.cue
module: "github.com/cueckoo/frostyapp@v0"
language: {
	version: "v0.13.0"
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

## Evaluate the configuration

Export the configuration as YAML:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" }
$ cue export --out yaml
config:
  appName: alpha
  port: 80
  features:
    logging: true
```

You can use this new module code just like any other CUE code.

## Well done!

That's it - you've just created a module and published it to the
[Central Registry](/products/central-registry/),
and then used the newly published module to check a concrete
configuration held in a different module.

The Central Registry already contains a rich set of schemas and curated content
you can use without needing to publish any modules. Get started with
[the Schema Library](/getting-started/schema-library/) ...
