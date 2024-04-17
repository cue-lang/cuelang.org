---
title: Generate CUE from a Go dependency
toc_hide: true
tags:
    - cue command
---

{{< step stepNumber="1" >}}

Create Go and CUE modules:

```text { title="TERMINAL" codeToCopy="Z28gbW9kIGluaXQgbW9kLmV4YW1wbGUKY3VlIG1vZCBpbml0IG1vZC5leGFtcGxl" }
$ go mod init mod.example
...
$ cue mod init mod.example
```

{{< /step >}}

{{< step stepNumber="2" >}}

Declare a dependency on the Kubernetes packages of interest:

```go { title="deps.go" }
//go:build deps
// +build deps

package deps

import _ "k8s.io/api/apps/v1"
```

{{< /step >}}

{{< step stepNumber="3" >}}
Add a dependency on a specific version (you could use `@latest`):

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGs4cy5pby9hcGkvYXBwcy92MUB2MC4yMy40CmdvIG1vZCB0aWR5" }
$ go get k8s.io/api/apps/v1@v0.23.4
...
$ go mod tidy
...
```

{{< /step >}}

{{< step stepNumber="4" >}}
Generate CUE from the Go types in a package:

```text { title="TERMINAL" codeToCopy="Y3VlIGdldCBnbyBrOHMuaW8vYXBpL2FwcHMvdjE=" }
$ cue get go k8s.io/api/apps/v1
```

{{< /step >}}

{{< step stepNumber="5" >}}
Inspect the files generated in `cue.mod/gen`:

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

{{< /step >}}

{{< step stepNumber="6" >}}
Use the generated code in a CUE package:

```cue { title="example.cue" }
package example

import (
	"k8s.io/api/core/v1"
	apps_v1 "k8s.io/api/apps/v1"
)

service: [string]:     v1.#Service
deployment: [string]:  apps_v1.#Deployment
daemonSet: [string]:   apps_v1.#DaemonSet
statefulSet: [string]: apps_v1.#StatefulSet
```

{{< /step >}}

{{< step stepNumber="7" >}}
Export the configuration to confirm everything works (as empty as the result is!):

```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydA==" }
$ cue export
{
    "service": {},
    "deployment": {},
    "daemonSet": {},
    "statefulSet": {}
}
```

{{< /step >}}
