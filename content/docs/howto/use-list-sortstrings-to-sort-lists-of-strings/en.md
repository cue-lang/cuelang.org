---
title: Using "list.SortStrings" to sort lists of strings
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
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

- {{< linkto/related/howto "use-list-sort-to-sort-lists" >}}
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
