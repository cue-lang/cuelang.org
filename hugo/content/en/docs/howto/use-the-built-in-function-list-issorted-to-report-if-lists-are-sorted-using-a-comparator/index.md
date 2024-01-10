---
title: Using the built-in function "list.IsSorted" to report if lists are sorted using a comparator
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.IsSorted`](https://pkg.go.dev/cuelang.org/go/pkg/list#IsSorted)
to test and report if lists are sorted, using either a predefined or custom
comparator.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top" >}}
package example

import "list"

// When testing lists that are composed of only numbers or only strings,
// list.IsSorted may be provided with one of the predefined comparators
// "list.Ascending" or "list.Descending".
isSorted: list.IsSorted([1, 2.2, 3], list.Ascending)

// Testing if lists of strings are sorted alphabetically may also be
// performed with list.IsSortedStrings (see "Related content", below).
// Testing if lists of strings have any other sort order, including reverse
// alphabetical order, requires list.IsSorted.
stringsDescendingTrue: list.IsSorted(["C", "B", "A"], list.Descending)
stringsDescendingFalse: list.IsSorted(["A", "B", "C"], list.Descending)

// When testing lists containing other types (or a mixture of types),
// list.IsSorted must be provided with a custom comparator.
structsCustomTrue: list.IsSorted([{a: 1}, {a: 2}, {a: 3}], {x: {}, y: {}, less: x.a < y.a})
structsCustomFalse: list.IsSorted([{a: 2}, {a: 3}, {a: 1}], {x: {}, y: {}, less: x.a < y.a})

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
stringsLengthDescendingTrue: list.IsSorted(["AAA", "AA", "A"], _sortStringsDescendingLength)
stringsLengthDescendingFalse: list.IsSorted(["A", "AA", "AAA"], _sortStringsDescendingLength)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue eval
isSorted:               true
stringsDescendingTrue:  true
stringsDescendingFalse: false
structsCustomTrue:      true
structsCustomFalse:     false
comparatorSchema: {
    T:    _
    x:    _
    y:    _
    less: bool
}
stringsLengthDescendingTrue:  true
stringsLengthDescendingFalse: false
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- `list.IsSorted` can also be used [as a field validator]({{< relref
    "../use-the-built-in-function-list-issorted-to-validate-that-lists-are-sorted-using-a-comparator"
  >}})
- Use `list.IsSortStrings`
  [to test and report if lists of strings are sorted alphabetically]({{< relref
    "../use-the-built-in-function-list-issortedstrings-to-report-if-lists-of-strings-are-sorted-alphabetically"
  >}}) without needing to define a comparator
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
