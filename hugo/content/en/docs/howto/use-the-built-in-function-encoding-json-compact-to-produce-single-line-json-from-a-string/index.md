---
title: Using the built-in function "encoding/json.Compact" to produce single-line JSON from a string
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`encoding/json.Compact`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json#Compact)
to transform JSON held in a string into JSON with all insignificant whitespace
removed. The resulting JSON takes up a single line.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top" >}}
package example

import "encoding/json"

compact: json.Compact(jsonString)

// jsonString contains insignificant whitespace, split over several lines.
jsonString: #"""
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
	"""#
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue export -e compact --out text
{"a":1,"b":{"c":"two","d":3.0},"e":false,"f":[4,5.0,"A\nMulti\nLine\nString"]}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`encoding/json`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json) built-in package
