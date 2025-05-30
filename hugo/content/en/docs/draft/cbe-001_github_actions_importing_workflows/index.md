---
title: CUE By Example - Driving GitHub Actions workflows with CUE
---

{{<caution>}}
Source: https://github.com/cue-labs/cue-by-example/tree/main/001_github_actions_importing_workflows
{{</caution>}}

# Driving GitHub Actions workflows with CUE
<sup>by [Jonathan Matthews](https://jonathanmatthews.com)</sup>

This guide explains how to convert GitHub Actions workflow files from YAML to
CUE, check those workflows are valid, and then use CUE's tooling layer to
regenerate YAML.

This allows you to switch to CUE as a source of truth for GitHub Actions
workflows and perform client-side validation, without GitHub needing to know
you're managing your workflows with CUE.

|   :exclamation: WARNING :exclamation:   |
|:--------------------------------------- |
| This guide requires that you use `cue` version `v0.11.0-alpha.2` or later. **The process described below won't work with earlier versions**. Check the version of your `cue` command by running `cue version`, and [upgrade it](https://cuelang.org/dl) if needed.

## Prerequisites

- You have a set of GitHub Actions workflow files.
  - The examples shown in this guide use the state of the first commit of CUE's
    [github-actions-example](https://github.com/cue-examples/github-actions-example/tree/2b9d2f240d0c677c30218282dc10f95dfd566453/.github/workflows)
    repository, but you don't need to use that repository in any way.
- You have
  [CUE installed](https://alpha.cuelang.org/docs/introduction/installation/)
  locally -- this allows you to run `cue` commands
  - You must have version `v0.11.0-alpha.2` or later installed.
- You have a [GitHub](https://github.com) account -- this allows you to use the
  CUE Central Registry.
- You have a [Central Registry](https://registry.cue.works) account -- this
  allows you to fetch a schema to validate your GitHub Actions workflows.
- You have [`git` installed](https://git-scm.com/downloads).

## Steps

### Convert YAML workflows to CUE

#### :arrow_right: Begin with a clean git state

Change directory into the root of the repository that contains your GitHub
Actions workflow files, and ensure you start this process with a clean git
state, with no modified files. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y2QgZ2l0aHViLWFjdGlvbnMtZXhhbXBsZSAjIG91ciBleGFtcGxlIHJlcG9zaXRvcnkKZ2l0IHN0YXR1cyAjIHNob3VsZCByZXBvcnQgIndvcmtpbmcgdHJlZSBjbGVhbiI=" }
$ cd github-actions-example # our example repository
$ git status # should report "working tree clean"
On branch master
nothing to commit, working tree clean
```

#### :arrow_right: Initialise a CUE module

Initialise a CUE module named after the organisation and repository you're
working with. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGdpdGh1Yi5jb20vY3VlLWV4YW1wbGVzL2dpdGh1Yi1hY3Rpb25zLWV4YW1wbGU=" }
$ cue mod init github.com/cue-examples/github-actions-example
```

#### :arrow_right: Import YAML workflows

Use `cue` to import your YAML workflow files:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGltcG9ydCAuLy5naXRodWIvd29ya2Zsb3dzLyAtLXdpdGgtY29udGV4dCAtcCBnaXRodWIgLWYgLWwgd29ya2Zsb3dzOiAtbCAnc3RyaW5ncy5UcmltU3VmZml4KHBhdGguQmFzZShmaWxlbmFtZSkscGF0aC5FeHQoZmlsZW5hbWUpKSc=" }
$ cue import ./.github/workflows/ --with-context -p github -f -l workflows: -l 'strings.TrimSuffix(path.Base(filename),path.Ext(filename))'
```

Check that a CUE file has been created for each YAML workflow in the
`.github/workflows` directory. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="bHMgLmdpdGh1Yi93b3JrZmxvd3MvID4uLi80LmFjdHVhbC50eHQ=" }
# Actual command in CUE-By-Example guide:
# ls .github/workflows/
$ ls .github/workflows/ >../4.actual.txt
```

Your output should look similar to this, with matching pairs of YAML and CUE
files:

{{< code-tabs >}}
{{< code-tab name="4.expected.txt" language="txt" area="top-left" >}}
workflow1.cue
workflow1.yml
workflow2.cue
workflow2.yml
{{< /code-tab >}}{{< /code-tabs >}}
Observe that each workflow has been imported into the `workflows` struct, at a
location derived from its original file name:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="aGVhZCAtNSAuZ2l0aHViL3dvcmtmbG93cy8qLmN1ZSA+Li4vNS5hY3R1YWwudHh0" }
# Actual command in CUE-By-Example guide:
# head -5 .github/workflows/*.cue
$ head -5 .github/workflows/*.cue >../5.actual.txt
```

The output should reflect your workflows. In our example:

{{< code-tabs >}}
{{< code-tab name="5.expected.txt" language="txt" area="top-left" >}}
==> .github/workflows/workflow1.cue <==
package github

workflows: workflow1: {
	on: [
		"push",

==> .github/workflows/workflow2.cue <==
package github

workflows: workflow2: {
	on: [
		"push",
{{< /code-tab >}}{{< /code-tabs >}}
#### :arrow_right: Store CUE workflows in a dedicated directory

Create a directory called `github` to hold your CUE-based GitHub Actions
workflow files. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="bWtkaXIgLXAgaW50ZXJuYWwvY2kvZ2l0aHVi" }
$ mkdir -p internal/ci/github
```

You may change the hierarchy and naming of `github`'s **parent** directories to
suit your repository layout. If you do so, you will need to adapt some commands
and CUE code as you follow this guide.

Move the newly-created CUE files into their dedicated directory. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="bXYgLi8uZ2l0aHViL3dvcmtmbG93cy8qLmN1ZSBpbnRlcm5hbC9jaS9naXRodWI=" }
$ mv ./.github/workflows/*.cue internal/ci/github
```

### Validate workflows

#### :arrow_right: Authenticate the `cue` command against the CUE Central Registry

Run this command, and follow the instructions it displays:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```

This will allow you to fetch modules from the Central Registry.

#### :arrow_right: Add a dependency on a GitHub Actions module

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBnZXQgZ2l0aHViLmNvbS9jdWUtdG1wL2pzb25zY2hlbWEtcHViL2V4cDEvZ2l0aHViYWN0aW9uc0B2MC4zLjA=" }
$ cue mod get github.com/cue-tmp/jsonschema-pub/exp1/githubactions@v0.3.0
```

This command specifies a precise version of the GitHub Actions module in order
to make sure that this process is reproducible.

The GitHub Actions module *looks* like it has a temporary location because it
was created as part of the CUE project's work to figure out how and where to
store third-party schemas. Whilst it will eventually live at a more permanent
and appropriate location (which will then be reflected in this guide), this
*version* of the module won't disappear from its "temporary" location - so it's
safe to use!

#### :arrow_right: Apply the schema

We need to tell CUE to apply the schema to each workflow.

To do this we'll create a file at `internal/ci/github/workflows.cue` in our
example.

However, if the workflow imports that you performed earlier *already* created a
file with that same path and name, then simply select a different CUE filename
that *doesn't* already exist. Place the file in the `internal/ci/github/`
directory.

:floppy_disk: `internal/ci/github/workflows.cue`
{{< code-tabs >}}
{{< code-tab name="github-actions-example/internal/ci/github/workflows.cue" language="cue" area="top-left" >}}
package github

import "github.com/cue-tmp/jsonschema-pub/exp1/githubactions"

// Each member of the workflows struct must be a valid #Workflow.
workflows: [_]: githubactions.#Workflow
{{< /code-tab >}}{{< /code-tabs >}}

#### :arrow_right: Validate your workflows

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAuL2ludGVybmFsL2NpL2dpdGh1Yg==" }
$ cue vet -c ./internal/ci/github
```

If this command fails and produces any output, then CUE believes that at least
one of your workflows isn't valid. It's very likely that CUE is correct (and
has found a problem) even if GitHub Actions manages to process your workflow
files successfully -- because GitHub Actions can be lax and overly permissive
in enforcing its own schema rules!  You'll need to resolve this before
continuing, by updating your workflows inside your new CUE files. If you're
having difficulty fixing them, please come and ask for help in the friendly CUE
[Slack workspace](https://cuelang.org/s/slack) or
[Discord server](https://cuelang.org/s/discord)!

### Generate YAML from CUE

#### :arrow_right: Create a CUE workflow command

Create a CUE file at `internal/ci/github/ci_tool.cue`, containing the following workflow command.
Adapt the element commented with `TODO`:

:floppy_disk: `internal/ci/github/ci_tool.cue`
{{< code-tabs >}}
{{< code-tab name="github-actions-example/internal/ci/github/ci_tool.cue" language="cue" area="top-left" >}}
package github

import (
	"path"
	"encoding/yaml"
	"tool/file"
)

_goos: string @tag(os,var=os)

// Regenerate all workflow files
command: regenerate: {
	workflow_files: {
		// TODO: update _toolFile to reflect the directory hierarchy containing this file.
		let _toolFile = "internal/ci/github/ci_tool.cue"
		let _workflowDir = path.FromSlash(".github/workflows", path.Unix)
		let _donotedit = "Code generated by \(_toolFile); DO NOT EDIT."

		clean: {
			glob: file.Glob & {
				glob: path.Join([_workflowDir, "*.yml"], _goos)
				files: [...string]
			}
			for _, _filename in glob.files {
				"Delete \(_filename)": file.RemoveAll & {path: _filename}
			}
		}

		create: {
			for _workflowName, _workflow in workflows
			let _filename = _workflowName + ".yml" {
				"Generate \(_filename)": file.Create & {
					$after: [for v in clean {v}]
					filename: path.Join([_workflowDir, _filename], _goos)
					contents: "# \(_donotedit)\n\n\(yaml.Marshal(_workflow))"
				}
			}
		}
	}
}
{{< /code-tab >}}{{< /code-tabs >}}

Make the modification indicated by the `TODO` comment.

This workflow command will export each CUE-based workflow back into its required YAML file,
on demand.

#### :arrow_right: Test the CUE workflow command

With the modified `ci_tool.cue` file in place, check that the `regenerate`
workflow command is available **from a shell sitting at the root of the
repository**. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y2QgJChnaXQgcmV2LXBhcnNlIC0tc2hvdy10b3BsZXZlbCkgIyBtYWtlIHN1cmUgd2UncmUgc2l0dGluZyBhdCB0aGUgcmVwb3NpdG9yeSByb290CmN1ZSBoZWxwIGNtZCByZWdlbmVyYXRlIC4vaW50ZXJuYWwvY2kvZ2l0aHViIHwgaGVhZCAtNCA+Li4vMTIuYWN0dWFsLnR4dA==" }
$ cd $(git rev-parse --show-toplevel) # make sure we're sitting at the repository root

# Actual command in CUE-By-Example guide:
# cue help cmd regenerate ./internal/ci/github   # the "./" prefix is required
$ cue help cmd regenerate ./internal/ci/github | head -4 >../12.actual.txt
```

Your output **must** begin with the following:

{{< code-tabs >}}
{{< code-tab name="12.expected.txt" language="txt" area="top-left" >}}
Regenerate all workflow files

Usage:
  cue cmd regenerate [flags]
{{< /code-tab >}}{{< /code-tabs >}}
|   :exclamation: WARNING :exclamation:   |
|:--------------------------------------- |
| If you *don't* see the usage explanation for the `regenerate` workflow command (or if you receive an error message) then **either** your workflow command isn't set up as CUE requires, **or** you're running a CUE version older than `v0.11.0-alpha.2`. If you've [upgraded to at least that version](https://cuelang.org/dl) but the usage explanation still isn't being displayed then: (1) double check the contents of the `ci_tool.cue` file and the modifications you made to it; (2) make sure its location in the repository is precisely as given in this guide; (3) ensure the filename is *exactly* `ci_tool.cue`; (4) check that the `internal/ci/github/workflows.cue` file has the same contents as shown above; (5) run `cue vet ./internal/ci/github` and check that your workflows actually validate successfully - in other words: were they truly valid before you even started this process? Lastly, make sure you've followed all the steps in this guide, and that you invoked the `cue help` command from the repository's root directory. If you get really stuck, please come and join [the CUE community](https://cuelang.org/community/) and ask for some help!

#### :arrow_right: Regenerate the YAML workflow files

Run the `regenerate` workflow command to produce YAML workflow files from CUE. For
example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGNtZCByZWdlbmVyYXRlIC4vaW50ZXJuYWwvY2kvZ2l0aHViICMgdGhlICIuLyIgcHJlZml4IGlzIHJlcXVpcmVk" }
$ cue cmd regenerate ./internal/ci/github # the "./" prefix is required
```

#### :arrow_right: Audit changes to the YAML workflow files

Check that each YAML workflow file has a single change from the original:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGRpZmYgLmdpdGh1Yi93b3JrZmxvd3MvIHwgZ3JlcCAtdiAnXmluZGV4IFswLTlhLWZdezd9XC5cLlswLTlhLWZdezd9JyA+Li4vMTQuYWN0dWFsLnR4dA==" }
# Actual command in CUE-By-Example guide:
# git diff .github/workflows/
$ git diff .github/workflows/ | grep -v '^index [0-9a-f]{7}\.\.[0-9a-f]{7}' >../14.actual.txt
```

Your output should look similar to the following example:

{{< code-tabs >}}
{{< code-tab name="14.expected.txt" language="txt" area="top-left" >}}
diff --git a/.github/workflows/workflow1.yml b/.github/workflows/workflow1.yml
--- a/.github/workflows/workflow1.yml
+++ b/.github/workflows/workflow1.yml
@@ -1,3 +1,5 @@
+# Code generated by internal/ci/github/ci_tool.cue; DO NOT EDIT.
+
 "on":
   - push
   - pull_request
diff --git a/.github/workflows/workflow2.yml b/.github/workflows/workflow2.yml
--- a/.github/workflows/workflow2.yml
+++ b/.github/workflows/workflow2.yml
@@ -1,3 +1,5 @@
+# Code generated by internal/ci/github/ci_tool.cue; DO NOT EDIT.
+
 "on":
   - push
   - pull_request
{{< /code-tab >}}{{< /code-tabs >}}

The only change in each YAML file is the addition of a header that warns the
reader not to edit the file directly.

#### :arrow_right: Add and commit files to git

Add your files to git. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGFkZCAuZ2l0aHViL3dvcmtmbG93cy8gaW50ZXJuYWwvY2kvZ2l0aHViLyBjdWUubW9kL21vZHVsZS5jdWU=" }
$ git add .github/workflows/ internal/ci/github/ cue.mod/module.cue
```

Make sure to include your slightly modified YAML workflow files in
`.github/workflows/` along with all the new files in `internal/ci/github/` and
your `cue.mod/module.cue` file.

Commit your files to git, with an appropriate commit message:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGNvbW1pdCAtLXF1aWV0IC1tICJjaTogY3JlYXRlIENVRSBzb3VyY2VzIGZvciBHSEEgd29ya2Zsb3dzIg==" }
# Actual command in CUE-By-Example guide:
# git commit -m "ci: create CUE sources for GHA workflows"
$ git commit --quiet -m "ci: create CUE sources for GHA workflows"
```

## Conclusion

**Well done - your GitHub Actions workflow files have been imported into CUE!**

They can now be managed using CUE, leading to safer and more predictable
changes. The use of a schema to check your workflows means that you will catch
and fix many types of mistake earlier than before, without waiting for the slow
"git add/commit/push; check if CI fails" cycle.

From now on, each time you make a change to a CUE workflow file, immediately
regenerate the YAML files required by GitHub Actions, and commit your changes
to all the CUE and YAML files. For example:

:computer: `terminal`
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGNtZCByZWdlbmVyYXRlIC4vaW50ZXJuYWwvY2kvZ2l0aHViLyAjIHRoZSAiLi8iIHByZWZpeCBpcyByZXF1aXJlZApnaXQgYWRkIC5naXRodWIvd29ya2Zsb3dzLyBpbnRlcm5hbC9jaS9naXRodWIvCmdpdCBjb21taXQgLW0gImNpOiBhZGRlZCBuZXcgcmVsZWFzZSB3b3JrZmxvdyIgIyBleGFtcGxlIG1lc3NhZ2U=" }
$ cue cmd regenerate ./internal/ci/github/ # the "./" prefix is required
$ git add .github/workflows/ internal/ci/github/
$ git commit -m "ci: added new release workflow" # example message
```
