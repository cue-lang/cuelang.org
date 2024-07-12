---
title: Installation
weight: 20
aliases:
- /docs/install
- /download
- /install
- /dl
---

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

```text { title="TERMINAL" type="terminal" codeToCopy="YnJldyBpbnN0YWxsIGN1ZS1sYW5nL3RhcC9jdWU="  }
$ brew install cue-lang/tap/cue
```

#### Install from Docker Hub

The CUE project publishes official container images containing `cue` on Docker Hub
([hub.docker.com/r/cuelang/cue](https://hub.docker.com/r/cuelang/cue)).
They can be used on
[platforms supported by Docker](https://docs.docker.com/engine/install/).

Various tags are available that let you select container images for different
machine architectures and CUE versions. To use the latest version that's
appropriate for your machine, use the `latest` tag:

```text { title="TERMINAL" type="terminal" codeToCopy="ZG9ja2VyIHB1bGwgY3VlbGFuZy9jdWU6bGF0ZXN0"  }
$ docker pull cuelang/cue:latest
```

#### Install from source

On
[platforms supported by Go](https://go.dev/dl/#stable),
`cue` can be installed from source using any of its released versions.

For example, to fetch the latest version:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gaW5zdGFsbCBjdWVsYW5nLm9yZy9nby9jbWQvY3VlQGxhdGVzdA=="  }
$ go install cuelang.org/go/cmd/cue@latest
...
```

This method requires that you already have [Go](https://go.dev) installed.
 
#### Install on Arch Linux

On Arch Linux
([archlinux.org](https://archlinux.org)),
`cue` can be installed from a package in the official Arch `extra` repository:

```text { title="TERMINAL" type="terminal" codeToCopy="cGFjbWFuIC1TIGV4dHJhL2N1ZQ=="  }
$ pacman -S extra/cue
```

This package is not published by the CUE project.

## Using the Go API

CUE's Go APIs are defined in the
[`cuelang.org/go`](https://pkg.go.dev/cuelang.org/go) module, which can be added
as a versioned dependency using Go's
[dependency management](https://go.dev/doc/modules/managing-dependencies)
workflows. All available versions are listed at
[pkg.go.dev/cuelang.org/go](https://pkg.go.dev/cuelang.org/go?tab=versions).

For example, to add a dependency on the latest version:
```text { title="TERMINAL" type="terminal" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQGxhdGVzdA=="  }
$ go get cuelang.org/go@latest
...
```

## Related content

- {{< linkto/related/concept "how-cue-works-with-go" >}}
