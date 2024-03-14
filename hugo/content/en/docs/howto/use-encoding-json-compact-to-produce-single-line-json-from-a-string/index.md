---
title: Using "encoding/json.Compact" to produce single-line JSON from a string
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
to transform JSON held in a string into a single line of JSON with all
insignificant whitespace removed.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="left" >}}
package example

import "encoding/json"

compact: json.Compact(jsonString)

// jsonString contains insignificant whitespace,
// split over several lines.
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
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtZSBjb21wYWN0IC0tb3V0IHRleHQ=" >}}
$ cue export -e compact --out text
{"a":1,"b":{"c":"two","d":3.0},"e":false,"f":[4,5.0,"A\nMulti\nLine\nString"]}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`encoding/json`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json) built-in package
