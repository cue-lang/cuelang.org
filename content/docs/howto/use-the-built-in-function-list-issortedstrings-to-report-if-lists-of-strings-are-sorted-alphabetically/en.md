---
title: Using the built-in function "list.IsSortedStrings" to report if lists of strings are sorted alphabetically
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.IsSortedStrings`](https://pkg.go.dev/cuelang.org/go/pkg/list#IsSortedStrings)
to test and report if lists of strings are sorted alphabetically.

{{{with code "en" "cc"}}}
#location left right

exec cue eval
cmp stdout out
-- file.cue --
package example

import "list"

_unsorted: ["B", "C", "A"]
_sorted: ["A", "B", "C"]

testUnsorted: list.IsSortedStrings(_unsorted)
testSorted:   list.IsSortedStrings(_sorted)
-- out --
testUnsorted: false
testSorted:   true
{{{end}}}

## Related content

- `list.IsSortedStrings` can also be used
  [as a field validator]({{< relref
    "../use-the-built-in-function-list-issortedstrings-to-validate-that-lists-of-strings-are-sorted-alphabetically"
  >}})
- `list.IsSortedStrings` only tests if lists of strings are sorted
  alphabetically - use `list.Sort`
  [to test any other list type or sort order]({{< relref
    "../use-the-built-in-function-list-issorted-to-report-if-lists-are-sorted-using-a-comparator"
  >}})
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
