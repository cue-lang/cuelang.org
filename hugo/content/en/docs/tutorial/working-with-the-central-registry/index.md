---
title: Working with modules and the Central Registry
authors:
- myitcv
tags:
- modules
- tooling
- cue command
toc_hide: true
---

## Introduction

In this tutorial you will learn how to create and work with CUE modules,
using the [Central Registry](https://registry.cue.works).

Along the way you will:

- Login to the Central Registry, and authenticate the `cue` command
- Create a module that depends on an existing, well-known module
- Use `cue mod tidy` to automatically add dependencies and their versions to the `module.cue` file

{{< info >}}
This tutorial describes an experimental feature. All details are subject to change.
{{< /info >}}

Note that this guide depends on a pre-release version of CUE:

```text { title="TERMINAL" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.9.0-alpha.4
...
```

## Enable the modules experiment

```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9FWFBFUklNRU5UPW1vZHVsZXM=" }
$ export CUE_EXPERIMENT=modules
```

Discussion [#2939](https://github.com/cue-lang/cue/discussions/2939) introduces
v3 of the proposal to introduce modules and dependency management for CUE. The
[v0.8.0](https://github.com/cue-lang/cue/releases/tag/v0.8.0) release included
experimental support for modules that implements part of that proposal. If we
accept #2939, then modules and package management will become a first-class
citizen of CUE. Until then, we need to set the `CUE_EXPERIMENT` environment
variable.

## Login to the Central Registry

{{< step stepNumber="1" >}}
Visit https://registry.cue.works and login via GitHub.
{{< /step >}}

{{< info >}}
If you would like to be one of the early testers of the Central Registry, please
get in touch via the [`#modules` channel on
Slack](https://join.slack.com/t/cuelang/shared_invite/enQtNzQwODc3NzYzNTA0LTAxNWQwZGU2YWFiOWFiOWQ4MjVjNGQ2ZTNlMmIxODc4MDVjMDg5YmIyOTMyMjQ2MTkzMTU5ZjA1OGE0OGE1NmE)
or by <a href="mailto:contact@cue.works?subject=Joining the Central Registry experiment">emailing us</a>.
{{< /info >}}

## Authenticate the `cue` command

{{< step stepNumber="2" >}}

Authenticate the `cue` command (a one-off process):

```text { title="TERMINAL" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```

{{< /step >}}

## Create a module

{{< step stepNumber="3" >}}

Initialize a local CUE module. We will not publish this module:

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBpbml0IGdsYWNpYWwtdGVjaC5leGFtcGxlL2Zyb3N0eWFwcEB2MA==" }
$ cue mod init glacial-tech.example/frostyapp@v0
```

We refer to such a module as the main module. Because we won't publish this
module, its module path is not significant. The module path we have chosen makes
this guide consistent with the companion tutorial on [working with a custom registry]({{<
relref "docs/tutorial/working-with-a-custom-module-registry" >}}).

{{< /step >}}

{{< step stepNumber="4" >}}

Create the code for the new module:

```cue { title="config.cue" }
package frostyapp

import "github.com/cue-labs/examples/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
```

This imports the `frostyconfig` package first introduced in the tutorial on
[working with a custom registry]({{< relref
"docs/tutorial/working-with-a-custom-module-registry" >}}). Instead of depending
on a version of that module published to a custom registry, we have instead
published a version to the Central Registry. In our local module we define some
concrete values for the configuration, constrained by the `frostyconfig.#Config`
schema.

{{< /step >}}

{{< step stepNumber="5" >}}

Ensure the module is tidy, pulling all dependencies:
```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

We can see that the dependencies have now been added to the `cue.mod/module.cue` file:

```text { title="TERMINAL" codeToCopy="Y2F0IGN1ZS5tb2QvbW9kdWxlLmN1ZQ==" }
$ cat cue.mod/module.cue
module: "glacial-tech.example/frostyapp@v0"
language: {
	version: "v0.9.0"
}
deps: {
	"github.com/cue-labs/examples/frostyconfig@v0": {
		v: "v0.0.1"
	}
}
```

{{< /step >}}

## Evaluate the configuration

{{< step stepNumber="6" >}}

Export the configuration as YAML:


```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" }
$ cue export --out yaml
config:
  appName: alpha
  port: 80
  features:
    logging: true
```

{{< /step >}}

## Congratulations!

That's it, you have just created a local module that depends on a well-known
module from the Central Registry!

## Related content

- {{< linkto/related/reference "modules" >}}
