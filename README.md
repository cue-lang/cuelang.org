### `github.com/cue-lang/cuelang.org` - the home of cuelang.org

This repo is the home of [cuelang.org](https://cuelang.org). The site is built using [Hugo](https://gohugo.io/) and is
based on the [docsy](https://www.docsy.dev/) theme.

The [CUE Language Specification](https://cuelang.org/docs/references/spec/) and
[tour](https://cuelang.org/docs/tutorials/tour/intro/) are generated from source files in the
[`cuelang.org/go`](https://pkg.go.dev/mod/cuelang.org/go) module; the results are currently not committed to this
repository.

The site is deployed and hosted via [Netlify](https://www.netlify.com/).

### Requirements for local development

* [NodeJS](https://nodejs.org/) `== v14.19.0`
* [Go](https://golang.org/dl/) `== go1.17.7`
* [Hugo](https://github.com/gohugoio/hugo/releases) `== v0.93.3`

### Developing the site locally

```bash
# Install Hugo's Node requirements
npm install

# Generate the language spec and tour
go generate ./...

# Serve (with auto-reload)
hugo serve -D
```

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
