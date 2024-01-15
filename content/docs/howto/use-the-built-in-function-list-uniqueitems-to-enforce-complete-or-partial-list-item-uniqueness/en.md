---
title: Using the built-in function "list.UniqueItems" to enforce complete or partial list item completeness
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

// inline uses list.UniqueItems in its non-validator mode, returning a boolean
// value. Its value will be "true".
inline: list.UniqueItems([1, 2, "3", 4, "five"])

// iceCreams is a list of structs representing multiple brands' specific kinds
// (or flavours) of ice cream, along with optional names and prices.
// It is *not* mandatory to declare a list's schema in order to use the list
// with list.UniqueItems. We do so, here, for clarity.
iceCreams: [...{
	brand!: string
	kind!:  string
	name?:  string
	price?: number
}]

// Assert that iceCreams contains no duplicate items.
iceCreams: list.UniqueItems

// Assert that a synthetic list, constructed using a subset of the fields inside
// iceCreams' items, contains no duplicate items.
_flavoursByBrand: list.UniqueItems & [
	for item in iceCreams {{
		brand: item.brand
		kind:  item.kind
	}},
]

// Assert that a synthetic list, constructed using a different subset of the
// fields inside iceCreams' items, contains no duplicate items.
_names: list.UniqueItems & [
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
    ./file.cue:25:19
_names: invalid value [{name:"Vanilla Deluxe"},{name:"Strawberry Delight"},{name:"Vanilla Treat"},{name:"Vanilla Deluxe"}] (does not satisfy list.UniqueItems):
    ./file.cue:34:9
{{{end}}}

## Related content

- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
