---
title: Using "list.IsSorted" as a field validator
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
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

import (
	"list"

	// The strings package is only imported for some examples in this
	// guide, and is not required when using list.IsSorted.
	"strings"
)

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

// This comparator tests if lists of strings are in descending order of how
// many "@" characters they contain.
_sortAtSymbolCountDescending: {
	x:    string
	y:    string
	less: strings.Count(x, "@") > strings.Count(y, "@")
}
stringsCountDescending: ["@", "@@", "X"]
stringsCountDescending: list.IsSorted(_sortAtSymbolCountDescending) // validation failure
-- out --
stringsDescending: invalid value ["A","B","C"] (does not satisfy list.IsSorted({T:number | string,x:number | string,y:number | string,less:_|_(Descending.less: unresolved disjunction number | string (type (string|number)) (and 1 more errors))})):
    ./file.cue:16:20
    ./file.cue:17:20
stringsCountDescending: invalid value ["@","@@","X"] (does not satisfy list.IsSorted({x:string,y:string,less:_|_(_sortAtSymbolCountDescending.less: error in call to strings.Count: non-concrete value string (and 1 more errors))})):
    ./file.cue:33:25
    ./file.cue:32:25
{{{end}}}

## Related content

- [`list.Sort`](https://pkg.go.dev/cuelang.org/go/pkg/list#Sort) documents the
  comparator schema and fields
- {{< linkto/related/howto "use-list-issorted-to-report-if-lists-are-sorted" >}}
- {{< linkto/related/howto "use-list-issortedstrings-as-a-field-validator" >}}
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
