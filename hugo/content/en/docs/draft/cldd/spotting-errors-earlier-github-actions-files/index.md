---
title: Spotting errors earlier in GitHub Actions files
draft: true
no_index: true
---

{{<info>}}
[Curated modules]({{<relref"curated-modules-faq">}})
are a work in progress and your feedback is important!
Please [report any issues]({{<report-issue-url>}}) you find.
{{</info>}}

An easy first step using CUE is shown in
[Checking existing GitHub Actions files using CUE]({{<relref"checking-existing-github-actions-files">}}).
There, we see the happy path of using `cue vet` to show that one of our
existing GitHub Actions workflow YAML files is valid.
But what does it look like when one of our manually maintained workflow files
isn't valid?
How does CUE help us catch errors early, before they've had the chance to move
further downstream and waste time, resources, and focus?

This guide shows what happens when the `cue vet` command finds a problem with a
GitHub Actions workflow file using a
[curated module]({{<relref"curated-modules-faq">}}) from the
CUE [Central Registry](https://registry.cue.works),
and how it highlights the data we need to fix.

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2lu" }
$ cue login
```
The
[Central Registry](https://registry.cue.works)
requires authentication, so you need to login before you can use its modules.

## A broken GitHub Actions workflow file

This example is adapted from GitHub's
[`actions/starter-workflows`](https://github.com/actions/starter-workflows/blob/main/ci/go.yml)
repository -- but the errors we've deliberately introduced here, of course, are
not part of the original file!

{{< code-tabs >}}
{{< code-tab name="workflow.yml" language="yml" area="top-left" >}}
name: Go
on:
  pull_request:
    branches: [ main ]
job:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Set up Go
      uses: actions/setup-go@v4
      with:
        go-version: '1.20'
    - name: Build
      run: go build -v ./...
    - name: Test
      run: go test -v ./...
{{< /code-tab >}}{{< /code-tabs >}}

## Validate the workflow file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyBnaXRodWIuY29tL2N1ZS10bXAvanNvbnNjaGVtYS1wdWIvZXhwMy9naXRodWJhY3Rpb25zQGxhdGVzdCB3b3JrZmxvdy55bWwgLWQgJyNXb3JrZmxvdyc=" }
$ cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/githubactions@latest workflow.yml -d '#Workflow'
job: field not allowed:
    ./workflow.yml:5:1
```

The `cue vet` command shows us the error (`job: field not allowed`), and
highlights the location of the problematic data: line 5 of `workflow.yml`.

(The module path used here is temporary, and will be given a proper home soon.
However, because one important property of the
[Central Registry](https://registry.cue.works) is that curated modules are
never removed, **we can rely on this "temporary" path for as long as we
need** -- it will not stop working and break our processes in the future.)


## Fix the workflow file

From the `cue vet` error message we know that the `job` field isn't permitted.
We check the GitHub Actions documentation -- or perhaps we review the most
recent change made to the workflow file in our version control system -- and
discover that the field should instead be named `jobs`.

We fix our workflow file by updating line 5, as mentioned by `cue vet`, and the
file becomes:

{{< code-tabs >}}
{{< code-tab name="workflow.yml" language="yml" area="top-left" >}}
name: Go
on:
  pull_request:
    branches: [ main ]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Set up Go
      uses: actions/setup-go@v4
      with:
        go-version: '1.20'
    - name: Build
      run: go build -v ./...
    - name: Test
      run: go test -v ./...
{{< /code-tab >}}{{< /code-tabs >}}

## Re-validate the workflow file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyBnaXRodWIuY29tL2N1ZS10bXAvanNvbnNjaGVtYS1wdWIvZXhwMy9naXRodWJhY3Rpb25zQGxhdGVzdCB3b3JrZmxvdy55bWwgLWQgJyNXb3JrZmxvdyc=" }
$ cue vet -c github.com/cue-tmp/jsonschema-pub/exp3/githubactions@latest workflow.yml -d '#Workflow'
```

Because `cue vet` doesn't display any errors,
we know that the curated module has validated our configuration file.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GitHub Actions + CUE]({{<relref"getting-started-with-github-actions-cue">}})
...
