---
title: Generate CUE from a Go dependency
toc_hide: true
tags:
    - cue command
---

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

{{{with step}}}

Create Go and CUE modules:

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init mod.example
cue mod init mod.example
{{{end}}}

{{{end}}}

{{{with step}}}

Declare a dependency on the Kubernetes packages of interest:

{{{with upload "en" "deps.go"}}}
-- deps.go --
//go:build deps
// +build deps

package deps

import _ "k8s.io/api/apps/v1"
{{{end}}}

{{{end}}}

{{{with step}}}
Add a dependency on a specific version (you could use `@latest`):

{{{with script "en" "go get k8s"}}}
#ellipsis 0
go get k8s.io/api/apps/v1@v0.23.4
#ellipsis 0
go mod tidy
{{{end}}}

{{{end}}}

{{{with step}}}
Generate CUE from the Go types in a package:

{{{with script "en" "cue get go"}}}
cue get go k8s.io/api/apps/v1
{{{end}}}

{{{end}}}

{{{with step}}}
Inspect the files generated in `cue.mod/gen`:

{{{with script "en" "inspect cue.mod/gen"}}}
#ellipsis 10
tree -d cue.mod/gen
{{{end}}}

{{{end}}}

{{{with step}}}
Use the generated code in a CUE package:

{{{with upload "en" "example.cue"}}}
-- example.cue --
package example

import (
	"k8s.io/api/core/v1"
	apps_v1 "k8s.io/api/apps/v1"
)

service: [string]:     v1.#Service
deployment: [string]:  apps_v1.#Deployment
daemonSet: [string]:   apps_v1.#DaemonSet
statefulSet: [string]: apps_v1.#StatefulSet
{{{end}}}

{{{end}}}

{{{with step}}}
Export the configuration to confirm everything works (as empty as the result is!):

{{{with script "en" "export"}}}
cue export
{{{end}}}

{{{end}}}
