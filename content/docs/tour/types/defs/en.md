---
title: Definitions
weight: 90
---

In CUE, schemas are typically written as **definitions**.
A definition is a field whose identifier starts with `#` or `_#`.

Because CUE knows that definitions are used for validation,
they aren't output as data.
It's normal for definitions to specify fields that don't have concrete values,
such as types.

A definition also tells CUE the complete set of allowed fields in a struct.
We say that such a definition defines a  **closed** struct.
Including a `...` in a struct keeps it **open**.

{{{with code "en" "tour"}}}
exec cue eval -ic file.cue
cmp stdout out
-- file.cue --
msg:   "Hello, \(#Name)!"
#Name: "world"
#A: {
	foo: int
	// Uncomment this to allow any field.
	// ...
}
valid: #A & {foo: 3}
invalid: #A & {FOO: 3}
-- out --
msg: "Hello, world!"
valid: {
    foo: 3
}
invalid: {
    foo: int
    FOO: _|_ // invalid.FOO: field not allowed
}
{{{end}}}
