---
title: Checking existing GitHub Actions files using CUE
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

This guide shows you how to use the `cue` command to validate a GitHub Actions
workflow file using a
[curated module]({{<relref"docs/draft/cldd/curated-modules-faq">}}) from the
CUE [Central Registry](https://registry.cue.works) -- all without writing any
schemas or policies in CUE.

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its modules.

## Choose a GitHub Actions workflow file

In this example we fetch
[a starter workflow](https://github.com/actions/starter-workflows/blob/main/ci/go.yml)
from GitHub's `actions/starter-workflows` repository, but you should use any
workflow file that's relevant to your situation.

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VybCAtc2wgLW8gd29ya2Zsb3cueW1sIGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9hY3Rpb25zL3N0YXJ0ZXItd29ya2Zsb3dzL2E0MTM4Njk5NDhjN2Y1ZDU2MTBiMDAzNDY5OTcyNzJjNGJhMzNmODQvY2kvZ28ueW1s" }
$ curl -sl -o workflow.yml https://raw.githubusercontent.com/actions/starter-workflows/a413869948c7f5d5610b00346997272c4ba33f84/ci/go.yml
```
## Validate the workflow file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyBnaXRodWIuY29tL2N1ZS10bXAvanNvbnNjaGVtYS1wdWIvZXhwMy9naXRodWJhY3Rpb25zQGxhdGVzdCB3b3JrZmxvdy55bWwgLWQgJyNXb3JrZmxvdyc=" }
$ cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/githubactions@latest workflow.yml -d '#Workflow'
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
{{<linkto/inline"draft/cldd/getting-started-with-github-actions-cue">}} ...
