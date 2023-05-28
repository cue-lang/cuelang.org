---
title: Comprehensions
weight: 40
draft: false
---


Comprehensions provide a way to query and transform data.

{{{with sidetrack "comprehensions-are-like-sql"}}}
For those familiar with databases, they are very similar in nature to SQL.
{{{end}}}


A comprehension consists of 1 or more clauses followed by a map to emit a result
for each of the 0 or more results produced by these clauses.

Each clause is invoked for each value produced by the previous clause.
If a comprehension is defined in a list, each final result becomes a list
element.
If it is defined within a map, each element is merged into this map.

## `for [key,] value in src`

A `for` clause processes elements of a list, map, or query result.
The key and value will be visible by subsequence clauses in the list.
The key is the index of a list element, the name of a data field, or undefined
for a query.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a: [1, 2]
for k, v in a {
	"n\(k+1)": v
}

b: [3, 4]
for k1, v1 in a
for k2, v2 in b {
	"m\(k1)_\(k2)": v1 + v2
}
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
a: [1, 2]
n1:   1
n2:   2
m0_0: 4
m0_1: 5
m1_0: 5
b: [3, 4]
m1_1: 6
{{< /code-tab >}}
{{< /code-tabs >}}

## `if cond`

The `if` clause discards a result if a condition does not hold.
By itself, `if` can be used to include values conditionally.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a: [1, 2, 3]
for k, v in a
if v > 2 {
	"n\(k+1)": v
}

if len(a) == 0 {
	emptyList: true
}
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
a: [1, 2, 3]
n3: 3
{{< /code-tab >}}
{{< /code-tabs >}}

## `let x = y`

The `let` clause allows assigning a formula to a single expression to avoid
having to repeat it.
A comprehension may not start with this clause.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a: [1, 2, 3]
for k, v in a
let x = v + 4 {
	"n\(x)": x
}
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
a: [1, 2, 3]
n5: 5
n6: 6
n7: 7
{{< /code-tab >}}
{{< /code-tabs >}}

<!-- TODO

reduce z=b  // to/ with

order x with a, b in expr

group [ref=]expr

-->

## List comprehensions

A list may mix regular elements with comprehensions.
Elements insert in order.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a: [1, 2, 3]

list: [
	0,
	for v in a {v * 2},
	10,
	20,
	for v in a {10 + v},
]
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
a: [1, 2, 3]
list: [0, 2, 4, 6, 10, 20, 11, 12, 13]
{{< /code-tab >}}
{{< /code-tabs >}}

## Switch and if-else

A common pattern is to use an `if` comprehension by itself to insert fields
conditionally.
CUE has no switch or if-else construct, but these can be simulated using lists.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
mem:       2Gi
footprint: [ // select first
		if mem < 1Gi {"small"},
		if mem < 4Gi {"medium"},
		"large",
][0]
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
mem:       2147483648
footprint: "medium"
{{< /code-tab >}}
{{< /code-tabs >}}

