---
title: Checking existing Argo Workflows files using CUE
---

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files.
By adding this check to your development or deployment process
you can catch and fix errors before they affect downstream
systems.

This guide shows you how to use the `cue` command to validate an Argo workflow
file using
[a curated module](../curated-module-argo-workflows.md) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

<!--more-->

## Choose an Argo workflow file

This example comes from
[the Argo Workflows project](https://github.com/argoproj/argo-workflows/blob/main/examples/arguments-parameters.yaml),
but you should use any Argo workflow file that's relevant to your situation.

``` { .yaml title="workflow.yml" }
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
```

## Validate the workflow file

``` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#Workflow&#39; cue.dev/x/argocd@latest workflow.yml" }
$ cue vet -c -d '#Workflow' cue.dev/x/argocd@latest workflow.yml
```

This command uses the `#Workflow` definition from the `argocd` package to check
the `workflow.yml` file. Because `cue vet` doesn't display any errors, you know
that the curated module has validated your configuration file.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](../login-central-registry.md)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Argo Workflows + CUE](../getting-started-with-argo-workflows-cue/index.md)
...
