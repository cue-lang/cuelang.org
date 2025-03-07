---
title: Getting started with Argo Workflows + CUE
draft: true
no_index: true
---

{{<info>}}
Curated modules are a work in progress and your feedback is important!
Please [report any issues]({{<report-issue-url>}}) you find.
{{</info>}}

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[YAML workflow files](https://argo-workflows.readthedocs.io/en/latest/fields/)
used by [Argo Workflows](https://argo-workflows.readthedocs.io/en/latest/).

This guide shows you how to get started defining your Argo workflows in CUE using
[curated modules]({{<relref"curated-modules-faq">}}).

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its schemas.

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```
You can choose any module name you like - it's easy to
[change it later]({{<relref"docs/reference/command/cue-help-mod-rename">}}).
It makes sense for your CUE module to exist at the root of a git repository,
but the commands in this guide will work in any setup.

## Create an Argo workflow

Declare an Argo workflow in CUE. This one is based on a comprehensive example from
[Argo's documentation](https://github.com/argoproj/argo-workflows/blob/main/examples/ci.yaml):

{{< code-tabs >}}
{{< code-tab name="workflow.cue" language="cue" area="top-left" >}}
package cicd

import argoworkflows "github.com/cue-tmp/jsonschema-pub/exp3/argocd"

workflows: example: argoworkflows.#Workflow & {
	apiVersion: "argoproj.io/v1alpha1"
	kind:       "Workflow"
	metadata: generateName: "ci-example-"
	spec: {
		// entrypoint is the name of the template used as the starting point of the workflow
		entrypoint: "ci-example"
		// the 'ci-example' template accepts a parameter 'revision', with a default of 'cfe12d6'.
		// this can be overridden via argo CLI (e.g. `argo submit ci.yaml -p revision=0dea2d0`)
		arguments: {
			parameters: [{
				name:  "revision"
				value: "cfe12d6"
			}]
		}
		// a temporary volume, named workdir, will be used as a working directory
		// for this workflow. This volume is passed around from step to step.
		volumeClaimTemplates: [{
			metadata: name: "workdir"
			spec: {
				accessModes: ["ReadWriteOnce"]
				resources: requests: storage: "1Gi"
			}
		}]
		templates: [{
			name: "ci-example"
			inputs: parameters: [{name: "revision"}]
			steps: [[{
				name:     "build"
				template: "build-golang-example"
				arguments: parameters: [{
					name:  "revision"
					value: "{{inputs.parameters.revision}}"
				}]
			}], [{
				// the test step expands into three parallel steps running
				// different operating system images. each mounts the workdir
				// and runs the compiled binary from the build step.
				name:     "test"
				template: "run-hello"
				arguments: parameters: [{
					name:  "os-image"
					value: "{{item.image}}:{{item.tag}}"
				}]
				withItems: [{
					image: "debian", tag: "9.1"
				}, {
					image: "alpine", tag: "3.6"
				}, {
					image: "ubuntu", tag: "17.10"
				}]
			}],
			]
		}, {
			name: "build-golang-example"
			inputs: {
				parameters: [{name: "revision"}]
				artifacts: [{
					name: "code"
					path: "/go/src/github.com/golang/example"
					git: {
						repo:     "https://github.com/golang/example.git"
						revision: "{{inputs.parameters.revision}}"
					}
				}]
			}
			container: {
				image: "golang:1.8"
				command: ["sh", "-c"]
				args: [" cd /go/src/github.com/golang/example/hello && git status && go build -v . "]
				volumeMounts: [{
					name:      "workdir"
					mountPath: "/go"
				}]
			}
		}, {
			name: "run-hello"
			inputs: parameters: [{name: "os-image"}]
			container: {
				image: "{{inputs.parameters.os-image}}"
				command: ["sh", "-c"]
				args: [" uname -a ; cat /etc/os-release ; /go/src/github.com/golang/example/hello/hello "]
				volumeMounts: [{
					name:      "workdir"
					mountPath: "/go"
				}]
			}
		}]
	}
}
{{< /code-tab >}}{{< /code-tabs >}}
In later guides we'll add more entries to the `workflows` struct.

The `import` at the top references the appropriate curated module for the workflow.
Its path is currently temporary, but only while its proper location is being decided.
The temporary path isn't a problem because one important property of the
[Central Registry](https://registry.cue.works)
is that, once a schema is published, it will always be
available at that location.
When the curated module’s location is finalised and versions are published
under the new path, you can use the
[`cue refactor imports`]({{<relref"docs/reference/command/cue-help-refactor-imports">}})
command to update your CUE easily, so it reflects the new location.

## Tidy your local CUE module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`]({{<relref"docs/reference/command/cue-help-mod-tidy">}})
when you use a curated module for the first time.

## Validate your workflow

```text { title="TERMINAL" type="terminal" codeToCopy="ZXhwb3J0IENVRV9FWFBFUklNRU5UPWV2YWx2Mz0xCmN1ZSB2ZXQgLWM=" }
$ export CUE_EXPERIMENT=evalv3=1
$ cue vet -c
```
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your workflow.

The `#Workflow` schema that's referenced requires the use of CUE's new `v3`
evaluator via the `CUE_EXPERIMENT` environment variable.
{{<linkto/inline"concept/faq/upgrading-from-evalv2-to-evalv3">}} provides more
information about this evaluator version.

## Export your workflow as YAML

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgd29ya2Zsb3cueW1sIC1lIHdvcmtmbG93cy5leGFtcGxl" }
$ cue export --outfile workflow.yml -e workflows.example
```
If you chose to export the `workflows.example` shown above,
your validated YAML workflow will look like this:
{{< code-tabs >}}
{{< code-tab name="workflow.yml" language="yml" area="top-left" >}}
apiVersion: argoproj.io/v1alpha1
kind: Workflow
metadata:
  generateName: ci-example-
spec:
  entrypoint: ci-example
  arguments:
    parameters:
      - name: revision
        value: cfe12d6
  volumeClaimTemplates:
    - metadata:
        name: workdir
      spec:
        accessModes:
          - ReadWriteOnce
        resources:
          requests:
            storage: 1Gi
  templates:
    - name: ci-example
      inputs:
        parameters:
          - name: revision
      steps:
        - - name: build
            template: build-golang-example
            arguments:
              parameters:
                - name: revision
                  value: '{{inputs.parameters.revision}}'
        - - name: test
            template: run-hello
            arguments:
              parameters:
                - name: os-image
                  value: '{{item.image}}:{{item.tag}}'
            withItems:
              - image: debian
                tag: "9.1"
              - image: alpine
                tag: "3.6"
              - image: ubuntu
                tag: "17.10"
    - name: build-golang-example
      inputs:
        parameters:
          - name: revision
        artifacts:
          - name: code
            path: /go/src/github.com/golang/example
            git:
              repo: https://github.com/golang/example.git
              revision: '{{inputs.parameters.revision}}'
      container:
        image: golang:1.8
        command:
          - sh
          - -c
        args:
          - ' cd /go/src/github.com/golang/example/hello && git status && go build -v . '
        volumeMounts:
          - name: workdir
            mountPath: /go
    - name: run-hello
      inputs:
        parameters:
          - name: os-image
      container:
        image: '{{inputs.parameters.os-image}}'
        command:
          - sh
          - -c
        args:
          - ' uname -a ; cat /etc/os-release ; /go/src/github.com/golang/example/hello/hello '
        volumeMounts:
          - name: workdir
            mountPath: /go
{{< /code-tab >}}{{< /code-tabs >}}
## Run your workflow

The `cue.mod` directory needs to be stored in your git repository, along with
your `workflow.cue` and `workflow.yml` files. After recording them in a commit
you can push your branch to your git remote and trigger the workflow.

Whenever you update your CUE workflow, re-run the `cue export` command shown
above, and then use `git` to record any changes to these files and directories.
