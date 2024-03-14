---
title: Using "list.Contains" as a field validator
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
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

// aList is the example list searched through in this guide.
aList: [
	1, "two",
	{asInt: 3, asString: "three"},
	[4, "four"],
]

// When unified with a list, list.Contains searches through the list and emits
// an error if the given value is not an element of that list.
aList: list.Contains(1)
aList: list.Contains("TWO") // validation failure

// When searching for a struct or a list value, rules are followed to determine
// if the value is equal to any of the elements being compared.
// The tracking issue for these rules is
// https://github.com/cue-lang/docs-and-content/issues/49
aList: list.Contains({asInt: 3}) // validation failure
aList: list.Contains({asInt: 3, asString: "three"})
aList: list.Contains([4, "four"])
aList: list.Contains(["four", 4, 4.0]) // validation failure
-- out --
aList: invalid value [1,"two",{asInt:3,asString:"three"},[4,"four"]] (does not satisfy list.Contains("TWO")):
    ./file.cue:15:8
    ./file.cue:6:8
    ./file.cue:14:8
    ./file.cue:15:22
    ./file.cue:21:8
    ./file.cue:22:8
    ./file.cue:23:8
    ./file.cue:24:8
aList: invalid value [1,"two",{asInt:3,asString:"three"},[4,"four"]] (does not satisfy list.Contains({asInt:3})):
    ./file.cue:21:8
    ./file.cue:6:8
    ./file.cue:14:8
    ./file.cue:15:8
    ./file.cue:22:8
    ./file.cue:23:8
    ./file.cue:24:8
aList: invalid value [1,"two",{asInt:3,asString:"three"},[4,"four"]] (does not satisfy list.Contains(["four",4,4.0])):
    ./file.cue:24:8
    ./file.cue:6:8
    ./file.cue:14:8
    ./file.cue:15:8
    ./file.cue:21:8
    ./file.cue:22:8
    ./file.cue:23:8
{{{end}}}

{{< info >}}
Issue [cue-lang/docs-and-content#49](https://github.com/cue-lang/docs-and-content/issues/49)
tracks the documentation of precisely what CUE means by values being
"equivalent", "equal", or "comparable". When this documentation is complete it
will be linked to from this guide.
{{< /info >}}

## Related content

- {{< linkto/related/howto "use-list-contains-to-report-if-a-value-is-in-a-list" >}}
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
