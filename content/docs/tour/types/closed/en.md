---
title: Closed structs
weight: 80
---

A struct may be **open** or **closed**, and is open *unless* it's been closed.

Both open and closed structs can have any field defined as members.\
Closed structs can only be unified with structs that have fields permitted by
the closed struct.

A closed struct can be created using the `close()` builtin, but is more
commonly created using a *definition*, as demonstrated shortly.
A struct created with `close()` can't have additional fields added elsewhere.

{{{with code "en" "structs"}}}
exec cue eval -i structs.cue
cmp stdout out
-- structs.cue --
A: close({
	y: int
	z: int
})

A: {
	a: "one" // validation failure (not allowed)
}

B: A & {
	x: "two"   // validation failure (not allowed)
	y: "three" // validation failure (wrong type)
}
-- out --
A: {
    y: int
    a: _|_ // A.a: field not allowed
    z: int
}
B: {
    a: _|_ // B.a: field not allowed
    x: _|_ // B.x: field not allowed
    y: _|_ // B.y: conflicting values int and "three" (mismatched types int and string)
    z: int
}
{{{end}}}
