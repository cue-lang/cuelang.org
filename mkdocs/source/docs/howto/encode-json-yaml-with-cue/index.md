---
title: Encoding JSON or YAML with CUE
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

<!--more-->

{{< spotlight >}}

### Prerequisites

-   You have [CUE installed]({{< relref "docs/introduction/installation" >}})
    locally. This allows you to run `cue` commands

{{< /spotlight >}}

## Encoding Nested JSON

Create a CUE file which uses the
[json](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json) package to encode an
inner value:

```` { .cue title="nested-json.cue" }
import "encoding/json"

_innerData: {
	innerString: "inside"
}

nestedJSON:  json.Marshal(_innerData)
outerString: "outside"
````

Use `cue export` to evaluate and encode the entire value:

```` { .text title="TERMINAL" data-copy="cue export nested-json.cue" }
$ cue export nested-json.cue
{
    "nestedJSON": "{\"innerString\":\"inside\"}",
    "outerString": "outside"
}
````

## Encoding YAML to JSON

Use a different encoding package for encoding the nested value, such as
[yaml](https://pkg.go.dev/cuelang.org/go/pkg/encoding/yaml):

```` { .cue title="nested-yaml.cue" }
import "encoding/yaml"

_innerData: {
	innerString: "inside"
}

nestedYAML:  yaml.Marshal(_innerData)
outerString: "outside"
````

```` { .text title="TERMINAL" data-copy="cue export nested-yaml.cue" }
$ cue export nested-yaml.cue
{
    "nestedYAML": "innerString: inside\n",
    "outerString": "outside"
}
````

## Choosing different encodings with `cue export --out`

Use a different encoding for the entire value via the `--out` flag, such as
`yaml`:

```` { .text title="TERMINAL" data-copy="cue export nested-json.cue --out yaml" }
$ cue export nested-json.cue --out yaml
nestedJSON: '{"innerString":"inside"}'
outerString: outside
````

... or `cue`:

```` { .text title="TERMINAL" data-copy="cue export nested-yaml.cue --out cue" }
$ cue export nested-yaml.cue --out cue
nestedYAML: """
	innerString: inside

	"""
outerString: "outside"
````

For all encodings see the
[`encoding`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/) package listing.
