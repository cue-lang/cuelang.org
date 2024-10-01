---
title: CUE By Example - Driving GitLab CI/CD pipelines with CUE
draft: true
---

{{<caution>}}
Source: https://raw.githubusercontent.com/cue-labs/cue-by-example/refs/heads/main/005_gitlab_ci/README.md
{{</caution>}}

# Driving GitLab CI/CD pipelines with CUE
<sup>by [Jonathan Matthews](https://jonathanmatthews.com)</sup>

This guide explains how to convert a GitLab CI/CD pipeline file from YAML to
CUE, check its contents are valid, and then use CUE's tooling layer to
regenerate YAML.

This is useful because it allows you to switch to CUE as a source of truth for
GitLab pipelines and perform client-side validation, without GitLab needing to
know you're managing your pipelines with CUE.

|   :exclamation: WARNING :exclamation:   |
|:--------------------------------------- |
| This guide requires that you use `cue` version `v0.11.0-alpha.2` or later. **The process described below won't work with earlier versions**. Check the version of your `cue` command by running `cue version`, and [upgrade it](https://cuelang.org/dl) if needed.

## Prerequisites

- You have [`cue` installed](https://cuelang.org/docs/install/).
- You have a GitLab pipeline file.
  - The example shown throughout this guide uses the state of a specific commit
    from the
    [Flockademic repository](https://gitlab.com/Flockademic/Flockademic/-/blob/8efcea927b10c2773790fe78bb858905a75cf3ef/.gitlab-ci.yml)
    on gitlab.com, as linked from
    [GitLab's documentation pages](https://docs.gitlab.com/ee/ci/examples/end_to_end_testing_webdriverio/index.html),
    but you don't need to use that repository in any way.\
    It is used here as it represents a reasonably complex example of a GitLab
    pipeline file.
- You have [`git` installed](https://git-scm.com/downloads).
- You have [`curl` installed](https://curl.se/dlwiz/), or can fetch a remote
  file some other way.

## Steps

### Convert YAML pipeline to CUE

#### :arrow_right: Begin with a clean git state

Change directory into the root of the repository that contains your GitLab
pipeline file, and ensure you start this process with a clean git state, with
no modified files. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y2QgRmxvY2thZGVtaWMgIyBvdXIgZXhhbXBsZSByZXBvc2l0b3J5CmdpdCBzdGF0dXMgIyBzaG91bGQgcmVwb3J0ICJ3b3JraW5nIHRyZWUgY2xlYW4i" }
$ cd Flockademic # our example repository
$ git status # should report "working tree clean"
On branch master
nothing to commit, working tree clean
```

#### :arrow_right: Initialise a CUE module

Initialise a CUE module named after the organisation and repository you're
working with, but containing only lowercase letters and numbers. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGdpdGxhYi5jb20vZmxvY2thZGVtaWMvZmxvY2thZGVtaWM=" }
$ cue mod init gitlab.com/flockademic/flockademic
```

#### :arrow_right: Import YAML pipeline

Use `cue` to import your YAML pipeline file:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGltcG9ydCAuZ2l0bGFiLWNpLnltbCAtLXdpdGgtY29udGV4dCAtcCBnaXRsYWIgLWYgLWwgcGlwZWxpbmVzOiAtbCAnc3RyaW5ncy5UcmltU3VmZml4KHBhdGguQmFzZShmaWxlbmFtZSkscGF0aC5FeHQoZmlsZW5hbWUpKScgLW8gZ2l0bGFiLWNpLmN1ZQ==" }
$ cue import .gitlab-ci.yml --with-context -p gitlab -f -l pipelines: -l 'strings.TrimSuffix(path.Base(filename),path.Ext(filename))' -o gitlab-ci.cue
```

If your project uses a different name for your pipeline file then use that name
in the above command, and throughout this guide.

Check that a CUE file has been created from your pipeline file. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="bHMgeywufSpnaXRsYWItY2kqID4uLi80LmV4cGVjdGVkLnR4dA==" }
# Actual command in CUE-By-Example guide:
# ls {,.}*gitlab-ci*
$ ls {,.}*gitlab-ci* >../4.expected.txt
```

Your output should look similar to this, with a matching YAML and CUE file:

{{< code-tabs >}}
{{< code-tab name="4.actual.txt" language="txt" area="top-left" >}}
.gitlab-ci.yml
gitlab-ci.cue
{{< /code-tab >}}{{< /code-tabs >}}
Observe that your file has been imported into the `pipelines` struct at a
location derived from its original file name, by running:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="aGVhZCAtOSBnaXRsYWItY2kuY3VlID4uLi81LmFjdHVhbC50eHQ=" }
# Actual command in CUE-By-Example guide:
# head -9 gitlab-ci.cue
$ head -9 gitlab-ci.cue >../5.actual.txt
```

The output should reflect your pipeline. In our example:

{{< code-tabs >}}
{{< code-tab name="5.expected.txt" language="txt" area="top-left" >}}
package gitlab

pipelines: ".gitlab-ci": {
	image: "node:8.10"
	stages: [
		"prepare",
		"test",
		"build-backend",
		"deploy-backend",
{{< /code-tab >}}{{< /code-tabs >}}
#### :arrow_right: Store CUE pipelines in a dedicated directory

Create a directory called `gitlab` to hold your CUE-based GitLab pipeline
files. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="bWtkaXIgLXAgaW50ZXJuYWwvY2kvZ2l0bGFi" }
$ mkdir -p internal/ci/gitlab
```

You may change the hierarchy and naming of `gitlab`'s **parent** directories to
suit your repository layout. If you do so, you will need to adapt some commands
and CUE code as you follow this guide.

Move the newly-created CUE pipeline file into its dedicated directory. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="bXYgZ2l0bGFiLWNpLmN1ZSBpbnRlcm5hbC9jaS9naXRsYWI=" }
$ mv gitlab-ci.cue internal/ci/gitlab
```

### Validate pipeline

#### :arrow_right: Create a pipeline schema

Fetch a schema for GitLab pipelines, as defined by the GitLab project, and
place it in the `internal/ci/gitlab` directory:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VybCAtc1NvIGludGVybmFsL2NpL2dpdGxhYi9naXRsYWIuY2ljZC5waXBlbGluZS5zY2hlbWEuanNvbiBodHRwczovL2dpdGxhYi5jb20vZ2l0bGFiLW9yZy9naXRsYWIvLS9yYXcvN2FhNjE3MGM0YzgxYTk4ZjM3MmQ3YzUyZjM5MTg4NThjNGI2OWNjYS9hcHAvYXNzZXRzL2phdmFzY3JpcHRzL2VkaXRvci9zY2hlbWEvY2kuanNvbg==" }
$ curl -sSo internal/ci/gitlab/gitlab.cicd.pipeline.schema.json https://gitlab.com/gitlab-org/gitlab/-/raw/7aa6170c4c81a98f372d7c52f3918858c4b69cca/app/assets/javascripts/editor/schema/ci.json
```

We use a specific commit from the upstream repository to make sure that this
process is reproducible.

Convert the GitLab schema from JSON Schema to CUE:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGltcG9ydCBqc29uc2NoZW1hK3N0cmljdEZlYXR1cmVzPTA6IGludGVybmFsL2NpL2dpdGxhYi9naXRsYWIuY2ljZC5waXBlbGluZS5zY2hlbWEuanNvbiAtcCBnaXRsYWIgLWwgJyNQaXBlbGluZTon" }
$ cue import jsonschema+strictFeatures=0: internal/ci/gitlab/gitlab.cicd.pipeline.schema.json -p gitlab -l '#Pipeline:'
```

This command will create the file `internal/ci/gitlab/gitlab.cicd.pipeline.schema.cue`
in the `gitlab` package, with the contents of the upstream schema placed in the
field `#Pipeline`.

#### :arrow_right: Apply the schema

We need to tell CUE to apply the schema to the pipeline.

To do this we'll create a file at `internal/ci/gitlab/pipelines.cue` in our
example. However, if your earlier pipeline import *already* created a file with
that same path and name, then simply select a different CUE filename that
*doesn't* already exist.

Create the file in the `internal/ci/gitlab/` directory and add this CUE:

:floppy_disk: `internal/ci/gitlab/pipelines.cue`

{{< code-tabs >}}
{{< code-tab name="Flockademic/internal/ci/gitlab/pipelines.cue" language="cue" area="top-left" >}}
package gitlab

// each member of the pipelines struct must be a valid #Pipeline
pipeline: [_]: #Pipeline
{{< /code-tab >}}{{< /code-tabs >}}

### Generate YAML from CUE

#### :arrow_right: Create a CUE workflow command

Create a CUE file in `internal/ci/gitlab/` containing the following workflow command.
Adapt the element commented with `TODO`:

:floppy_disk: `internal/ci/gitlab/ci_tool.cue`
{{< code-tabs >}}
{{< code-tab name="Flockademic/internal/ci/gitlab/ci_tool.cue" language="cue" area="top-left" >}}
package gitlab

import (
	"path"
	"encoding/yaml"
	"tool/file"
)

_goos: string @tag(os,var=os)

// Regenerate pipeline files
command: regenerate: {
	pipeline_files: {
		// TODO: update _toolFile to reflect the directory hierarchy containing this file.
		// TODO: update _pipelineDir to reflect the directory containing your pipeline file.
		let _toolFile = "internal/ci/gitlab/ci_tool.cue"
		let _pipelineDir = path.FromSlash(".", path.Unix)
		let _donotedit = "Code generated by \(_toolFile); DO NOT EDIT."

		for _pipelineName, _pipelineConfig in pipelines
		let _pipelineFile = _pipelineName + ".yml"
		let _pipelinePath = path.Join([_pipelineDir, _pipelineFile]) {
			let delete = {
				"Delete \(_pipelinePath)": file.RemoveAll & {path: _pipelinePath}
			}
			delete
			create: file.Create & {
				$after:   delete
				filename: _pipelinePath
				contents: "# \(_donotedit)\n\n\(yaml.Marshal(_pipelineConfig))"
			}
		}
	}
}
{{< /code-tab >}}{{< /code-tabs >}}

Make the modifications indicated by the `TODO` comments.

The `regenerate` workflow command will export your CUE-based pipeline back into its required YAML file,
on demand.

#### :arrow_right: Test the CUE workflow command

With the modified `ci_tool.cue` file in place, check that the `regenerate`
workflow command is available **from a shell sitting at the repository root**. For
example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y2QgJChnaXQgcmV2LXBhcnNlIC0tc2hvdy10b3BsZXZlbCkgIyBtYWtlIHN1cmUgd2UncmUgc2l0dGluZyBhdCB0aGUgcmVwb3NpdG9yeSByb290CmN1ZSBoZWxwIGNtZCByZWdlbmVyYXRlIC4vaW50ZXJuYWwvY2kvZ2l0bGFiIHwgaGVhZCAtNCA+Li4vMTIuZXhwZWN0ZWQudHh0CnN5bmM=" }
$ cd $(git rev-parse --show-toplevel) # make sure we're sitting at the repository root

# Actual command in CUE-By-Example guide:
# cue help cmd regenerate ./internal/ci/gitlab   # the "./" prefix is required
$ cue help cmd regenerate ./internal/ci/gitlab | head -4 >../12.expected.txt

# Sometimes the above command's regeneration of the YAML file doesn't get
# sync'd to disk before we git-diff it, below. Make sure that it does.
$ sync
```

The output of the `cue help` command **must** begin with the following:

{{< code-tabs >}}
{{< code-tab name="12.actual.txt" language="txt" area="top-left" >}}
Regenerate pipeline files

Usage:
  cue cmd regenerate [flags]
{{< /code-tab >}}{{< /code-tabs >}}
|   :exclamation: WARNING :exclamation:   |
|:--------------------------------------- |
| If you *don't* see the usage explanation for the `regenerate` workflow command (or if you receive an error message) then **either** your workflow command isn't set up as CUE requires, **or** you're running a CUE version older than `v0.11.0-alpha.2`. If you've [upgraded to at least that version](https://cuelang.org/dl) but the usage explanation still isn't being displayed then: (1) double check the contents of the `ci_tool.cue` file and the modifications you made to it; (2) make sure its location in the repository is precisely as given in this guide; (3) ensure the filename is *exactly* `ci_tool.cue`; (4) run `cue vet ./internal/ci/gitlab` and check that your pipelines actually validate successfully - in other words: were they truly valid before you even started this process? Lastly, make sure you've followed all the steps in this guide, and that you invoked the `cue help` command from the repository's root directory. If you get really stuck, please come and join [the CUE community](https://cuelang.org/community/) and ask for some help!

#### :arrow_right: Regenerate the YAML pipeline file

Run the `regenerate` workflow command to produce a YAML pipeline file from CUE. For
example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGNtZCByZWdlbmVyYXRlIC4vaW50ZXJuYWwvY2kvZ2l0bGFiICMgdGhlICIuLyIgcHJlZml4IGlzIHJlcXVpcmVk" }
$ cue cmd regenerate ./internal/ci/gitlab # the "./" prefix is required
```

#### :arrow_right: Audit changes to the YAML pipeline file

Check that your YAML pipeline file has a single *material* change from the
original:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGRpZmYgLS0gLmdpdGxhYi1jaS55bWwgfCBncmVwIC12ICdeaW5kZXggWzAtOWEtZl17N31cLlwuWzAtOWEtZl17N30nIHwgaGVhZCAtMTAgPi4uLzE0LmFjdHVhbC50eHQKZ2l0IGRpZmYgLS0gLmdpdGxhYi1jaS55bWwgPi4uLzE0LmFjdHVhbC50eHQKZ2l0IGRpZmYgLmdpdGxhYi1jaS55bWwgfCBjYXQKZWNobyBoZWxsbw==" }
# Actual command in CUE-By-Example guide:
# git diff .gitlab-ci.yml
# For some unknown reason the trailing '>../...' redirection *only* works when
# the diff command is given a '--' separator. I'm utterly stumped, but let's
# just give it what it wants!
$ git diff -- .gitlab-ci.yml | grep -v '^index [0-9a-f]{7}\.\.[0-9a-f]{7}' | head -10 >../14.actual.txt
$ git diff -- .gitlab-ci.yml >../14.actual.txt
$ git diff .gitlab-ci.yml | cat
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d0eaf80..d0a309e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,5 +1,6 @@
-image: node:8.10
+# Code generated by internal/ci/gitlab/ci_tool.cue; DO NOT EDIT.
 
+image: node:8.10
 stages:
   - prepare
   - test
@@ -9,7 +10,6 @@ stages:
   - build-frontend
   - deploy-frontend
   - confidence-check
-
 prepare:
   stage: prepare
   script:
@@ -18,7 +18,7 @@ prepare:
   artifacts:
     expire_in: 1 month
     paths:
-    - node_modules/
+      - node_modules/
 prepare_frontend:
   stage: prepare
   script:
@@ -28,7 +28,7 @@ prepare_frontend:
   artifacts:
     expire_in: 1 month
     paths:
-    - stacks/frontend/node_modules/
+      - stacks/frontend/node_modules/
 prepare_server:
   stage: prepare
   script:
@@ -38,7 +38,7 @@ prepare_server:
   artifacts:
     expire_in: 1 month
     paths:
-    - server/node_modules/
+      - server/node_modules/
 prepare_accounts:
   stage: prepare
   script:
@@ -48,7 +48,7 @@ prepare_accounts:
   artifacts:
     expire_in: 1 month
     paths:
-    - stacks/accounts/node_modules/
+      - stacks/accounts/node_modules/
 prepare_periodicals:
   stage: prepare
   script:
@@ -58,26 +58,25 @@ prepare_periodicals:
   artifacts:
     expire_in: 1 month
     paths:
-    - stacks/periodicals/node_modules/
-
+      - stacks/periodicals/node_modules/
 test:
   stage: test
   dependencies:
-   - prepare
+    - prepare
   script:
-   - yarn run test
+    - yarn run test
 test_frontend:
   stage: test
   dependencies:
-   - prepare
-   - prepare_frontend
+    - prepare
+    - prepare_frontend
   script:
     - cd stacks/frontend
     - yarn run test --ci
   artifacts:
     expire_in: 1 week
     paths:
-    - stacks/frontend/__tests__/__coverage__/
+      - stacks/frontend/__tests__/__coverage__/
     when: always
 test_accounts:
   stage: test
@@ -90,7 +89,7 @@ test_accounts:
   artifacts:
     expire_in: 1 week
     paths:
-    - stacks/accounts/__tests__/__coverage__/
+      - stacks/accounts/__tests__/__coverage__/
     when: always
 test_periodicals:
   stage: test
@@ -103,73 +102,67 @@ test_periodicals:
   artifacts:
     expire_in: 1 week
     paths:
-    - stacks/periodicals/__tests__/__coverage__/
+      - stacks/periodicals/__tests__/__coverage__/
     when: always
-
 build_terraform:
   stage: build-backend
-  dependencies:
-    # No previous assets needed for this job
+  dependencies: null
   script: echo "Dummy job to preserve artifacts for the undeploy job"
   artifacts:
     expire_in: 1 month
     paths:
-    # The below files are needed for the undeploy jobs,
-    # because when undeploying the branch (and thus these files) is no longer available
-    - stacks.tf
-    - stacks/*.tf
-    - stacks/*/*.tf
-    - stacks/*/*_lambda_role_policy.json
-    - stacks/*/*_lambda_policy.json
+      - stacks.tf
+      - stacks/*.tf
+      - stacks/*/*.tf
+      - stacks/*/*_lambda_role_policy.json
+      - stacks/*/*_lambda_policy.json
 build_server:
   stage: build-backend
   dependencies:
-     - prepare_server
+    - prepare_server
   script:
     - cd server
     - yarn run build
   artifacts:
     expire_in: 1 month
     paths:
-    - server/dist/
+      - server/dist/
 build_accounts:
   stage: build-backend
   dependencies:
-   - prepare
-   - prepare_accounts
+    - prepare
+    - prepare_accounts
   script:
     - cd stacks/accounts
     - yarn run build
   artifacts:
     expire_in: 1 month
     paths:
-    - stacks/accounts/dist/
+      - stacks/accounts/dist/
 build_periodicals:
   stage: build-backend
   dependencies:
-   - prepare
-   - prepare_periodicals
+    - prepare
+    - prepare_periodicals
   script:
     - cd stacks/periodicals
     - yarn run build
   artifacts:
     expire_in: 1 month
     paths:
-    - stacks/periodicals/dist/
-
+      - stacks/periodicals/dist/
 deploy_terraform:
   stage: deploy-backend
   image:
     name: hashicorp/terraform:0.11.2
     entrypoint:
-      # These values provided by https://github.com/hashicorp/docker-hub-images/issues/37#issuecomment-356330221
-      - '/usr/bin/env'
-      - 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
+      - /usr/bin/env
+      - PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   dependencies:
-   - build_terraform
-   - build_server
-   - build_accounts
-   - build_periodicals
+    - build_terraform
+    - build_server
+    - build_accounts
+    - build_periodicals
   script:
     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export TF_VAR_aws_access_key_id=$AWS_ACCESS_KEY_ID_PRODUCTION; else export TF_VAR_aws_access_key_id=$AWS_ACCESS_KEY_ID; fi;
     - export TF_VAR_aws_account_id=$AWS_ACCOUNT_ID
@@ -180,13 +173,7 @@ deploy_terraform:
     - export TF_VAR_jwt_secret=$(echo "$JWT_SECRET$CI_COMMIT_REF_NAME" | sha512sum)
     - export TF_VAR_frontend_url="https://$CI_COMMIT_REF_SLUG.flockademic.com"
     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export TF_VAR_orcid_base_path="$ORCID_BASE_PATH_PRODUCTION"; export TF_VAR_orcid_client_id="$ORCID_CLIENT_ID_PRODUCTION"; export TF_VAR_orcid_client_secret="$ORCID_CLIENT_SECRET_PRODUCTION"; else export TF_VAR_orcid_base_path="$ORCID_BASE_PATH"; export TF_VAR_orcid_client_id="$ORCID_CLIENT_ID"; export TF_VAR_orcid_client_secret="$ORCID_CLIENT_SECRET"; fi;
-    # Use the branch/tag name as the TerraForm Workspace,
-    # limited to 26 chars (30 is the max length of Heroku app names, which we prepend with `fl9-`),
-    # and with a potential trailing dash stripped
-    # (Note that I'd rather name this $TF_WORKSPACE, but:
-    # https://github.com/hashicorp/terraform/issues/15874 )
     - export WORKSPACE_NAME=`echo $CI_COMMIT_REF_SLUG | cut -c 1-26 | sed -e 's/-$//'`
-    # Deploy everything
     - terraform version
     - terraform init -backend-config="region=$TF_VAR_aws_region" -input=false
     - terraform workspace select $WORKSPACE_NAME || terraform workspace new $WORKSPACE_NAME
@@ -194,15 +181,12 @@ deploy_terraform:
     - terraform graph
     - terraform plan -out .tfplan -input=false | sed -e "s/$TF_VAR_aws_access_key_id/***/g" | sed -e "s/$TF_VAR_aws_secret_access_key/***/g"
     - terraform apply -input=false .tfplan | sed -e "s/$TF_VAR_aws_access_key_id/***/g" | sed -e "s/$TF_VAR_aws_secret_access_key/***/g" | sed -e "s/$TF_VAR_orcid_client_secret/***/g"
-    # Store the API endpoint to a file so that we can pass it on to other jobs (without a trailing slash)
     - terraform output heroku_web_url | sed s'/\/$//' > api_url
     - terraform output heroku_git_url > heroku_git_url
-    # Copy everything to a dir to push to Heroku
     - cd server
     - mkdir -p dist/stacks/accounts
     - mkdir -p dist/stacks/periodicals
     - cp package.json yarn.lock dist
-    # Make sure that library dependencies are available to all stacks:
     - cp ../package.json ../yarn.lock dist/stacks
     - cp -r ../stacks/accounts/dist ../stacks/accounts/package.json ../stacks/accounts/yarn.lock dist/stacks/accounts
     - cp -r ../stacks/periodicals/dist ../stacks/periodicals/package.json ../stacks/periodicals/yarn.lock dist/stacks/periodicals
@@ -221,22 +205,20 @@ deploy_terraform:
     url: https://api.$CI_COMMIT_REF_SLUG.flockademic.com
     on_stop: stop_terraform
   artifacts:
-    # This is just needed for subsequent jobs, so 1 hour should be enough
     expire_in: 1 hour
     paths:
-     - api_url
+      - api_url
 stop_terraform:
   stage: deploy-backend
   image:
     name: hashicorp/terraform:0.11.2
     entrypoint:
-      # These values provided by https://github.com/hashicorp/docker-hub-images/issues/37#issuecomment-356330221
-      - '/usr/bin/env'
-      - 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
+      - /usr/bin/env
+      - PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   variables:
     GIT_STRATEGY: none
   dependencies:
-   - build_terraform
+    - build_terraform
   script:
     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export TF_VAR_aws_access_key_id=$AWS_ACCESS_KEY_ID_PRODUCTION; else export TF_VAR_aws_access_key_id=$AWS_ACCESS_KEY_ID; fi;
     - export TF_VAR_aws_account_id=$AWS_ACCOUNT_ID
@@ -249,11 +231,6 @@ stop_terraform:
     - export TF_VAR_orcid_client_id="irrelevant_for_undeployment"
     - export TF_VAR_orcid_client_secret="irrelevant_for_undeployment"
     - export TF_VAR_frontend_url="irrelevant_for_undeployment"
-    # Use the branch/tag name as the TerraForm Workspace,
-    # limited to 26 chars (30 is the max length of Heroku app names, which we prepend with `fl9-`),
-    # and with a potential trailing dash stripped
-    # (Note that I'd rather name this $TF_WORKSPACE, but:
-    # https://github.com/hashicorp/terraform/issues/15874 )
     - export WORKSPACE_NAME=`echo $CI_COMMIT_REF_SLUG | cut -c 1-26 | sed -e 's/-$//'`
     - terraform init -backend-config="region=$TF_VAR_aws_region" -input=false
     - terraform workspace select $WORKSPACE_NAME
@@ -264,22 +241,15 @@ stop_terraform:
   environment:
     name: review_api/$CI_COMMIT_REF_SLUG
     action: stop
-
 provision_databases:
   stage: provision-backend
   dependencies:
-   - deploy_terraform
+    - deploy_terraform
   image: alpine:3.6
   script:
     - apk add --no-cache curl jq postgresql-client
-    # Use the branch/tag name as the TerraForm Workspace,
-    # limited to 26 chars (30 is the max length of Heroku app names, which we prepend with `fl9-`),
-    # and with a potential trailing dash stripped
-    # (Note that I'd rather name this $TF_WORKSPACE, but:
-    # https://github.com/hashicorp/terraform/issues/15874 )
     - export WORKSPACE_NAME=`echo $CI_COMMIT_REF_SLUG | cut -c 1-26 | sed -e 's/-$//'`
-    - "DATABASE_URL=`curl -X GET \"https://api.heroku.com/apps/fl9-${WORKSPACE_NAME}/config-vars\" -H \"Accept: application/vnd.heroku+json; version=3\" -H \"Authorization: Bearer ${HEROKU_API_KEY}\" | jq -r \".DATABASE_URL\"`"
-    # $DATABASE_URL is of the form `postgres://<username>:<password>@<hostname>:<port>/<database>
+    - 'DATABASE_URL=`curl -X GET "https://api.heroku.com/apps/fl9-${WORKSPACE_NAME}/config-vars" -H "Accept: application/vnd.heroku+json; version=3" -H "Authorization: Bearer ${HEROKU_API_KEY}" | jq -r ".DATABASE_URL"`'
     - export PGHOST=`echo ${DATABASE_URL:11} | cut -d '@' -f 2 | cut -d ':' -f 1`
     - export PGPORT=`echo ${DATABASE_URL:11} | cut -d '@' -f 2 | cut -d ':' -f 2 | cut -d '/' -f 1`
     - export PGUSER=`echo ${DATABASE_URL:11} | cut -d '@' -f 1 | cut -d ':' -f 1`
@@ -287,15 +257,13 @@ provision_databases:
     - echo "$PGHOST:$PGPORT:$PGDATABASE:$PGUSER:`echo ${DATABASE_URL:11} | cut -d '@' -f 1 | cut -d ':' -f 2`" > .pgpass.conf
     - chmod 0600 .pgpass.conf
     - export PGPASSFILE=.pgpass.conf
-    # Create the databases and provision them:
     - sh stacks/provision_databases.sh stacks
-
 build_frontend:
   stage: build-frontend
   dependencies:
-   - prepare
-   - prepare_frontend
-   - deploy_terraform
+    - prepare
+    - prepare_frontend
+    - deploy_terraform
   script:
     - cd stacks/frontend
     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export ORCID_BASE_PATH="$ORCID_BASE_PATH_PRODUCTION"; export ORCID_CLIENT_ID="$ORCID_CLIENT_ID_PRODUCTION"; fi;
@@ -306,17 +274,14 @@ build_frontend:
   artifacts:
     expire_in: 1 month
     paths:
-    - stacks/frontend/dist/
-    # The below files are needed for the undeploy jobs,
-    # because when undeploying the branch (and thus these files) is no longer available
-    - stacks/frontend/package.json
-    - stacks/frontend/build/
-
+      - stacks/frontend/dist/
+      - stacks/frontend/package.json
+      - stacks/frontend/build/
 deploy_frontend:
   stage: deploy-frontend
   dependencies:
-   - prepare_frontend
-   - build_frontend
+    - prepare_frontend
+    - build_frontend
   script:
     - cd stacks/frontend
     - yarn run deploy
@@ -330,8 +295,8 @@ deploy_frontend:
 deploy_frontend_prod:
   stage: deploy-frontend
   dependencies:
-   - prepare_frontend
-   - build_frontend
+    - prepare_frontend
+    - build_frontend
   script:
     - cd stacks/frontend
     - export AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID_PRODUCTION"
@@ -339,8 +304,6 @@ deploy_frontend_prod:
     - yarn run deploy
     - yarn run awaitDeployTasks
   environment:
-    # Since the deploy_terraform environment cannot have different environment names for production and review apps,
-    # we're not doing that here either in order to be able to match on the name and make certain variables only available to production.
     name: review/$CI_COMMIT_REF_SLUG
     url: https://flockademic.com
   only:
@@ -350,8 +313,8 @@ stop_frontend:
   variables:
     GIT_STRATEGY: none
   dependencies:
-   - prepare_frontend
-   - build_frontend
+    - prepare_frontend
+    - build_frontend
   script:
     - cd stacks/frontend
     - yarn run undeploy
@@ -359,74 +322,67 @@ stop_frontend:
   environment:
     name: review/$CI_COMMIT_REF_SLUG
     action: stop
-
 e2e:firefox:
   stage: confidence-check
   services:
     - selenium/standalone-firefox:3.13
   dependencies:
-   - prepare
+    - prepare
   script:
     - if [[ $CI_COMMIT_REF_NAME == $BRANCH_IN_MAINTENANCE ]]; then echo 'Running checks in maintenance mode.'; export MAINTENANCE_MODE=true; fi;
     - yarn run confidence-check --host=selenium__standalone-firefox
   artifacts:
     expire_in: 1 week
     paths:
-    - __e2e__/results/
-    - __e2e__/errorShots/
+      - __e2e__/results/
+      - __e2e__/errorShots/
     when: always
-  # GUI tests loading a full browser are notoriously unstable.
-  # See https://gitlab.com/Flockademic/Flockademic/issues/366
   retry: 2
 e2e:chrome:
   stage: confidence-check
   services:
     - selenium/standalone-chrome:3.13
   dependencies:
-   - prepare
+    - prepare
   script:
     - if [[ $CI_COMMIT_REF_NAME == $BRANCH_IN_MAINTENANCE ]]; then echo 'Running checks in maintenance mode.'; export MAINTENANCE_MODE=true; fi;
     - yarn run confidence-check --host=selenium__standalone-chrome
   artifacts:
     expire_in: 1 week
     paths:
-    - __e2e__/results/
-    - __e2e__/errorShots/
+      - __e2e__/results/
+      - __e2e__/errorShots/
     when: always
-  # GUI tests loading a full browser are notoriously unstable.
-  # See https://gitlab.com/Flockademic/Flockademic/issues/366
   retry: 2
-# See https://docs.gitlab.com/ce/ci/examples/sast.html
 sast:
   stage: confidence-check
   image: registry.gitlab.com/gitlab-org/gl-sast:latest
   dependencies:
-   - prepare
-   - prepare_frontend
-   - prepare_accounts
-   - prepare_periodicals
+    - prepare
+    - prepare_frontend
+    - prepare_accounts
+    - prepare_periodicals
   script:
     - /app/bin/run .
   artifacts:
     paths:
-    - gl-sast-report.json
-# See https://docs.gitlab.com/ee/ci/examples/dast.html
+      - gl-sast-report.json
 dast:
   stage: confidence-check
   image: owasp/zap2docker-weekly
-  dependencies:
+  dependencies: null
   script:
     - mkdir /zap/wrk/
     - if [[ $CI_COMMIT_REF_NAME == "master" ]]; then export SITE_URL=https://flockademic.com; else export SITE_URL=https://$CI_COMMIT_REF_SLUG.flockademic.com; fi;
     - /zap/zap-baseline.py -J gl-dast-report.json -t $SITE_URL || true
     - cp /zap/wrk/gl-dast-report.json .
   artifacts:
-    paths: [gl-dast-report.json]
-# See https://docs.gitlab.com/ee/ci/examples/browser_performance.html
+    paths:
+      - gl-dast-report.json
 performance:
   stage: confidence-check
   image: docker:git
-  dependencies:
+  dependencies: null
   services:
     - docker:stable-dind
   script:
@@ -438,7 +394,7 @@ performance:
     - mv sitespeed-results/data/performance.json performance.json
   artifacts:
     paths:
-    - performance.json
+      - performance.json
 license_management:
   stage: confidence-check
   image: docker:stable
@@ -449,8 +405,7 @@ license_management:
     - docker:stable-dind
   script:
     - export LICENSE_MANAGEMENT_VERSION=$(echo "$CI_SERVER_VERSION" | sed 's/^\([0-9]*\)\.\([0-9]*\).*/\1-\2-stable/')
-    - docker run
-        --volume "$PWD:/code"
-        "registry.gitlab.com/gitlab-org/security-products/license-management:$LICENSE_MANAGEMENT_VERSION" analyze /code
+    - docker run --volume "$PWD:/code" "registry.gitlab.com/gitlab-org/security-products/license-management:$LICENSE_MANAGEMENT_VERSION" analyze /code
   artifacts:
-    paths: [gl-license-management-report.json]
+    paths:
+      - gl-license-management-report.json
$ echo hello
hello
```

Your output should look similar to the following example:

{{< code-tabs >}}
{{< code-tab name="14.expected.txt" language="txt" area="top-left" >}}
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,5 +1,6 @@
-image: node:8.10
+# Code generated by internal/ci/gitlab/ci_tool.cue; DO NOT EDIT.

+image: node:8.10
 stages:
   - prepare
   - test
{{< /code-tab >}}{{< /code-tabs >}}
The main change in each YAML file is the addition of a header that warns the
reader not to edit the file directly.

Your diff might also contain some YAML reformatting (with the number of leading
spaces having been changed in nested structures) but this won't make a
difference to the underlying meaning of the file.

Additionally, any comments in the original YAML file will now be found *only*
in the CUE source file - which is important as that's the only file that you'll
be manually changing, from now on.

#### :arrow_right: Add and commit files to git

Add your files to git. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGFkZCAuZ2l0bGFiLWNpLnltbCBpbnRlcm5hbC9jaS9naXRsYWIvIGN1ZS5tb2QvbW9kdWxlLmN1ZQ==" }
$ git add .gitlab-ci.yml internal/ci/gitlab/ cue.mod/module.cue
```

Make sure to include your slightly modified YAML pipeline file, wherever you
store it, along with all the new files in `internal/ci/gitlab/` and your
`cue.mod/module.cue` file.

Commit your files to git, with an appropriate commit message:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGNvbW1pdCAtLXF1aWV0IC1tICJjaTogY3JlYXRlIENVRSBzb3VyY2VzIGZvciBHaXRMYWIgQ0kvQ0QgcGlwZWxpbmVzIg==" }
# Actual command in CUE-By-Example guide:
# git commit -m "ci: create CUE sources for GitLab CI/CD pipelines"
$ git commit --quiet -m "ci: create CUE sources for GitLab CI/CD pipelines"
```

## Conclusion

**Well done - your GitLab CI/CD pipeline file has been imported into CUE!**

It can now be managed using CUE, leading to safer and more predictable changes.
The use of a schema to check your pipeline means that you will catch and fix
certain types of mistake earlier than before, without waiting for the slow "git
add/commit/push; check if CI fails" cycle.

From now on, each time you make a change to a CUE pipeline file, immediately
regenerate the YAML files required by GitLab CI/CD, and commit your changes to
all the CUE and YAML files. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGNtZCByZWdlbmVyYXRlIC4vaW50ZXJuYWwvY2kvZ2l0bGFiLyAjIHRoZSAiLi8iIHByZWZpeCBpcyByZXF1aXJlZApnaXQgYWRkIC5naXRsYWItY2kueW1sIGludGVybmFsL2NpL2dpdGxhYi8KZ2l0IGNvbW1pdCAtbSAiY2k6IGFkZGVkIG5ldyByZWxlYXNlIHBpcGVsaW5lIiAjIGV4YW1wbGUgbWVzc2FnZQ==" }
$ cue cmd regenerate ./internal/ci/gitlab/ # the "./" prefix is required
$ git add .gitlab-ci.yml internal/ci/gitlab/
$ git commit -m "ci: added new release pipeline" # example message
```
