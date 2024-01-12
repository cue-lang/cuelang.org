---
title: Using the built-in functions "list.SortStrings" and "list.IsSortedStrings" to sort and test lists of strings
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in functions `list.SortStrings` to sort lists
of strings, and `list.IsSortedStrings` to test that list of strings are sorted.

{{{with code "en" "cc1"}}}
#location left right

exec cue eval
cmp stdout out
-- file.cue --
package example

import "list"

unsorted: ["z", "Z", "a", "AAA", "42", "!£$%^&*"]
sorted: list.SortStrings(unsorted)

// IsSortedStrings returns a boolean, which may be
// assigned as shown here, or used as a validator
// as shown in the other example on this page.
testUnsorted: list.IsSortedStrings(unsorted)
testSorted:   list.IsSortedStrings(sorted)
-- out --
unsorted: ["z", "Z", "a", "AAA", "42", "!£$%^&*"]
sorted: ["!£$%^&*", "42", "AAA", "Z", "a", "z"]
testUnsorted: false
testSorted:   true
{{{end}}}

{{{with code "en" "cc2"}}}
#location top bottom

! exec cue eval
cmp stderr out
-- file.cue --
package example

import "list"

unsorted: ["c", "b", "a"]
sorted: ["a", "b", "c"]

// IsSortedStrings can be used as a field validator.
unsorted: list.IsSortedStrings
sorted:   list.IsSortedStrings
-- out --
unsorted: invalid value ["c","b","a"] (does not satisfy list.IsSortedStrings):
    ./file.cue:5:11
    ./file.cue:9:11
{{{end}}}

## Related content

- `list.SortStrings` can only sort lists of strings *alphabetically*.
  In any other situation, use [`list.Sort`]({{< relref
    "../use-the-built-in-functions-list-sort-list-issorted"
  >}})
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
