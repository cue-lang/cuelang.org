---
title: Using the built-in functions "list.SortStrings" and "list.IsSortedStrings" to sort and test lists of strings
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in functions
[`list.SortStrings`](https://pkg.go.dev/cuelang.org/go/pkg/list#SortStrings)
to sort lists of strings, and
[`list.IsSortedStrings`](https://pkg.go.dev/cuelang.org/go/pkg/list#IsSortedStrings)
to test if lists of strings are sorted.

In this first example, `list.IsSortedStrings` is shown returning a boolean
value:

{{{with code "en" "cc1"}}}
#location left right

exec cue eval
cmp stdout out
-- file.cue --
package example

import "list"

unsorted: ["z", "Z", "a", "AAA", "42", "!£$%^&*"]

sorted:       list.SortStrings(unsorted)
unsortedTest: list.IsSortedStrings(unsorted)
sortedTest:   list.IsSortedStrings(sorted)
-- out --
unsorted: ["z", "Z", "a", "AAA", "42", "!£$%^&*"]
sorted: ["!£$%^&*", "42", "AAA", "Z", "a", "z"]
unsortedTest: false
sortedTest:   true
{{{end}}}

`list.IsSortedStrings` can also be used as a validator, directly applied to a
list field.

This second example shows the function producing an evaluation error when
applied to an unsorted list of strings:

{{{with code "en" "cc2"}}}
#location top bottom

! exec cue eval
cmp stderr out
-- file.cue --
package example

import "list"

sorted: ["A", "B", "C"]
unsorted: ["C", "A", "B"]

sorted:   list.IsSortedStrings
unsorted: list.IsSortedStrings
-- out --
unsorted: invalid value ["C","A","B"] (does not satisfy list.IsSortedStrings):
    ./file.cue:6:11
    ./file.cue:9:11
{{{end}}}

## Related content

- `list.SortStrings` can only sort lists of strings *alphabetically*.
  In any other situation, use [`list.Sort`]({{< relref
    "../use-the-built-in-functions-list-sort-list-issorted"
  >}})
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
