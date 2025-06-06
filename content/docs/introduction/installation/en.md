---
title: Installation
weight: 20
aliases:
- /docs/install/
- /download/
- /install/
- /dl/
---

{{{with _script_ "en" "HIDDEN_ set up caches"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

{{<warning>}}
### Try out CUE in your browser!
You can use the latest version of CUE without installing anything -- just visit
[cuelang.org/play](https://cuelang.org/play/)!
{{</warning>}}

## Installing the `cue` command

The `cue` command is available from various sources, listed on this page.
If you don't know which source to choose, download and unpack the
[latest version](https://github.com/cue-lang/cue/releases/latest)
that's appropriate for your operating system -- it contains the most recent
features and bug fixes.
The latest version of the `cue` command is:

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

<!--more-->

#### Download an official CUE binary

On Linux, Microsoft Windows, and macOS, the `cue` command can be downloaded from the
[official CUE releases](https://github.com/cue-lang/cue/releases/).

These releases include *pre-releases*, which are cutting-edge versions of the
`cue` command made available to help expose bugs and flush out unintended
behaviours. You should choose to install the
[latest release](https://github.com/cue-lang/cue/releases/latest) if you don't
have a specific reason to select a pre-release.

#### Install using Homebrew

On macOS and Linux, `cue` can be installed using Homebrew
([brew.sh](https://brew.sh)):

{{{with script "en" "brew install"}}}
#norun
brew install cue-lang/tap/cue
{{{end}}}

#### Install from Docker Hub

The CUE project publishes official container images containing `cue` on Docker Hub
([hub.docker.com/r/cuelang/cue](https://hub.docker.com/r/cuelang/cue)).
They can be used on
[platforms supported by Docker](https://docs.docker.com/engine/install/).

Various tags are available that let you select container images for different
machine architectures and CUE versions. To use the latest version that's
appropriate for your machine, use the `latest` tag:

{{{with script "en" "docker pull"}}}
#norun
docker pull cuelang/cue:latest
{{{end}}}

#### Install from source

On
[platforms supported by Go](https://go.dev/dl/#stable),
`cue` can be installed from source using any of its
release, pre-release, or as-yet-unreleased versions.
Installing from source requires that you already have
[Go](https://go.dev)
installed and available.

For example, to fetch the `latest` version:

{{{with script "en" "go install cmd/cue@latest"}}}
#ellipsis 0
go install cuelang.org/go/cmd/cue@latest
{{{end}}}

[This page](https://pkg.go.dev/cuelang.org/go?tab=versions)
lists the installable releases and pre-releases that you can specify instead of
`latest`.

##### Development version

You can install the development version of `cue` from source by specifying `master`:

{{{with script "en" "go install cmd/cue@master"}}}
#ellipsis 0
go install cuelang.org/go/cmd/cue@master
{{{end}}}

The capabilities of the development version change frequently because it contains the
most recent, unreleased code.

#### Install on Arch Linux

On Arch Linux
([archlinux.org](https://archlinux.org)),
`cue` can be installed from a package in the official Arch `extra` repository:

{{{with script "en" "pacman"}}}
#norun
pacman -S extra/cue
{{{end}}}

This package is not published by the CUE project.

## Using the Go API

CUE's Go APIs are defined in the
[`cuelang.org/go`](https://pkg.go.dev/cuelang.org/go) module, which can be added
as a versioned dependency using Go's
[dependency management](https://go.dev/doc/modules/managing-dependencies)
workflows. All available versions are listed at
[pkg.go.dev/cuelang.org/go](https://pkg.go.dev/cuelang.org/go?tab=versions).

For example, to add a dependency on the latest version:

{{{with _script_ "en" "HIDDEN: go mod init"}}}
go mod init go.example
{{{end}}}
{{{with script "en" "go get cue"}}}
#ellipsis 0
go get cuelang.org/go@latest
{{{end}}}

## Related content

- {{< linkto/related/concept "how-cue-works-with-go" >}}
