---
title: Using "list.FlattenN" to flatten lists
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.FlattenN`](https://pkg.go.dev/cuelang.org/go/pkg/list#FlattenN)
to flatten a list by expanding its list elements by a specified depth.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

import "list"

// src is a list (of lists (of lists ...)), defined below.
src: [...]

// one transforms src by expanding its first-level list elements.
one: list.FlattenN(src, 1)
// two transforms src by expanding its first- and second-level list elements.
two: list.FlattenN(src, 2)
// all transforms src by expanding all its list elements, recursively, no
// matter their depth.
all: list.FlattenN(src, -1)

src: [
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
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV2YWw=" >}}
$ cue eval
src: [1, 2, 3, ["a", "b", "c"], [[4, 5, 6], [["d", "e", "f"], [[7, 8, 9]]]], [[[[["g", "h", "i"]]]]]]
one: [1, 2, 3, "a", "b", "c", [4, 5, 6], [["d", "e", "f"], [[7, 8, 9]]], [[[["g", "h", "i"]]]]]
two: [1, 2, 3, "a", "b", "c", 4, 5, 6, ["d", "e", "f"], [[7, 8, 9]], [[["g", "h", "i"]]]]
all: [1, 2, 3, "a", "b", "c", 4, 5, 6, "d", "e", "f", 7, 8, 9, "g", "h", "i"]
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
