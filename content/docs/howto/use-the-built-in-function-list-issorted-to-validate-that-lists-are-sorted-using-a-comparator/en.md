---
title: Using the built-in function "list.IsSorted" to validate that lists are sorted using a comparator
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.IsSorted`](https://pkg.go.dev/cuelang.org/go/pkg/list#IsSorted)
as a field validator to assert that lists are sorted, using either a predefined
or custom comparator.

{{{with code "en" "cc"}}}
#location top bottom

! exec cue vet
cmp stderr out
-- file.cue --
package example

import "list"

// When validating lists that are composed of only numbers or only strings,
// list.IsSorted may be provided with one of the predefined comparators
// "list.Ascending" or "list.Descending".
numbersAscending: [1, 2.2, 3]
numbersAscending: list.IsSorted(list.Ascending)

// Validating that lists of strings are sorted alphabetically may also be
// performed with list.IsSortedStrings (see "Related content", below).
// Validating that lists of strings have any other sort order, including
// reverse alphabetical order, requires list.IsSorted.
stringsDescending: ["A", "B", "C"]
stringsDescending: list.IsSorted(list.Descending) // validation failure

// When validating lists containing other types (or a mixture of types),
// list.IsSorted must be provided with a custom comparator.
structsCustom: list.IsSorted({x: {}, y: {}, less: x.a < y.a})
structsCustom: [{a: 1}, {a: 2}, {a: 3}]

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
stringsLengthDescending: ["AA", "BBB", "C"]
stringsLengthDescending: list.IsSorted(_sortStringsDescendingLength) // validation failure
-- out --
stringsDescending: invalid value ["A","B","C"] (does not satisfy list.IsSorted({T:number | string,x:number | string,y:number | string,less:_|_(Descending.less: unresolved disjunction number | string (type (string|number)) (and 1 more errors))})):
    ./file.cue:16:20
    ./file.cue:15:20
stringsLengthDescending: invalid value ["AA","BBB","C"] (does not satisfy list.IsSorted({x:string,y:string,less:_|_(_sortStringsDescendingLength.less: incomplete argument string (type string) (and 1 more errors))})):
    ./file.cue:43:26
    ./file.cue:42:26
{{{end}}}

## Related content

- `list.IsSorted` can also be used
  [to return a list's sort status as a boolean]({{< relref
    "../use-the-built-in-function-list-issorted-to-report-if-lists-are-sorted-using-a-comparator"
  >}})
- Use `list.IsSortStrings`
  [to validate that lists of strings are sorted alphabetically]({{< relref
    "../use-the-built-in-function-list-issortedstrings-to-validate-that-lists-of-strings-are-sorted-alphabetically"
  >}}) without needing to define a comparator
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
