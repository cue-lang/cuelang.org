---
title: Validating several Kyverno policy files
---

We've already seen how CUE makes it trivially easy to get started, in
[Checking existing Kyverno policy files using CUE]({{<relref"checking-existing-kyverno-policy-files">}}).
That guide finished by showing us how to validate multiple data files using
specifically constructed `cue` commands ... but wouldn't it be useful if CUE
could track which data files need to be validated against which schemas,
and then perform all those checks at once? This guide demonstrates how
to start offloading that work to CUE.

<!--more-->

## Start with a directory containing several policy files

Our example setup begins with a `kyverno-policies` directory that contains two
unrelated Kyverno policy files:

{{<columns>}}
```yaml { title="kyverno-policies/require-labels.yaml" codeToCopy="YXBpVmVyc2lvbjoga3l2ZXJuby5pby92MQpraW5kOiBDbHVzdGVyUG9saWN5Cm1ldGFkYXRhOgogIG5hbWU6IHJlcXVpcmUtbGFiZWxzCiAgYW5ub3RhdGlvbnM6CiAgICBwb2xpY2llcy5reXZlcm5vLmlvL3RpdGxlOiBSZXF1aXJlIExhYmVscwogICAgcG9saWNpZXMua3l2ZXJuby5pby9jYXRlZ29yeTogQmVzdCBQcmFjdGljZXMKICAgIHBvbGljaWVzLmt5dmVybm8uaW8vZGVzY3JpcHRpb246ID4tCiAgICAgIERlZmluZSBhbmQgdXNlIGxhYmVscyB0aGF0IGlkZW50aWZ5IHNlbWFudGljIGF0dHJpYnV0ZXMgb2YgeW91ciBhcHBsaWNhdGlvbiBvciBEZXBsb3ltZW50LgpzcGVjOgogIHZhbGlkYXRpb25GYWlsdXJlQWN0aW9uOiBBdWRpdAogIGJhY2tncm91bmQ6IHRydWUKICBydWxlczoKICAtIG5hbWU6IGNoZWNrLWZvci1sYWJlbHMKICAgIG1hdGNoOiB7YW55OiBbe3Jlc291cmNlczoge2tpbmRzOiBbUG9kXX19XX0KICAgIHZhbGlkYXRlOgogICAgICBtZXNzYWdlOiAiVGhlIGxhYmVsIGBhcHAua3ViZXJuZXRlcy5pby9uYW1lYCBpcyByZXF1aXJlZC4iCiAgICAgIHBhdHRlcm46IHttZXRhZGF0YToge2xhYmVsczoge2FwcC5rdWJlcm5ldGVzLmlvL25hbWU6ICI/KiJ9fX0K" }
# filepath: kyverno-policies/require-labels.yaml

apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: require-labels
  annotations:
    policies.kyverno.io/title: Require Labels
    policies.kyverno.io/category: Best Practices
    policies.kyverno.io/description: >-
      Define and use labels that identify semantic attributes of your application or Deployment.
spec:
  validationFailureAction: Audit
  background: true
  rules:
  - name: check-for-labels
    match: {any: [{resources: {kinds: [Pod]}}]}
    validate:
      message: "The label `app.kubernetes.io/name` is required."
      pattern: {metadata: {labels: {app.kubernetes.io/name: "?*"}}}
```
{{<columns-separator>}}
```yaml { title="kyverno-policies/require-pod-requests-limits.yaml" codeToCopy="CmFwaVZlcnNpb246IGt5dmVybm8uaW8vdjEKa2luZDogQ2x1c3RlclBvbGljeQptZXRhZGF0YToKICBuYW1lOiByZXF1aXJlLXJlcXVlc3RzLWxpbWl0cwogIGFubm90YXRpb25zOgogICAgcG9saWNpZXMua3l2ZXJuby5pby90aXRsZTogUmVxdWlyZSBMaW1pdHMgYW5kIFJlcXVlc3RzCiAgICBwb2xpY2llcy5reXZlcm5vLmlvL2NhdGVnb3J5OiBCZXN0IFByYWN0aWNlcywgRUtTIEJlc3QgUHJhY3RpY2VzCiAgICBwb2xpY2llcy5reXZlcm5vLmlvL2Rlc2NyaXB0aW9uOiA+LQogICAgICBUaGlzIHBvbGljeSB2YWxpZGF0ZXMgdGhhdCBhbGwgY29udGFpbmVycyBoYXZlIHNvbWV0aGluZyBzcGVjaWZpZWQgZm9yIG1lbW9yeSBhbmQgQ1BVCiAgICAgIHJlcXVlc3RzIGFuZCBtZW1vcnkgbGltaXRzLgpzcGVjOgogIHZhbGlkYXRpb25GYWlsdXJlQWN0aW9uOiBBdWRpdAogIGJhY2tncm91bmQ6IHRydWUKICBydWxlczoKICAtIG5hbWU6IHZhbGlkYXRlLXJlc291cmNlcwogICAgbWF0Y2g6IHthbnk6IFt7cmVzb3VyY2VzOiB7a2luZHM6IFtQb2RdfX1dfQogICAgdmFsaWRhdGU6CiAgICAgIG1lc3NhZ2U6ICJDUFUgYW5kIG1lbW9yeSByZXNvdXJjZSByZXF1ZXN0cyBhbmQgbWVtb3J5IGxpbWl0cyBhcmUgcmVxdWlyZWQgZm9yIGNvbnRhaW5lcnMuIgogICAgICBwYXR0ZXJuOgogICAgICAgIHNwZWM6CiAgICAgICAgICBjb250YWluZXJzOgogICAgICAgICAgLSByZXNvdXJjZXM6CiAgICAgICAgICAgICAgcmVxdWVzdHM6CiAgICAgICAgICAgICAgICBtZW1vcnk6ICI/KiIKICAgICAgICAgICAgICAgIGNwdTogIj8qIgogICAgICAgICAgICAgIGxpbWl0czoKICAgICAgICAgICAgICAgIG1lbW9yeTogIj8qIgogICAgICAgICAgPShpbml0Q29udGFpbmVycyk6CiAgICAgICAgICAtIHJlc291cmNlczoKICAgICAgICAgICAgICByZXF1ZXN0czoKICAgICAgICAgICAgICAgIG1lbW9yeTogIj8qIgogICAgICAgICAgICAgICAgY3B1OiAiPyoiCiAgICAgICAgICAgICAgbGltaXRzOgogICAgICAgICAgICAgICAgbWVtb3J5OiAiPyoiCiAgICAgICAgICA9KGVwaGVtZXJhbENvbnRhaW5lcnMpOgogICAgICAgICAgLSByZXNvdXJjZXM6CiAgICAgICAgICAgICAgcmVxdWVzdHM6CiAgICAgICAgICAgICAgICBtZW1vcnk6ICI/KiIKICAgICAgICAgICAgICAgIGNwdTogIj8qIgogICAgICAgICAgICAgIGxpbWl0czoKICAgICAgICAgICAgICAgIG1lbW9yeTogIj8qIgo=" }
# filepath: kyverno-policies/require-pod-requests-limits.yaml


apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: require-requests-limits
  annotations:
    policies.kyverno.io/title: Require Limits and Requests
    policies.kyverno.io/category: Best Practices, EKS Best Practices
    policies.kyverno.io/description: >-
      This policy validates that all containers have something specified for memory and CPU
      requests and memory limits.
spec:
  validationFailureAction: Audit
  background: true
  rules:
  - name: validate-resources
    match: {any: [{resources: {kinds: [Pod]}}]}
    validate:
      message: "CPU and memory resource requests and memory limits are required for containers."
      pattern:
        spec:
          containers:
          - resources:
              requests:
                memory: "?*"
                cpu: "?*"
              limits:
                memory: "?*"
          =(initContainers):
          - resources:
              requests:
                memory: "?*"
                cpu: "?*"
              limits:
                memory: "?*"
          =(ephemeralContainers):
          - resources:
              requests:
                memory: "?*"
                cpu: "?*"
              limits:
                memory: "?*"
```
{{</columns>}}

