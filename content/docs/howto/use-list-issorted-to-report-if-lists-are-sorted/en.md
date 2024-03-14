---
title: Using "list.IsSorted" to report if lists are sorted
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.IsSorted`](https://pkg.go.dev/cuelang.org/go/pkg/list#IsSorted)
to test and report if lists are sorted, using either a predefined or custom
comparator.

{{{with code "en" "cc"}}}
#location top bottom

exec cue eval
cmp stdout out
-- file.cue --
package example

import (
	"list"

	// The strings package is only imported for some examples in this
	// guide, and is not required when using list.IsSorted.
	"strings"
)

// For lists of numbers or lists of strings, list.IsSorted can be provided
// with the predefined comparator list.Ascending or list.Descending.
isSorted: list.IsSorted([1, 2.2, 3], list.Ascending)

// See related content, below, for a list.IsSortedStrings example.
stringsDescending: list.IsSorted(["C", "B", "A"], list.Descending)

// Mixed type lists require a custom comparator containing a "less" field that
// encodes a comparison between its "x" and "y" fields, reflecting x<y. See
// list.Sort for details.
structsCustomTrue: list.IsSorted( [{a: 1}, {a: 2}, {a: 3}], {x: {}, y: {}, less: x.a < y.a})
structsCustomFalse: list.IsSorted([{a: 2}, {a: 3}, {a: 1}], {x: {}, y: {}, less: x.a < y.a})

// This comparator tests if lists of strings are in descending order of how
// many "@" characters they contain.
_sortAtSymbolCountDescending: {
	x:    string
	y:    string
	less: strings.Count(x, "@") > strings.Count(y, "@")
}
stringsCountDescendingTrue: list.IsSorted( ["@@", "@", "X"], _sortAtSymbolCountDescending)
stringsCountDescendingFalse: list.IsSorted(["X", "@", "@@"], _sortAtSymbolCountDescending)
-- out --
isSorted:                    true
stringsDescending:           true
structsCustomTrue:           true
structsCustomFalse:          false
stringsCountDescendingTrue:  true
stringsCountDescendingFalse: false
{{{end}}}

## Related content

- [`list.Sort`](https://pkg.go.dev/cuelang.org/go/pkg/list#Sort) documents the
  comparator schema and fields
- {{< linkto/related/howto "use-list-issorted-as-a-field-validator" >}}
- {{< linkto/related/howto "use-list-issortedstrings-to-report-if-lists-of-strings-are-sorted" >}}
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
