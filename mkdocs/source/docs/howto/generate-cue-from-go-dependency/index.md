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

<!--more-->

## Initialize Go and CUE modules

[**:material-chevron-right-circle-outline: Step 1**](#step-1){id="step-1"}: Create a Go module, or use an existing one if that's more suitable for your situation:

```` { .text title="TERMINAL" data-copy="go mod init go.example" }
$ go mod init go.example
...
````

---


[**:material-chevron-right-circle-outline: Step 2**](#step-2){id="step-2"}: Create a CUE module if you don't already have one:

```` { .text title="TERMINAL" data-copy="cue mod init cue.example" }
$ cue mod init cue.example
````

---


## Declare a Go dependency

If your Go doesn't already depend on the module containing the Go types
you're interested in, add it as a dependency.

[**:material-chevron-right-circle-outline: Step 3**](#step-3){id="step-3"}: Create a Go file to signal the required package to the `go` command.
Our example depends on a Kubernetes package:

```` { .go title="deps.go" }
package deps

import _ "k8s.io/api/apps/v1"
````

---


[**:material-chevron-right-circle-outline: Step 4**](#step-4){id="step-4"}: Add a dependency on a specific version of the target Go package,
and tidy the main module:

```` { .text title="TERMINAL" data-copy="go get k8s.io/api/apps/v1@v0.23.4 # &#34;@latest&#34; would also work.&#10;go mod tidy" }
$ go get k8s.io/api/apps/v1@v0.23.4 # "@latest" would also work.
...
$ go mod tidy
...
````

---


## Generate CUE from Go

[**:material-chevron-right-circle-outline: Step 5**](#step-5){id="step-5"}: Use the `cue` command to generate CUE from the target Go package:

```` { .text title="TERMINAL" data-copy="cue get go k8s.io/api/apps/v1" }
$ cue get go k8s.io/api/apps/v1
````

---


[**:material-chevron-right-circle-outline: Step 6**](#step-6){id="step-6"}: Inspect the CUE packages generated in `cue.mod/gen`:

```` { .text title="TERMINAL" data-copy="tree -d cue.mod/gen" }
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
````

More CUE packages are generated than just the target.
These are *dependencies* of the target package.

---


## Test the generated CUE

[**:material-chevron-right-circle-outline: Step 7**](#step-7){id="step-7"}: Use the generated code in a CUE package:

```` { .cue title="example.cue" }
package example

import (
	core "k8s.io/api/core/v1"
	apps "k8s.io/api/apps/v1"
)

service: [string]:     core.#Service
deployment: [string]:  apps.#Deployment
daemonSet: [string]:   apps.#DaemonSet
statefulSet: [string]: apps.#StatefulSet
````

---


[**:material-chevron-right-circle-outline: Step 8**](#step-8){id="step-8"}: Export an empty configuration to confirm that everything works:

```` { .text title="TERMINAL" data-copy="cue export --out yaml" }
$ cue export --out yaml
service: {}
deployment: {}
daemonSet: {}
statefulSet: {}
````

---

## Related content

- Issue [#2865](/issue/2865) tracks the plans for CUE to support
  finding well-known types (such as the Kubernetes example used above) at a
  well-known location, without having to import them manually.
- {{< linkto/related/howto "generate-cue-from-local-go" >}}
