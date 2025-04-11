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

{{< todo "TODO: Preamble" >}}

The latest pre-release of the `cue` command is required -- please
[upgrade to this version](/docs/installing-cue/) if it's not already installed:
{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

## Login to the Central Registry

{{{with script "en" "cue login"}}}
#norun
cue login # only during beta
{{{end}}}
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
{{{with upload "en" "file 1"}}}
-- .github/workflows/go.yml --
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
{{{end}}}
{{<columns-separator>}}
{{{with upload "en" "file 2"}}}
-- .github/workflows/dotnet.yml --
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
{{{end}}}
{{</columns>}}

## Embed the workflow files in some CUE

The [file embedding](https://cuelang.org/docs/howto/embed-files-in-cue-evaluation/)
feature allows data files to be read by CUE -- without telling the `cue` command
about them. The following CUE enables the feature, and then *embeds* all the YAML
files in the `.github/workflows/` directory:

{{{with upload "en" "cue"}}}
-- github.cue --
@extern(embed) // File embedding must be explicitly enabled.
package cicd

import "cue.dev/x/githubactions"

github: {
	// Embed the contents of all YAML files in the .github/workflows/ directory.
	workflows: _ @embed(glob=.github/workflows/*.yml)
	// Validate the contents of each embedded file against the curated module's relevant schema.
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

## Tidy your local CUE module

{{{with script "en" "tidy"}}}
cue mod tidy
{{{end}}}
Tidying a module is an important part of using curated modules from the
[Central Registry](https://registry.cue.works).
Always use
[`cue mod tidy`](https://cuelang.org/docs/reference/command/cue-help-mod-tidy/)
when you use a curated module for the first time.

## Validate all the workflow files

{{{with script "en" "cue vet"}}}
cue vet -c # this should fail due to the "jobs" field being replaced with "job", temporarily ...
{{{end}}}

TODO: point out the command's easy reproducibility, relative to the alternative.

## Next steps

Validating your existing configuration files with CUE can help make development
and deployments safer, but *defining* those same files in CUE lets you build on
its first-class templating, referencing, and policy features. Take the first
step with
[Getting started with GitHub Actions + CUE]({{<relref"getting-started-with-github-actions-cue">}})
...
