---
title: Using modules with the Go API
authors:
- myitcv
- jpluscplusm
tags:
- go api
- modules
- tooling
toc_hide: true
---

{{{with _script_ "en" "HIDDEN set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

{{{with _script_ "en" "HIDDEN setup auth"}}}
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

## Introduction

In this tutorial you will
use CUE's Go API to work with a CUE module dependency fetched from the Central Registry.

Along the way you will:

- Login to the Central Registry, and authenticate the `cue` command
- Create a CUE module that depends on an existing, well-known module
- Use `cue mod tidy` to fetch and organise your module's dependencies
- Load your CUE using the Go API working in a modules-aware mode

## Prerequisites

- **Access to the [Central Registry](https://registry.cue.works)** -- if you
  need to practise using the Central Registry, then first follow the
  tutorial {{< linkto/inline "tutorial/working-with-the-central-registry" >}}
- **A tool to edit text files** -- any text editor you have will be fine;
    for example: [VSCode](https://code.visualstudio.com/) or [Vim](https://neovim.io/)
- **A command terminal** -- the `cue` command works on all platforms;
  use any terminal on Linux or macOS, or PowerShell, `cmd.exe` or
  [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) on Windows.
- **An installed `go` binary** -- [installation details](https://go.dev/doc/install)
- **An installed `cue` binary** -- [installation details]({{< relref "/docs/introduction/installation" >}})

This tutorial uses the following version of CUE:

{{{with script "en" "show cue version"}}}
#ellipsis 1
cue version
{{{end}}}

## Set up the `cue` command

{{{with step}}}
Authenticate the `cue` command with the Central Registry:

{{{with script "en" "#norun cue login"}}}
#norun
cue login
{{{end}}}

Later in this tutorial the `cue` command will fetch a well-known module from
the Central Registry, which requires authentication.
{{{end}}}

## Create a CUE module

{{{with step}}}
Initialize a new main CUE module in an empty directory:

{{{with script "en" "cue mod init"}}}
cue mod init an.example/config@v0
{{{end}}}

You won't publish this module, so the name you give it is unimportant.
{{{end}}}

{{{with step}}}
Create the file `main.cue`, holding the code for the main module:

{{{with upload "en" "initial main.cue"}}}
-- main.cue --
package config

import "github.com/cue-labs/examples/frostyconfig@v0"

config: frostyconfig.#Config & {
	appName: "alpha"
	port:    80
	features: logging: true
}
{{{end}}}

Your main module defines some concrete values for a configuration,
constrained by the `frostyconfig.#Config` schema.
{{{end}}}

{{< info >}}
Your module imports and uses the `frostyconfig` package first introduced in the tutorial
{{< linkto/inline "tutorial/working-with-a-custom-module-registry" >}}.
You don't need to follow that tutorial right now - it's only mentioned for context.
{{< /info >}}

{{{with step}}}
Ensure the CUE module is tidy:

{{{with script "en" "initial cue mod tidy"}}}
cue mod tidy
{{{end}}}

This fetches the `frostyconfig` module (and any dependencies it might have)
from the Central Registry.
{{{end}}}

{{{with step}}}
Export the configuration from your CUE module:

{{{with script "en" "first export"}}}
cue export
{{{end}}}

This export shows that your CUE is valid and you can successfully use a
dependency from the Central Registry.
{{{end}}}

## Create a Go module and program

{{{with step}}}
Initialize a Go module for your program:

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init an.example/config
{{{end}}}

You won't publish this module, so the name you give it is unimportant.
{{{end}}}

{{{with step}}}
Create the file `main.go` containing this Go program:

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

	// Load the package from the current directory.
	// We don't need to specify a Config in this example.
	insts := load.Instances([]string{"."}, &load.Config{
		Registry: reg,
	})

	// The current directory just has one file without any build tags,
	// and that file belongs to the example package, so we get a single
	// instance as a result.
	v := ctx.BuildInstance(insts[0])
	if err := v.Err(); err != nil {
		log.Fatal(err)
	}

	// Lookup the 'config' field and print it out
	config := v.LookupPath(cue.ParsePath("config"))
	fmt.Println(config)
}
{{{end}}}

This program loads the CUE package in the current directory,
and then prints a message based on the `config` field.
{{{end}}}

{{{with step}}}
Add a dependency on `cuelang.org/go` and ensure the Go module is tidy:

{{{with script "en" "go test"}}}
#ellipsis 0
go get cuelang.org/go@$CUELANG_CUE_LATEST
#ellipsis 0
go mod tidy
{{{end}}}

You can use `@latest` in place of the specific version mentioned here.
{{{end}}}

## Run the Go program

{{{with step}}}
Run the Go program:

{{{with script "en" "go run"}}}
go run .
{{{end}}}
{{{end}}}

{{{with _script_ "en" "https://github.com/cue-lang/docs-and-content/issues/186 #1"}}}
go vet ./...
#ellipsis 0
go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./...
{{{end}}}

## Summary

Well done - you've finished this tutorial! In completing it, you:

- **created a main module** that depends on a well-known module from the Central Registry, and
- **used the Go API to load the main module**, transparently using the module's dependencies.

## Related content

- {{< linkto/related/reference "modules" >}}
- {{< linkto/related/tutorial "working-with-a-custom-module-registry" >}}
