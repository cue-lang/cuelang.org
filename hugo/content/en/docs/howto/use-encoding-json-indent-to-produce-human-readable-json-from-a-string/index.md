---
title: Using "encoding/json.Indent" to produce human-readable JSON from a string
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`encoding/json.Indent`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json#Indent)
to transform JSON from a compact, single-line form held in a string into JSON
with insignificant whitespace added that makes it easier for humans to read.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

import "encoding/json"

// See Related content, below, for documentation
// of json.Indent's 3 arguments:
//   func Indent(src []byte, prefix, indent string)
indent:     json.Indent(jsonString, " ", "  ")
jsonString: #"{"a":1,"b":{"c":"two","d":3.0},"e":false,"f":[4,5.0,"A\nMulti\nLine\nString"]}"#
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtZSBpbmRlbnQgLS1vdXQgdGV4dA==" >}}
$ cue export -e indent --out text
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
