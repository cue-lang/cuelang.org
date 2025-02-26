---
title: Getting started with Kubernetes + CUE
draft: true
no_index: true
---

The CUE Central Registry provides a well-known location for well-known schemas,
including some from the [Kubernetes project](https://kubernetes.io/).
By using the curated schemas published on the CUE Central Registry you can get
started creating validated Kubernetes manifests in minutes!

Here's how to begin ...

## Login to the Central Registry
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```
The Central Registry requires authentication, so you need to login before you can use its schemas.

## Initialise your local CUE module
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```
CUE that uses schemas and modules from the Central Registry needs to exist
within its own CUE module. You can choose any module name you like - it's easy to
[change it later]({{<relref"docs/reference/command/cue-help-mod-rename">}}).

## Create a Kubernetes manifest using CUE

If you don't have an example you want to
use, create the `manifest.cue` file with this contents:
{{< code-tabs >}}
{{< code-tab name="manifest.cue" language="cue" area="top-left" >}}
package kube

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
The `import` at the top references the appropriate curated module for the
deployment contained in the manifest.
Its path is currently temporary, but only while its proper location is being decided.
The temporary path isn't a problem because one important property of the
Central Registry is that, once a schema is published, it will always be
available at that location.
When the curated module's location is finalised, and versions are published
under the new path, it's easy to use the
[`cue refactor imports`]({{<relref"docs/reference/command/cue-help-refactor-imports">}})
command to update your CUE.

## Tidy your CUE module
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```
Tidying a module is an important part of using curated modules from the Central
Registry. Always use
[`cue mod tidy`]({{<relref"docs/reference/command/cue-help-mod-tidy">}})
when you use a curated module for the first time.

## Validate your manifest
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldA==" }
$ cue vet
```
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your manifest.

## Export your manifest as YAML
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgbWFuaWZlc3QueW1s" }
$ cue export --outfile manifest.yml
```
If you used the example manifest from above, your validated YAML manifest will look like this:
{{< code-tabs >}}
{{< code-tab name="manifest.yml" language="yml" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}