These policies are adapted from Kyverno's
[`policies`](https://github.com/kyverno/policies)
repository, but you should use policy files that are more relevant to your
situation.

## Initialise your local CUE module

CUE that uses modules from the
[Central Registry](https://registry.cue.works), as shown below, needs to exist
within its own CUE module:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```

You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).

## Embed the policy files in some CUE

CUE's [file embedding](https://cuelang.org/docs/howto/embed-files-in-cue-evaluation/)
allows the `cue` command to read data files without being told about them through
individual arguments. The following CUE enables this feature, and then *embeds*
the Kyverno policy files shown above:

```cue { title="kyverno.cue" codeToCopy="QGV4dGVybihlbWJlZCkgLy8gRmlsZSBlbWJlZGRpbmcgbXVzdCBiZSBleHBsaWNpdGx5IGVuYWJsZWQuCnBhY2thZ2UgY29uZmlnCgppbXBvcnQgImN1ZS5kZXYveC9reXZlcm5vL3BvbGljeS92MSIKCmt5dmVybm86IHsKCS8vIEVtYmVkIHRoZSBjb250ZW50cyBvZiBhbGwgWUFNTCBwb2xpY3kgZmlsZXMuCglwb2xpY2llczogXyBAZW1iZWQoZ2xvYj1reXZlcm5vLXBvbGljaWVzLyoueWFtbCkKCgkvLyBWYWxpZGF0ZSB0aGUgY29udGVudHMgb2YgZWFjaCBlbWJlZGRlZCBmaWxlIGFnYWluc3QgdGhlIHJlbGV2YW50IHNjaGVtYS4KCXBvbGljaWVzOiBbX106IHYxLiNQb2xpY3kKfQo=" }
// filepath: kyverno.cue

@extern(embed) // File embedding must be explicitly enabled.
package config

import "cue.dev/x/kyverno/policy/v1"

kyverno: {
	// Embed the contents of all YAML policy files.
	policies: _ @embed(glob=kyverno-policies/*.yaml)

	// Validate the contents of each embedded file against the relevant schema.
	policies: [_]: v1.#Policy
}
```


## Tidy your local CUE module

Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a CUE module for the first time:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).

If you see an error message mentioning "too many requests" while following this
guide, then
[login to the Central Registry](https://cue.dev/docs/login-central-registry/)
and re-run the failing command.
The Central Registry allows more requests from authenticated users.

## Validate the policy files

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYw==" }
$ cue vet -c
```

We know that all our embedded policy files are valid
because this command doesn't display any errors.

This simple `cue` command performs all the same checks as
[the previous guide]({{<relref"checking-existing-kyverno-policy-files/#validate-more-policy-files">}}),
and is also somewhat easier to remember and repeat --
but that's not the only reason to choose file embedding.
As we'll see in later guides, using this feature opens the door towards
managing a truly *unified configuration graph* ...

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Kyverno policies + CUE]({{<relref"getting-started-with-kyverno-cue">}})
...
