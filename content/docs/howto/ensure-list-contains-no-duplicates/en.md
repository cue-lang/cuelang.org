---
title: Ensuring that a list doesn't contain duplicate elements
toc_hide: true
authors: [jpluscplusm]
aliases:
- /docs/howto/list-no-duplicates
- /docs/howto/use-list-uniqueitems-as-a-field-validator
---

Structured data often includes fields that are lists of values, and sometimes
you'll want to ensure that lists don't contain repeated or duplicate elements.
This guide demonstrates how to use the built-in function
[`list.UniqueItems`](https://pkg.go.dev/cuelang.org/go/pkg/list#UniqueItems)
to check that list elements' concrete values are unique.

## Lists of simple, concrete values

Check lists containing `string` and `integer` values using `list.UniqueItems`:

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

Lists containing `float` values can also be checked with `list.UniqueItems`, as
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
	1.0, 2.0, 42.0, 3, 21 * 2.0,
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

## Lists of structs

The easiest way to ensure that the elements in a list of structs each have
unique values for a single key is to construct the list from a map, dynamically:

{{{with code "en" "struct from map"}}}
exec cue export
cmp stdout out
-- file.cue --
package example

_A: {
	joe: age:   30
	alice: age: 35
}

A: [
	for itemName, itemData in _A {
		name: itemName
		itemData
	},
]
-- out --
{
    "A": [
        {
            "name": "joe",
            "age": 30
        },
        {
            "name": "alice",
            "age": 35
        }
    ]
}
{{{end}}}

If a list of structs needs to be constrained directly, unify the list with an
embedded hidden field that uses `list.UniqueItems` to check that a field in
each struct contains unique values:

{{{with code "en" "struct - single field"}}}
#location top bottom
! exec cue vet
cmp stderr out
-- file.cue --
package example

import "list"

A: [
	{name: "joe", age: 30},
	{name: "alice", age: 35},
	{name: "joe", age: 31},
]

A: {
	[...]
	_names: list.UniqueItems & [
		for i in A {
			name: i.name
		},
	]
}
-- out --
A._names: invalid value [{name:"joe"},{name:"alice"},{name:"joe"}] (does not satisfy list.UniqueItems):
    ./file.cue:13:10
{{{end}}}

This technique also works if there are multiple keys whose combinations must be
unique.
In this example the combination of `name` and `birthday` needs to be unique
across the list's elements:

{{{with code "en" "struct - multiple fields"}}}
#location top bottom
! exec cue vet
cmp stderr out
-- file.cue --
package example

import "list"

A: [
	{name: "joe", age: 30, birthday: "1997-02-01"},
	{name: "alice", age: 35, birthday: "1970-04-17"},
	{name: "joe", age: 31, birthday: "2001-12-16"},
	{name: "alice", age: 99, birthday: "1970-04-17"}, // Duplicate element.
]

A: {
	[...]
	_namesAndBirthdays: list.UniqueItems & [
		for i in A {
			// Check the combination of these fields for uniqueness:
			name:     i.name
			birthday: i.birthday
		},
	]
}
-- out --
A._namesAndBirthdays: invalid value [{name:"joe",birthday:"1997-02-01"},{name:"alice",birthday:"1970-04-17"},{name:"joe",birthday:"2001-12-16"},{name:"alice",birthday:"1970-04-17"}] (does not satisfy list.UniqueItems):
    ./file.cue:14:22
{{{end}}}

The `list.UniqueItems` function isn't yet able to validate the uniqueness of
lists of structs where the structs' fields are ordered inconsistently.
For example, this use of the function currently fails to point out the
duplicate list element:

{{{with code "en" "struct - direct function failure"}}}
exec cue vet # this command currently succeeds
cmp stdout out
-- file.cue --
package example

import "list"

A: list.UniqueItems & [
	{x: 1, o: 2},
	{o: 2, x: 1},
]
-- out --
{{{end}}}

To validate structs containing (even potentially) inconsistently ordered
fields, use the hidden field technique demonstrated above. This unexpected
behaviour is tracked in {{<issue 2192/>}} -- please subscribe to the issue to
receive notifications for relevant updates.
