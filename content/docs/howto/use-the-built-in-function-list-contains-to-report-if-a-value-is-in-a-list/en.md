---
title: Using the built-in function "list.Contains" to report if a value is contained in a list
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
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

// When passed two arguments, list.Contains returns a boolean value reporting
// if the second argument is an element directly contained in the first.
contains: list.Contains([1, 2, 3, 4, 5], 4)
containsBasicInt:    list.Contains(_source, 1)
containsBasicString: list.Contains(_source, "TWO")

// If the second argument is a struct, then for a match to be reported all the
// struct's fields must be present inside a single struct member of the first
// argument, with both structs' fields holding equivalent values. There must be
// no additional fields present.
containsStructMissingField: list.Contains(_source, {
	Int: 3
})
containsStructAllFields: list.Contains(_source, {
	Int:    3
	String: "three"
})
containsStructExtraFields: list.Contains(_source, {
	Int:    3
	String: "three"
	Float:  3.0
})

// If the second argument is a list, then the entire list must be an element
// contained directly in the first argument, with both lists' elements holding
// the same values in the same order.
containsListMissingElement: list.Contains(_source, ["four"])
containsListAllElementsIncorrectOrder: list.Contains(_source, ["four", 4])
containsListAllElementsCorrectOrder: list.Contains(_source, [4, "four"])
containsListExtraElements: list.Contains(_source, ["four", 4, 4.0])

// _source is the list being searched through in these examples.
_source: [
	1,
	"two",
	{
		Int:    3
		String: "three"
	},
	[4, "four"],
]
-- out --
contains:                              true
containsBasicInt:                      true
containsBasicString:                   false
containsStructMissingField:            false
containsStructAllFields:               true
containsStructExtraFields:             false
containsListMissingElement:            false
containsListAllElementsIncorrectOrder: false
containsListAllElementsCorrectOrder:   true
containsListExtraElements:             false
{{{end}}}

{{< info >}}
[Issue #49](https://github.com/cue-lang/docs-and-content/issues/49) tracks the
documentation of precisely what CUE means by values being "equivalent" or
"equal". When this documentation is complete it will be linked from here, and
fewer examples will be presented in this guide.
{{< /info >}}

## Related content

- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
- How to [use the built-in function `list.Contains` as a list validator]({{< 
    relref "../use-the-built-in-function-list-contains-as-a-list-validator"
  >}})
