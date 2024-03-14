---
title: Using "list.Sort" to sort lists
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.Sort`](https://pkg.go.dev/cuelang.org/go/pkg/list#Sort)
to sort lists, using either a predefined or custom comparator.

{{{with code "en" "cc"}}}
#location top bottom

exec cue eval
cmp stdout out
-- file.cue --
package example

import (
	"list"

	// The strings package is only imported for some examples in this
	// guide, and is not required when using list.Sort.
	"strings"
)

// For lists of numbers or lists of strings, list.Sort can be provided with the
// predefined comparator list.Ascending or list.Descending.
sort: list.Sort([2.2, 3, 1], list.Ascending)

// See related content, below, for a list.SortStrings example.
stringsDescending: list.Sort(["B", "C", "A"], list.Descending)

// Mixed type lists require a custom comparator containing a "less" field that
// encodes a comparison between its "x" and "y" fields, reflecting x<y. See
// list.Sort's documentation for details.
structsCustom: list.Sort([{a: 2}, {a: 3}, {a: 1}], {x: {}, y: {}, less: x.a < y.a})

// This comparator tests if lists of strings are in descending order of how
// many "@" characters they contain.
_sortAtSymbolCountDescending: {
	x:    string
	y:    string
	less: strings.Count(x, "@") > strings.Count(y, "@")
}
stringsCountDescending: list.Sort( ["X", "@@", "@"], _sortAtSymbolCountDescending)
-- out --
sort: [1, 2.2, 3]
stringsDescending: ["C", "B", "A"]
structsCustom: [{
    a: 1
}, {
    a: 2
}, {
    a: 3
}]
stringsCountDescending: ["@@", "@", "X"]
{{{end}}}

## Related content

- [`list.Sort`](https://pkg.go.dev/cuelang.org/go/pkg/list#Sort) documents the
  comparator schema and fields.
- {{< linkto/related/howto "use-list-sortstrings-to-sort-lists-of-strings" >}}
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
