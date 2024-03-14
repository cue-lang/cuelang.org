---
title: Using "encoding/json.Compact" to produce single-line JSON from a file
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`encoding/json.Compact`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json#Compact)
to transform a JSON file into a single line of JSON with all insignificant
whitespace removed.

<!-- TODO: is the json.Compact call even needed?
Right now it isn't, as the output of json.Marshal /seems/ to be compact by
default - but is that /guaranteed/?
If so, we /could/ simply document
`cue export -l d: data.json -e 'json.Marshal(d)' -out text` ...
-->

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

import "encoding/json"

compact: json.Compact(json.Marshal(input))

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
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZSAtbCBpbnB1dDogZGF0YS5qc29uIC1lIGNvbXBhY3QgLS1vdXQgdGV4dA==" >}}
$ cue export file.cue -l input: data.json -e compact --out text
{"a":1,"b":{"c":"two","d":3.0},"e":false,"f":[4,5.0,"A\nMulti\nLine\nString"]}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`encoding/json`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json) built-in package
