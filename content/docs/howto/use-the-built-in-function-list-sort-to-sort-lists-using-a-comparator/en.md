---
title: Using the built-in function "list.Sort" to sort lists using a comparator
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.Sort`](https://pkg.go.dev/cuelang.org/go/pkg/list#Sort)
to sort lists, using either a predefined or custom comparator.

{{{with code "en" "cc"}}}
#location top bottom

exec cue eval
cmp stdout out
-- file.cue --
package example

import "list"

// When sorting lists that are composed of only numbers or only strings,
// list.Sort may be provided with one of the predefined comparators
// "list.Ascending" or "list.Descending".
sort: list.Sort([2.2, 3, 1], list.Ascending)

// Sorting lists of strings alphabetically may also be performed with
// list.SortStrings (see "Related content", below).
// Sorting lists of strings into any other sort order, including reverse
// alphabetical order, requires list.Sort.
stringsDescending: list.Sort(["B", "C", "A"], list.Descending)

// When sorting lists containing other types (or a mixture of types), list.Sort
// must be provided with a custom comparator.
structsCustom: list.Sort([{a: 2}, {a: 3}, {a: 1}], {x: {}, y: {}, less: x.a < y.a})

// The comparator defines how to compare the list's elements, and must adhere
// to the list.Comparer schema (see output, below).
comparatorSchema: list.Comparer

// The comparator's "less" field encodes a comparison between its "x" and "y"
// fields' values.  It can contain any comparison logic needed to express a
// particular sort order.
// The "x" and "y" fields might hold any pair of the list's elements during the
// sort operation.
// The "less" field must be an expression that is able to compare any two
// elements from lists that the comparator will handle. It must evaluate to a
// boolean value that reports if "x" is less than "y".
_sortStringsDescendingLength: {
	x:    string
	y:    string
	less: len(x) > len(y)
}

// The comparator does not need to be provided inline - it may be a reference.
stringsLengthDescending: list.Sort(["AA", "AAA", "A"], _sortStringsDescendingLength)
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
comparatorSchema: {
    T:    _
    x:    _
    y:    _
    less: bool
}
stringsLengthDescending: ["AAA", "AA", "A"]
{{{end}}}

## Related content

- Use `list.SortStrings`
  [to sort lists of strings alphabetically]({{< relref
    "../use-the-built-in-function-list-sortstrings-to-sort-lists-of-strings-alphabetically"
  >}}) without needing to define a comparator
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
