---
title: Validating several GitHub Actions workflow files
---

We've already seen how CUE makes it trivially easy to get started, in
[Checking existing GitHub Actions files using CUE]({{<relref"checking-existing-github-actions-files">}}).
That guide finished by showing us how to validate multiple data files using
specifically constructed `cue` commands ... but wouldn't it be useful if CUE
could track which data files need to be validated against which schemas,
and then perform all those checks at once? This guide demonstrates how
to start offloading that work to CUE.

The latest pre-release of the `cue` command is required -- please
[upgrade to this version](/docs/installing-cue/) if it's not already installed:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.13.0-alpha.4
...
```

## Start with a repository containing several workflow files

GitHub Actions workflow files live in the `.github/workflows/` directory, so
that's the setup shown here:

{{<columns>}}
```yml { title=".github/workflows/test.yml" codeToCopy="bmFtZTogVGVzdCBQUnMKb246CiAgcHVsbF9yZXF1ZXN0OgogICAgYnJhbmNoZXM6CiAgICAgIC0gbWFpbgpwZXJtaXNzaW9uczoKICBjb250ZW50czogcmVhZAogIHB1bGwtcmVxdWVzdHM6IHJlYWQKam9iczoKICB0ZXN0OgogICAgcnVucy1vbjogdWJ1bnR1LWxhdGVzdAogICAgc3RlcHM6CiAgICAgIC0gdXNlczogYWN0aW9ucy9jaGVja291dEB2NAogICAgICAtIG5hbWU6IFNldCB1cCBHbwogICAgICAgIHVzZXM6IGFjdGlvbnMvc2V0dXAtZ29AdjUKICAgICAgICB3aXRoOgogICAgICAgICAgZ28tdmVyc2lvbjogIjEuMjQiCiAgICAgIC0gbmFtZTogSW5zdGFsbCBkZXBlbmRlbmNpZXMKICAgICAgICBydW46IGdvIG1vZCB0aWR5CiAgICAgIC0gbmFtZTogVGVzdAogICAgICAgIHJ1bjogZ28gdGVzdCAtdiAgLi8uLi4K" }
# filepath: .github/workflows/test.yml

name: Test PRs
on:
  pull_request:
    branches:
      - main
permissions:
  contents: read
  pull-requests: read
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up Go
        uses: actions/setup-go@v5
        with:
          go-version: "1.24"
      - name: Install dependencies
        run: go mod tidy
      - name: Test
        run: go test -v  ./...
```
{{<columns-separator>}}
```yml { title=".github/workflows/release.yml" codeToCopy="bmFtZTogUmVsZWFzZQoib24iOgogIHB1c2g6CiAgICB0YWdzOgogICAgICAtIHYqCnBlcm1pc3Npb25zOgogIGNvbnRlbnRzOiByZWFkCmpvYnM6CiAgcmVsZWFzZToKICAgIHJ1bnMtb246IHVidW50dS1sYXRlc3QKICAgIHN0ZXBzOgogICAgICAtIHVzZXM6IGFjdGlvbnMvY2hlY2tvdXRAdjQKICAgICAgLSBuYW1lOiBTZXQgdXAgR28KICAgICAgICB1c2VzOiBhY3Rpb25zL3NldHVwLWdvQHY1CiAgICAgICAgd2l0aDoKICAgICAgICAgIGdvLXZlcnNpb246ICIxLjI0IgogICAgICAtIG5hbWU6IEluc3RhbGwgZGVwZW5kZW5jaWVzCiAgICAgICAgcnVuOiBnbyBtb2QgdGlkeQogICAgICAtIG5hbWU6IFRlc3QKICAgICAgICBydW46IGdvIHRlc3QgLXYgLXJhY2UgLi8uLi4KICAgICAgLSBuYW1lOiBSZWxlYXNlCiAgICAgICAgcnVuOiBlY2hvIFJlbGVhc2UgcHJvY2VzcyBoZXJlLgo=" }
# filepath: .github/workflows/release.yml

name: Release
"on":
  push:
    tags:
      - v*
permissions:
  contents: read
jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up Go
        uses: actions/setup-go@v5
        with:
          go-version: "1.24"
      - name: Install dependencies
        run: go mod tidy
      - name: Test
        run: go test -v -race ./...
      - name: Release
        run: echo Release process here.
```
{{</columns>}}

We've assembled a pair of workflows that test and release a Go module, but you
should use workflows in a repository that's more relevant to your situation.

## Initialise your local CUE module

CUE that uses modules from the
[Central Registry](https://registry.cue.works), as shown below, needs to exist
within its own CUE module:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```

You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).

## Login to the Central Registry

The
[Central Registry](https://registry.cue.works)
requires authentication while it's in beta testing,
so you need to login before using its modules:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2luICMgb25seSBkdXJpbmcgYmV0YQ==" }
$ cue login # only during beta
```

## Embed the workflow files in some CUE

CUE's [file embedding](https://cuelang.org/docs/howto/embed-files-in-cue-evaluation/)
allows the `cue` command to read data files without being told about them through
individual arguments. The following CUE enables this feature, and then *embeds*
the GitHub Actions workflow files shown above:

```cue { title="github.cue" codeToCopy="QGV4dGVybihlbWJlZCkgLy8gRmlsZSBlbWJlZGRpbmcgbXVzdCBiZSBleHBsaWNpdGx5IGVuYWJsZWQuCnBhY2thZ2UgY29uZmlnCgppbXBvcnQgImN1ZS5kZXYveC9naXRodWJhY3Rpb25zIgoKZ2l0aHViOiB7CgkvLyBFbWJlZCB0aGUgY29udGVudHMgb2YgYWxsIFlBTUwgd29ya2Zsb3cgZmlsZXMuCgl3b3JrZmxvd3M6IF8gQGVtYmVkKGdsb2I9LmdpdGh1Yi93b3JrZmxvd3MvKi55bWwpCgkvLyBWYWxpZGF0ZSB0aGUgY29udGVudHMgb2YgZWFjaCBlbWJlZGRlZCBmaWxlIGFnYWluc3QgdGhlIHJlbGV2YW50IHNjaGVtYS4KCXdvcmtmbG93czogW19dOiBnaXRodWJhY3Rpb25zLiNXb3JrZmxvdwp9Cg==" }
// filepath: github.cue

@extern(embed) // File embedding must be explicitly enabled.
package config

import "cue.dev/x/githubactions"

github: {
	// Embed the contents of all YAML workflow files.
	workflows: _ @embed(glob=.github/workflows/*.yml)
	// Validate the contents of each embedded file against the relevant schema.
	workflows: [_]: githubactions.#Workflow
}
```


## Tidy your local CUE module

Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a CUE module for the first time:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```

Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).

## Validate the workflow files

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYw==" }
$ cue vet -c
```

We know that all our embedded workflow files are valid
because this command doesn't display any errors.

This simple `cue` command performs all the same checks as
[the previous guide]({{<relref"checking-existing-github-actions-files/#validate-more-workflow-files">}}),
and is also somewhat easier to remember and repeat --
but that's not the only reason to choose file embedding.
As we'll see in later guides, using this feature opens the door towards
managing a truly *unified configuration graph* ...

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GitHub Actions + CUE]({{<relref"getting-started-with-github-actions-cue">}})
...
