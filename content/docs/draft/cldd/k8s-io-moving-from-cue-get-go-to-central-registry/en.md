---
title: Migrating to the Central Registry's Curated Kubernetes CUE Schemas
draft: true
no_index: true
---

{{{with _script_ "en" "HIDDEN: setup"}}}
# Caches.
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
# Access "cue refactor imports" command.
export PATH=/cues/$CUELANG_CUE_TIP:$PATH
# Registry access.
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

{{<todo "switch to central registry module rationale">}}

If you're already using CUE to validate or generate Kubernetes manifests then
it's pretty likely you're using CUE schemas generated from the upstream
Kubernetes project's Go code. That means you probably ran some commands like
these, as a one-off:

{{{with script "en" "obsolete CUE generation to prime local content"}}}
cue mod init kube.example
#ellipsis 0
go mod init kube.example
#ellipsis 0
go get k8s.io/api
#ellipsis 0
go get k8s.io/apimachinery
#ellipsis 0
go get k8s.io/kube-aggregator
cue get go k8s.io/api/apps/v1
cue get go k8s.io/api/authentication/v1
cue get go k8s.io/api/authorization/v1
cue get go k8s.io/api/core/v1
#ellipsis 10
tree -d cue.mod/gen/k8s.io
{{{end}}}

Having these locally-generated schemas available has allowed you to validate
Kubernetes manifests, or to generate them easily from from CUE code like this:

{{{with upload "en" "manifest"}}}
-- manifest.cue --
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
{{{end}}}

{{<todo "switch to central registry module rationale">}}

{{{with step}}}
If you're generating your Kubernetes manifests from CUE, start by exporting the
current state of one of your YAML manifests:
{{{with script "en" "export pre"}}}
cue export --outfile manifest-before.yaml
cat manifest-before.yaml
{{{end}}}
You won't need to store this file - you're only keeping it around temporarily,
to prove that moving to the Central Registry module won't have changed your
YAML manifests.
{{{end}}}

{{{with step}}}
{{<todo "refactor preamble">}}
{{{with script "en" "refactor"}}}
cue refactor imports k8s.io github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0
{{{end}}}
{{< todo "explain temp location" >}}
{{{end}}}

{{{with step}}}
{{< todo "demo change to .cue file" >}}
{{{end}}}

{{{with step}}}
If you haven't logged in before, you'll now need to authenticate to the CUE Central Registry.
{{{with script "en" "cue login"}}}
#norun
cue login
{{{end}}}
This lets you download the curated CUE modules.
{{{end}}}

{{{with step}}}
Tidy your CUE module and observe the changes the command made to your CUE
module (in the `deps` field):
{{{with script "en" "cue mod tidy"}}}
cue mod tidy
cat cue.mod/module.cue
{{{end}}}
{{{end}}}

{{{with step}}}
Lastly, let's confirm that there aren't any material differences from the last
time we exported:
{{{with script "en" "export post"}}}
cue export --outfile manifest-after.yaml
! diff -tyW75 manifest-before.yaml manifest-after.yaml
{{{end}}}
We can see that the only differences are cosmetic changes to the order in which
a couple of keys are emitted - all of which are unimportant to Kubernetes.
{{{end}}}

{{<todo"wrapup">}}
{{<todo"links?">}}
