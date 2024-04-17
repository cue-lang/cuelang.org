---
title: Generate CUE from a Go dependency
toc_hide: true
tags:
- cue command
authors:
- myitcv
- jpluscplusm
---

This guide demonstrates how to generate CUE from Go types defined in some
dependency of a Go module.

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

## Initialize Go and CUE modules

{{{with step}}}
Create a Go module, or use an existing one if that's more suitable for your situation:

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init go.example
{{{end}}}
{{{end}}}

{{{with step}}}
Create a CUE module if you don't already have one:

{{{with script "en" "cue mod init"}}}
cue mod init cue.example
{{{end}}}
{{{end}}}

## Declare a Go dependency

If your Go doesn't already depend on the module containing the Go types
you're interested in, add it as a dependency.

{{{with step}}}
Create a Go file to signal the required module to the `go` command.
Our example use a Kubernetes package:

{{{with upload "en" "deps.go"}}}
-- deps.go --
//go:build deps
// +build deps

package deps

import _ "k8s.io/api/apps/v1"
{{{end}}}
{{{end}}}

{{{with step}}}
Add a dependency on a specific version:

{{{with script "en" "go get k8s"}}}
#ellipsis 0
go get k8s.io/api/apps/v1@v0.23.4 # "v1@latest" would also work.
#ellipsis 0
go mod tidy
{{{end}}}
{{{end}}}

## Generate CUE from Go

{{{with step}}}
Use the `cue` command to generate CUE from the Go types in a specific package:

{{{with script "en" "cue get go"}}}
cue get go k8s.io/api/apps/v1
{{{end}}}
{{{end}}}

{{{with step}}}
Inspect the CUE packages generated in `cue.mod/gen`:

{{{with script "en" "inspect cue.mod/gen"}}}
#ellipsis 10
tree -d cue.mod/gen
{{{end}}}

Notice that we see more packages than just the one explicitly mentioned in the previous step.
These are *dependencies* of the package that was mentioned.
{{{end}}}

## Test the generated CUE

{{{with step}}}
Use the generated code in a CUE package:

{{{with upload "en" "example.cue"}}}
-- example.cue --
package example

import (
	core "k8s.io/api/core/v1"
	apps "k8s.io/api/apps/v1"
)

service: [string]:     core.#Service
deployment: [string]:  apps.#Deployment
daemonSet: [string]:   apps.#DaemonSet
statefulSet: [string]: apps.#StatefulSet
{{{end}}}
{{{end}}}

{{{with step}}}
Export an empty configuration to confirm that everything works:

{{{with script "en" "export"}}}
cue export --out yaml
{{{end}}}
{{{end}}}

## Related content

- Issue {{< issue 2865 >}}#2865{{</issue>}} tracks the plans for CUE to support
  finding well-known types (such as the Kubernetes example used above) at a
  well-known location, without having to import them manually.
