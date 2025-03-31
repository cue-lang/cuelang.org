---
title: Getting started with Argo Workflows + CUE
---

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for the
[YAML workflow files](https://argo-workflows.readthedocs.io/en/latest/fields/)
used by [Argo Workflows](https://argo-workflows.readthedocs.io/en/latest/).
This guide shows you how to get started defining your Argo workflows in CUE using
[a curated module](/getting-started/argo-workflows/)
from
[the schema library](/getting-started/schema-library/).

The latest pre-release of the `cue` command is required -- please
[upgrade to this version](TODO) if it's not already installed:
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

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```
You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).
It makes sense for your CUE module to exist at the root of a source code
repository, but the commands in this guide will work in any setup.

## Create an Argo workflow

Declare an Argo workflow in CUE. This one comes from
[Argo's examples](https://github.com/argoproj/argo-workflows/blob/main/examples/steps.yaml):

```cue { title="workflow.cue" codeToCopy="cGFja2FnZSBjaWNkCgppbXBvcnQgYXJnb3dvcmtmbG93cyAidGVzdC5jdWUud29ya3MveDEvYXJnb2NkIgoKd29ya2Zsb3dzOiBleGFtcGxlOiBhcmdvd29ya2Zsb3dzLiNXb3JrZmxvdyAmIHsKCS8vIFRoaXMgdGVtcGxhdGUgZGVtb25zdHJhdGVzIGEgc3RlcHMgdGVtcGxhdGUgYW5kIGhvdyB0byBjb250cm9sIHNlcXVlbnRpYWwgdnMuIHBhcmFsbGVsIHN0ZXBzLgoJLy8gSW4gdGhpcyBleGFtcGxlLCB0aGUgaGVsbG8xIGNvbXBsZXRlcyBiZWZvcmUgdGhlIGhlbGxvMmEsIGFuZCBoZWxsbzJiIHN0ZXBzLCB3aGljaCBydW4gaW4gcGFyYWxsZWwuCglhcGlWZXJzaW9uOiAiYXJnb3Byb2ouaW8vdjFhbHBoYTEiCglraW5kOiAgICAgICAiV29ya2Zsb3ciCgltZXRhZGF0YTogZ2VuZXJhdGVOYW1lOiAic3RlcHMtIgoJc3BlYzogewoJCWVudHJ5cG9pbnQ6ICJoZWxsby1oZWxsby1oZWxsbyIKCQl0ZW1wbGF0ZXM6IFt7CgkJCW5hbWU6ICJoZWxsby1oZWxsby1oZWxsbyIKCQkJc3RlcHM6IFtbewoJCQkJbmFtZTogICAgICJoZWxsbzEiCgkJCQl0ZW1wbGF0ZTogInByaW50LW1lc3NhZ2UiCgkJCQlhcmd1bWVudHM6IHBhcmFtZXRlcnM6IFt7bmFtZTogIm1lc3NhZ2UiLCB2YWx1ZTogImhlbGxvMSJ9XQoJCQl9XSwgW3sKCQkJCW5hbWU6ICAgICAiaGVsbG8yYSIKCQkJCXRlbXBsYXRlOiAicHJpbnQtbWVzc2FnZSIKCQkJCWFyZ3VtZW50czogcGFyYW1ldGVyczogW3tuYW1lOiAibWVzc2FnZSIsIHZhbHVlOiAiaGVsbG8yYSJ9XQoJCQl9LCB7CgkJCQluYW1lOiAgICAgImhlbGxvMmIiCgkJCQl0ZW1wbGF0ZTogInByaW50LW1lc3NhZ2UiCgkJCQlhcmd1bWVudHM6IHBhcmFtZXRlcnM6IFt7bmFtZTogIm1lc3NhZ2UiLCB2YWx1ZTogImhlbGxvMmIifV0KCQkJfV0sCgkJCV0KCQl9LCB7CgkJCW5hbWU6ICJwcmludC1tZXNzYWdlIgoJCQlpbnB1dHM6IHBhcmFtZXRlcnM6IFt7bmFtZTogIm1lc3NhZ2UifV0KCQkJY29udGFpbmVyOiB7CgkJCQlpbWFnZTogImJ1c3lib3giCgkJCQljb21tYW5kOiBbImVjaG8iXQoJCQkJYXJnczogWyJ7e2lucHV0cy5wYXJhbWV0ZXJzLm1lc3NhZ2V9fSJdCgkJCX0KCQl9XQoJfQp9Cg==" }
// filepath: workflow.cue

package cicd

import argoworkflows "test.cue.works/x1/argocd"

workflows: example: argoworkflows.#Workflow & {
	// This template demonstrates a steps template and how to control sequential vs. parallel steps.
	// In this example, the hello1 completes before the hello2a, and hello2b steps, which run in parallel.
	apiVersion: "argoproj.io/v1alpha1"
	kind:       "Workflow"
	metadata: generateName: "steps-"
	spec: {
		entrypoint: "hello-hello-hello"
		templates: [{
			name: "hello-hello-hello"
			steps: [[{
				name:     "hello1"
				template: "print-message"
				arguments: parameters: [{name: "message", value: "hello1"}]
			}], [{
				name:     "hello2a"
				template: "print-message"
				arguments: parameters: [{name: "message", value: "hello2a"}]
			}, {
				name:     "hello2b"
				template: "print-message"
				arguments: parameters: [{name: "message", value: "hello2b"}]
			}],
			]
		}, {
			name: "print-message"
			inputs: parameters: [{name: "message"}]
			container: {
				image: "busybox"
				command: ["echo"]
				args: ["{{inputs.parameters.message}}"]
			}
		}]
	}
}
```
In later guides we'll add more entries to the `workflows` struct.

The `import` at the top references the appropriate curated module for the workflow.
Its path is currently temporary, but only while its proper location is being decided.
The temporary path isn't a problem because one important property of the
[Central Registry](https://registry.cue.works)
is that, once a schema is published, it will always be
available at that location.
When the curated module’s location is finalised and versions are published
under the new path, you can use the
[`cue refactor imports`](https://cuelang.org/docs/reference/command/cue-help-refactor-imports/)
command to update your CUE easily, so it reflects the new location.

## Tidy your local CUE module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a curated module for the first time.

## Validate your workflow

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYw==" }
$ cue vet -c
```
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your workflow.

## Export your workflow as YAML

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgd29ya2Zsb3cueW1sIC1lIHdvcmtmbG93cy5leGFtcGxl" }
$ cue export --outfile workflow.yml -e workflows.example
```
If you chose to export the `workflows.example` shown above,
your validated YAML workflow will look like this:
```yml { title="workflow.yml" codeToCopy="YXBpVmVyc2lvbjogYXJnb3Byb2ouaW8vdjFhbHBoYTEKa2luZDogV29ya2Zsb3cKbWV0YWRhdGE6CiAgZ2VuZXJhdGVOYW1lOiBzdGVwcy0Kc3BlYzoKICBlbnRyeXBvaW50OiBoZWxsby1oZWxsby1oZWxsbwogIHRlbXBsYXRlczoKICAgIC0gbmFtZTogaGVsbG8taGVsbG8taGVsbG8KICAgICAgc3RlcHM6CiAgICAgICAgLSAtIG5hbWU6IGhlbGxvMQogICAgICAgICAgICB0ZW1wbGF0ZTogcHJpbnQtbWVzc2FnZQogICAgICAgICAgICBhcmd1bWVudHM6CiAgICAgICAgICAgICAgcGFyYW1ldGVyczoKICAgICAgICAgICAgICAgIC0gbmFtZTogbWVzc2FnZQogICAgICAgICAgICAgICAgICB2YWx1ZTogaGVsbG8xCiAgICAgICAgLSAtIG5hbWU6IGhlbGxvMmEKICAgICAgICAgICAgdGVtcGxhdGU6IHByaW50LW1lc3NhZ2UKICAgICAgICAgICAgYXJndW1lbnRzOgogICAgICAgICAgICAgIHBhcmFtZXRlcnM6CiAgICAgICAgICAgICAgICAtIG5hbWU6IG1lc3NhZ2UKICAgICAgICAgICAgICAgICAgdmFsdWU6IGhlbGxvMmEKICAgICAgICAgIC0gbmFtZTogaGVsbG8yYgogICAgICAgICAgICB0ZW1wbGF0ZTogcHJpbnQtbWVzc2FnZQogICAgICAgICAgICBhcmd1bWVudHM6CiAgICAgICAgICAgICAgcGFyYW1ldGVyczoKICAgICAgICAgICAgICAgIC0gbmFtZTogbWVzc2FnZQogICAgICAgICAgICAgICAgICB2YWx1ZTogaGVsbG8yYgogICAgLSBuYW1lOiBwcmludC1tZXNzYWdlCiAgICAgIGlucHV0czoKICAgICAgICBwYXJhbWV0ZXJzOgogICAgICAgICAgLSBuYW1lOiBtZXNzYWdlCiAgICAgIGNvbnRhaW5lcjoKICAgICAgICBpbWFnZTogYnVzeWJveAogICAgICAgIGNvbW1hbmQ6CiAgICAgICAgICAtIGVjaG8KICAgICAgICBhcmdzOgogICAgICAgICAgLSAne3tpbnB1dHMucGFyYW1ldGVycy5tZXNzYWdlfX0nCg==" }
# filepath: workflow.yml

apiVersion: argoproj.io/v1alpha1
kind: Workflow
metadata:
  generateName: steps-
spec:
  entrypoint: hello-hello-hello
  templates:
    - name: hello-hello-hello
      steps:
        - - name: hello1
            template: print-message
            arguments:
              parameters:
                - name: message
                  value: hello1
        - - name: hello2a
            template: print-message
            arguments:
              parameters:
                - name: message
                  value: hello2a
          - name: hello2b
            template: print-message
            arguments:
              parameters:
                - name: message
                  value: hello2b
    - name: print-message
      inputs:
        parameters:
          - name: message
      container:
        image: busybox
        command:
          - echo
        args:
          - '{{inputs.parameters.message}}'
```
## Run your workflow

You can now
[trigger the Argo workflow](https://argo-workflows.readthedocs.io/en/latest/quick-start/#submit-an-example-workflow)
using your validated YAML workflow file.

The `cue.mod` directory needs to be stored in your source code repository,
along with your `workflow.cue` and `workflow.yml` files.
Whenever you update your CUE workflow, re-run the `cue export` command shown
above, and then record any changes to these files and directories.
