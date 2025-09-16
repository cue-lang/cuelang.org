---
title: Working with modules and the Central Registry
authors: [myitcv]
tags: [modules]
toc_hide: true
---

## Introduction

In this tutorial you will learn how to create and work with CUE modules,
using the [Central Registry](https://registry.cue.works).

Along the way you will:

- Create a module that depends on an existing, well-known module
- Use `cue mod tidy` to automatically add dependencies and their versions to the `module.cue` file

<!--more-->

## Create a module

[**:material-chevron-right-circle-outline: Step 1**](#step-1){id="step-1"}: Initialize a local CUE module. We will not publish this module:

```` { .text title="TERMINAL" data-copy="cue mod init glacial-tech.example/frostyapp@v0" }
$ cue mod init glacial-tech.example/frostyapp@v0
````

We refer to such a module as the main module. Because we won't publish this
module, its module path is not significant. The module path we have chosen makes
this guide consistent with its companion tutorial
{{< linkto/inline "tutorial/working-with-a-custom-module-registry" >}}.

---


[**:material-chevron-right-circle-outline: Step 2**](#step-2){id="step-2"}: Create the code for the new module:

```` { .cue title="config.cue" }
package frostyapp

import "github.com/cue-labs/examples/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
````

This imports the `frostyconfig` package first introduced in the tutorial
{{< linkto/inline "tutorial/working-with-a-custom-module-registry" >}}.
Instead of depending on a version of that module published to a custom
registry, we have instead published a version to the Central Registry.
In our local module we define some concrete values for the configuration,
constrained by the `frostyconfig.#Config` schema.

---


[**:material-chevron-right-circle-outline: Step 3**](#step-3){id="step-3"}: Ensure the module is tidy, pulling all dependencies:

```` { .text title="TERMINAL" data-copy="cue mod tidy" }
$ cue mod tidy
````

If you see an error message mentioning "too many requests" then
[login to the Central Registry](https://cue.dev/docs/login-central-registry/)
and re-run this command.
The Central Registry allows more requests from authenticated users.

We can see that the dependencies have now been added to the `cue.mod/module.cue` file:

```` { .text title="TERMINAL" data-copy="cat cue.mod/module.cue" }
$ cat cue.mod/module.cue
module: "glacial-tech.example/frostyapp@v0"
language: {
	version: "v0.14.1"
}
deps: {
	"github.com/cue-labs/examples/frostyconfig@v0": {
		v: "v0.0.1"
	}
}
````


---


## Evaluate the configuration

[**:material-chevron-right-circle-outline: Step 4**](#step-4){id="step-4"}: Export the configuration as YAML:

```` { .text title="TERMINAL" data-copy="cue export --out yaml" }
$ cue export --out yaml
config:
  appName: alpha
  port: 80
  features:
    logging: true
````


---


## Congratulations!

That's it, you have just created a local module that depends on a well-known
module from the Central Registry!

## Related content

- {{< linkto/related/tutorial "publishing-modules-to-the-central-registry" >}}
- {{< linkto/related/tutorial "working-with-a-custom-module-registry" >}}
- {{< linkto/related/reference "modules" >}}
