---
title: Installation
weight: 20
aliases:
- /docs/install
- /download
- /install
- /dl
---

Visit
[cuelang.org/play](https://cuelang.org/play/)
to try out CUE without installing anything on your computer.

## Installing the `cue` command

The `cue` command is available from various sources.
Choose how you prefer to install software:

{{< table >}}
| Source | How to install | Operating Systems
| :---  | :--- | :---
| All officially release binaries | Download from [github.com/cue-lang/cue/releases](https://github.com/cue-lang/cue/releases/) | Linux \| macOS \| Windows
| Latest (non-prerelease) binaries | Download from [github.com/cue-lang/cue/releases/latest](https://github.com/cue-lang/cue/releases/latest) | Linux \| macOS \| Windows
| Homebrew ([brew.sh](https://brew.sh)) | `brew install cue-lang/tap/cue` | Linux \| macOS
| Arch Linux ([archlinux.org](https://archlinux.org)) | `pacman -S extra/cue` | Linux
| Docker Hub ([hub.docker.com](https://hub.docker.com/r/cuelang/cue)) | `docker pull cuelang/cue:latest` | [Docker-supported platforms](https://docs.docker.com/engine/install/)
| Go source code ([go.dev](https://go.dev)) | `go install cuelang.org/go/cmd/cue@latest` | [Go-supported platforms](https://go.dev/dl/#stable)
{{< /table >}}

If you don't have a preference, install the
[latest non-prerelease binary](https://github.com/cue-lang/cue/releases/latest)
that's appropriate for your operating system.

## Installing the Go API

CUE's Go APIs are defined in the
[`cuelang.org/go`](https://pkg.go.dev/cuelang.org/go) module, which can be added
as a versioned dependency using Go's
[dependency management](https://go.dev/doc/modules/managing-dependencies)
workflows. All available versions are listed at
[pkg.go.dev/cuelang.org/go](https://pkg.go.dev/cuelang.org/go?tab=versions).

For example, to fetch the latest non-prerelease version:

{{{with script "en" "go get cue"}}}
#norun
go get cuelang.org/go@latest
{{{end}}}
