---
title: Spotting errors earlier in GitHub Actions files
---

An easy first step with CUE is shown in
[Checking existing GitHub Actions files using CUE]({{<relref"checking-existing-github-actions-files">}}).
There, we see the happy path of using `cue vet` to confirm that one of our
existing GitHub Actions workflow files is valid.
But what does it look like when one of our manually maintained workflow files
isn't valid?
How does CUE help us catch errors early, before they've had the chance to move
further downstream and waste time, resources, and focus?

This guide shows what happens when the `cue vet` command finds a problem with a
GitHub Actions workflow file using a
[curated module](/getting-started/github-actions-workflows/) from the
CUE [Central Registry](https://registry.cue.works),
and how it highlights the data we need to fix.

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2luICMgb25seSBkdXJpbmcgYmV0YQ==" }
$ cue login # only during beta
```
The
[Central Registry](https://registry.cue.works)
requires authentication while it’s in beta testing,
so we need to login before using its modules.

## A broken workflow file

This example is adapted from GitHub's
[`actions/starter-workflows`](https://github.com/actions/starter-workflows/blob/main/ci/go.yml)
repository -- but the deliberate errors introduced here aren't part
of the original file, of course!

```yml { title="workflow.yml" codeToCopy="bmFtZTogR28Kb246CiAgcHVsbF9yZXF1ZXN0OgogICAgYnJhbmNoZXM6IFsgbWFpbiBdCmpvYjoKICBidWlsZDoKICAgIHJ1bnMtb246IHVidW50dS1sYXRlc3QKICAgIHN0ZXBzOgogICAgLSB1c2VzOiBhY3Rpb25zL2NoZWNrb3V0QHY0CiAgICAtIG5hbWU6IFNldCB1cCBHbwogICAgICB1c2VzOiBhY3Rpb25zL3NldHVwLWdvQHY0CiAgICAgIHdpdGg6CiAgICAgICAgZ28tdmVyc2lvbjogJzEuMjAnCiAgICAtIG5hbWU6IEJ1aWxkCiAgICAgIHJ1bjogZ28gYnVpbGQgLXYgLi8uLi4KICAgIC0gbmFtZTogVGVzdAogICAgICBydW46IGdvIHRlc3QgLXYgLi8uLi4K" }
# filepath: workflow.yml

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
```

## Validate the workflow file

We use `cue vet` to validate `workflow.yml` against the `githubactions` package's `#Workflow` definition:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1dvcmtmbG93JyBjdWUuZGV2L3gvZ2l0aHViYWN0aW9uc0BsYXRlc3Qgd29ya2Zsb3cueW1s" }
$ cue vet -c -d '#Workflow' cue.dev/x/githubactions@latest workflow.yml
job: field not allowed:
    ./workflow.yml:5:1
```

The `cue vet` command shows us the error (`job: field not allowed`), and tells
us the location of the problem (line 5 of our data file).

## Fix the workflow file

From the `cue vet` error message we know that the `job` field isn't permitted.
We check the GitHub Actions documentation (or perhaps we review the most recent
change made to the workflow file in our version control system) and discover
that the field should actually be named `jobs`.

We fix our workflow file by updating the highlighted line that `cue vet`
mentioned, so that the file becomes:

```yml { title="workflow.yml" codeToCopy="bmFtZTogR28Kb246CiAgcHVsbF9yZXF1ZXN0OgogICAgYnJhbmNoZXM6IFsgbWFpbiBdCmpvYnM6CiAgYnVpbGQ6CiAgICBydW5zLW9uOiB1YnVudHUtbGF0ZXN0CiAgICBzdGVwczoKICAgIC0gdXNlczogYWN0aW9ucy9jaGVja291dEB2NAogICAgLSBuYW1lOiBTZXQgdXAgR28KICAgICAgdXNlczogYWN0aW9ucy9zZXR1cC1nb0B2NAogICAgICB3aXRoOgogICAgICAgIGdvLXZlcnNpb246ICcxLjIwJwogICAgLSBuYW1lOiBCdWlsZAogICAgICBydW46IGdvIGJ1aWxkIC12IC4vLi4uCiAgICAtIG5hbWU6IFRlc3QKICAgICAgcnVuOiBnbyB0ZXN0IC12IC4vLi4uCg==" hl_lines=7 }
# filepath: workflow.yml

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
```

## Re-validate the workflow file

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1dvcmtmbG93JyBjdWUuZGV2L3gvZ2l0aHViYWN0aW9uc0BsYXRlc3Qgd29ya2Zsb3cueW1s" }
$ cue vet -c -d '#Workflow' cue.dev/x/githubactions@latest workflow.yml
```

We know that the curated module has validated our file this time because `cue
vet` doesn't display any errors.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GitHub Actions + CUE]({{<relref"getting-started-with-github-actions-cue">}})
...
