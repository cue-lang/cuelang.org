---
title: Using "list.IsSorted" as a field validator
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

// For lists of numbers or lists of strings, list.IsSorted can be provided
// with the predefined comparator list.Ascending or list.Descending.
isSorted: [1, 2.2, 3] & list.IsSorted(list.Ascending)

// See related content, below, for a list.IsSortedStrings example.
stringsDescending: list.IsSorted(list.Descending) // validation failure
stringsDescending: ["A", "B", "C"]

// Mixed type lists require a custom comparator containing a "less" field that
// encodes a comparison between its "x" and "y" fields, reflecting x<y. See
// list.Sort for details.
structsCustom: list.IsSorted({x: {}, y: {}, less: x.a < y.a})
structsCustom: [{a: 1}, {a: 2}, {a: 3}]

// This comparator tests if lists of strings are in descending order of length.
_sortStringsDescendingLength: {
	x:    string
	y:    string
	less: len(x) > len(y)
}
stringsLengthDescending: ["AA", "BBB", "C"]
stringsLengthDescending: list.IsSorted(_sortStringsDescendingLength) // validation failure
-- out --
stringsDescending: invalid value ["A","B","C"] (does not satisfy list.IsSorted({T:number | string,x:number | string,y:number | string,less:_|_(Descending.less: unresolved disjunction number | string (type (string|number)) (and 1 more errors))})):
    ./file.cue:10:20
    ./file.cue:11:20
stringsLengthDescending: invalid value ["AA","BBB","C"] (does not satisfy list.IsSorted({x:string,y:string,less:_|_(_sortStringsDescendingLength.less: incomplete argument string (type string) (and 1 more errors))})):
    ./file.cue:26:26
    ./file.cue:25:26
{{{end}}}

## Related content

- [`list.Sort`](https://pkg.go.dev/cuelang.org/go/pkg/list#Sort) documents the
  comparator schema and fields.
- `list.IsSorted` can also be used
  [to return a list's sort status as a boolean]({{< relref
    "../use-the-built-in-function-list-issorted-to-report-if-lists-are-sorted-using-a-comparator"
  >}})
- Use `list.IsSortStrings`
  [to validate that lists of strings are sorted alphabetically]({{< relref
    "../use-the-built-in-function-list-issortedstrings-to-validate-that-lists-of-strings-are-sorted-alphabetically"
  >}}) without needing to define a comparator
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
