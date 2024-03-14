---
title: Using "list.IsSortedStrings" as a field validator
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
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

- {{< linkto/related/howto "use-list-issortedstrings-to-report-if-lists-of-strings-are-sorted" >}}
- {{< linkto/related/howto "use-list-issorted-as-a-field-validator" >}}
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
