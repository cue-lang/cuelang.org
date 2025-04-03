---
title: Checking existing Argo Workflows files using CUE
---

[Central Registry](/getting-started/with-the-central-registry/) >>
[Schema Library](/getting-started/schema-library/) >>
[Argo Workflows](/getting-started/argo-workflows/) >>
[Checking existing Argo Workflows files using CUE](.)
<hr>

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files.
By adding this check to your development or deployment process
you can catch and fix errors before they affect downstream
systems.

This guide shows you how to use the `cue` command to validate an Argo workflow
file using
[a curated module](/getting-started/argo-workflows/) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

The latest pre-release of the `cue` command is required -- please
[upgrade to this version](/docs/installing-cue/) if it's not already installed:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.13.0-alpha.3
...
```

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2luICMgb25seSBkdXJpbmcgYmV0YQ==" }
$ cue login # only during beta
```
The
[Central Registry](https://registry.cue.works)
requires authentication while it's in beta testing,
so you need to login before you can use its schemas.

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

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1dvcmtmbG93JyBjdWUuZGV2L3gvYXJnb2NkQGxhdGVzdCB3b3JrZmxvdy55bWw=" }
$ cue vet -c -d '#Workflow' cue.dev/x/argocd@latest workflow.yml
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

---
[Central Registry](/getting-started/with-the-central-registry/) >>
[Schema Library](/getting-started/schema-library/) >>
[Argo Workflows](/getting-started/argo-workflows/) >>
[Checking existing Argo Workflows files using CUE](.)
