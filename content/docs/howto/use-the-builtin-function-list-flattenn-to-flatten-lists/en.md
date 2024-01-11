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

{{{with code "en" "cc"}}}
#location top bottom

exec cue eval
cmp stdout out
-- file.cue --
package example

import "list"

// lSrc is a list (of lists (of lists ...)), defined below
lSrc: [...]

// eOne's first-level list elements are expanded
eOne: list.FlattenN(lSrc, 1)
// eTwo's first- and second-level list elements are expanded
eTwo: list.FlattenN(lSrc, 2)
// All of eNeg's list elements are expanded, no matter their depth
eNeg: list.FlattenN(lSrc, -1)

lSrc: [
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
-- out --
lSrc: [1, 2, 3, ["a", "b", "c"], [[4, 5, 6], [["d", "e", "f"], [[7, 8, 9]]]], [[[[["g", "h", "i"]]]]]]
eOne: [1, 2, 3, "a", "b", "c", [4, 5, 6], [["d", "e", "f"], [[7, 8, 9]]], [[[["g", "h", "i"]]]]]
eTwo: [1, 2, 3, "a", "b", "c", 4, 5, 6, ["d", "e", "f"], [[7, 8, 9]], [[["g", "h", "i"]]]]
eNeg: [1, 2, 3, "a", "b", "c", 4, 5, 6, "d", "e", "f", 7, 8, 9, "g", "h", "i"]
{{{end}}}

## Related content

- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) builtin package
