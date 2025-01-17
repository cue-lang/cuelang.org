---
title: 5 minutes with ... k8s.io
draft: true
no_index: true
---

{{{with _script_ "en" "HIDDEN setup auth"}}}
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

## Login to the Central Registry

{{{with script "en" "cue login"}}}
#norun
cue login
{{{end}}}

## Initialise your local CUE module

{{{with script "en" "cue mod init"}}}
cue mod init
{{{end}}}

## Create a CUE manifest

{{{with upload "en" "1"}}}
# Taken from https://github.com/appvia/KubernetesHelloWorld?tab=readme-ov-file#deploy-an-application
-- manifest.cue --
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
{{{end}}}

## Tidy your local CUE module

{{{with script "en" "tidy"}}}
cue mod tidy
{{{end}}}

## Validate and export your manifest as YAML

{{{with script "en" "export"}}}
cue vet .:k8s
cue export .:k8s --outfile manifest.yml
{{{end}}}

## Review your YAML manifest

{{{with script "en" "display"}}}
cat manifest.yml
{{{end}}}
