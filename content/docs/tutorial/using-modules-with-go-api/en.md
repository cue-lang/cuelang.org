---
title: Using modules with the Go API
authors:
- myitcv
tags:
- modules
- tooling
toc_hide: true
---

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

{{{with _script_ "en" "setup auth"}}}
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

## Introduction

In this tutorial you will learn how to use CUE's Go API to work with CUE
modules, using a dependency from the [Central
Registry](https://registry.cue.works).

Along the way you will:

- Login to the Central Registry, and authenticate the `cue` command
- Create a module that depends on an existing, well-known module
- Use `cue mod tidy` to automatically add dependencies and their versions to the `module.cue` file
- Load that same CUE using the Go API, in a modules-aware mode

{{< info >}}
This tutorial describes an experimental feature. All details are subject to change.
{{< /info >}}

## Prerequisites

- **Access to the Central Registry**. Get started with [working with the Central
  Registry]({{< relref "docs/tutorial/working-with-the-central-registry" >}}),
  and ensure you have run `cue login`.
- **A tool to edit text files**. Any text editor you have will be fine, for
  example [VSCode](https://code.visualstudio.com/).
- **A command terminal**. `cue` works on all platforms, so any terminal on Linux
  or macOS, and on PowerShell, `cmd.exe` or
  [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) in Windows.

Note that this guide depends on a pre-release version of CUE:

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}


{{{with step}}}
Enable the modules experiment:

{{{with script "en" "enable modules"}}}
export CUE_EXPERIMENT=modules
{{{end}}}
{{{end}}}

## Authenticate the `cue` command

{{{with step}}}

Authenticate the `cue` command (a one-off process):

{{{with script "en" "#norun cue login"}}}
#norun
cue login
{{{end}}}

In this tutorial, we use `cue` to first check that our CUE is valid, before
trying to load that same CUE using the Go API.

{{{end}}}

## Create a module

{{{with step}}}

Initialize a local CUE module. We will not publish this module:

{{{with script "en" "cue mod init"}}}
cue mod init glacial-tech.example/frostyapp@v0
{{{end}}}

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

This imports the `frostyconfig` package first introduced in the tutorial on
[working with a custom registry]({{< relref
"docs/tutorial/working-with-a-custom-module-registry" >}}). Instead of depending
on a version of that module published to a custom registry, we have instead
published a version to the Central Registry. In our local module we define some
concrete values for the configuration, constrained by the `frostyconfig.#Config`
schema.

{{{end}}}

{{{with step}}}

Ensure the module is tidy, pulling all dependencies:
{{{with script "en" "initial cue mod tidy"}}}
cue mod tidy
{{{end}}}

{{{end}}}

## Evaluate the configuration

{{{with step}}}

Export the configuration as YAML:

{{{with script "en" "first export"}}}
cue export --out yaml
{{{end}}}

At this stage we know the CUE is valid and can be evaluated against a dependency
that lives in the Central Registry.

{{{end}}}

## Create a Go module and program

{{{with _script_ "en" "unset CUE_EXPERIMENT"}}}
unset CUE_EXPERIMENT
{{{end}}}

{{{with step}}}
Initialize a Go module to contain your program:

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init glacial-tech.example/frostyapp
{{{end}}}

{{{end}}}

{{{with step}}}
Write a Go program to load the CUE and print a message based on the `output`
field:

{{{with upload "en" "initial go code"}}}
-- main.go --
package main

import (
	"fmt"
	"log"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/mod/modconfig"
)

func main() {
	ctx := cuecontext.New()

	// Create a registry client. Passing a nil config
	// will give us client that behaves like the cue command.
	reg, err := modconfig.NewRegistry(nil)
	if err != nil {
		log.Fatal(err)
	}

	// Load the package "example" from the current directory.
	// We don't need to specify a config in this example.
	insts := load.Instances([]string{"."}, &load.Config{
		Registry: reg,
	})

	// The current directory just has one file without any build tags,
	// and that file belongs to the example package.
	// So we get a single instance as a result.
	v := ctx.BuildInstance(insts[0])
	if err := v.Err(); err != nil {
		log.Fatal(err)
	}

	// Lookup the 'config' field and print it out
	config := v.LookupPath(cue.ParsePath("config"))
	fmt.Println(config)
}
{{{end}}}

{{{end}}}

{{{with step}}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

{{{with script "en" "go test"}}}
#ellipsis 0
go get cuelang.org/go@$CUELANG_CUE_LATEST
#ellipsis 0
go mod tidy
{{{end}}}

You can use `@latest` in place of a specified version.

{{{end}}}

## Run the Go program

{{{with step}}}
Run the Go program:

{{{with script "en" "go run"}}}
go run .
{{{end}}}

{{{end}}}

## Congratulations!

That's it, you have just created a local module that depends on a well-known
module from the Central Registry, and loaded it via the Go API!

## Related content

- {{< linkto/related/reference "modules" >}}
