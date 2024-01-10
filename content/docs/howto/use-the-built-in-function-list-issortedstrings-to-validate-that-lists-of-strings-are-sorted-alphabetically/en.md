---
title: Using the built-in function "list.IsSortedStrings" to validate that lists of strings are sorted alphabetically
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.IsSortedStrings`](https://pkg.go.dev/cuelang.org/go/pkg/list#IsSortedStrings)
as a field validator to assert that lists of strings are sorted alphabetically.

{{{with code "en" "cc"}}}
#location top bottom

! exec cue eval
cmp stderr out
-- file.cue --
package example

import "list"

sorted: ["A", "B", "C"]
unsorted: ["B", "C", "A"]

sorted:   list.IsSortedStrings
unsorted: list.IsSortedStrings // validation failure
-- out --
unsorted: invalid value ["B","C","A"] (does not satisfy list.IsSortedStrings):
    ./file.cue:6:11
    ./file.cue:9:11
{{{end}}}

## Related content

- `list.IsSortedStrings` can also be used
  [to return a list's sort status as a boolean]({{< relref
    "../use-the-built-in-function-list-issortedstrings-to-report-if-lists-of-strings-are-sorted-alphabetically"
  >}})
- `list.IsSortedStrings` only validates if lists of strings are sorted
  alphabetically - use `list.IsSorted`
  [to validate any other list type or sort order]({{< relref
    "../use-the-built-in-function-list-issorted-to-validate-that-lists-are-sorted-using-a-comparator"
  >}})
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
