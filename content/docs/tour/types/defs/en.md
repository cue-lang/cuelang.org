---
title: "Definitions"
weight: 8
---

A definition, indicated by an identifier starting with `#` or `_#`,
defines values that
are not output when converting a configuration to a concrete value.
They are used to define schema against which concrete values can
be validated.

Structs defined by definitions are implicitly closed.

{{{with code "en" "definitions"}}}
exec cue eval -ic defs.cue
cmp stdout out.golden
-- defs.cue --
msg: "Hello \(#Name)!"

#Name: "world"

#A: {
	field: int
}

a:   #A & {field: 3}
err: #A & {feild: 3}
-- out.golden --
msg: "Hello world!"
a: {
    field: 3
}
err: {
    field: int
    feild: _|_ // err.feild: field not allowed
}
{{{end}}}
