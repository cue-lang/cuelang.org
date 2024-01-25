---
title: Using the built-in function "encoding/json.Indent" to produce human-readable JSON from a file
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
{{< code-tab name="file.cue" language="cue"  area="top-left" >}}
package example

import  "encoding/json"

// json.Indent takes 3 arguments:
//  1. the JSON to format
//  2. the string prefix added once to each line
//  3. the string indent prefix repeated for each
//     level the data key is nested
indent: json.Indent(json.Marshal(input), " ", "  ")

// The contents of data.json is placed here by
// the -l parameter.
input:  _
{{< /code-tab >}}
{{< code-tab name="data.json" language="json"  area="top-right" >}}
{"a":1,"b":{"c":"two","d":3.0},"e":false,"f":[4,5.0,"A\nMulti\nLine\nString"]}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
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

- The [`encoding/json`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json) built-in package
