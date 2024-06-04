---
title: Generating CUE from a Go dependency
toc_hide: true
tags:
- cue command
- encodings
authors:
- myitcv
- jpluscplusm
---

This guide demonstrates how to generate CUE from Go types defined in some
dependency of a Go module.

## Initialize Go and CUE modules

{{< step stepNumber="1" >}}
Create a Go module, or use an existing one if that's more suitable for your situation:

```text { title="TERMINAL" codeToCopy="Z28gbW9kIGluaXQgZ28uZXhhbXBsZQ==" }
$ go mod init go.example
...
```
{{< /step >}}

{{< step stepNumber="2" >}}
Create a CUE module if you don't already have one:

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```
{{< /step >}}

## Declare a Go dependency

If your Go doesn't already depend on the module containing the Go types
you're interested in, add it as a dependency.

{{< step stepNumber="3" >}}
Create a Go file to signal the required package to the `go` command.
Our example depends on a Kubernetes package:

{{< code-tabs >}}
{{< code-tab name="deps.go" language="go" area="top-left" >}}
//go:build deps
// +build deps

package deps

import _ "k8s.io/api/apps/v1"
{{< /code-tab >}}
{{< /code-tabs >}}
{{< /step >}}

{{< step stepNumber="4" >}}
Add a dependency on a specific version of the target Go package,
and tidy the main module:

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGs4cy5pby9hcGkvYXBwcy92MUB2MC4yMy40ICMgIkBsYXRlc3QiIHdvdWxkIGFsc28gd29yay4KZ28gbW9kIHRpZHk=" }
$ go get k8s.io/api/apps/v1@v0.23.4 # "@latest" would also work.
...
$ go mod tidy
...
```
{{< /step >}}

## Generate CUE from Go

{{< step stepNumber="5" >}}
Use the `cue` command to generate CUE from the target Go package:

```text { title="TERMINAL" codeToCopy="Y3VlIGdldCBnbyBrOHMuaW8vYXBpL2FwcHMvdjE=" }
$ cue get go k8s.io/api/apps/v1
```
{{< /step >}}

{{< step stepNumber="6" >}}
Inspect the CUE packages generated in `cue.mod/gen`:

```text { title="TERMINAL" codeToCopy="dHJlZSAtZCBjdWUubW9kL2dlbg==" }
$ tree -d cue.mod/gen
cue.mod/gen
└── k8s.io
    ├── api
    │   ├── apps
    │   │   └── v1
    │   └── core
    │       └── v1
    └── apimachinery
        └── pkg
            ├── api
...
```

More CUE packages are generated than just the target.
These are *dependencies* of the target package.
{{< /step >}}

## Test the generated CUE

{{< step stepNumber="7" >}}
Use the generated code in a CUE package:

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
package example

import (
	core "k8s.io/api/core/v1"
	apps "k8s.io/api/apps/v1"
)

service: [string]:     core.#Service
deployment: [string]:  apps.#Deployment
daemonSet: [string]:   apps.#DaemonSet
statefulSet: [string]: apps.#StatefulSet
{{< /code-tab >}}
{{< /code-tabs >}}
{{< /step >}}

{{< step stepNumber="8" >}}
Export an empty configuration to confirm that everything works:

```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" }
$ cue export --out yaml
service: {}
deployment: {}
daemonSet: {}
statefulSet: {}
```
{{< /step >}}

## Related content

- Issue {{< issue 2865 >}}#2865{{</issue>}} tracks the plans for CUE to support
  finding well-known types (such as the Kubernetes example used above) at a
  well-known location, without having to import them manually.
- {{< linkto/related/howto "generate-cue-from-local-go" >}}
