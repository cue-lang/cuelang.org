---
title: Structs
weight: 70
aliases:
- optional
---

CUE's most important composite type is the **struct**.
Its members are called **fields**.

By default, a field is **regular** (`field: value`).
Regular fields can have concrete values or non-concrete types that constrain
their values,
and specifying a regular field brings it into existence.

A field may be optional (`field?: value`).
An **optional field constraint** restricts the field's value *if* it is
specified elsewhere as a regular field.
An optional field constraint doesn't bring the field into existence.

A field may be required (`field!: value`).
A **required field constraint** restricts the field's value.
A required field constraint doesn't bring the field into existence,
but does require that it be brought into existence *somewhere*.

Regular fields *must* be made concrete to allow a configuration to be exported.\
A field marked with an optional field constraint and a value of bottom (`_|_`)
*cannot* be specified.

{{{with code "en" "tour"}}}
exec cue eval -i file.cue
cmp stdout out
-- file.cue --
a: {
	foo?:  int    // optional
	bar:   string // regular
	baz!:  float  // required
	quux?: _|_    // cannot be specified
}

b: a & {
	foo:  "not an int" // validation failure
	bar:  "some string"
	baz:  42.0
	quux: "some string" // validation failure
}
-- out --
a: {
    bar:  string
    baz!: float
}
b: {
    foo:  _|_ // b.foo: conflicting values int and "not an int" (mismatched types int and string)
    bar:  "some string"
    baz:  42.0
    quux: _|_ // explicit error (_|_ literal) in source
}
{{{end}}}
