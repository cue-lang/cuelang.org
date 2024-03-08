---
title: How CUE works with Go
tags:
- encodings
- cue command
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

## Convert Go types to CUE

* cue get go
  - Go as source of truth
  - example
    - fetched something k8s.io related
  - refine `_gen.cue` files via unification
    - does this still "work" with modules?
  - point to future published modules, leaving cue get go as a --local operation "only"

## Using CUE's Go API

* Using the CUE Go API
  - 2x simple load data examples
  - Loading CUE data
    - .cue
  - Loading non-CUE data FIXME
    - .yaml
  - prose mentions what else is possible
  - Checking Go data with CUE schema
    - "CUE that validates that a struct have only keys beginning with "a" and values that are either `5 | string`"
    - Check if we should demo (i.e. push folks towards) gocodec or not.
    - prose mentions what else is possible in prose

### Loading CUE data

### Loading non-CUE data (e.g. YAML)

### Checking Go data with CUE schema

## Future plans

* Generating Go from CUE

## Related content
