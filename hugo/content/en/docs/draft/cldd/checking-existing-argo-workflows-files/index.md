---
title: Checking existing Argo Workflows files using CUE
draft: true
no_index: true
---

{{<info>}}
[Curated modules]({{<relref"curated-modules-faq">}})
are a work in progress and your feedback is important!
Please [report any issues]({{<report-issue-url>}}) you find.
{{</info>}}

The easiest way to start taking advantage of CUE's powerful validation is to
use it to check existing configuration files that you normally update by hand.
By adding this check to your development or deployment process, manually
introduced data errors can be caught and fixed before they affect downstream
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

```yml { title="workflow.yml" codeToCopy="YXBpVmVyc2lvbjogYXJnb3Byb2ouaW8vdjFhbHBoYTEKa2luZDogV29ya2Zsb3cKbWV0YWRhdGE6CiAgZ2VuZXJhdGVOYW1lOiBhcmd1bWVudHMtcGFyYW1ldGVycy0Kc3BlYzoKICBlbnRyeXBvaW50OiBwcmludC1tZXNzYWdlCiAgIyBQYXJhbWV0ZXJzIGNhbiBiZSBwYXNzZWQvb3ZlcnJpZGRlbiB2aWEgdGhlIGFyZ28gQ0xJLgogICMgVG8gb3ZlcnJpZGUgdGhlIHByaW50ZWQgbWVzc2FnZSwgcnVuIGBhcmdvIHN1Ym1pdGAgd2l0aCB0aGUgLXAgb3B0aW9uOgogICMgJCBhcmdvIHN1Ym1pdCBleGFtcGxlcy9hcmd1bWVudHMtcGFyYW1ldGVycy55YW1sIC1wIG1lc3NhZ2U9Imdvb2RieWUgd29ybGQiCiAgYXJndW1lbnRzOgogICAgcGFyYW1ldGVyczoKICAgIC0gbmFtZTogbWVzc2FnZQogICAgICB2YWx1ZTogaGVsbG8gd29ybGQKCiAgdGVtcGxhdGVzOgogIC0gbmFtZTogcHJpbnQtbWVzc2FnZQogICAgaW5wdXRzOgogICAgICBwYXJhbWV0ZXJzOgogICAgICAtIG5hbWU6IG1lc3NhZ2UKICAgIGNvbnRhaW5lcjoKICAgICAgaW1hZ2U6IGJ1c3lib3gKICAgICAgY29tbWFuZDogW2VjaG9dCiAgICAgIGFyZ3M6IFsie3tpbnB1dHMucGFyYW1ldGVycy5tZXNzYWdlfX0iXQo=" }
# filepath: workflow.yml

apiVersion: argoproj.io/v1alpha1
kind: Workflow
metadata:
  generateName: arguments-parameters-
spec:
  entrypoint: print-message
  # Parameters can be passed/overridden via the argo CLI.
  # To override the printed message, run `argo submit` with the -p option:
  # $ argo submit examples/arguments-parameters.yaml -p message="goodbye world"
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

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyBnaXRodWIuY29tL2N1ZS10bXAvanNvbnNjaGVtYS1wdWIvZXhwMy9hcmdvY2RAbGF0ZXN0IHdvcmtmbG93LnltbCAtZCAnI1dvcmtmbG93Jw==" }
$ cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/argocd@latest workflow.yml -d '#Workflow'
```

Because `cue vet` doesn't display any errors,
you know that the curated module has validated your configuration file.

The module path used here is temporary, and will be given a proper home soon.
However, because one important property of the
[Central Registry](https://registry.cue.works) is that curated modules are
never removed, **you can rely on this "temporary" path for as long as you
need** -- it will not stop working and break your processes in the future.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with Argo Workflows + CUE]({{<relref"getting-started-with-argo-workflows-cue">}})
...
