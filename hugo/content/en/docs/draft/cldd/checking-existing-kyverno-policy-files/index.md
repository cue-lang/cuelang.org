---
title: Checking existing Kyverno policy files using CUE
---

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing policies. By adding this check to your
development or deployment process you can catch and fix structural errors in policies
before they are applied by Kyverno.

This guide shows you how to use the `cue` command to validate the structure of
a Kyverno policy file using
[a curated module](../curated-module-kyverno.md) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

<!--more-->

## Choose a Kyverno policy file

This example is adapted from the
[`kyverno/policies`](https://github.com/kyverno/policies/blob/main/best-practices/require-labels/require-labels.yaml)
repository, but you should use any Kyverno policy file that's relevant
to your situation:

``` { .yaml title="require-labels.yaml" }
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

``` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#ClusterPolicy&#39; cue.dev/x/kyverno/clusterpolicy/v1@latest require-labels.yaml" }
$ cue vet -c -d '#ClusterPolicy' cue.dev/x/kyverno/clusterpolicy/v1@latest require-labels.yaml
```

This command uses the `#Policy` definition from the `kyverno/policy/v1` package
to check the policy file. Because `cue vet` doesn't display any errors,
you know that the curated module has validated the file's structure.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](../login-central-registry.md)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Validate more policy files

Kyverno provides a large set of example policies that you can adapt, so you
might well end up with multiple, separate policy files. To check each one
you could repeat the `cue vet` command, or use it with several files at once:

``` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#Policy&#39; cue.dev/x/kyverno/policy/v1@latest require-labels.yaml&#10;cue vet -c -d &#39;#Policy&#39; cue.dev/x/kyverno/policy/v1@latest disable-http.yaml limit-cpu.yaml" }
$ cue vet -c -d '#Policy' cue.dev/x/kyverno/policy/v1@latest require-labels.yaml
$ cue vet -c -d '#Policy' cue.dev/x/kyverno/policy/v1@latest disable-http.yaml limit-cpu.yaml
```

However, an easy alternative is to set up a simple CUE file that *embeds* your
policy files and validates them all with a single command.
Read more about this option in
[Validating several Kyverno policy files](../validating-several-kyverno-policy-files/index.md) ...

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Kyverno + CUE](../getting-started-with-kyverno-cue/index.md)
...
