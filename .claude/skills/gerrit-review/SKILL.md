---
name: gerrit-review
description: Fetch and display review comments from a GerritHub change
disable-model-invocation: false
argument-hint: "[change-number, change-id, git-ref, or url]"
---

Fetch review feedback from a GerritHub change and present it clearly.

## Fetching comments

Use the `_scripts/gerritComments.bash` script for everything. It handles
argument resolution, authentication, JSON parsing, thread grouping, and
resolved state detection.

The argument `$ARGUMENTS` can be any of:
- A bare change number (e.g. `1233340`)
- A Change-Id (e.g. `Ia15e97465869aa18ba2b8c9795cec18f438d7b76`)
- A git ref (e.g. `HEAD`, `HEAD~2`, a commit SHA)
- A GerritHub URL — extract the change number (final numeric path
  segment) and pass that

```bash
# Show all comments grouped by thread with resolved state
./_scripts/gerritComments.bash $ARGUMENTS

# Show only unresolved threads
./_scripts/gerritComments.bash $ARGUMENTS --unresolved-only
```

The script resolves Change-Ids and git refs to change numbers
automatically via the GerritHub REST API.

## Presenting feedback

After fetching comments, focus on **unresolved** threads as these need
action. For each unresolved thread, summarise the feedback and suggest
a concrete plan for addressing it.

When the file `/COMMIT_MSG` appears as a path, present those comments as
feedback on the **commit message** itself, not a source file.

If all threads are resolved, report that no action is needed.
