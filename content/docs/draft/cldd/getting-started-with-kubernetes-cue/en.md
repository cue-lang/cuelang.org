---
title: Getting started with Kubernetes + CUE
draft: true
no_index: true
---

{{{with _script_ "en" "HIDDEN setup auth"}}}
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

The CUE Central Registry provides a well-known location for well-known schemas,
including some from the [Kubernetes project](https://kubernetes.io/).
By using the curated schemas published on the CUE Central Registry you can get
started creating validated Kubernetes manifests in minutes!

Here's how to begin ...

## Login to the Central Registry
{{{with script "en" "cue login"}}}
#norun
cue login
{{{end}}}
The Central Registry requires authentication, so you need to login before you can use its schemas.

## Initialise your local CUE module
{{{with script "en" "cue mod init"}}}
cue mod init cue.example
{{{end}}}
CUE that uses schemas and modules from the Central Registry needs to exist
within its own CUE module. You can choose any module name you like - it's easy to
[change it later]({{<relref"docs/reference/command/cue-help-mod-rename">}}).

## Create a Kubernetes manifest using CUE

If you don't have an example you want to
use, create the `manifest.cue` file with this contents:
{{{with upload "en" "1"}}}
# Taken from https://github.com/appvia/KubernetesHelloWorld?tab=readme-ov-file#deploy-an-application
-- manifest.cue --
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
{{{end}}}
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
{{{with script "en" "tidy"}}}
cue mod tidy
{{{end}}}
Tidying a module is an important part of using curated modules from the Central
Registry. Always use
[`cue mod tidy`]({{<relref"docs/reference/command/cue-help-mod-tidy">}})
when you use a curated module for the first time.

## Validate your manifest
{{{with script "en" "vet"}}}
cue vet
{{{end}}}
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your manifest.

## Export your manifest as YAML
{{{with script "en" "export"}}}
cue export --outfile manifest.yml
{{{end}}}
{{{with _script_ "en" "HIDDEN: move"}}}
mv manifest.yml .manifest.yml
{{{end}}}
If you used the example manifest from above, your validated YAML manifest will look like this:
{{{with upload "en" "yaml"}}}
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
{{{with _script_ "en" "HIDDEN: diff"}}}
diff manifest.yml .manifest.yml
{{{end}}}
