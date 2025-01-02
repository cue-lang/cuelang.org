---
title: Ensuring that lists don't contain duplicate elements
toc_hide: true
tags: [language]
---

Structured data often includes fields with list values, and sometimes you'll
want to ensure that lists don't contain repeated or duplicate elements.
This guide demonstrates how to use the built-in function
[`list.UniqueItems`](https://pkg.go.dev/cuelang.org/go/pkg/list#UniqueItems)
as a field validator to check that your lists' elements' concrete values are
unique.

## Simple, concrete values

Check `string` and `integer` values using `list.UniqueItems`:

{{{with code "en" "simple-strings-integers"}}}
#location top bottom
! exec cue vet
cmp stderr out
-- file.cue --
package example

import "list"

// A validates successfully.
A: ["a", "b", 1, "c", "d"]
A: list.UniqueItems

// B and C fail to validate.
B: ["X", "b", 1, "X", "d"]
B: list.UniqueItems
C: list.UniqueItems & [
	1, 2, 42, 3, 40 + 2,
]
-- out --
B: invalid value ["X","b",1,"X","d"] (does not satisfy list.UniqueItems):
    ./file.cue:10:4
    ./file.cue:11:4
C: invalid value [1,2,42,3,42] (does not satisfy list.UniqueItems):
    ./file.cue:12:4
{{{end}}}

Values of type `float` can also be checked with `list.UniqueItems`, as
demonstrated below.
However there are corner cases where `list.UniqueItems` doesn't behave as you
might expect when checking these values.

{{{with code "en" "simple-floats-numbers"}}}
#location top bottom
! exec cue vet
cmp stderr out
-- file.cue --
package example

import "list"

// A validates successfully, as expected.
A: [1.0, 2.0, 42.0, 3, 42]
A: list.UniqueItems

// B fails to validate, as expected.
B: list.UniqueItems & [
	1.0, 2.0, 42.0, 3, 40 + 2.0,
]

// C validates, unexpectedly.
C: list.UniqueItems & [
	1.0, 2.0, 42.0, 3, 42.00,
]
-- out --
B: invalid value [1.0,2.0,42.0,3,42.0] (does not satisfy list.UniqueItems):
    ./file.cue:10:4
{{{end}}}

The unexpected behaviour above, where `C` validates successfully, is tracked in
{{<issue 2192/>}}.

## Structs

A common issue is we have a list of structs, each with some key that must be
unique across all items in the list.

To ensure a list of structs has no duplicate keys, one common approach is to
guarantee that the list has no duplicate items by constructing the list from a
map.

{{{with code "en" "struct from map"}}}
-- structs.cue --
_items: {
	joe: age:   30
	alice: age: 35
}
_items: [name=string]: "name": name

items: [
	for item in _items {
		item
	},
]
{{{end}}}

If the list must be constrained directly, you can embed a hidden field that
creates a mapping from the keys

{{{with code "en" "auxiliary field"}}}
-- auxiliary-field.cue --
FIXME

x: {
	[...]
	_check: list.UniqueItems & [
		for e in x {a: e.a, b: e.b},
	]
}

x: [
	{a: 1, b: 1, c: false},
	{a: 1, b: 2, c: true},
	{a: 1, b: 1, c: true},
]

items: [
	{
		name: "joe"
		age:  30
	},
	{
		name: "alice"
		age:  35
	},
	{
		name: "joe"
		age:  31
	},
]
_itemsCheck: {
	for i, item in items {
		(item.name): i
	}
}
{{{end}}}

If the key is specified twice, there will be a conflict in `_itemsCheck`.

### Ensuring multiple keys to have no duplicates

If there are multiple keys that together must be unique, a similar approach can
be used, using
[`json.Marshal`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json)  to form a
composite string key from the keys. Here, for example, the combination of `name`
and `dateOfBirth` must be unique:

{{{with code "en" "multiple keys"}}}
-- multiple-keys.cue --
import "encoding/json"

items: [
	{
		name:        "joe"
		dateOfBirth: "1983-10-21"
		country:     "US"
	},
	{
		name:        "alice"
		dateOfBirth: "1987-10-15"
		country:     "DE"
	},
	{
		name:        "joe"
		dateOfBirth: "2010-02-05"
		country:     "UK"
	},
	{
		name:        "alice"
		dateOfBirth: "1987-10-15"
		country:     "BE"
	},
]
_itemsCheck: {
	for i, item in items {
		(json.Marshal([item.name, item.dateOfBirth])): i
	}
}
{{{end}}}
