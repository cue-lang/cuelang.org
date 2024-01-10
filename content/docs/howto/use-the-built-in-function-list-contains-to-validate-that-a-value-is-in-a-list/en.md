---
title: Using the built-in function "list.Contains" to validate that a value is in a list
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.Contains`](https://pkg.go.dev/cuelang.org/go/pkg/list#Contains)
as a validator that checks if a simple or composite value is contained in a
list.

{{{with code "en" "cc"}}}
#location top bottom

! exec cue vet
cmp stderr out
-- file.cue --
package example

import "list"

// The example contents of aList are assigned below.
aList: [...]

// When passed a single argument and unified with a list, list.Contains emits
// an error if the argument is not an element present at the top level of the
// unified list.
aList: list.Contains(1)
aList: list.Contains("TWO")

// If the argument is a struct, then all the struct's fields must be present
// inside a single struct member of the unified list, with both structs' fields
// holding equivalent values. There must be no additional fields present.
aList: list.Contains({asInt: 3})
aList: list.Contains({asInt: 3, asString: "three"})
aList: list.Contains({asInt: 3, asString: "three", asFloat: 3.0})

// If the argument is a list, then the entire list must be an element present
// at the top level of the unified list, with both lists' elements holding the
// same values in the same order.
aList: list.Contains(["four"])
aList: list.Contains(["four", 4])
aList: list.Contains([4, "four"])
aList: list.Contains(["four", 4, 4.0])

aList: [
	1, "two",
	{asInt: 3, asString: "three"},
	[4, "four"],
]
-- out --
aList: invalid value [1,"two",{asInt:3,asString:"three"},[4,"four"]] (does not satisfy list.Contains("TWO")):
    ./file.cue:12:8
    ./file.cue:6:8
    ./file.cue:11:8
    ./file.cue:12:22
    ./file.cue:17:8
    ./file.cue:18:8
    ./file.cue:19:8
    ./file.cue:24:8
    ./file.cue:25:8
    ./file.cue:26:8
    ./file.cue:27:8
    ./file.cue:29:8
aList: invalid value [1,"two",{asInt:3,asString:"three"},[4,"four"]] (does not satisfy list.Contains({asInt:3})):
    ./file.cue:17:8
    ./file.cue:6:8
    ./file.cue:11:8
    ./file.cue:12:8
    ./file.cue:18:8
    ./file.cue:19:8
    ./file.cue:24:8
    ./file.cue:25:8
    ./file.cue:26:8
    ./file.cue:27:8
    ./file.cue:29:8
aList: invalid value [1,"two",{asInt:3,asString:"three"},[4,"four"]] (does not satisfy list.Contains({asInt:3,asString:"three",asFloat:3.0})):
    ./file.cue:19:8
    ./file.cue:6:8
    ./file.cue:11:8
    ./file.cue:12:8
    ./file.cue:17:8
    ./file.cue:18:8
    ./file.cue:24:8
    ./file.cue:25:8
    ./file.cue:26:8
    ./file.cue:27:8
    ./file.cue:29:8
aList: invalid value [1,"two",{asInt:3,asString:"three"},[4,"four"]] (does not satisfy list.Contains(["four"])):
    ./file.cue:24:8
    ./file.cue:6:8
    ./file.cue:11:8
    ./file.cue:12:8
    ./file.cue:17:8
    ./file.cue:18:8
    ./file.cue:19:8
    ./file.cue:25:8
    ./file.cue:26:8
    ./file.cue:27:8
    ./file.cue:29:8
aList: invalid value [1,"two",{asInt:3,asString:"three"},[4,"four"]] (does not satisfy list.Contains(["four",4,4.0])):
    ./file.cue:27:8
    ./file.cue:6:8
    ./file.cue:11:8
    ./file.cue:12:8
    ./file.cue:17:8
    ./file.cue:18:8
    ./file.cue:19:8
    ./file.cue:24:8
    ./file.cue:25:8
    ./file.cue:26:8
    ./file.cue:29:8
{{{end}}}

{{< info >}}
[Issue #49](https://github.com/cue-lang/docs-and-content/issues/49) tracks the
documentation of precisely what CUE means by values being "equivalent",
"equal", or "comparable". When this documentation is complete it will be linked
to, and fewer examples will be presented in this guide.
{{< /info >}}

## Related content

- `list.Contains` can also be used
  [to report if a value is in a list]({{< relref
    "../use-the-built-in-function-list-contains-to-report-if-a-value-is-in-a-list"
  >}})
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
