---
title: Using the builtin functions "list.Sort" and "list.IsSorted" to sort and test lists
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin functions `list.Sort` to sort lists, and
`list.IsSorted` to test that lists are sorted, by using a predefined or custom
comparator.

{{{with code "en" "cc1"}}}
#location top bottom

exec cue eval -s
cmp stdout out
-- file.cue --
package example

import "list"

// Lists composed of only numbers or only strings may provide list.Sort with
// one of the predefined comparators "list.Ascending" or "list.Descending".
numbersAscending: list.Sort([3, 5, 1, 4, 2], list.Ascending)

// Sorting strings alphabetically may also be performed with
// list.SortStrings - see "Related content" at the end of this page.
// Sorting strings in any other way (including reverse alphabetical order)
// requires list.Sort.
stringsDescending: list.Sort(["aaaaa", "AA", "b", "BBB", "zzzz", "Z"], list.Descending)

// Lists containing other types (or a mixture of types) must provide list.Sort
// with a custom comparator. The comparator defines how to compare the list's elements.
structsCustom: list.Sort( [{a: 2}, {a: 3}, {a: 1}], {x: {}, y: {}, less: x.a < y.a})

// The comparator must adhere to the list.Comparer schema (see output, below).
comparatorSchema: list.Comparer

// The comparator can encode any legal CUE comparison between its "x" and
// "y" fields. These fields might hold any pairing of 2 of the list's elements
// during the sort operation.
// The "less" field must be able to compare any 2 elements from the lists that
// the comparator will handle, and must evaluate to a boolean value that
// reports if "x" is less than "y".
_stringsCompareLengths: {
	x:    string
	y:    string
	less: len(x) < len(y)
}

// The comparator does not need to be provided inline - it may be a reference.
stringsLengthAscending: list.Sort(stringsDescending, _stringsCompareLengths)

// list.IsSorted requires a comparator, and reports if the list is sorted
// according to the comparator's definition. The comparator may be a reference.
isSortedAscending:       list.IsSorted(stringsLengthAscending, list.Ascending)
isSortedDescending:      list.IsSorted(stringsLengthAscending, list.Ascending)
isSortedLengthAscending: list.IsSorted(stringsLengthAscending, _stringsCompareLengths)
-- out --
numbersAscending: [1, 2, 3, 4, 5]
stringsDescending: ["zzzz", "b", "aaaaa", "Z", "BBB", "AA"]
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
stringsLengthAscending: ["b", "Z", "AA", "BBB", "zzzz", "aaaaa"]
isSortedAscending:       false
isSortedDescending:      false
isSortedLengthAscending: true
{{{end}}}

## Related content

- Use [`list.SortStrings`]({{< relref
    "../use-the-builtin-functions-list-sortstrings-list-issortedstrings"
  >}}) to sort lists of strings alphabetically without needing to define a
  comparator
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) builtin package
