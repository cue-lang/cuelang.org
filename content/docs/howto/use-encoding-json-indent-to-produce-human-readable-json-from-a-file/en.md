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

{{{with code "en" "cc"}}}
#nofmt(data.json)
exec cue export file.cue -l input: data.json -e indent --out text
cmp stdout out
-- file.cue --
package example

import  "encoding/json"

// json.Indent takes 3 arguments. See Related
// content, below, for their documentation.
//   Indent(src []byte, prefix, indent string)
indent: json.Indent(json.Marshal(input), " ", "  ")

// The contents of data.json is placed here by
// the -l parameter.
input:  _
-- data.json --
{"a":1,"b":{"c":"two","d":3.0},"e":false,"f":[4,5.0,"A\nMulti\nLine\nString"]}
-- out --
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
{{{end}}}

## Related content

- [`encoding/json.Indent`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json#Indent)
  documents the function's arguments
- The [`encoding/json`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json) built-in package
