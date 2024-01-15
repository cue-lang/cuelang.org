---
title: Using "list.UniqueItems" as a field validator
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.UniqueItems`](https://pkg.go.dev/cuelang.org/go/pkg/list#UniqueItems)
to enforce that a list's items are either completely unique (taking all of each
item's fields into account), or that they're partially unique (taking only
*some* of each item's fields into account).

{{{with code "en" "cc"}}}
#location top bottom

! exec cue vet
cmp stderr out
-- file.cue --
package example

import "list"

// When passed a single argument, list.UniqueItems returns a boolean value.
// This field's value will be "true".
uniqueItems: list.UniqueItems([1, 2, "3", 3, "three"])

// iceCreams is a list of structs representing multiple brands' specific kinds
// (or flavours) of ice cream, along with optional names and prices.
// It is *not* mandatory to declare a list's schema in order to unify the list
// with list.UniqueItems - we do this only for visibility of the data model.
iceCreams: [...{
	brand!: string
	kind!:  string
	name?:  string // optional
	price?: number // optional
}]

// Assert that all of iceCreams' items are unique. Item comparability is
// discussed in https://github.com/cue-lang/docs-and-content/issues/49.
iceCreams: list.UniqueItems

// Assert that a subset of the fields in iceCreams' items are unique by using
// list.UniqueItems as a validator on a list populated by a comprehension
// that selects only those fields whose combined uniqueness is required.
_flavoursByBrand: list.UniqueItems & [
	for item in iceCreams {{
		brand: item.brand
		kind:  item.kind
	}},
]

// Assert that a different subset of the fields in iceCreams' items are unique.
_iceCreamNames: list.UniqueItems & [
	for item in iceCreams
	if item.name != _|_ {{
		name: item.name
	}},
]

iceCreams: [{
	brand: "Charlie's Chocs"
	kind:  "vanilla"
	name:  "Vanilla Deluxe"
	price: 5
}, {
	brand: "Lola's Lollies"
	kind:  "strawberry"
}, {
	brand: "Charlie's Chocs"
	kind:  "strawberry"
	name:  "Strawberry Delight"
	price: 7.99
}, {
	brand: "Charlie's Chocs"
	kind:  "vanilla"
	name:  "Vanilla Treat"
	price: 5
}, {
	brand: "Lola's Lollies"
	kind:  "vanilla"
	name:  "Vanilla Deluxe"
}]
-- out --
_flavoursByBrand: invalid value [{brand:"Charlie's Chocs",kind:"vanilla"},{brand:"Lola's Lollies",kind:"strawberry"},{brand:"Charlie's Chocs",kind:"strawberry"},{brand:"Charlie's Chocs",kind:"vanilla"},{brand:"Lola's Lollies",kind:"vanilla"}] (does not satisfy list.UniqueItems):
    ./file.cue:27:19
_iceCreamNames: invalid value [{name:"Vanilla Deluxe"},{name:"Strawberry Delight"},{name:"Vanilla Treat"},{name:"Vanilla Deluxe"}] (does not satisfy list.UniqueItems):
    ./file.cue:35:17
{{{end}}}

{{< info >}}
[Issue #49](https://github.com/cue-lang/docs-and-content/issues/49) tracks the
documentation of precisely what CUE means by values being "equivalent",
"equal", or "comparable". When this documentation is complete it will be linked
to from this guide.
{{< /info >}}

## Related content

- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
