---
title: Using the built-in function "list.Contains" to report if a value is in a list
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

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top" >}}
package example

import "list"

// When passed two arguments, list.Contains returns a boolean value reporting
// if the second argument is an element present at the top level of the first.
contains: list.Contains([1, 2, 3, 4, 5], 4)

// The example contents of _source are assigned below.
_source: [...]

// Either of list.Contains' arguments may be a reference.
containsBasicInt:    list.Contains(_source, 1)
containsBasicString: list.Contains(_source, "TWO")

// If the second argument is a struct, then for a match to be reported all the
// struct's fields must be present inside a single struct member of the first
// argument, with both structs' fields holding equivalent values. There must be
// no additional fields present.
containsStructMissingField: list.Contains(_source, {
	asInt: 3
})
containsStructAllFields: list.Contains(_source, {
	asInt:    3
	asString: "three"
})
containsStructExtraFields: list.Contains(_source, {
	asInt:    3
	asString: "three"
	asFloat:  3.0
})

// If the second argument is a list, then the entire list must be an element
// present at the top level of the first argument, with both lists' elements
// holding the same values in the same order.
containsListMissingElement: list.Contains(_source, ["four"])
containsListAllElementsIncorrectOrder: list.Contains(_source, ["four", 4])
containsListAllElementsCorrectOrder: list.Contains(_source, [4, "four"])
containsListExtraElements: list.Contains(_source, ["four", 4, 4.0])

_source: [
	1, "two",
	{asInt: 3, asString: "three"},
	[4, "four"],
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue eval
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
{{< /code-tab >}}
{{< /code-tabs >}}

{{< info >}}
[Issue #49](https://github.com/cue-lang/docs-and-content/issues/49) tracks the
documentation of precisely what CUE means by values being "equivalent",
"equal", or "comparable". When this documentation is complete it will be linked
to, and fewer examples will be presented in this guide.
{{< /info >}}

## Related content

- `list.Contains` can also be used
  [as a field validator]({{< relref
    "../use-the-built-in-function-list-contains-to-validate-that-a-value-is-in-a-list"
  >}})
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
