---
title: Getting started with Kubernetes + CUE
---

The CUE
[Central Registry](https://registry.cue.works)
provides a well-known location for well-known schemas,
including some from the [Kubernetes project](https://kubernetes.io/). In the
past, you had to use the `cue get go` command to generate these schemas from
their Go source code. By using the curated schemas published on the
[Central Registry](https://registry.cue.works),
now you can get started creating validated Kubernetes manifests in minutes!

This guide shows you how to get started defining your Kubernetes configurations using
[a curated module](/getting-started/kubernetes/)
from
[the schema library](/getting-started/schema-library/).

<!--more-->

## Initialise your local CUE module
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```
CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist
within its own CUE module. You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).

## Create a Kubernetes manifest using CUE

If you don't have an example you want to
use, create the `manifest.cue` file with this contents:
```cue { title="manifest.cue" codeToCopy="cGFja2FnZSBrdWJlCgppbXBvcnQgYXBwcyAiY3VlLmRldi94L2s4cy5pby9hcGkvYXBwcy92MSIKCmFwcHMuI0RlcGxveW1lbnQgJiB7CglhcGlWZXJzaW9uOiAiYXBwcy92MSIKCWtpbmQ6ICAgICAgICJEZXBsb3ltZW50IgoJbWV0YWRhdGE6IHsKCQlsYWJlbHM6IGFwcDogImV4YW1wbGUxIgoJCW5hbWU6ICJleGFtcGxlMSIKCX0KCXNwZWM6IHsKCQlyZXBsaWNhczogMQoJCXNlbGVjdG9yOiBtYXRjaExhYmVsczogYXBwOiAiZXhhbXBsZTEiCgkJdGVtcGxhdGU6IHsKCQkJbWV0YWRhdGE6IGxhYmVsczogYXBwOiAiZXhhbXBsZTEiCgkJCXNwZWM6IGNvbnRhaW5lcnM6IFt7CgkJCQlpbWFnZTogIm5naW54OmxhdGVzdCIKCQkJCW5hbWU6ICAibmdpbngiCgkJCX1dCgkJfQoJfQp9Cg==" }
// filepath: manifest.cue

package kube

import apps "cue.dev/x/k8s.io/api/apps/v1"

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
```
The `import` at the top references the appropriate curated module for the
deployment contained in the manifest.
Its path is currently temporary, but only while its proper location is being decided.
The temporary path isn't a problem because one important property of the
[Central Registry](https://registry.cue.works)
is that, once a schema is published, it will always be
available at that location.
When the curated module’s location is finalised and versions are published
under the new path, you can use the
[`cue refactor imports`](https://cuelang.org/docs/reference/command/cue-help-refactor-imports/)
command to update your CUE easily, so it reflects the new location.

## Tidy your CUE module
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a curated module for the first time.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](https://cue.dev/docs/login-central-registry/)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Validate your manifest
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYw==" }
$ cue vet -c
```
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your manifest.

## Export your manifest as YAML
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgbWFuaWZlc3QueW1s" }
$ cue export --outfile manifest.yml
```

If you used the example manifest from above, your validated YAML manifest will look like this:

```yml { title="manifest.yml" codeToCopy="YXBpVmVyc2lvbjogYXBwcy92MQpraW5kOiBEZXBsb3ltZW50Cm1ldGFkYXRhOgogIGxhYmVsczoKICAgIGFwcDogZXhhbXBsZTEKICBuYW1lOiBleGFtcGxlMQpzcGVjOgogIHJlcGxpY2FzOiAxCiAgc2VsZWN0b3I6CiAgICBtYXRjaExhYmVsczoKICAgICAgYXBwOiBleGFtcGxlMQogIHRlbXBsYXRlOgogICAgbWV0YWRhdGE6CiAgICAgIGxhYmVsczoKICAgICAgICBhcHA6IGV4YW1wbGUxCiAgICBzcGVjOgogICAgICBjb250YWluZXJzOgogICAgICAgIC0gaW1hZ2U6IG5naW54OmxhdGVzdAogICAgICAgICAgbmFtZTogbmdpbngK" }
# filepath: manifest.yml

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
