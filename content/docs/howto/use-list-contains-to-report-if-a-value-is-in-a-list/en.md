---
title: Using "list.Contains" to report if a value is in a list
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.Contains`](https://pkg.go.dev/cuelang.org/go/pkg/list#Contains)
to report if a simple or composite value is contained in a list.

{{{with code "en" "cc"}}}
#location top bottom

exec cue eval
cmp stdout out
-- file.cue --
package example

import "list"

// list.Contains searches through a list and reports if the given value is an
// element of that list.
containsIntTrue: list.Contains( [1, 2, 3, 4, 5], 4)
containsIntFalse: list.Contains([1, 2, 3, 4, 5], 99)

// _source is the example list searched through in this guide.
_source: [
	1, "two",
	{asInt: 3, asString: "three"},
	[4, "four"],
]

// When searching for a basic type, comparison is straight forward.
containsStringFalse: list.Contains(_source, "TWO")

// When searching for a struct or a list value, rules are followed to determine
// if the value is equal to any of the elements being compared.
// The tracking issue for these rules is
// https://github.com/cue-lang/docs-and-content/issues/49
containsStructFalse: list.Contains(_source, {asInt: 3})
containsStructTrue: list.Contains( _source, {asInt: 3, asString: "three"})
containsListTrue: list.Contains( _source, [4, "four"])
containsListFalse: list.Contains(_source, ["four", 4, 4.0])
-- out --
containsIntTrue:     true
containsIntFalse:    false
containsStringFalse: false
containsStructFalse: false
containsStructTrue:  true
containsListTrue:    true
containsListFalse:   false
{{{end}}}

{{< info >}}
Issue [cue-lang/docs-and-content#49](https://github.com/cue-lang/docs-and-content/issues/49)
tracks the documentation of precisely what CUE means by values being
"equivalent", "equal", or "comparable". When this documentation is complete it
will be linked to from this guide.
{{< /info >}}

## Related content

- {{< linkto/related/howto "use-list-contains-as-a-field-validator" >}}
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
