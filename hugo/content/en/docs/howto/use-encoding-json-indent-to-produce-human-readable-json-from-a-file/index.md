---
title: Using "encoding/json.Indent" to produce human-readable JSON from a file
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`encoding/json.Indent`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json#Indent)
to transform JSON from a compact, single-line form held in a file into JSON
with insignificant whitespace added that makes it easier for humans to read.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

import "encoding/json"

// See Related content, below, for documentation
// of json.Indent's 3 arguments:
//   func Indent(src []byte, prefix, indent string)
indent: json.Indent(json.Marshal(input), " ", "  ")

// The contents of data.json is placed here by
// the -l parameter.
input: _
{{< /code-tab >}}
{{< code-tab name="data.json" language="json" area="top-right" >}}
{
    "a": 1,
    "b": {
        "c": "two",
        "d": 3.0
    },
    "e": false,
    "f": [
        4,
        5.0,
        "A\nMulti\nLine\nString"
    ]
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZSAtbCBpbnB1dDogZGF0YS5qc29uIC1lIGluZGVudCAtLW91dCB0ZXh0" >}}
$ cue export file.cue -l input: data.json -e indent --out text
{
   "a": 1,
   "b": {
     "c": "two",
     "d": 3.0
   },
   "e": false,
   "f": [
     4,
     5.0,
     "A\nMulti\nLine\nString"
   ]
 }
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- [`encoding/json.Indent`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json#Indent)
  documents the function's arguments
- The [`encoding/json`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json) built-in package
