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
| This guide requires that you use `cue` version `v0.11.0-alpha.4` or later. **The process described below won't work with earlier versions**. Check the version of your `cue` command by running `cue version`, and [upgrade it](https://cuelang.org/dl) if needed.

## Prerequisites

- You have a GitLab pipeline file.
  - The example shown throughout this guide uses the pipeline file from a
    specific commit in the
    [`gitlab-org/gitlab` repository](https://gitlab.com/gitlab-org/gitlab/-/blob/3308936efcd70839cc61e0545dcb780756e4ec28/.gitlab-ci.yml)
    on gitlab.com, as linked from GitLab's
    [CI documentation pages](https://docs.gitlab.com/ee/ci/yaml/),
    but **you don't need to use that repository in any way**. It's used as the
    example in this guide only because it's a reasonably complex GitLab
    pipeline file.
- You have [`cue` installed](https://cuelang.org/docs/install/).
  - You must have version `v0.11.0-alpha.4` or later installed. Using an
    earlier version will cause certain commands in this guide to fail.
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
```text { title="TERMINAL" type="terminal" codeToCopy="Y2QgZ2l0bGFiICMgb3VyIGV4YW1wbGUgcmVwb3NpdG9yeQpnaXQgc3RhdHVzICMgc2hvdWxkIHJlcG9ydCAid29ya2luZyB0cmVlIGNsZWFuIg==" }
$ cd gitlab # our example repository
$ git status # should report "working tree clean"
On branch master
nothing to commit, working tree clean
```

#### :arrow_right: Initialise a CUE module

Initialise a CUE module named after the organisation and repository you're
working with, but containing only lowercase letters and numbers. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGdpdGxhYi5jb20vZ2l0bGFiLW9yZy9naXRsYWI=" }
$ cue mod init gitlab.com/gitlab-org/gitlab
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
	stages: [
		"sync",
		"preflight",
		"prepare",
		"build-images",
		"fixtures",
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
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VybCAtc1NvIGludGVybmFsL2NpL2dpdGxhYi9naXRsYWIuY2ljZC5waXBlbGluZS5zY2hlbWEuanNvbiBodHRwczovL2dpdGxhYi5jb20vZ2l0bGFiLW9yZy9naXRsYWIvLS9yYXcvMjc3YzlmNmI2NDNjOTJkMDAxMDFhY2EwZjJiNGI4NzRhMTQ0ZjdjNS9hcHAvYXNzZXRzL2phdmFzY3JpcHRzL2VkaXRvci9zY2hlbWEvY2kuanNvbg==" }
$ curl -sSo internal/ci/gitlab/gitlab.cicd.pipeline.schema.json https://gitlab.com/gitlab-org/gitlab/-/raw/277c9f6b643c92d00101aca0f2b4b874a144f7c5/app/assets/javascripts/editor/schema/ci.json
```

We use a specific commit from the upstream repository to make sure that this
process is reproducible.

Convert the GitLab schema from JSON Schema to CUE:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGltcG9ydCAtcCBnaXRsYWIgLWwgJyNQaXBlbGluZTonIGludGVybmFsL2NpL2dpdGxhYi9naXRsYWIuY2ljZC5waXBlbGluZS5zY2hlbWEuanNvbg==" }
$ cue import -p gitlab -l '#Pipeline:' internal/ci/gitlab/gitlab.cicd.pipeline.schema.json
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
{{< code-tab name="gitlab/internal/ci/gitlab/pipelines.cue" language="cue" area="top-left" >}}
package gitlab

// each member of the pipelines struct must be a valid #Pipeline
pipelines: [_]: #Pipeline
{{< /code-tab >}}{{< /code-tabs >}}

#### :arrow_right: Validate your pipelines

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAuL2ludGVybmFsL2NpL2dpdGxhYg==" }
$ cue vet ./internal/ci/gitlab
```

If this command fails and produces any output, then CUE believes that at least
one of your pipelines isn't valid. You'll need to resolve this before
continuing, by updating your pipelines inside your new CUE files. If you're
having difficulty fixing them, please come and ask for help in the friendly CUE
[Slack workspace](https://cuelang.org/s/slack) or
[Discord server](https://cuelang.org/s/discord)!

### Generate YAML from CUE

#### :arrow_right: Create a CUE workflow command

Create a CUE file in `internal/ci/gitlab/` containing the following workflow command.
Adapt the element commented with `TODO`:

:floppy_disk: `internal/ci/gitlab/ci_tool.cue`
{{< code-tabs >}}
{{< code-tab name="gitlab/internal/ci/gitlab/ci_tool.cue" language="cue" area="top-left" >}}
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
```text { title="TERMINAL" type="terminal" codeToCopy="Y2QgJChnaXQgcmV2LXBhcnNlIC0tc2hvdy10b3BsZXZlbCkgIyBtYWtlIHN1cmUgd2UncmUgc2l0dGluZyBhdCB0aGUgcmVwb3NpdG9yeSByb290CmN1ZSBoZWxwIGNtZCByZWdlbmVyYXRlIC4vaW50ZXJuYWwvY2kvZ2l0bGFiIHwgaGVhZCAtNCA+Li4vMTIuYWN0dWFsLnR4dA==" }
$ cd $(git rev-parse --show-toplevel) # make sure we're sitting at the repository root

# Actual command in CUE-By-Example guide:
# cue help cmd regenerate ./internal/ci/gitlab   # the "./" prefix is required
$ cue help cmd regenerate ./internal/ci/gitlab | head -4 >../12.actual.txt
```

The output of the `cue help` command **must** begin with the following:

{{< code-tabs >}}
{{< code-tab name="12.expected.txt" language="txt" area="top-left" >}}
Regenerate pipeline files

Usage:
  cue cmd regenerate [flags]
{{< /code-tab >}}{{< /code-tabs >}}
|   :exclamation: WARNING :exclamation:   |
|:--------------------------------------- |
| If you *don't* see the usage explanation for the `regenerate` workflow command (or if you receive an error message) then **either** your workflow command isn't set up as CUE requires, **or** you're running a CUE version older than `v0.11.0-alpha.4`. If you've [upgraded to at least that version](https://cuelang.org/dl) but the usage explanation still isn't being displayed then: (1) double check the contents of the `ci_tool.cue` file and the modifications you made to it; (2) make sure its location in the repository is precisely as given in this guide; (3) ensure the filename is *exactly* `ci_tool.cue`; (4) run `cue vet ./internal/ci/gitlab` and check that your pipelines actually validate successfully - in other words: were they truly valid before you even started this process? Lastly, make sure you've followed all the steps in this guide, and that you invoked the `cue help` command from the repository's root directory. If you get really stuck, please come and join [the CUE community](https://cuelang.org/community/) and ask for some help!

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
```text { title="TERMINAL" type="terminal" codeToCopy="c2xlZXAgMQpzeW5jCmdpdCBkaWZmIC0tIC5naXRsYWItY2kueW1sIHwgZ3JlcCAtdkUgJ15pbmRleCBbMC05YS1mXXs3fVwuXC5bMC05YS1mXXs3fScgfCBoZWFkIC05ID4uLi8xNC5hY3R1YWwudHh0" }
# 2 commands not present in CUE-By-Example guide, added as an attempt to work
# around cue-lang/cue#3492. DELETE THESE COMMANDS!
$ sleep 1
$ sync

# Actual command in CUE-By-Example guide:
# git diff .gitlab-ci.yml
# For some unknown reason the trailing '>../...' redirection *only* works when
# the diff command is given a '--' separator. I'm utterly stumped, but let's
# just give it what it wants!
$ git diff -- .gitlab-ci.yml | grep -vE '^index [0-9a-f]{7}\.\.[0-9a-f]{7}' | head -9 >../14.actual.txt
```

Your output should look similar to the following example:

{{< code-tabs >}}
{{< code-tab name="14.expected.txt" language="txt" area="top-left" >}}
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,3 +1,5 @@
+# Code generated by internal/ci/gitlab/ci_tool.cue; DO NOT EDIT.
+
 stages:
   - sync
   - preflight
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
