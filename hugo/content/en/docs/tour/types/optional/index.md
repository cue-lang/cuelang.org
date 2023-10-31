---
title: "Structs"
weight: 9
---

Struct is the most important composite type in CUE.
Its members are called fields.

A struct field may be optional.
One can use an optional field to indicate what the type should be if it were
specified.
A regular (or required) field, on the other hand, must be made concrete
for a configuration to be converted to, say, JSON.

It is okay for an optional field to be bottom (`_|_`).
This just means that field may not be specified.

{{< code-tabs >}}
{{< code-tab name="structs.cue" language="text"  area="top-left" >}}
#a: {
	foo?: int
	bar?: string
	baz?: string
}
b: #a & {
	foo:  3
	baz?: 2 // baz?: _|_
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="top-right" >}}
$ cue eval -c structs.cue
b: {
    foo: 3
}
{{< /code-tab >}}
{{< /code-tabs >}}
