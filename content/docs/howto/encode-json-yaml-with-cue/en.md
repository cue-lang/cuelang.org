---
title: Encode JSON or YAML with CUE
weight:
draft: false
toc_hide: true
date: "2023-08-22"
tags:
    - encodings
authors:
    - myitcv
    - mpvl
meta:
    - type: readingTime
      value: 5
---

## Introduction

It may be necessary to include **nested data** as an encoded string, such as a bit
of YAML embedded as a string inside a JSON request. The steps below show how to
accomplish that with the `cue` command line. First with JSON, then with YAML.

{{< spotlight >}}

### Prerequisites

-   You have [CUE installed]({{< relref "docs/introduction/installation" >}})
    locally. This allows you to run `cue` commands

{{< /spotlight >}}

## Encoding Nested JSON

Create a CUE file which uses the
[json](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json) package to encode an
inner value:

{{{with upload "en" "json"}}}
-- nested-json.cue --
import "encoding/json"

_innerData: {
	innerString: "inside"
}

nestedJSON:  json.Marshal(_innerData)
outerString: "outside"
{{{end}}}

Use `cue export` to evaluate and encode the entire value:

{{{with script "en" "export json"}}}
cue export nested-json.cue
{{{end}}}

## Encoding YAML to JSON

Use a different encoding package for encoding the nested value, such as
[yaml](https://pkg.go.dev/cuelang.org/go/pkg/encoding/yaml):

{{{with upload "en" "yaml"}}}
-- nested-yaml.cue --
import "encoding/yaml"

_innerData: {
	innerString: "inside"
}

nestedYAML:  yaml.Marshal(_innerData)
outerString: "outside"
{{{end}}}

{{{with script "en" "export json 2"}}}
cue export nested-yaml.cue
{{{end}}}

## Choosing different encodings with `cue export --out`

Use a different encoding for the entire value via the `--out` flag, such as
`yaml`:

{{{with script "en" "export yaml"}}}
cue export nested-json.cue --out yaml
{{{end}}}

... or `cue`:

{{{with script "en" "export cue"}}}
cue export nested-yaml.cue --out cue
{{{end}}}

For all encodings see the
[`encoding`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/) package listing.
