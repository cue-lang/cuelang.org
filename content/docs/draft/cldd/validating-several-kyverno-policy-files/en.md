---
title: Validating several Kyverno policy files
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

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
{{{with upload "en" "file 1"}}}
-- kyverno-policies/require-labels.yaml --
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
{{<columns-separator>}}
{{{with upload "en" "file 2"}}}
-- kyverno-policies/require-pod-requests-limits.yaml --

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
{{{end}}}
{{</columns>}}

These policies are adapted from Kyverno's
[`policies`](https://github.com/kyverno/policies)
repository, but you should use policy files that are more relevant to your
situation.

## Initialise your local CUE module

CUE that uses modules from the
[Central Registry](https://registry.cue.works), as shown below, needs to exist
within its own CUE module:

{{{with script "en" "cue mod init"}}}
cue mod init cue.example
{{{end}}}

You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).

## Embed the policy files in some CUE

CUE's [file embedding](https://cuelang.org/docs/howto/embed-files-in-cue-evaluation/)
allows the `cue` command to read data files without being told about them through
individual arguments. The following CUE enables this feature, and then *embeds*
the Kyverno policy files shown above:

{{{with upload "en" "cue"}}}
-- kyverno.cue --
@extern(embed) // File embedding must be explicitly enabled.
package config

import "cue.dev/x/kyverno/policy/v1"

kyverno: {
	// Embed the contents of all YAML policy files.
	policies: _ @embed(glob=kyverno-policies/*.yaml)

	// Validate the contents of each embedded file against the relevant schema.
	policies: [_]: v1.#Policy
}
{{{end}}}


## Tidy your local CUE module

Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a CUE module for the first time:

{{{with script "en" "tidy"}}}
cue mod tidy
{{{end}}}

Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).

If you see an error message mentioning "too many requests" while following this
guide, then
[login to the Central Registry](https://cue.dev/docs/login-central-registry/)
and re-run the failing command.
The Central Registry allows more requests from authenticated users.

## Validate the policy files

{{{with script "en" "cue vet"}}}
cue vet -c
{{{end}}}

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
[Getting started with Kyverno + CUE]({{<relref"getting-started-with-kyverno-cue">}})
...
