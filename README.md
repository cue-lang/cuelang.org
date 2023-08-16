### `github.com/cue-lang/cuelang.org` - the home of cuelang.org

This repo is the home of [cuelang.org](https://cuelang.org). The site is built using [Hugo](https://gohugo.io/) and is
based on the [docsy](https://www.docsy.dev/) theme.

The [CUE Language Specification](https://cuelang.org/docs/references/spec/) and
[tour](https://cuelang.org/docs/tutorials/tour/intro/) are generated from source files in the
[`cuelang.org/go`](https://pkg.go.dev/mod/cuelang.org/go) module; the results are currently not committed to this
repository.

The site is deployed and hosted via [Netlify](https://www.netlify.com/).

### Issue tracking

Please raise all issues in the [main CUE
repository](https://github.com/cue-lang/cue/issues), giving the title of the
issue a `cuelang.org: ` prefix.

### Requirements for local development

* [NodeJS](https://nodejs.org/) `v18.x`
* [Go](https://golang.org/dl/) `>= go1.20` (not needed for only running `hugo`)
* [Hugo](https://github.com/gohugoio/hugo/releases) `>= v0.117.0`
  (["extended"](https://gohugo.io/troubleshooting/faq/#i-get-this-feature-is-not-available-in-your-current-hugo-version)
  binary version)
* [Docker](https://docs.docker.com/get-docker/) CLI `>= 19.03` (for [`docker
  buildx`](https://github.com/docker/buildx#installing) use, amongst other
  things)
   * [Podman](https://podman.io/) has been used successfully, instead of
     Docker, but its use is currently undocumented

### Folders

#### content
This contains the unprocessed content for the website

#### playground
This contains the app code for the cue-playground

#### functions
This contains cloud functions

#### hugo
This contains all code to build the hugo-website.

#### internal
Internal stuff: can be ignored

#### cue.mod, go.mod, go.sum
Can be ignored

### Developing the site locally

To serve the site locally run:

```
./_scripts/npmInstall.bash # one-off
./_scripts/buildDockerImage.bash # one-off, or when internal/cmd/preprocessor/cmd changes
./_scripts/serve.bash
```

The site will be served at http://localhost:1313/.

### Updating the language spec and tour for cuelang.org

The tour and spec and generated against the required version of the `cuelang.org/go` module:

```
go generate ./...
```

Therefore to update the generated version you need to update the required version of `cuelang.org/go`:

```
go get cuelang.org/go@latest
```

### tip.cuelang.org

[tip.cuelang.org](https://tip.cuelang.org/) has the exact same site template and content as
[cuelang.org](https://cuelang.org) except for the fact the language spec and tour are generated based on
`cuelang.org/go@master`. Any commit to `master` of this repository or
[github.com/cue-lang/cue](https://github.com/cue-lang/cue) will result in a redeploy of
[tip.cuelang.org](https://tip.cuelang.org).

### History

This site was setup using the following guides:

* https://gohugo.io/hosting-and-deployment/hosting-on-netlify/
* https://www.docsy.dev/docs/getting-started
* https://www.docsy.dev/docs/deployment/
