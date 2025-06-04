---
title: Getting started with Kyverno + CUE
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for the
[different policy types](https://kyverno.io/policies) enforced by
[Kyverno](https://kyverno.io/).
This guide shows you how to get started defining your Kyverno policies in CUE using
[a curated module](/getting-started/kyverno/)
from
[the schema library](/getting-started/schema-library/).

<!--more-->

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
{{{with script "en" "cue mod init"}}}
cue mod init cue.example
{{{end}}}

You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).

## Create a policy

Declare a Kyverno policy in CUE. This one is based on an example from Kyverno's
[`policies`](https://github.com/kyverno/policies/blob/main/istio/create-authorizationpolicy/create-authorizationpolicy.yaml)
repository, but you should use policies that are more relevant to your
situation.

{{{with upload "en" "1"}}}
-- kyverno-policies/create-authorizationpolicy.cue --
package cicd

import "cue.dev/x/kyverno/clusterpolicy/v1"

clusterPolicies: createAuthorizationPolicy: v1.#ClusterPolicy & {
	apiVersion: "kyverno.io/v1"
	kind:       "ClusterPolicy"
	metadata: {
		name: "create-authorizationpolicy"
		annotations: {
			"policies.kyverno.io/title":       "Create Istio Deny AuthorizationPolicy"
			"policies.kyverno.io/category":    "Istio"
			"policies.kyverno.io/subject":     "AuthorizationPolicy"
			"policies.kyverno.io/description": "This policy creates a default deny AuthorizationPolicy for all new Namespaces, and should be supplemented with additional AuthorizationPolicies to allow traffic as required"
		}
	}
	spec: rules: [{
		name: "generate-deny-authorizationpolicy"
		match: any: [{
			resources: kinds: ["Namespace"]
		}]
		generate: {
			apiVersion:  "security.istio.io/v1beta1"
			kind:        "AuthorizationPolicy"
			name:        "default-deny"
			namespace:   "{{request.object.metadata.name}}"
			synchronize: true
			data: spec: {}
		}
	}]
}
{{{end}}}

In later guides we'll add more entries to the `clusterPolicies` struct.

The `import` at the top references the appropriate curated module for the policy.
Its path is currently temporary, but only while its proper location is being decided.
The temporary path isn't a problem because one important property of the
[Central Registry](https://registry.cue.works)
is that, once a schema is published, it will always be
available at that location.
When the curated module’s location is finalised and versions are published
under the new path, you can use the
[`cue refactor imports`](https://cuelang.org/docs/reference/command/cue-help-refactor-imports/)
command to update your CUE easily, so it reflects the new location.

## Tidy your local CUE module

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

## Validate your policy

{{{with script "en" "vet"}}}
cue vet -c ./kyverno-policies
{{{end}}}

Because `cue vet` doesn't display any errors,
you know that the curated schema has validated your policy.

## Export your policy as YAML

{{{with script "en" "export"}}}
cd kyverno-policies
cue export --outfile create-authorizationpolicy.yml -e clusterPolicies.createAuthorizationPolicy
{{{end}}}

If you chose to export the example policy shown above,
your validated YAML workflow will look like this:

{{{with upload "en" "yaml"}}}
#assert
-- kyverno-policies/create-authorizationpolicy.yml --
apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: create-authorizationpolicy
  annotations:
    policies.kyverno.io/title: Create Istio Deny AuthorizationPolicy
    policies.kyverno.io/category: Istio
    policies.kyverno.io/subject: AuthorizationPolicy
    policies.kyverno.io/description: This policy creates a default deny AuthorizationPolicy for all new Namespaces, and should be supplemented with additional AuthorizationPolicies to allow traffic as required
spec:
  rules:
    - generate:
        apiVersion: security.istio.io/v1beta1
        data:
          spec: {}
        kind: AuthorizationPolicy
        name: default-deny
        namespace: '{{request.object.metadata.name}}'
        synchronize: true
      match:
        any:
          - resources:
              kinds:
                - Namespace
      name: generate-deny-authorizationpolicy
{{{end}}}

## Use your policy

The `kyverno-policies` directory should be stored in your version control
system. After recording the state of the directory and its files,
apply the policy to a Kubernetes cluster that's running Kyverno using the
[`kyverno apply`](https://kyverno.io/docs/kyverno-cli/usage/apply/)
command with the generated YAML file.

Whenever you update your CUE policy, re-run the `cue export` command shown
above, record any changes to your files, and apply the validated policy to your
cluster.
