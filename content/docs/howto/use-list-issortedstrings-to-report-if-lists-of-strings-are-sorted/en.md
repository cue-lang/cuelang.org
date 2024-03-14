---
title: Using "list.IsSortedStrings" to report if lists of strings are sorted
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
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

- {{< linkto/related/howto "use-list-issortedstrings-as-a-field-validator" >}}
- {{< linkto/related/howto "use-list-issorted-to-report-if-lists-are-sorted" >}}
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
