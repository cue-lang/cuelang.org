---
title: Validating several GitHub Actions workflow files
---

{{< todo "TODO: Preamble" >}}

The latest pre-release of the `cue` command is required -- please
[upgrade to this version](/docs/installing-cue/) if it's not already installed:
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.13.0-alpha.3
...
```

## Login to the Central Registry

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGxvZ2luICMgb25seSBkdXJpbmcgYmV0YQ==" }
$ cue login # only during beta
```
The
[Central Registry](https://registry.cue.works)
requires authentication while it's in beta testing,
so you need to login before you can use its schemas.

## Start with a repository containing several workflow files

GitHub Actions requires that workflow files live in the `.github/workflows/`
directory, so that's the setup assembled here.
We've adapted two examples from GitHub's
[`actions/starter-workflows`](https://github.com/actions/starter-workflows/tree/main/ci)
repository, but you should use workflows in a repository that's more relevant
to your situation.

{{<columns>}}
```yml { title=".github/workflows/go.yml" codeToCopy="bmFtZTogR28Kb246CiAgcHVsbF9yZXF1ZXN0OgogICAgYnJhbmNoZXM6IFsgbWFpbiBdCmpvYjoKICBidWlsZDoKICAgIHJ1bnMtb246IHVidW50dS1sYXRlc3QKICAgIHN0ZXBzOgogICAgLSB1c2VzOiBhY3Rpb25zL2NoZWNrb3V0QHY0CiAgICAtIG5hbWU6IFNldCB1cCBHbwogICAgICB1c2VzOiBhY3Rpb25zL3NldHVwLWdvQHY0CiAgICAgIHdpdGg6CiAgICAgICAgZ28tdmVyc2lvbjogJzEuMjAnCiAgICAtIG5hbWU6IEJ1aWxkCiAgICAgIHJ1bjogZ28gYnVpbGQgLXYgLi8uLi4KICAgIC0gbmFtZTogVGVzdAogICAgICBydW46IGdvIHRlc3QgLXYgLi8uLi4K" }
# filepath: .github/workflows/go.yml

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
{{<columns-separator>}}
```yml { title=".github/workflows/dotnet.yml" codeToCopy="bmFtZTogLk5FVApvbjoKICBwdWxsX3JlcXVlc3Q6CiAgICBicmFuY2hlczogWyBtYWluIF0Kam9iOgogIGJ1aWxkOgogICAgcnVucy1vbjogdWJ1bnR1LWxhdGVzdAogICAgc3RlcHM6CiAgICAtIHVzZXM6IGFjdGlvbnMvY2hlY2tvdXRAdjQKICAgIC0gbmFtZTogU2V0dXAgLk5FVAogICAgICB1c2VzOiBhY3Rpb25zL3NldHVwLWRvdG5ldEB2NAogICAgICB3aXRoOgogICAgICAgIGRvdG5ldC12ZXJzaW9uOiA4LjAueAogICAgLSBuYW1lOiBSZXN0b3JlIGRlcGVuZGVuY2llcwogICAgICBydW46IGRvdG5ldCByZXN0b3JlCiAgICAtIG5hbWU6IEJ1aWxkCiAgICAgIHJ1bjogZG90bmV0IGJ1aWxkIC0tbm8tcmVzdG9yZQogICAgLSBuYW1lOiBUZXN0CiAgICAgIHJ1bjogZG90bmV0IHRlc3QgLS1uby1idWlsZCAtLXZlcmJvc2l0eSBub3JtYWwK" }
# filepath: .github/workflows/dotnet.yml

name: .NET
on:
  pull_request:
    branches: [ main ]
job:
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

The [file embedding](https://cuelang.org/docs/howto/embed-files-in-cue-evaluation/)
feature allows data files to be read by CUE -- without telling the `cue` command
about them. The following CUE enables the feature, and then *embeds* all the YAML
files in the `.github/workflows/` directory:

```cue { title="github.cue" codeToCopy="QGV4dGVybihlbWJlZCkgLy8gRmlsZSBlbWJlZGRpbmcgbXVzdCBiZSBleHBsaWNpdGx5IGVuYWJsZWQuCnBhY2thZ2UgY2ljZAoKaW1wb3J0ICJjdWUuZGV2L3gvZ2l0aHViYWN0aW9ucyIKCmdpdGh1YjogewoJLy8gRW1iZWQgdGhlIGNvbnRlbnRzIG9mIGFsbCBZQU1MIGZpbGVzIGluIHRoZSAuZ2l0aHViL3dvcmtmbG93cy8gZGlyZWN0b3J5LgoJd29ya2Zsb3dzOiBfIEBlbWJlZChnbG9iPS5naXRodWIvd29ya2Zsb3dzLyoueW1sKQoJLy8gVmFsaWRhdGUgdGhlIGNvbnRlbnRzIG9mIGVhY2ggZW1iZWRkZWQgZmlsZSBhZ2FpbnN0IHRoZSBjdXJhdGVkIG1vZHVsZSdzIHJlbGV2YW50IHNjaGVtYS4KCXdvcmtmbG93czogW19dOiBnaXRodWJhY3Rpb25zLiNXb3JrZmxvdwp9Cg==" }
// filepath: github.cue

@extern(embed) // File embedding must be explicitly enabled.
package cicd

import "cue.dev/x/githubactions"

github: {
	// Embed the contents of all YAML files in the .github/workflows/ directory.
	workflows: _ @embed(glob=.github/workflows/*.yml)
	// Validate the contents of each embedded file against the curated module's relevant schema.
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

## Tidy your local CUE module

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCB0aWR5" }
$ cue mod tidy
```
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a curated module for the first time.

## Validate all the workflow files

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAjIHRoaXMgc2hvdWxkIGZhaWwgZHVlIHRvIHRoZSAiam9icyIgZmllbGQgYmVpbmcgcmVwbGFjZWQgd2l0aCAiam9iIiwgdGVtcG9yYXJpbHkgLi4u" }
$ cue vet -c # this should fail due to the "jobs" field being replaced with "job", temporarily ...
```

TODO: point out the command's easy reproducibility, relative to the alternative.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GitHub Actions + CUE]({{<relref"getting-started-with-github-actions-cue">}})
...
