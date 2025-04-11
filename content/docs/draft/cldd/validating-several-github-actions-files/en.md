---
title: Validating several GitHub Actions workflow files
---

{{{with _script_ "en" "HIDDEN setup"}}}
# Registry auth
mkdir -p $HOME/.config/cue
cat <<EOD > $HOME/.config/cue/logins.json
{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
EOD

# TODO(jm): revert to latest when it has evalv3 as default.
export PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH
{{{end}}}

We've already seen how CUE makes it trivially easy to get started, in
[Checking existing GitHub Actions files using CUE]({{<relref"checking-existing-github-actions-files">}}).
That guide finished by showing us how to validate multiple data files using
specifically constructed `cue` commands ... but wouldn't it be useful if CUE
could track which data files need to be validated against which schemas,
and then perform all those checks at once? This guide demonstrates how
to start offloading that work to CUE.

The latest pre-release of the `cue` command is required -- please
[upgrade to this version](/docs/installing-cue/) if it's not already installed:
{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

## Start with a repository containing several workflow files

GitHub Actions workflow files live in the `.github/workflows/` directory, so
that's the setup assembled here. We've adapted two examples from GitHub's
[`actions/starter-workflows`](https://github.com/actions/starter-workflows/tree/main/ci)
repository, but you should use workflows in a repository that's more relevant
to your situation.

{{<columns>}}
{{{with upload "en" "file 1"}}}
-- .github/workflows/go.yml --
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
{{{end}}}
{{<columns-separator>}}
{{{with upload "en" "file 2"}}}
-- .github/workflows/dotnet.yml --
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
{{{end}}}
{{</columns>}}

## Embed the workflow files in some CUE

CUE's [file embedding](https://cuelang.org/docs/howto/embed-files-in-cue-evaluation/)
feature allows the `cue` command to read data files without being told about
them individually through the command's invocation. The following CUE enables
the feature, and then *embeds* the data files we need:

{{{with upload "en" "cue"}}}
-- github.cue --
@extern(embed) // File embedding must be enabled explicitly.
package config

import "cue.dev/x/githubactions"

github: {
	workflows: {
		// Embed the contents of specific YAML files.
		dotnet: _ @embed(file=.github/workflows/dotnet.yml)
		go:     _ @embed(file=.github/workflows/go.yml)
	}
	// Validate the contents of every embedded file against the relevant schema.
	workflows: [_]: githubactions.#Workflow
}
{{{end}}}

## Initialise your local CUE module

CUE that uses schemas and modules from the
[Central Registry](https://registry.cue.works), like the file shown above,
needs to exist within its own CUE module.
{{{with script "en" "cue mod init"}}}
cue mod init cue.example
{{{end}}}
You can choose any module name you like - it's easy to
[change it later](https://cuelang.org/docs/reference/command/cue-help-mod-rename/).

## Login to the Central Registry

{{{with script "en" "cue login"}}}
#norun
cue login # only during beta
{{{end}}}
The
[Central Registry](https://registry.cue.works)
requires authentication while it's in beta testing,
so you need to login before you can use its schemas.

## Tidy your local CUE module

{{{with script "en" "tidy"}}}
cue mod tidy
{{{end}}}
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a curated module for the first time.

## Validate the workflow files

{{{with script "en" "cue vet"}}}
cue vet -c
{{{end}}}

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
