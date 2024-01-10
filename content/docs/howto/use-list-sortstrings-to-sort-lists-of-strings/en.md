---
title: Using "list.SortStrings" to sort lists of strings
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.SortStrings`](https://pkg.go.dev/cuelang.org/go/pkg/list#SortStrings)
to sort lists of strings alphabetically.

{{{with code "en" "cc"}}}
#location left right

exec cue eval
cmp stdout out
-- file.cue --
package example

import "list"

unsorted: ["B", "C", "A"]
sorted: list.SortStrings(unsorted)
-- out --
unsorted: ["B", "C", "A"]
sorted: ["A", "B", "C"]
{{{end}}}

## Related content

- `list.SortStrings` only sorts lists of strings alphabetically - use
  `list.Sort`
  [to apply any other sort order]({{< relref
    "../use-the-built-in-function-list-sort-to-sort-lists-using-a-comparator"
  >}})
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
