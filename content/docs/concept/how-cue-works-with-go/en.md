---
title: How CUE works with Go
tags:
- encodings
authors:
- myitcv
- jpluscplusm
toc_hide: true
---

CUE and Go work together by making it easy to use Go as your source of truth by
converting Go types to CUE with the `cue` CLI, as well as providing a powerful
API that enables your Go code to take advantage of CUE's advanced capabilites.

In this guide we'll demonstrate importing some Kubernetes API code to generate
CUE schemas. We'll also use the API to convert both CUE and non-CUE data to
native Go values, and validate some Go data natively with CUE.

## Converting Go types to CUE

If you've already invested time developing Go types, you might need them to be
the source of truth in your system whilst also wanting to use CUE to validate
data that *matches* those types.

The `cue` CLI tool can help here, as it can convert arbitrary Go types to CUE.
Here, we fetch some Go source code published by the Kubernetes project, import
some types it defines, and show some of the CUE that's produced:

{{{with _script "en" "hidden work"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
go mod init cue.example
{{{end}}}

{{{with script "en" "work"}}}
#ellipsis 0
go get k8s.io/api/apps/v1@v0.23.4
cue get go k8s.io/api/apps/v1
#ellipsis 31
#use head, not cat, so the reader knows the file is truncated.
head -31 cue.mod/gen/k8s.io/api/core/v1/types_go_gen.cue
{{{end}}}

<!--
TODO: Should we demo refining `_gen.cue` files via unification?
Does this approach still "work", with modules?
-->

This import currently needs to be performed locally because there isn't a
central, public store of well-known types made available as CUE - but there are
[plans](https://github.com/cue-lang/proposal/blob/main/designs/2330-modules-v2.md)
to change that!
If you'd like to get updates on that work, please subscribe to
{{< issue 2032 />}}.

To generate CUE from local, potentially private Go source code,
[`cue get go`]({{< relref "docs/reference/cli/cue-get-go" >}})'s
`--local` option has you covered.

## Using CUE's Go API

The Go API injects the power and expressiveness of CUE into your Go programs,
allowing them to load and validate both CUE and non-CUE data, and to check
data marshalled by Go, wherever it comes from.

### Loading CUE data

Here's an example of loading some data from a `.cue` file and FIXME'ing it.

{{< caution >}}
TODO: Paul to provide code, so I can word around whatever it demonstrates.
{{< /caution >}}

### Loading non-CUE data (e.g. YAML)

The API also makes it easy to validate data held in `.yaml` and `.json` files.
Here's a FIXME.

{{< caution >}}
TODO: Paul to provide code, so I can word around whatever it demonstrates.
{{< /caution >}}

The API also allows FIXME.

### Checking Go data with CUE schema

CUE can also validate data that's only available inside Go. Perhaps it's only
fetched at runtime, over the network, or FIXME.

Here, we FIXME.

{{< caution >}}
TODO: Paul to provide code, so I can word around whatever it demonstrates.
{{< /caution >}}

<!-- TODO
  - Checking Go data with CUE schema
    - "CUE that validates that a struct have only keys beginning with "a" and values that are either `5 | string`"
    - Check if we should demo (i.e. push folks towards) gocodec or not.
-->

## Future plans

The CUE project believes that its role can be one of *interlingua* - a
bi-direction bridge between all the formats it speaks, linking sources of truth
to data, whevever it exists.

To serve that goal, the project has plans not only to extend CUE so that it can
*generate* Go types and Go code directly, but also FIXME.
