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
that's the setup shown here. We've adapted two examples from GitHub's
[`actions/starter-workflows`](https://github.com/actions/starter-workflows/tree/main/ci)
repository, but you should use workflows in a repository that's more relevant
to your situation.

{{<columns>}}
```yml { title=".github/workflows/go.yml" codeToCopy="bmFtZTogR28Kb246CiAgcHVsbF9yZXF1ZXN0OgogICAgYnJhbmNoZXM6IFsgbWFpbiBdCmpvYnM6CiAgYnVpbGQ6CiAgICBydW5zLW9uOiB1YnVudHUtbGF0ZXN0CiAgICBzdGVwczoKICAgIC0gdXNlczogYWN0aW9ucy9jaGVja291dEB2NAogICAgLSBuYW1lOiBTZXQgdXAgR28KICAgICAgdXNlczogYWN0aW9ucy9zZXR1cC1nb0B2NAogICAgICB3aXRoOgogICAgICAgIGdvLXZlcnNpb246ICcxLjIwJwogICAgLSBuYW1lOiBCdWlsZAogICAgICBydW46IGdvIGJ1aWxkIC12IC4vLi4uCiAgICAtIG5hbWU6IFRlc3QKICAgICAgcnVuOiBnbyB0ZXN0IC12IC4vLi4uCg==" }
# filepath: .github/workflows/go.yml

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
{{<columns-separator>}}
```yml { title=".github/workflows/dotnet.yml" codeToCopy="bmFtZTogLk5FVApvbjoKICBwdWxsX3JlcXVlc3Q6CiAgICBicmFuY2hlczogWyBtYWluIF0Kam9iczoKICBidWlsZDoKICAgIHJ1bnMtb246IHVidW50dS1sYXRlc3QKICAgIHN0ZXBzOgogICAgLSB1c2VzOiBhY3Rpb25zL2NoZWNrb3V0QHY0CiAgICAtIG5hbWU6IFNldHVwIC5ORVQKICAgICAgdXNlczogYWN0aW9ucy9zZXR1cC1kb3RuZXRAdjQKICAgICAgd2l0aDoKICAgICAgICBkb3RuZXQtdmVyc2lvbjogOC4wLngKICAgIC0gbmFtZTogUmVzdG9yZSBkZXBlbmRlbmNpZXMKICAgICAgcnVuOiBkb3RuZXQgcmVzdG9yZQogICAgLSBuYW1lOiBCdWlsZAogICAgICBydW46IGRvdG5ldCBidWlsZCAtLW5vLXJlc3RvcmUKICAgIC0gbmFtZTogVGVzdAogICAgICBydW46IGRvdG5ldCB0ZXN0IC0tbm8tYnVpbGQgLS12ZXJib3NpdHkgbm9ybWFsCg==" }
# filepath: .github/workflows/dotnet.yml

name: .NET
on:
  pull_request:
    branches: [ main ]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Setup .NET
      uses: actions/setup-dotnet@v4
      with:
        dotnet-version: 8.0.x
    - name: Restore dependencies
      run: dotnet restore
    - name: Build
      run: dotnet build --no-restore
    - name: Test
      run: dotnet test --no-build --verbosity normal
```
{{</columns>}}

## Embed the workflow files in some CUE

CUE's [file embedding](https://cuelang.org/docs/howto/embed-files-in-cue-evaluation/)
feature allows the `cue` command to read data files without being told about
them individually through the command's invocation. The following CUE enables
the feature, and then *embeds* the data files we need:

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

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works), like the file shown above,
needs to exist within its own CUE module.
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGN1ZS5leGFtcGxl" }
$ cue mod init cue.example
```
You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2luICMgb25seSBkdXJpbmcgYmV0YQ==" }
$ cue login # only during beta
```
The
[Central Registry](https://registry.cue.works)
requires authentication while it's in beta testing,
so you need to login before you can use its schemas.

## Tidy your local CUE module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a curated module for the first time.

## Validate the workflow files

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYw==" }
$ cue vet -c
```

We know that each embedded data file is valid
because this command doesn't display any errors.

This simple `cue` command performs all the same checks as
[the previous guide]({{<relref"checking-existing-github-actions-files/#validate-more-workflow-files">}})
and is somewhat easier to remember and repeat.
However, that's not the only reason to choose file embedding --
as we'll see in later guides, using this feature opens the door towards
managing a truly *unified configuration graph* ...

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GitHub Actions + CUE]({{<relref"getting-started-with-github-actions-cue">}})
...
