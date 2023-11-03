---
title: "Closed structs"
weight: 7
---

Struct is the most important composite type in CUE.

A struct may be open or closed.
A closed struct may only be merged with structs that have fields that
it defines to be allowed.
In other words, closing a struct is equivalent to requiring that all
other values be undefined.

A closed struct can be created using the `close` builtin,
but are more commonly defined using a _definition_, defined next.

{{< code-tabs >}}
{{< code-tab name="structs.cue" language="cue"  area="top-left" >}}
a: close({
	field: int
})

b: a & {
	feild: 3
}
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt"  area="top-right" >}}
a: {
    field: int
}
b: {
    field: int
    feild: _|_ // b.feild: field not allowed
}
{{< /code-tab >}}
{{< /code-tabs >}}
