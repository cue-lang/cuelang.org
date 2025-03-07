---
title: Getting started with Argo Workflows + CUE
draft: true
no_index: true
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD
{{{end}}}

{{<info>}}
Curated modules are a work in progress and your feedback is important!
Please [report any issues]({{<report-issue-url>}}) you find.
{{</info>}}

The CUE
[Central Registry](https://registry.cue.works/)
provides a well-known location for well-known schemas, including those for
[YAML workflow files](https://argo-workflows.readthedocs.io/en/latest/fields/)
used by [Argo Workflows](https://argo-workflows.readthedocs.io/en/latest/).

This guide shows you how to get started defining your Argo Workflows in CUE using
[curated modules]({{<relref"curated-modules-faq">}}).

## Login to the Central Registry

{{{with script "en" "cue login"}}}
#norun
cue login
{{{end}}}
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its schemas.

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works)
needs to exist within its own CUE module.
{{{with script "en" "cue mod init"}}}
cue mod init cue.example
{{{end}}}
You can choose any module name you like - it's easy to
[change it later]({{<relref"docs/reference/command/cue-help-mod-rename">}}).
<<<<<<< HEAD
It makes sense for your CUE module to exist at the root of a git repository
that's hosted on GitHub, but the commands in this guide will work in any setup.

## Create a GitHub workflow

In later guides we'll add more workflows to the `workflow` struct, but this
initial `example` workflow comes from
[GitHub's documentation](https://docs.github.com/en/actions/use-cases-and-examples/creating-an-example-workflow#creating-an-example-workflow),
converted to CUE using
[`cue import`]({{<relref"docs/reference/command/cue-help-import">}}):

{{{with upload "en" "1"}}}
=======

## Create a CUE workflow
{{{with upload "en" "1"}}}
# Taken from https://raw.githubusercontent.com/argoproj/argo-workflows/refs/heads/main/examples/ci.yaml
>>>>>>> bef5ccc8b (docs/draft/cldd: +getting-started-with-argo-workflows)
-- workflow.cue --
package gha

import argoworkflows "github.com/cue-tmp/jsonschema-pub/exp3/argocd"

<<<<<<< HEAD
workflow: example: githubactions.#Workflow & {
	name:       "learn-github-actions"
	"run-name": "${{ github.actor }} is learning GitHub Actions"
	on: ["push"]
	jobs: "check-bats-version": {
		"runs-on": "ubuntu-latest"
		steps: [
			{uses: "actions/checkout@v4"},
			{uses: "actions/setup-node@v4", with: "node-version": "20"},
			{run: "npm install -g bats"},
			{run: "bats -v"},
		]
=======
argoworkflows.#Workflow & {
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
>>>>>>> bef5ccc8b (docs/draft/cldd: +getting-started-with-argo-workflows)
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
{{{end}}}
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

{{{with script "en" "tidy"}}}
cue mod tidy
{{{end}}}
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`]({{<relref"docs/reference/command/cue-help-mod-tidy">}})
when you use a curated module for the first time.

## Validate your workflow

{{{with script "en" "vet"}}}
cue vet -c
{{{end}}}
Because `cue vet` doesn't display any errors, you know that the curated schema has validated your workflow.

## Export your workflow as YAML
<<<<<<< HEAD

Before exporting your workflow you'll need to create a directory to hold it, as expected by GitHub Actions:
{{{with script "en" "export"}}}
mkdir -p .github/workflows/
cue export --outfile .github/workflows/workflow.yml -e workflow.example
{{{end}}}
{{{with _script_ "en" "HIDDEN: move before diff"}}}
mv .github/workflows/workflow.yml{,.got}
=======
{{{with script "en" "export"}}}
cue export --outfile workflow.yml
{{{end}}}
{{{with _script_ "en" "HIDDEN: move"}}}
mv workflow.yml{,.got}
>>>>>>> bef5ccc8b (docs/draft/cldd: +getting-started-with-argo-workflows)
{{{end}}}

If you chose to export the `workflow.example` shown above,
your validated YAML workflow will look like this:
{{{with upload "en" "yaml"}}}
<<<<<<< HEAD
-- .github/workflows/workflow.yml --
name: learn-github-actions
run-name: ${{ github.actor }} is learning GitHub Actions
"on":
  - push
jobs:
  check-bats-version:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
      - run: npm install -g bats
      - run: bats -v
{{{end}}}
{{{with _script_ "en" "HIDDEN: diff"}}}
diff --side .github/workflows/workflow.yml{,.got}
{{{end}}}

## Run your workflow

The `cue.mod` and `.github` directories need to be stored in your git
repository, along with your `workflow.cue` file.
After recording them in a commit you can push your branch to GitHub and trigger
the workflow.

Whenever you update your CUE workflow, re-run the `cue export` command shown
above, and then use `git` to record any changes to these files and directories.
=======
-- workflow.yml --
{{{end}}}
{{{with script "en" "HIDDEN: diff"}}}
cat workflow.yml
# diff .github/workflows/workflow.yml .workflow.yml
{{{end}}}
>>>>>>> bef5ccc8b (docs/draft/cldd: +getting-started-with-argo-workflows)
