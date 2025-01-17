---
title: 5 minutes with ... k8s.io
draft: true
no_index: true
---

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```

## Initialise your local CUE module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0" }
$ cue mod init
```

## Create a CUE manifest

{{< code-tabs >}}
{{< code-tab name="manifest.cue" language="cue" area="top-left" >}}
package k8s

import apps "github.com/cue-tmp/jsonschema-pub/exp1/k8s.io/api/apps/v1"

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

## Tidy your local CUE module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

## Validate and export your manifest as YAML

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAuOms4cwpjdWUgZXhwb3J0IC46azhzIC0tb3V0ZmlsZSBtYW5pZmVzdC55bWw=" }
$ cue vet .:k8s
$ cue export .:k8s --outfile manifest.yml
```

## Review your YAML manifest

```text { title="TERMINAL" type="terminal" codeToCopy="Y2F0IG1hbmlmZXN0LnltbA==" }
$ cat manifest.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: example1
  name: example1
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
        - image: nginx:latest
          name: nginx
```
