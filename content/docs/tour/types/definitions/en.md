---
title: Definitions
weight: 90
aliases:
- /docs/tour/types/defs
---

In CUE, schemas are typically written as **definitions**.
A definition is a field whose identifier starts with `#` or `_#`.

Because CUE knows that definitions are used for validation,
they aren't output as data.\
It's normal for definitions to specify fields that don't have concrete values,
such as types.

A definition also tells CUE the complete set of allowed fields in a struct.\
Referring to a definition **closes** any structs and lists recursively.
Structs and lists can be left **open** using `...`.

{{{with code "en" "tour"}}}
exec cue eval -ic file.cue
cmp stdout out
-- file.cue --
message: "Hello, \(#Name)!"
#Name:   "world"

#A: {
	n: int
	// Uncomment this to allow any field.
	// ...
}

valid: #A & {n: 3}
invalid: #A & {N: 3}
-- out --
message: "Hello, world!"
valid: {
    n: 3
}
invalid: {
    n: int
    N: _|_ // invalid.N: field not allowed
}
{{{end}}}
