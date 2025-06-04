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

Our setup begins with a `policy` directory that contains two unrelated Kyverno
policy files:

{{<columns>}}
{{{with upload "en" "file 1"}}}
-- policy/require-labels.yaml --
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
-- policy/require-pod-requests-limits.yaml --

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
[`kyverno/policies`](https://github.com/kyverno/policies/blob/main/best-practices/require-labels/require-labels.yaml)
repository, but you should use policies that are more relevant to your
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

## Embed the workflow files in some CUE

CUE's [file embedding](https://cuelang.org/docs/howto/embed-files-in-cue-evaluation/)
allows the `cue` command to read data files without being told about them through
individual arguments. The following CUE enables this feature, and then *embeds*
the GitHub Actions workflow files shown above:

{{{with upload "en" "cue"}}}
-- github.cue --
@extern(embed) // File embedding must be explicitly enabled.
package config

import "cue.dev/x/githubactions"

github: {
	// Embed the contents of all YAML workflow files.
	workflows: _ @embed(glob=.github/workflows/*.yml)

	// Validate the contents of each embedded file against the relevant schema.
	workflows: [_]: githubactions.#Workflow
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

## Validate the workflow files

{{{with script "en" "cue vet"}}}
cue vet -c
{{{end}}}

We know that all our embedded workflow files are valid
because this command doesn't display any errors.

This simple `cue` command performs all the same checks as
[the previous guide]({{<relref"checking-existing-github-actions-files/#validate-more-workflow-files">}}),
and is also somewhat easier to remember and repeat --
but that's not the only reason to choose file embedding.
As we'll see in later guides, using this feature opens the door towards
managing a truly *unified configuration graph* ...

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GitHub Actions + CUE]({{<relref"getting-started-with-github-actions-cue">}})
...
