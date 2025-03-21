---
title: Checking existing Argo Workflows files using CUE
draft: true
no_index: true
---

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

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its modules.

## Choose an Argo workflow file

This example comes from
[the Argo Workflows project](https://github.com/argoproj/argo-workflows/blob/main/examples/arguments-parameters.yaml),
but you should use any Argo workflow file that's relevant to your situation.

```yml { title="workflow.yml" codeToCopy="YXBpVmVyc2lvbjogYXJnb3Byb2ouaW8vdjFhbHBoYTEKa2luZDogV29ya2Zsb3cKbWV0YWRhdGE6CiAgZ2VuZXJhdGVOYW1lOiBhcmd1bWVudHMtcGFyYW1ldGVycy0Kc3BlYzoKICBlbnRyeXBvaW50OiBwcmludC1tZXNzYWdlCiAgYXJndW1lbnRzOgogICAgcGFyYW1ldGVyczoKICAgIC0gbmFtZTogbWVzc2FnZQogICAgICB2YWx1ZTogaGVsbG8gd29ybGQKICB0ZW1wbGF0ZXM6CiAgLSBuYW1lOiBwcmludC1tZXNzYWdlCiAgICBpbnB1dHM6CiAgICAgIHBhcmFtZXRlcnM6CiAgICAgIC0gbmFtZTogbWVzc2FnZQogICAgY29udGFpbmVyOgogICAgICBpbWFnZTogYnVzeWJveAogICAgICBjb21tYW5kOiBbZWNob10KICAgICAgYXJnczogWyJ7e2lucHV0cy5wYXJhbWV0ZXJzLm1lc3NhZ2V9fSJdCg==" }
# filepath: workflow.yml

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

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1dvcmtmbG93JyBnaXRodWIuY29tL2N1ZS10bXAvanNvbnNjaGVtYS1wdWIvZXhwMy9hcmdvY2RAbGF0ZXN0IHdvcmtmbG93LnltbA==" }
$ cue vet -c -d '#Workflow' github.com/cue-tmp/jsonschema-pub/exp3/argocd@latest workflow.yml
```

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
