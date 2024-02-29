---
title: "Closed structs"
weight: 8
---

A struct may be **open** or **closed**, and is open by default.

An open struct can have any field defined as a member, unless otherwise
constrained. The constraints applied to an open struct's fields also constrain
the fields of other structs when they're **unified** with the open struct.

The same rules apply to a closed struct but, when it's unified with some other
struct, that struct can only contain fields defined in the closed struct.

A closed struct can be created using the `close()` builtin, but is more
commonly created using a *definition*, as demonstrated on the next page.
A struct created with `close()` cannot have additional fields added elsewhere,
through unification.

{{< code-tabs >}}
{{< code-tab name="structs.cue" language="cue" area="top-left" >}}
A: close({
	y: int
	z: string
})

A: {
	a: "one" // validation failure (not allowed)
}

B: A & {
	x: "two"   // validation failure (not allowed)
	y: "three" // validation failure (wrong type)
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWkgc3RydWN0cy5jdWU=" >}}
$ cue eval -i structs.cue
A: {
    y: int
    a: _|_ // A.a: field not allowed
    z: string
}
B: {
    a: _|_ // B.a: field not allowed
    x: _|_ // B.x: field not allowed
    y: _|_ // B.y: conflicting values int and "three" (mismatched types int and string)
    z: string
}
{{< /code-tab >}}
{{< /code-tabs >}}
