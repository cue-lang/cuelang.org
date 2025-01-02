---
title: Ensuring that a list doesn't contain duplicate elements
toc_hide: true
authors: [jpluscplusm]
aliases:
- /docs/howto/list-no-duplicates/
- /docs/howto/use-list-uniqueitems-as-a-field-validator/
---

When working with lists you might need to ensure that they don't contain
repeated or duplicate elements. This guide demonstrates how to achieve this
using CUE and its standard library of functions.

## Checking lists of concrete values

You can assert that a list of concrete values (of any type)
doesn't contain duplicate elements by using the
[`list.UniqueItems`](/go/pkg/list#UniqueItems)
function as a field validator:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
{{< /code-tab >}}
{{< /code-tabs >}}

If a list contains duplicate elements, evaluation fails:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
A: invalid value [1,2,1] (does not satisfy list.UniqueItems): equal value (1) at position 0 and 2:
    ./file.cue:6:6
    ./file.cue:8:4
B: invalid value ["a","b","a"] (does not satisfy list.UniqueItems): equal value ("a") at position 0 and 2:
    ./file.cue:6:6
    ./file.cue:9:4
C: invalid value [[1,2],[3,4],[1,2]] (does not satisfy list.UniqueItems): equal values at position 0 and 2:
    ./file.cue:6:6
    ./file.cue:10:4
{{< /code-tab >}}
{{< /code-tabs >}}

Field `D` is also invalid, although no error message is shown.
The missing message is tracked in {{<issue 4140 />}}.

## Checking lists with a custom "key"

When you have a list of structs, you may only need certain fields to be unique.
Together, these fields form a "key".
You can enforce that each "key" is unique by unifying the list with a check
that emits a custom error if duplicates exist:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

import "list"

// We want list A to contain elements that have a
// unique key based on the name and DoB fields.
A: [
	{name: "joe", age: 30, DoB: "1997-02-01"},
	{name: "alice", age: 35, DoB: "1970-04-17"},
	{name: "joe", age: 31, DoB: "2001-12-16"},
	{name: "alice", age: 99, DoB: "1970-04-17"}, // Duplicate element.
]

// This mechanism works with CUE v0.14.0 and later.
A: X={
	let uniqueKeys = [for i in X {
		name: i.name
		DoB:  i.DoB
	}]
	if !list.UniqueItems(uniqueKeys) {error("name + DoB values are not unique")}
}

// We want list A to contain elements that have a
// unique key based on the name field.
B: [{name: "joe", age: 30},
	{name: "joe", age: 31}]

// This mechanism works with all versions of CUE.
B: X={
	let uniqueKeys = [for i in X {
		name: i.name
	}]
	if !list.UniqueItems(uniqueKeys) {"ERROR: name values are not unique"}
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
B: conflicting values [{name:"joe",age:30},{name:"joe",age:31}] and "ERROR: name values are not unique" (mismatched types list and string):
    ./file.cue:25:4
    ./file.cue:33:36
A: name + DoB values are not unique:
    ./file.cue:20:36
{{< /code-tab >}}
{{< /code-tabs >}}

<!-- TODO: remove this once v0.14.0 is the earliest supported version (post-v0.15.0?) -->
List `A` is constrained using the `error` builtin, which was introduced in CUE
v0.14.0. The alternative mechanism demonstrated by list `B` can also be used
with older versions of CUE. Upgrading to
[a later version of CUE]({{< relref "docs/introduction/installation#installing-the-cue-command" >}})
is recommended instead of relying on this technique.

## Constructing lists with unique elements

When you use a map to construct a list dynamically, including a map key in each
element ensures that the resulting list doesn't contain any duplicate elements:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

import "list"

[_]: list.UniqueItems

A: [for key, value in _data {
	name: key
	value
}]

B: list.SortStrings([for k, _ in _data {k}])

_data: {
	joe: age:     35
	alice: age:   35
	charlie: age: 80
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" >}}
$ cue export --out yaml
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
{{< /code-tab >}}
{{< /code-tabs >}}

It's a good idea to sort a list that's constructed from a map, as shown with
list `B`. This ensures that the list's contents remain stable across
evaluations and CUE versions. A list that contains values other than strings
needs to be sorted using `list.Sort` -- as demonstrated in
{{< linkto/inline "howto/use-list-sort-to-sort-lists" >}}.

## Related content

- Standard library: the [`list.UniqueItems`](/go/pkg/list#UniqueItems) builtin
- {{< linkto/related/howto "use-list-sort-to-sort-lists" >}}
- {{<issue 943>}}Issue #943{{</issue>}} tracks the proposed built-in function
  `must()`, which would improve the granularity of the error messages displayed
  by some of the examples presented in this guide
