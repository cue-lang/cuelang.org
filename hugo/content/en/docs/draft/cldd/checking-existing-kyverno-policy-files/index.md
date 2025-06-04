---
title: Checking existing Kyverno policy files using CUE
---

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing policies. By adding this check to your
development or deployment process you can catch and fix structural errors
before they are applied by Kyverno.

This guide shows you how to use the `cue` command to validate the structure of
a Kyverno policy file using
[a curated module](/getting-started/kyverno/) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

<!--more-->

## Choose a Kyverno policy file

This example is adapted from the
[`kyverno/policies`](https://github.com/kyverno/policies/blob/main/best-practices/require-labels/require-labels.yaml)
repository, but you should use any Kyverno policy file that's relevant
to your situation:

```yaml { title="require-labels.yaml" codeToCopy="YXBpVmVyc2lvbjoga3l2ZXJuby5pby92MQpraW5kOiBDbHVzdGVyUG9saWN5Cm1ldGFkYXRhOgogIG5hbWU6IHJlcXVpcmUtbGFiZWxzCiAgYW5ub3RhdGlvbnM6CiAgICBwb2xpY2llcy5reXZlcm5vLmlvL3RpdGxlOiBSZXF1aXJlIExhYmVscwogICAgcG9saWNpZXMua3l2ZXJuby5pby9jYXRlZ29yeTogQmVzdCBQcmFjdGljZXMKICAgIHBvbGljaWVzLmt5dmVybm8uaW8vZGVzY3JpcHRpb246ID4tCiAgICAgIERlZmluZSBhbmQgdXNlIGxhYmVscyB0aGF0IGlkZW50aWZ5IHNlbWFudGljIGF0dHJpYnV0ZXMgb2YgeW91ciBhcHBsaWNhdGlvbiBvciBEZXBsb3ltZW50LgpzcGVjOgogIHZhbGlkYXRpb25GYWlsdXJlQWN0aW9uOiBBdWRpdAogIGJhY2tncm91bmQ6IHRydWUKICBydWxlczoKICAtIG5hbWU6IGNoZWNrLWZvci1sYWJlbHMKICAgIG1hdGNoOiB7YW55OiBbe3Jlc291cmNlczoge2tpbmRzOiBbUG9kXX19XX0KICAgIHZhbGlkYXRlOgogICAgICBtZXNzYWdlOiAiVGhlIGxhYmVsIGBhcHAua3ViZXJuZXRlcy5pby9uYW1lYCBpcyByZXF1aXJlZC4iCiAgICAgIHBhdHRlcm46IHttZXRhZGF0YToge2xhYmVsczoge2FwcC5rdWJlcm5ldGVzLmlvL25hbWU6ICI/KiJ9fX0K" }
# filepath: require-labels.yaml

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

## Validate the policy file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1BvbGljeScgY3VlLmRldi94L2t5dmVybm8vcG9saWN5L3YxQGxhdGVzdCByZXF1aXJlLWxhYmVscy55YW1s" }
$ cue vet -c -d '#Policy' cue.dev/x/kyverno/policy/v1@latest require-labels.yaml
```

This command uses the `#Policy` definition from the `kyverno/policy/v1` package
to check the policy file. Because `cue vet` doesn't display any errors,
you know that the curated module has validated your configuration file.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](https://cue.dev/docs/login-central-registry/)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Validate more policy files

Kyverno provides a large set of example policies that you can adapt, so you
might well end up with multiple, separate policy files. To check each policy
file you could repeat the `cue vet` command for one or more files, like this:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1BvbGljeScgY3VlLmRldi94L2t5dmVybm8vcG9saWN5L3YxQGxhdGVzdCBwb2xpY3kvcmVxdWlyZS1sYWJlbHMueWFtbApjdWUgdmV0IC1jIC1kICcjUG9saWN5JyBjdWUuZGV2L3gva3l2ZXJuby9wb2xpY3kvdjFAbGF0ZXN0IHBvbGljeS9kaXNhYmxlLWh0dHAueWFtbA==" }
$ cue vet -c -d '#Policy' cue.dev/x/kyverno/policy/v1@latest policy/require-labels.yaml
$ cue vet -c -d '#Policy' cue.dev/x/kyverno/policy/v1@latest policy/disable-http.yaml
```

However, an easy alternative is to set up a simple CUE file that *embeds* your
workflow files and validates them all with a single command.
Read more about this option in
[Validating several Kyverno policy files]({{<relref"validating-several-kyverno-policy-files">}}) ...

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Kyverno + CUE]({{<relref"getting-started-with-kyverno-cue">}})
...
