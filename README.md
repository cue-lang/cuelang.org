
### `github.com/cue-lang/cuelang.org` - the home of cuelang.org

This repo is the home of [cuelang.org](https://cuelang.org). The site is built using [Hugo](https://gohugo.io/) and is
based on the [docsy](https://www.docsy.dev/) theme.

The [CUE Language Specification](https://cuelang.org/docs/references/spec/)
is generated from source files in the
[`cuelang.org/go`](https://pkg.go.dev/mod/cuelang.org/go) module.

The site is deployed and hosted via [Netlify](https://www.netlify.com/).

### Issue tracking

To raise an issue about a specific page or piece of content, scroll to the
bottom of the published page and use the "Report an Issue" link in the site
footer.
This link will save you time by prepopulating the issue with information that
you'll need to find and fill in if you raise the issue manually.

To raise an issue manually, please open it in the
[main CUE issue tracker](https://cuelang.org/issues),
giving the issue's title a "`cuelang.org: `" prefix.

### Requirements for local development

#### To run `hugo` alone

* [Hugo](https://github.com/gohugoio/hugo/releases) `== v0.147.6`
  (["extended"](https://gohugo.io/troubleshooting/faq/#i-get-this-feature-is-not-available-in-your-current-hugo-version)
  binary version)
* [NodeJS](https://nodejs.org/) `v20.x`

#### To run any other development workflows

In addition to the `hugo` requirements listed above:

* [Go](https://golang.org/dl/) `>= go1.23`
* [Docker](https://docs.docker.com/get-docker/) CLI `>= 19.03` (for [`docker
  buildx`](https://github.com/docker/buildx#installing) use, amongst other
  things)
   * [Podman](https://podman.io/) has been used successfully, instead of
     Docker, but its use is currently undocumented
* [CUE](https://cuelang.org/dl) -- use the `latest` version
* When adding or changing pages that interact with the CUE Central Registry (or
  making changes to "infra" bits like the `preprocessor`), your registry
  account must have been granted the `test manager` role, and you must have run
  `cue login` successfully.

### Directory structure

- `content`: the unprocessed website content
- `hugo`: hugo-specific content, likely generated from the `content` directory by the preprocessor
- `playground`: the app code for the cue-playground (`/play`)
- `functions`: cloud functions
- `internal`: internal stuff that can be ignored
- `cue.mod`/`go.mod`/`go.sum`: can be ignored

### Developing the site locally

To serve the site locally run:

```
cue login               # A one-time login.
# Follow the prompts to authorise the Central Registry to read your GitHub account.
./_scripts/build.bash   # Ensure everything works.
./_scripts/serve.bash   # Serve the site locally at http://localhost:1313/.
```

Useful flags you can provide to `serve.bash` include:

- `--update`: write changes back into source files under `content/`.
- `--hugo='<someHugoFlag>'`: any flag which needs to be passed to the
  underlying `hugo serve` command. For example:
  - `--hugo=--buildDrafts`: include draft pages in the locally-served site.
  - `--hugo=--bind=0.0.0.0 --hugo=--baseURL=http://<networkInterfaceIP>:1313`:
    serve the site on all non-localhost network interfaces, and cause absolute
    inter-page links to work correctly with the new IP.

### Updating the version of CUE documented by the site

The site's CUE content is formatted, tested, and used to produce output by the
`latest` version of CUE stored in [`site.cue`](/site.cue).

See commit
https://github.com/cue-lang/cuelang.org/commit/80c17ba707e239adfe7794ffcfc79f314ed51841
(and the commit that comes after, updating cache files) for an example of how
to update this version.

The spec is handled by a different version of CUE, as tracked in cue-lang/cue#3013.
It is generated against the required version of the `cuelang.org/go` module:

```
go generate ./...
```

To update the generated spec you need to update the site's required version of `cuelang.org/go`:

```
go get cuelang.org/go@latest
```

### tip.cuelang.org

[tip.cuelang.org](https://tip.cuelang.org/) has the same template and content as
[cuelang.org](https://cuelang.org), except that all pages have their data
formatted and output emitted by `cuelang.org/go@master`, and the site is
re-built and re-deployed when any commit is added to `master` on
`cue-lang/cuelang.org` (this repo) or
[`cue-lang/cue`](https://github.com/cue-lang/cue).
Tip includes the CUE Playground running `cuelang.org/go@master`.

Serving multi-versioned documentation (e.g. current stable release; previous
stable release; etc) is tracked in https://cuelang.org/issues/2538.

### History

This site was setup using the following guides:

* https://gohugo.io/hosting-and-deployment/hosting-on-netlify/
* https://www.docsy.dev/docs/getting-started
* https://www.docsy.dev/docs/deployment/

