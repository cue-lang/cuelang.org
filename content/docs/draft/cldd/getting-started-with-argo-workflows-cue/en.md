---
title: Getting started with Argo Workflows + CUE
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for the
[YAML workflow files](https://argo-workflows.readthedocs.io/en/latest/fields/)
used by [Argo Workflows](https://argo-workflows.readthedocs.io/en/latest/).
This guide shows you how to get started defining your Argo workflows in CUE using
[a curated module](/getting-started/argo-workflows/)
from
[the schema library](/getting-started/schema-library/).

<!--more-->

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
{{{with script "en" "cue mod init"}}}
cue mod init cue.example
{{{end}}}
You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).
It makes sense for your CUE module to exist at the root of a source code
repository, but the commands in this guide will work in any setup.

## Create an Argo workflow

Declare an Argo workflow in CUE. This one comes from
[Argo's examples](https://github.com/argoproj/argo-workflows/blob/main/examples/steps.yaml):

{{{with upload "en" "1"}}}
-- workflow.cue --
package cicd

import argoworkflows "cue.dev/x/argocd"

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
{{{end}}}
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

{{{with script "en" "tidy"}}}
cue mod tidy
{{{end}}}
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a curated module for the first time.

If you see an error message mentioning "too many requests" then
[login to the Central Registry](https://cue.dev/docs/login-central-registry/)
and re-run this command.
The Central Registry allows more requests from authenticated users.

## Validate your workflow

{{{with script "en" "vet"}}}
cue vet -c
{{{end}}}
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your workflow.

## Export your workflow as YAML

{{{with script "en" "export"}}}
cue export --outfile workflow.yml -e workflows.example
{{{end}}}

If you chose to export the `workflows.example` shown above,
your validated YAML workflow will look like this:

{{{with upload "en" "yaml"}}}
#assert
-- workflow.yml --
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
{{{end}}}

## Run your workflow

You can now
[trigger the Argo workflow](https://argo-workflows.readthedocs.io/en/latest/quick-start/#submit-an-example-workflow)
using your validated YAML workflow file.

The `cue.mod` directory needs to be stored in your source code repository,
along with your `workflow.cue` and `workflow.yml` files.
Whenever you update your CUE workflow, re-run the `cue export` command shown
above, and then record any changes to these files and directories.
