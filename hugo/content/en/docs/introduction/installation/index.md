---
title: Installation
weight: 20
---

The Go APIs for CUE are defined in the
[`cuelang.org/go`](https://pkg.go.dev/cuelang.org/go) module, which can be added
as a dependency using [Go's native dependency
management](https://go.dev/doc/modules/managing-dependencies).

The `cue` binary can be installed using one of the following methods.

## Install CUE from official release binaries

### Download

Binaries for various operating systems, including Linux, Microsoft Windows,
and macOS can be downloaded from
[official CUE releases](https://github.com/cue-lang/cue/releases/).

### Install using Homebrew

In addition, CUE can be installed with using [`brew`](https://brew.sh/) on macOS
and Linux:

```
brew install cue-lang/tap/cue
```

### Installation on Arch Linux

Arch Linux has an official package that you can install by running:

```
pacman -S cue
```

## Install CUE from source

### Prerequisites

Go 1.16 or higher (see below for instructions on installing Go).

### Installing CUE

To install the `cue` command line tool:

```
go install cuelang.org/go/cmd/cue@latest
```

### Installing Go

#### Download Go

Download the binary for Microsoft Windows, macOS, and Linux at
https://go.dev/dl/. If you use a different OS you can [install Go from
source](https://go.dev/doc/install/source).

#### Install Go

Follow the instructions at https://go.dev/doc/install. Make sure the `go`
binary is in your `PATH`, then follow the instructions above to install CUE
from source.
