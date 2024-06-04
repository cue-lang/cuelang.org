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
# we don't use '#location left left right' for 2 reasons:
# - so the reader can see all code tabs at once (and doesn't have to click to
#   switch between the CUE and the data)
# - because the `cue` CLI command is longer than the 50 chars that a left/right
#   split makes available /without/ horizontal scrolling.

exec cue export file.cue -l input: data.json -e indent --out text
cmp stdout out
-- file.cue --
package example

import "encoding/json"

// See Related content, below, for documentation
// of json.Indent's 3 arguments:
//   func Indent(src []byte, prefix, indent string)
indent: json.Indent(json.Marshal(input), " ", "  ")

// The contents of data.json is placed here by
// the -l parameter.
input: _
-- data.json --
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
