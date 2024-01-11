---
title: Using the builtin function "list.FlattenN" to flatten lists
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin function `list.FlattenN` to flatten a list
by expanding its list elements down to a specified depth.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top" >}}
package example

import "list"

flatter: {
	// f1's first-level list elements are expanded
	f1: list.FlattenN(L, 1)
	// f2's first- and second-level list elements are expanded
	f2: list.FlattenN(L, 2)
	// All of fNegative's list elements are expanded, no matter their depth
	fNegative: list.FlattenN(L, -1)
}

// L is a list (of lists (of lists ...))
L: [
	1, 2, 3,
	["a", "b", "c"],
	[
		[4, 5, 6],
		[
			["d", "e", "f"],
			[[7, 8, 9]],
		],
	],
	[[[[["g", "h", "i"]]]]],
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue eval -e flatter
f1: [1, 2, 3, "a", "b", "c", [4, 5, 6], [["d", "e", "f"], [[7, 8, 9]]], [[[["g", "h", "i"]]]]]
f2: [1, 2, 3, "a", "b", "c", 4, 5, 6, ["d", "e", "f"], [[7, 8, 9]], [[["g", "h", "i"]]]]
fNegative: [1, 2, 3, "a", "b", "c", 4, 5, 6, "d", "e", "f", 7, 8, 9, "g", "h", "i"]
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) builtin package
