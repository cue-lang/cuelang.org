---
title: Closed structs
weight: 80
---

A struct may be **open** or **closed**, and is open *unless* it has been closed.

Both open and closed structs can have any field defined as members.\
Closed structs can only be
[unified]({{< relref "docs/tour/basics/unification" >}})
with structs that have fields permitted by the closed struct.

A closed struct can be created using the `close()` builtin, but is more
commonly created using a *definition*, as demonstrated on the next page.
A struct created with `close()` can't have additional fields added elsewhere.

{{{with code "en" "structs"}}}
exec cue eval -i structs.cue
cmp stdout out
-- structs.cue --
A: close({
	a: int
})

B: A & {
	b: 42 // validation failure
}
-- out --
A: {
    a: int
}
B: {
    a: int
    b: _|_ // B.b: field not allowed
}
{{{end}}}
