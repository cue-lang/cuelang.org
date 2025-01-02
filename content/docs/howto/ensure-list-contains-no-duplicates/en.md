---
title: Ensuring that a list doesn't contain duplicate elements
toc_hide: true
authors: [jpluscplusm]
aliases:
- /docs/howto/list-no-duplicates/
- /docs/howto/use-list-uniqueitems-as-a-field-validator/
---

Structured data often includes fields that are lists of values, and sometimes
you'll want to ensure that lists don't contain repeated or duplicate elements.
This guide demonstrates how to do that using the built-in function
[`list.UniqueItems`](/go/pkg/list#UniqueItems).

## Lists of simple, concrete values

You can check lists containing simple values such as `bool`, `string`,
`integer`, and `float` types using `list.UniqueItems` as a field validator:

{{{with code "en" "simple-strings-integers"}}}
#location top bottom
! exec cue vet -c
cmp stderr out
-- file.cue --
package example

import "list"

// A validates successfully.
A: ["a", true, "b", 1, "c", "d", false]
A: list.UniqueItems

// B and C fail to validate.
B: list.UniqueItems & [
	1, 2, 42, 3, 40 + 2,
]
C: list.UniqueItems & [
	1.0, 2.0, 42.0, 3, 21 * 2.0,
]
-- out --
B: invalid value [1,2,42,3,42] (does not satisfy list.UniqueItems): equal value (42) at position 2 and 4:
    ./file.cue:10:4
C: invalid value [1.0,2.0,42.0,3,42.0] (does not satisfy list.UniqueItems): equal value (42.0) at position 2 and 4:
    ./file.cue:13:4
{{{end}}}

## Lists of structs

The easiest way to assert that a list of structs contains unique elements is to
unify the list with `list.UniqueItems`:

{{{with code "en" "struct - all fields"}}}
! exec cue vet -c
cmp stderr out
-- file.cue --
package example

import "list"

A: list.UniqueItems & [
	{name: "joe", age: 30},
	{name: "alice", age: 30},
	{name: "alice", age: 31},

	// Field order doesn't matter; this element
	// is a duplicate.
	{age: 30, name: "joe"},
]
-- out --
A: invalid value [{name:"joe",age:30},{name:"alice",age:30},{name:"alice",age:31},{age:30,name:"joe"}] (does not satisfy list.UniqueItems): equal values at position 0 and 3:
    ./file.cue:5:4
{{{end}}}

This check ensures that each struct is unique based on the combined values of
all its fields.

When you dynamically construct a list of structs from a map, including the
map's keys in the struct data guarantees that the list will contain unique
elements:

{{{with code "en" "struct from map"}}}
exec cue export
cmp stdout out
-- file.cue --
package example

import "list"

_A: {
	joe: age:     35
	alice: age:   35
	charlie: age: 80
}

A: list.UniqueItems & [
	for itemKey, itemValue in _A {
		name: itemKey
		itemValue
	},
]
-- out --
{
    "A": [
        {
            "age": 35,
            "name": "joe"
        },
        {
            "age": 35,
            "name": "alice"
        },
        {
            "age": 80,
            "name": "charlie"
        }
    ]
}
{{{end}}}

You can assert that a subset of fields in each struct are unique by unifying
the list with a check that emits a custom error if duplicates are found.
This technique works for any number of fields -- here it's checking the single
field `name`:

{{{with code "en" "struct - single field"}}}
# TODO: update example once must() is available.
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
	let uniqueKeys = [for i in A {
		name: i.name
	}]
	if !list.UniqueItems(uniqueKeys) {
		error ("name values are not unique")
	}
}
-- out --
A: name values are not unique:
    ./file.cue:16:3
{{{end}}}

Here's the same technique being used to check the combination of multiple keys'
values for uniqueness. In this example the combination of `name` and `birthday`
needs to be unique across all the list's elements:

{{{with code "en" "struct - multiple fields"}}}
# TODO: update example once must() is available.
! exec cue vet -c
cmp stderr out
-- file.cue --
package example

import "list"

A: [
	{name: "joe", age: 30, DoB: "1997-02-01"},
	{name: "alice", age: 35, DoB: "1970-04-17"},
	{name: "joe", age: 31, DoB: "2001-12-16"},
	// Duplicate element.
	{name: "alice", age: 99, DoB: "1970-04-17"},
]

A: {
	let uniqueKeys = [for i in A {
		name: i.name
		DoB:  i.DoB
	}]
	if !list.UniqueItems(uniqueKeys) {
		error("name + DoB values are not unique")
	}
}
-- out --
A: name + DoB values are not unique:
    ./file.cue:19:3
{{{end}}}

<!-- TODO: remove this once v0.14.0 is the earliest supported version (post-v0.15.0?) -->

The `error` builtin was introduced in CUE v0.14.0. If you're using an older
version then you can replace the entire `error(...)` call with a string value,
which causes an evaluation failure and indirectly displays the value as part of
the failure's error message:

{{{with code "en" "struct - single field - explicit bottom"}}}
! exec cue export
cmp stderr out
-- file.cue --
package example

import "list"

A: [{name: "joe", age: 30},
	{name: "joe", age: 31}]

A: {
	let uniqueKeys = [for i in A {name: i.name}]
	if !list.UniqueItems(uniqueKeys) {
		"error: name values are not unique"
	}
}
-- out --
A: conflicting values [{name:"joe",age:30},{name:"joe",age:31}] and "error: name values are not unique" (mismatched types list and string):
    ./file.cue:5:4
    ./file.cue:11:3
{{{end}}}

Upgrading to
[a later version of CUE]({{< relref "docs/introduction/installation#installing-the-cue-command" >}})
is recommended instead of relying on this technique.

## Related content

- Standard library: [`list.UniqueItems`](/go/pkg/list#UniqueItems)
- {{<issue 943>}}Issue #943{{</issue>}} tracks the proposed built-in function
  `must()`, which would improve the granularity of the error messages displayed
  by some of the examples presented in this guide
