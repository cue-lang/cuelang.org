---
title: "Closed structs"
weight: 8
---

A struct may be **open** or **closed**, and is open unless otherwise
restricted.

By default, an open struct can have any field defined as a member.

A closed struct may only be merged with structs that have fields that the
closed struct defines as being allowed.\
In other words, closing a struct is equivalent to requiring that all other
values be undefined.

A closed struct can be created using the `close` builtin, but is more commonly
created using a *definition*, as demonstrated on the next page.

{{< code-tabs >}}
{{< code-tab name="structs.cue" language="cue" area="top-left" >}}
a: close({
	field: int
})

b: a & {
	FIELD: 3
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWkgc3RydWN0cy5jdWU=" >}}
$ cue eval -i structs.cue
a: {
    field: int
}
b: {
    field: int
    FIELD: _|_ // b.FIELD: field not allowed
}
{{< /code-tab >}}
{{< /code-tabs >}}
