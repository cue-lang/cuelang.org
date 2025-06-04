---
title: Getting started with Kyverno + CUE
---

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for the
[policy files](https://kyverno.io/policies) used by
[Kyverno](https://kyverno.io/).
This guide shows you how to get started defining your Kyverno policies in CUE using
[a curated module](/getting-started/kyverno-policies/)
from
[the schema library](/getting-started/schema-library/).

<!--more-->

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```

You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).

## Create a policy

Declare a Kyverno policy in CUE. This one is based on an example from Kyverno's
[`policies`](https://github.com/kyverno/policies/blob/main/istio/create-authorizationpolicy/create-authorizationpolicy.yaml)
repository, but you should use policies that are more relevant to your
situation.

```cue { title="kyverno-policies/create-authorizationpolicy.cue" codeToCopy="cGFja2FnZSBjaWNkCgppbXBvcnQgImN1ZS5kZXYveC9reXZlcm5vL2NsdXN0ZXJwb2xpY3kvdjEiCgpjbHVzdGVyUG9saWNpZXM6IGNyZWF0ZUF1dGhvcml6YXRpb25Qb2xpY3k6IHYxLiNDbHVzdGVyUG9saWN5ICYgewoJYXBpVmVyc2lvbjogImt5dmVybm8uaW8vdjEiCglraW5kOiAgICAgICAiQ2x1c3RlclBvbGljeSIKCW1ldGFkYXRhOiB7CgkJbmFtZTogImNyZWF0ZS1hdXRob3JpemF0aW9ucG9saWN5IgoJCWFubm90YXRpb25zOiB7CgkJCSJwb2xpY2llcy5reXZlcm5vLmlvL3RpdGxlIjogICAgICAgIkNyZWF0ZSBJc3RpbyBEZW55IEF1dGhvcml6YXRpb25Qb2xpY3kiCgkJCSJwb2xpY2llcy5reXZlcm5vLmlvL2NhdGVnb3J5IjogICAgIklzdGlvIgoJCQkicG9saWNpZXMua3l2ZXJuby5pby9zdWJqZWN0IjogICAgICJBdXRob3JpemF0aW9uUG9saWN5IgoJCQkicG9saWNpZXMua3l2ZXJuby5pby9kZXNjcmlwdGlvbiI6ICJUaGlzIHBvbGljeSBjcmVhdGVzIGEgZGVmYXVsdCBkZW55IEF1dGhvcml6YXRpb25Qb2xpY3kgZm9yIGFsbCBuZXcgTmFtZXNwYWNlcywgYW5kIHNob3VsZCBiZSBzdXBwbGVtZW50ZWQgd2l0aCBhZGRpdGlvbmFsIEF1dGhvcml6YXRpb25Qb2xpY2llcyB0byBhbGxvdyB0cmFmZmljIGFzIHJlcXVpcmVkIgoJCX0KCX0KCXNwZWM6IHJ1bGVzOiBbewoJCW5hbWU6ICJnZW5lcmF0ZS1kZW55LWF1dGhvcml6YXRpb25wb2xpY3kiCgkJbWF0Y2g6IGFueTogW3sKCQkJcmVzb3VyY2VzOiBraW5kczogWyJOYW1lc3BhY2UiXQoJCX1dCgkJZ2VuZXJhdGU6IHsKCQkJYXBpVmVyc2lvbjogICJzZWN1cml0eS5pc3Rpby5pby92MWJldGExIgoJCQlraW5kOiAgICAgICAgIkF1dGhvcml6YXRpb25Qb2xpY3kiCgkJCW5hbWU6ICAgICAgICAiZGVmYXVsdC1kZW55IgoJCQluYW1lc3BhY2U6ICAgInt7cmVxdWVzdC5vYmplY3QubWV0YWRhdGEubmFtZX19IgoJCQlzeW5jaHJvbml6ZTogdHJ1ZQoJCQlkYXRhOiBzcGVjOiB7fQoJCX0KCX1dCn0K" }
// filepath: kyverno-policies/create-authorizationpolicy.cue

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
```

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

## Validate your policy

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAuL2t5dmVybm8tcG9saWNpZXM=" }
$ cue vet -c ./kyverno-policies
```

Because `cue vet` doesn't display any errors,
you know that the curated schema has validated your policy.

## Export your policy as YAML

```text { title="TERMINAL" type="terminal" codeToCopy="Y2Qga3l2ZXJuby1wb2xpY2llcwpjdWUgZXhwb3J0IC0tb3V0ZmlsZSBjcmVhdGUtYXV0aG9yaXphdGlvbnBvbGljeS55bWwgLWUgY2x1c3RlclBvbGljaWVzLmNyZWF0ZUF1dGhvcml6YXRpb25Qb2xpY3k=" }
$ cd kyverno-policies
$ cue export --outfile create-authorizationpolicy.yml -e clusterPolicies.createAuthorizationPolicy
```

If you chose to export the example policy shown above,
your validated YAML workflow will look like this:

```yml { title="kyverno-policies/create-authorizationpolicy.yml" codeToCopy="YXBpVmVyc2lvbjoga3l2ZXJuby5pby92MQpraW5kOiBDbHVzdGVyUG9saWN5Cm1ldGFkYXRhOgogIG5hbWU6IGNyZWF0ZS1hdXRob3JpemF0aW9ucG9saWN5CiAgYW5ub3RhdGlvbnM6CiAgICBwb2xpY2llcy5reXZlcm5vLmlvL3RpdGxlOiBDcmVhdGUgSXN0aW8gRGVueSBBdXRob3JpemF0aW9uUG9saWN5CiAgICBwb2xpY2llcy5reXZlcm5vLmlvL2NhdGVnb3J5OiBJc3RpbwogICAgcG9saWNpZXMua3l2ZXJuby5pby9zdWJqZWN0OiBBdXRob3JpemF0aW9uUG9saWN5CiAgICBwb2xpY2llcy5reXZlcm5vLmlvL2Rlc2NyaXB0aW9uOiBUaGlzIHBvbGljeSBjcmVhdGVzIGEgZGVmYXVsdCBkZW55IEF1dGhvcml6YXRpb25Qb2xpY3kgZm9yIGFsbCBuZXcgTmFtZXNwYWNlcywgYW5kIHNob3VsZCBiZSBzdXBwbGVtZW50ZWQgd2l0aCBhZGRpdGlvbmFsIEF1dGhvcml6YXRpb25Qb2xpY2llcyB0byBhbGxvdyB0cmFmZmljIGFzIHJlcXVpcmVkCnNwZWM6CiAgcnVsZXM6CiAgICAtIGdlbmVyYXRlOgogICAgICAgIGFwaVZlcnNpb246IHNlY3VyaXR5LmlzdGlvLmlvL3YxYmV0YTEKICAgICAgICBkYXRhOgogICAgICAgICAgc3BlYzoge30KICAgICAgICBraW5kOiBBdXRob3JpemF0aW9uUG9saWN5CiAgICAgICAgbmFtZTogZGVmYXVsdC1kZW55CiAgICAgICAgbmFtZXNwYWNlOiAne3tyZXF1ZXN0Lm9iamVjdC5tZXRhZGF0YS5uYW1lfX0nCiAgICAgICAgc3luY2hyb25pemU6IHRydWUKICAgICAgbWF0Y2g6CiAgICAgICAgYW55OgogICAgICAgICAgLSByZXNvdXJjZXM6CiAgICAgICAgICAgICAga2luZHM6CiAgICAgICAgICAgICAgICAtIE5hbWVzcGFjZQogICAgICBuYW1lOiBnZW5lcmF0ZS1kZW55LWF1dGhvcml6YXRpb25wb2xpY3kK" }
# filepath: kyverno-policies/create-authorizationpolicy.yml

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
```

## Use your policy

The `kyverno-policies` directory should be stored in your version control
system. After recording the directory and its files, apply the policy to a
Kubernetes cluster that's running Kyverno using the
[`kyverno apply`](https://kyverno.io/docs/kyverno-cli/usage/apply/)
command with the generated YAML file.

Whenever you update your CUE policy, re-run the `cue export` command shown
above, record any changes to your files, and apply the validated policy to your
cluster.
