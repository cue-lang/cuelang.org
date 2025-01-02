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

Check lists containing `string` and `integer` values using `list.UniqueItems`
as a field validator:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
B: invalid value ["X","b",1,"X","d"] (does not satisfy list.UniqueItems): equal value ("X") at position 0 and 3:
    ./file.cue:10:4
    ./file.cue:11:4
C: invalid value [1,2,42,3,42] (does not satisfy list.UniqueItems): equal value (42) at position 2 and 4:
    ./file.cue:12:4
{{< /code-tab >}}
{{< /code-tabs >}}

Lists containing `float` values can also be checked with `list.UniqueItems`, as
demonstrated below.
However there are corner cases where `list.UniqueItems` doesn't behave as you
might expect when checking these values.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
B: invalid value [1.0,2.0,42.0,3,42.0] (does not satisfy list.UniqueItems):
    ./file.cue:10:4
{{< /code-tab >}}
{{< /code-tabs >}}

The unexpected behaviour above, where `C` validates successfully, is tracked in
{{<issue 2192/>}}.

## Lists of structs

The easiest way to ensure that the elements in a list of structs each have
unique values for a single key is to construct the list from a map, dynamically:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
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
{{< /code-tab >}}
{{< /code-tabs >}}

If a list of structs needs to be constrained directly, unify the list with an
embedded hidden field that uses `list.UniqueItems` to check that a field in
each struct contains unique values:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
A._names: invalid value [{name:"joe"},{name:"alice"},{name:"joe"}] (does not satisfy list.UniqueItems):
    ./file.cue:13:10
{{< /code-tab >}}
{{< /code-tabs >}}

This technique also works if there are multiple keys whose combinations must be
unique.
In this example the combination of `name` and `birthday` needs to be unique
across the list's elements:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
A._namesAndBirthdays: invalid value [{name:"joe",birthday:"1997-02-01"},{name:"alice",birthday:"1970-04-17"},{name:"joe",birthday:"2001-12-16"},{name:"alice",birthday:"1970-04-17"}] (does not satisfy list.UniqueItems):
    ./file.cue:14:22
{{< /code-tab >}}
{{< /code-tabs >}}

The `list.UniqueItems` function isn't yet able to validate the uniqueness of
lists of structs where the structs' fields are ordered inconsistently.
For example, this use of the function currently fails to point out the
duplicate list element:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

import "list"

A: list.UniqueItems & [
	{x: 1, o: 2},
	{o: 2, x: 1},
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAjIHRoaXMgY29tbWFuZCBjdXJyZW50bHkgc3VjY2VlZHM=" >}}
$ cue vet # this command currently succeeds
{{< /code-tab >}}
{{< /code-tabs >}}

To validate structs containing (even potentially) inconsistently ordered
fields, use the hidden field technique demonstrated above. This unexpected
behaviour is tracked in {{<issue 2192/>}} -- please subscribe to the issue to
receive notifications for relevant updates.
