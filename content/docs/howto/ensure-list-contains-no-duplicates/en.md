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

{{<info>}}
`list.UniqueItems` has been updated for CUE v0.12.0.
The examples in this guide demonstrate the following version:

{{{with _script_ "en" "HIDDEN: use cue pre-release"}}}
export PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH
{{{end}}}
{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}
{{</info>}}

## Lists of simple, concrete values

Check lists containing `string`, `integer`, `float` and other simple values
using `list.UniqueItems` as a field validator:

{{{with code "en" "simple-strings-integers"}}}
#location top bottom
env PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH

! exec cue vet
cmp stderr out
-- file.cue --
package example

import "list"

// A validates successfully.
A: ["a", "b", 1, "c", "d"]
A: list.UniqueItems

// B and C fail to validate.
B: list.UniqueItems & [
	1, 2, 42, 3, 40 + 2,
]
C: list.UniqueItems & [
	1.0, 2.0, 42.0, 3, 21 * 2.0,
]
-- out --
B: invalid value ["X","b",1,"X","d"] (does not satisfy list.UniqueItems): equal value ("X") at position 0 and 3:
    ./file.cue:10:4
    ./file.cue:11:4
C: invalid value [1,2,42,3,42] (does not satisfy list.UniqueItems): equal value (42) at position 2 and 4:
    ./file.cue:12:4
{{{end}}}

## Lists of structs

The easiest way to ensure that the elements in a list of structs each have
unique values for a single key is to construct the list from a map, dynamically:

{{{with code "en" "struct from map"}}}
env PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH

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

To constrain a list of structs directly (instead of constructing it
from a map) so that all the fields inside each struct must be unique when taken
together, in combination, unify the list with `list.UniqueItems`:

{{{with code "en" "struct - all fields"}}}
env PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH

! exec cue vet
cmp stderr out
-- file.cue --
package example

A: [
	{name: "joe", age: 30},
	{name: "alice", age: 30},
	{name: "alice", age: 31},
	{age: 30, name: "joe"}, // Field order doesn't matter - this element is a duplicate.
]
A: list.UniqueItems
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

To constrain a list of structs directly, but where only a subset of the
structs' fields need to be unique in combination, unify the list with an
embedded hidden field that uses `list.UniqueItems` to check only that
subset of fields. This technique works for any number of fields - here it's
being used to check a single field:

{{{with code "en" "struct - single field"}}}
#location top bottom
env PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH

! exec cue export
cmp stderr out
-- file.cue --
package example

import "list"

A: [
	{name: "joe", age: 30},
	{name: "alice", age: 31},
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

Here's an example of the same technique being used to check the combination of
multiple keys' values for uniqueness. In this example the combination of `name`
and `birthday` needs to be unique across all the list's elements:

{{{with code "en" "struct - multiple fields"}}}
#location top bottom
env PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH

! exec cue vet -c
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
