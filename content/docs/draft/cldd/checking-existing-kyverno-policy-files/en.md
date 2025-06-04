---
title: Checking existing Kyverno policy files using CUE
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configurations, such as Kyverno's policy files.
In Kubernetes environments, Kyverno policies can validate, mutate, generate,
and cleanup any Kubernetes resource, including custom resources -- but the
policies themselves need to be valid.
By adding this check to your development or deployment process you can catch
and fix errors in your policies before they affect downstream systems.

This guide shows you how to use the `cue` command to validate a Kyverno
policy file using
[a curated module](/getting-started/github-actions-workflows/) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

<!--more-->

## Choose a Kyverno policy file

This example is adapted from Kyverno's
[`kyverno/policies`](https://github.com/kyverno/policies/blob/main/best-practices/require-labels/require-labels.yaml)
repository, but you should use any Kyverno policy file that's relevant
to your situation:

{{{with upload "en" "policy"}}}
-- require-labels.yaml --
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
{{{end}}}

## Validate the policy file

{{{with script "en" "cue vet"}}}
cue vet -c -d '#Policy' cue.dev/x/kyverno/policy/v1@latest require-labels.yaml
{{{end}}}

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

{{{with script "en" "cue vet multiple"}}}
#norun
cue vet -c -d '#Policy' cue.dev/x/kyverno/policy/v1@latest policy/require-labels.yaml
cue vet -c -d '#Policy' cue.dev/x/kyverno/policy/v1@latest policy/disable-http.yaml
{{{end}}}

However, an easy alternative is to set up a simple CUE file that *embeds* your
workflow files and validates them all with a single command.
Read more about this option in
[Validating multiple Kyverno policy files]({{<relref".">}}) ...

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Kyverno policies + CUE]({{<relref".">}})
...
