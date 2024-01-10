---
title: Using the builtin function "list.Contains" to report if a value is contained in a list
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin function `list.Contains` to report if a
simple or composite value is contained in a list.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top" >}}
package example

import "list"

inline: list.Contains([1, 2, "3", 4, "five"], 4)

numbers: {
	haystack1: list.Contains(_haystack1, _needle)
	haystack2: list.Contains(_haystack2, _needle)

	_needle: 42
	// _haystack1 does *not* contain the needle.
	_haystack1: [-10, 0, 10, 20, 30, 40, 50]
	// _haystack2 *does* contain the needle.
	_haystack2: [-10, 0, 42, 20, 30, 42, 50]
}

strings: {
	haystack1: list.Contains(_haystack1, _needle)
	haystack2: list.Contains(_haystack2, _needle)

	_needle: "A Needle"
	// _haystack1 does *not* contain the needle.
	_haystack1: ["some hay", "more hay", "nothing but hay"]
	// _haystack2 *does* contain the needle.
	_haystack2: ["some hay", "more hay", "A Needle", "even more hay"]
}

composite: {
	haystack1: list.Contains(_haystack1, _needle)
	haystack2: list.Contains(_haystack2, _needle)

	_needle: {
		a: 42
		b: c: "A Needle"
	}
	// _haystack1 does *not* contain the needle.
	_haystack1: [
		{
			a: 42
			b: c: "a needle"
		},
		{
			a: 42
			b: c: "A Needle"
			b: d: "An extra field"
		},
		{
			a: 42
			B: c: "A Needle"
		},
		{
			a: 42
			b: c: "A Needle": ".. as a key, not a value"
		},
		{
			a: 42.0
			b: c: "A Needle"
		},
	]
	// _haystack2 *does* contain the needle.
	_haystack2: [
		-10,
		0,
		"some hay",
		"more hay",
		{
			a: 42
			b: c: "A Needle"
		},
	]
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue eval
inline: true
numbers: {
    haystack1: false
    haystack2: true
}
strings: {
    haystack1: false
    haystack2: true
}
composite: {
    haystack1: false
    haystack2: true
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) builtin package
