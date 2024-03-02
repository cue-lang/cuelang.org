---
title: Structs
weight: 70
aliases:
- optional
---

CUE's most important composite type is the **struct**,
also known as a **map**.
Its members are called **fields**.

A **regular** field (`field: value`) *must* be made concrete if it's exported
to a data format such as JSON or YAML.

An **optional field constraint** (`field?: value`) only restricts the field's
value if it's specified elsewhere as a regular field.
An optional field with a value of bottom (`_|_`) means the field *can't* be
specified.

A **required field constraint** (`field!: value`) requires that the field be
specified as a regular field if it's exported.

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
