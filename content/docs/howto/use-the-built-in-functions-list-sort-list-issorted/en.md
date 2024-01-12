---
title: Using the built-in functions "list.Sort" and "list.IsSorted" to sort and test lists
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in functions `list.Sort` to sort lists, and
`list.IsSorted` to test that lists are sorted, by using a predefined or custom
comparator.

{{{with code "en" "cc1"}}}
#location top bottom

exec cue eval
cmp stdout out
-- file.cue --
package example

import "list"

// When sorting lists that are composed of only numbers or only strings,
// list.Sort may be provided with one of the predefined comparators
// "list.Ascending" or "list.Descending".
numbersAscending: list.Sort([3, 5, 1, 4, 2], list.Ascending)

// Sorting strings alphabetically may also be performed with list.SortStrings
// (see "Related content", below).
// Sorting strings in any other way (including reverse alphabetical order)
// requires list.Sort.
stringsDescending: list.Sort(["aaaaa", "AA", "b", "BBB", "zzzz", "Z"], list.Descending)

// When sorting lists containing other types (or a mixture of types), list.Sort
// must be provided with a custom comparator. The comparator defines how to
// compare the list's elements.
structsCustom: list.Sort([{a: 2}, {a: 3}, {a: 1}], {x: {}, y: {}, less: x.a < y.a})

// The comparator must adhere to the list.Comparer schema (see output, below).
comparatorSchema: list.Comparer

// The comparator can encode any legal CUE comparison between its "x" and
// "y" fields' values. These values might contain any pairing of 2 of the
// list's elements during the sort operation.
// The "less" field must be an expression that is able to compare any 2
// elements from the lists that the comparator will handle. It must evaluate to
// a boolean value that reports if "x" is less than "y".
_stringsCompareLengths: {
	x:    string
	y:    string
	less: len(x) < len(y)
}

// The comparator does not need to be provided inline - it may be a reference.
stringsLengthAscending: list.Sort(stringsDescending, _stringsCompareLengths)

// list.IsSorted requires a comparator, and reports if the list is sorted
// according to that comparator's definition. The comparator may be a reference.
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
    "../use-the-built-in-functions-list-sortstrings-list-issortedstrings"
  >}}) to sort lists of strings alphabetically without needing to define a
  comparator
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
