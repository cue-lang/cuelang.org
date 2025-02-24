---
title: Migrating to the Central Registry's Curated Kubernetes CUE Schemas
draft: true
no_index: true
---

{{<todo "switch to central registry module rationale">}}

If you're already using CUE to validate or generate Kubernetes manifests then
it's pretty likely you're using CUE schemas generated from the upstream
Kubernetes project's Go code. That means you probably ran some commands like
these, as a one-off:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGt1YmUuZXhhbXBsZQpnbyBtb2QgaW5pdCBrdWJlLmV4YW1wbGUKZ28gZ2V0IGs4cy5pby9hcGkKZ28gZ2V0IGs4cy5pby9hcGltYWNoaW5lcnkKZ28gZ2V0IGs4cy5pby9rdWJlLWFnZ3JlZ2F0b3IKY3VlIGdldCBnbyBrOHMuaW8vYXBpL2FwcHMvdjEKY3VlIGdldCBnbyBrOHMuaW8vYXBpL2F1dGhlbnRpY2F0aW9uL3YxCmN1ZSBnZXQgZ28gazhzLmlvL2FwaS9hdXRob3JpemF0aW9uL3YxCmN1ZSBnZXQgZ28gazhzLmlvL2FwaS9jb3JlL3YxCnRyZWUgLWQgY3VlLm1vZC9nZW4vazhzLmlv" }
$ cue mod init kube.example
$ go mod init kube.example
...
$ go get k8s.io/api
...
$ go get k8s.io/apimachinery
...
$ go get k8s.io/kube-aggregator
...
$ cue get go k8s.io/api/apps/v1
$ cue get go k8s.io/api/authentication/v1
$ cue get go k8s.io/api/authorization/v1
$ cue get go k8s.io/api/core/v1
$ tree -d cue.mod/gen/k8s.io
cue.mod/gen/k8s.io
├── api
│   ├── apps
│   │   └── v1
│   ├── authentication
│   │   └── v1
│   ├── authorization
│   │   └── v1
│   └── core
│       └── v1
...
```

Having these locally-generated schemas available has allowed you to validate
Kubernetes manifests, or to generate them easily from from CUE code like this:

{{< code-tabs >}}
{{< code-tab name="manifest.cue" language="cue" area="top-left" >}}
package k8s

import apps "k8s.io/api/apps/v1"

apps.#Deployment & {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		labels: app: "example1"
		name: "example1"
	}
	spec: {
		replicas: 1
		selector: matchLabels: app: "example1"
		template: {
			metadata: labels: app: "example1"
			spec: containers: [{
				image: "nginx:latest"
				name:  "nginx"
			}]
		}
	}
}
{{< /code-tab >}}{{< /code-tabs >}}

{{<todo "switch to central registry module rationale">}}

{{< step stepNumber="1" >}}
If you're generating your Kubernetes manifests from CUE, start by exporting the
current state of one of your YAML manifests:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgbWFuaWZlc3QtYmVmb3JlLnlhbWwKY2F0IG1hbmlmZXN0LWJlZm9yZS55YW1s" }
$ cue export --outfile manifest-before.yaml
$ cat manifest-before.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: example1
  labels:
    app: example1
spec:
  replicas: 1
  selector:
    matchLabels:
      app: example1
  template:
    metadata:
      labels:
        app: example1
    spec:
      containers:
        - name: nginx
          image: nginx:latest
```
You won't need to store this file - you're only keeping it around temporarily,
to prove that moving to the Central Registry module won't have changed your
YAML manifests.
{{< /step >}}

{{< step stepNumber="2" >}}
{{<todo "refactor preamble">}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHJlZmFjdG9yIGltcG9ydHMgazhzLmlvIGdpdGh1Yi5jb20vY3VlLXRtcC9qc29uc2NoZW1hLXB1Yi9leHAzL2s4cy5pb0B2MA==" }
$ cue refactor imports k8s.io github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0
```
{{< todo "explain temp location" >}}
{{< /step >}}

{{< step stepNumber="3" >}}
{{< todo "demo change to .cue file" >}}
{{< /step >}}

{{< step stepNumber="4" >}}
If you haven't logged in before, you'll now need to authenticate to the CUE Central Registry.
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```
This lets you download the curated CUE modules.
{{< /step >}}

{{< step stepNumber="5" >}}
Tidy your CUE module and observe the changes the command made to your CUE
module (in the `deps` field):
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5CmNhdCBjdWUubW9kL21vZHVsZS5jdWU=" }
$ cue mod tidy
$ cat cue.mod/module.cue
module: "kube.example"
language: {
	version: "v0.13.0"
}
deps: {
	"github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0": {
		v: "v0.0.0"
	}
}
```
{{< /step >}}

{{< step stepNumber="6" >}}
Lastly, let's confirm that there aren't any material differences from the last
time we exported:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgbWFuaWZlc3QtYWZ0ZXIueWFtbApkaWZmIC10eVc3NSBtYW5pZmVzdC1iZWZvcmUueWFtbCBtYW5pZmVzdC1hZnRlci55YW1s" }
$ cue export --outfile manifest-after.yaml
$ diff -tyW75 manifest-before.yaml manifest-after.yaml
apiVersion: apps/v1                    apiVersion: apps/v1
kind: Deployment                       kind: Deployment
metadata:                              metadata:
  name: example1                     <
  labels:                                labels:
    app: example1                          app: example1
                                     >   name: example1
spec:                                  spec:
  replicas: 1                            replicas: 1
  selector:                              selector:
    matchLabels:                           matchLabels:
      app: example1                          app: example1
  template:                              template:
    metadata:                              metadata:
      labels:                                labels:
        app: example1                          app: example1
    spec:                                  spec:
      containers:                            containers:
        - name: nginx                |         - image: nginx:latest
          image: nginx:latest        |           name: nginx
```
We can see that the only differences are cosmetic changes to the order in which
a couple of keys are emitted - all of which are unimportant to Kubernetes.
{{< /step >}}

{{<todo"wrapup">}}
{{<todo"links?">}}
