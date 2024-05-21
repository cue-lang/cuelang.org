---
title: Installing CUE
weight: 50
aliases:
- /docs/install
- /download
- /install
- /dl
---

{{{with _script_ "en" "HIDDEN_ set up caches"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

{{<warning>}}
### Try out CUE in your browser!
You can use CUE without installing anything -- just visit
[cuelang.org/play](https://cuelang.org/play/) with your browser.
{{</warning>}}

## Installing the `cue` command

The `cue` command is available from various sources, listed on this page.
If you don't know which source to choose, download and unpack the
[latest version](https://github.com/cue-lang/cue/releases/latest)
that's appropriate for your operating system.

#### Download an official CUE binary

On Linux, Microsoft Windows, and macOS, the `cue` command can be downloaded from the
[official CUE releases](https://github.com/cue-lang/cue/releases/).

These releases include *prereleases*, which are cutting-edge versions of `cue`
made available to help expose bugs and flush out unintended behaviours.

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
`cue` can be installed from source using any of its released versions.

For example, to fetch the latest version:

{{{with script "en" "go install"}}}
#ellipsis 0
go install cuelang.org/go/cmd/cue@latest
{{{end}}}

This method requires that you already have [Go](https://go.dev) installed.
 
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
