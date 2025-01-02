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
This guide demonstrates
how to assert that a list's elements are unique;
how to construct a list that's guaranteed to have unique elements; and
how to handle the special case where you have a list of structs,
but only need to assert that *some* of the structs' fields have unique values.

## Checking lists of concrete values

When you have a list of concrete values of any type, you can assert that each
element is unique using the [`list.UniqueItems`](/go/pkg/list#UniqueItems)
function as a field validator:

{{{with code "en" "concrete values pass"}}}
exec cue vet -c
cmp stdout out
-- file.cue --
package example

import "list"

A: list.UniqueItems & [
	1, 2, 3,                    // ints
	"a", "b", "c",              // strings
	true, false,                // bools
	1.1, 2.2, 3.3,              // floats
	{X: 1, O: 2}, {X: 2, O: 1}, // structs
	[1, 2, 3], [3, 2, 1],       // lists
]
-- out --
{{{end}}}

Otherwise, evaluation fails:

{{{with code "en" "concrete values fail"}}}
#location top bottom
! exec cue vet -c
cmp stderr out
-- file.cue --
package example

import "list"

// This templated constraint applies to all regular top-level fields.
[_]: list.UniqueItems

A: [1, 2, 1]
B: ["a", "b", "a"]
C: [
	[1, 2],
	[3, 4],
	[1, 2],
]
D: [
	{X: 1, O: 2},
	{X: 3, O: 4},
	{X: 1, O: 2},
]
-- out --
A: invalid value [1,2,1] (does not satisfy list.UniqueItems): equal value (1) at position 0 and 2:
    ./file.cue:6:6
    ./file.cue:8:4
B: invalid value ["a","b","a"] (does not satisfy list.UniqueItems): equal value ("a") at position 0 and 2:
    ./file.cue:6:6
    ./file.cue:9:4
C: invalid value [[1,2],[3,4],[1,2]] (does not satisfy list.UniqueItems): equal values at position 0 and 2:
    ./file.cue:6:6
    ./file.cue:10:4
{{{end}}}

Field `D` is invalid, despite its missing error message, and will always cause
evaluation to fail. {{<issue 4140>}}Issue #4140{{</issue>}} tracks the lack of
error message in this specific situation.

## Constructing lists with unique elements

When you dynamically construct a list from a map, including the map's keys in
the list data guarantees that it will contain unique elements:

{{{with code "en" "struct from map"}}}
exec cue export --out yaml
cmp stdout out
-- file.cue --
package example

import "list"

[_]: list.UniqueItems

A: [for itemKey, itemValue in _data {
	name: itemKey
	itemValue
}]

B: list.SortStrings([for k, _ in _data {k}])

_data: {
	joe: age:     35
	alice: age:   35
	charlie: age: 80
}
-- out --
A:
  - age: 35
    name: joe
  - age: 35
    name: alice
  - age: 80
    name: charlie
B:
  - alice
  - charlie
  - joe
{{{end}}}

In this example the templated `list.UniqueItems` constraint applies to all
regular top-level fields, but plays no part in *why* the list elements are
unique. It's included here purely for show: we know that lists `A` and `B`
*must* be unique because they include data from a map's keys.

When you construct a list from a map it's a good idea to sort the list, as
shown with list `B`. This ensures that the list's contents remain stable across
evaluations and CUE versions. A list that contains values other than strings
needs to be sorted using `list.Sort` -- as demonstrated in
{{< linkto/inline "howto/use-list-sort-to-sort-lists" >}}.

## Checking a subset of fields in a list of structs

When you have a list of structs, sometimes you only need a *subset* of the
structs' fields to be unique.

You can assert this by unifying the list with a check that emits a custom error
if duplicates are found:

{{{with code "en" "struct - single field"}}}
# TODO: update example once must() is available.
#location top bottom
! exec cue vet -c
cmp stderr out
-- file.cue --
package example

import "list"

// We want list A to contain elements that have unique combinations of the name and DoB fields.
A: [
	{name: "joe", age: 30, DoB: "1997-02-01"},
	{name: "alice", age: 35, DoB: "1970-04-17"},
	{name: "joe", age: 31, DoB: "2001-12-16"},
	{name: "alice", age: 99, DoB: "1970-04-17"}, // Duplicate element.
]

// List A is constrained by a mechanism that works with CUE v0.14.0 and later,
// and is the suggested way to check a subset of fields in a list of structs.
A: X={
	let uniqueKeys = [for i in X {
		name: i.name
		DoB:  i.DoB
	}]
	if !list.UniqueItems(uniqueKeys) {error("name + DoB values are not unique")}
}

// We want list B to contain elements that have unique name fields.
B: [{name: "joe", age: 30},
	{name: "joe", age: 31}]

// List B is constrained using a mechanism that works with CUE versions prior to v0.14.0.
B: X={
	let uniqueKeys = [for i in X {
		name: i.name
	}]
	if !list.UniqueItems(uniqueKeys) {"ERROR: name values are not unique"}
}
-- out --
B: conflicting values [{name:"joe",age:30},{name:"joe",age:31}] and "ERROR: name values are not unique" (mismatched types list and string):
    ./file.cue:24:4
    ./file.cue:32:36
A: name + DoB values are not unique:
    ./file.cue:20:36
{{{end}}}

<!-- TODO: remove this once v0.14.0 is the earliest supported version (post-v0.15.0?) -->


List `A` is constrained using the `error` builtin, which was introduced in CUE
v0.14.0. The alternative mechanism demonstrated by list `B` can be used with
older versions of CUE. Upgrading to
[a later version of CUE]({{< relref "docs/introduction/installation#installing-the-cue-command" >}})
is recommended instead of relying on this technique.

## Related content

- Standard library: the [`list.UniqueItems`](/go/pkg/list#UniqueItems) builtin
- {{<issue 943>}}Issue #943{{</issue>}} tracks the proposed built-in function
  `must()`, which would improve the granularity of the error messages displayed
  by some of the examples presented in this guide
