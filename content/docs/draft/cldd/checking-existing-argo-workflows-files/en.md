---
title: Checking existing Argo Workflows files using CUE
draft: true
no_index: true
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD

# Switch to CUE tip, as this page will only be seen on tip.cuelang.org
# and it's easiest to align behaviours here, inline, rather than using
# the internal/patch/tip.diff mechanism.
export PATH=/cues/$CUELANG_CUE_TIP:$PATH
{{{end}}}

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files.
By adding this check to your development or deployment process
you can catch and fix errors before they affect downstream
systems.

This guide shows you how to use the `cue` command to validate an Argo workflow
file using a
[curated module](https://cuelang.org/docs/draft/cldd/curated-modules-faq/) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

## Login to the Central Registry

{{{with script "en" "cue login"}}}
#norun
cue login
{{{end}}}
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its modules.

## Choose an Argo workflow file

This example comes from
[the Argo Workflows project](https://github.com/argoproj/argo-workflows/blob/main/examples/arguments-parameters.yaml),
but you should use any Argo workflow file that's relevant to your situation.

{{{with upload "en" "workflow"}}}
-- workflow.yml --
apiVersion: argoproj.io/v1alpha1
kind: Workflow
metadata:
  generateName: arguments-parameters-
spec:
  entrypoint: print-message
  arguments:
    parameters:
    - name: message
      value: hello world
  templates:
  - name: print-message
    inputs:
      parameters:
      - name: message
    container:
      image: busybox
      command: [echo]
      args: ["{{inputs.parameters.message}}"]
{{{end}}}

## Validate the workflow file

{{{with script "en" "cue vet"}}}
cue vet -c -d '#Workflow' github.com/cue-tmp/jsonschema-pub/exp3/argocd@latest workflow.yml
{{{end}}}

This command uses the `#Workflow` definition from the `argocd` package to check
the `workflow.yml` file. Because `cue vet` doesn't display any errors, you know
that the curated module has validated your configuration file.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Argo Workflows + CUE]({{<relref"getting-started-with-argo-workflows-cue">}})
...
