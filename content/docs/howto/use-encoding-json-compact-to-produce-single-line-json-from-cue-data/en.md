---
title: Using "encoding/json.Compact" to produce single-line JSON from CUE data
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
to transform CUE data into a single line of JSON with all insignificant
whitespace removed.

<!--more-->

<!-- TODO: is the json.Compact call even needed?
Right now it isn't, as the output of json.Marshal /seems/ to be compact by
default - but is that /guaranteed/?  -->

{{{with code "en" "cc"}}}
#location left right

exec cue export file.cue -e compact --out text
cmp stdout out
-- file.cue --
package example

import "encoding/json"

compact: json.Compact(json.Marshal(data))
data: {
	a: 1
	b: {
		c: "two"
		d: 3.0
	}
	e: false
	f: [
		4,
		5.0,
		"""
			A
			Multi
			Line
			String
			""",
	]
}
-- out --
{"a":1,"b":{"c":"two","d":3.0},"e":false,"f":[4,5.0,"A\nMulti\nLine\nString"]}
{{{end}}}

## Related content

- The [`encoding/json`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json) built-in package
