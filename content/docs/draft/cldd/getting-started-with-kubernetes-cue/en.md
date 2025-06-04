---
title: Getting started with Kubernetes + CUE
---

{{{with _script_ "en" "HIDDEN setup auth"}}}
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

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
{{{with script "en" "cue mod init"}}}
cue mod init cue.example
{{{end}}}
CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist
within its own CUE module. You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).

## Create a Kubernetes manifest using CUE

If you don't have an example you want to
use, create the `manifest.cue` file with this contents:
{{{with upload "en" "1"}}}
# Taken from https://github.com/appvia/KubernetesHelloWorld?tab=readme-ov-file#deploy-an-application
-- manifest.cue --
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
{{{end}}}
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
{{{with script "en" "tidy"}}}
cue mod tidy
{{{end}}}
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
{{{with script "en" "vet"}}}
cue vet -c
{{{end}}}
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your manifest.

## Export your manifest as YAML
{{{with script "en" "export"}}}
cue export --outfile manifest.yml
{{{end}}}

If you used the example manifest from above, your validated YAML manifest will look like this:

{{{with upload "en" "yaml"}}}
#assert
-- manifest.yml --
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
{{{end}}}
