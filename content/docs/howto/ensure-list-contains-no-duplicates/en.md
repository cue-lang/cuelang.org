---
title: Ensuring that a list doesn't contain duplicate elements
toc_hide: true
authors: [jpluscplusm]
aliases:
- /docs/howto/list-no-duplicates
- /docs/howto/use-list-uniqueitems-as-a-field-validator
---
{{<sidenote text="Requires CUE v0.12.0 or later">}}

Structured data often includes fields that are lists of values, and sometimes
you'll want to ensure that lists don't contain repeated or duplicate elements.
This guide demonstrates how to use the built-in function
[`list.UniqueItems`](https://pkg.go.dev/cuelang.org/go/pkg/list#UniqueItems)
to check that list elements' concrete values are unique.

## Lists of simple, concrete values

You can check lists containing simple values such as `string`, `integer`, or
`float` types using `list.UniqueItems` as a field validator:

{{{with code "en" "simple-strings-integers"}}}
#location top bottom
! exec cue vet -c
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
B: invalid value [1,2,42,3,42] (does not satisfy list.UniqueItems): equal value (42) at position 2 and 4:
    ./file.cue:10:4
C: invalid value [1.0,2.0,42.0,3,42.0] (does not satisfy list.UniqueItems): equal value (42.0) at position 2 and 4:
    ./file.cue:13:4
{{{end}}}

## List of structs

The easiest way to ensure that the elements in a list of structs have unique
values for a single key is to construct the list dynamically from a map:

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
            "age": 30,
            "name": "joe"
        },
        {
            "age": 35,
            "name": "alice"
        }
    ]
}
{{{end}}}

You can also constrain a list of structs directly, ensuring that each struct
is unique based on the combined values of all its fields. To do this, unify the
list with `list.UniqueItems`:

{{{with code "en" "struct - all fields"}}}
#location top bottom
! exec cue vet -c
cmp stderr out
-- file.cue --
package example

import "list"

A: [
	{name: "joe", age: 30},
	{name: "alice", age: 30},
	{name: "alice", age: 31},
	{age: 30, name: "joe"}, // Field order doesn't matter - this element is a duplicate.
]
A: list.UniqueItems
-- out --
A: invalid value [{name:"joe",age:30},{name:"alice",age:30},{name:"alice",age:31},{age:30,name:"joe"}] (does not satisfy list.UniqueItems): equal values at position 0 and 3:
    ./file.cue:5:4
    ./file.cue:11:4
{{{end}}}

When only some fields in each struct need to be unique, you can enforce this by
unifying the list with a check that emits a custom error if duplicates are
found. This technique works for any number of fields - here it's used to check
a single field, `name`:

{{{with code "en" "struct - single field"}}}
#location top bottom
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
	if !list.UniqueItems([for i in A {
		name: i.name
	}]) {error ("name values are not unique")}
}
-- out --
A: name values are not unique:
    ./file.cue:14:7
{{{end}}}

Here's the same technique being used to check the combination of multiple keys'
values for uniqueness. In this example the combination of `name` and `birthday`
needs to be unique across all the list's elements:

{{{with code "en" "struct - multiple fields"}}}
#location top bottom
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
	if !list.UniqueItems([for i in A {
		name:     i.name
		birthday: i.birthday
	}]) {error("name + birthday values are not unique")}
}
-- out --
A: name + birthday values are not unique:
    ./file.cue:16:7
{{{end}}}

## Related content

- Standard library: [`list.UniqueItems`](/go/pkg/list#UniqueItems)
- {{<issue 943>}}Issue #943{{</issue>}} tracks the proposed built-in function
  `must()`, which would improve the granularity of the error messages displayed
  by the last pair of examples presented in this guide
