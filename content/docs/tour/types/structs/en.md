---
title: Structs
weight: 70
aliases:
- /docs/tour/types/optional
---

CUE's most important composite type is the **struct**,
also known as a **map**.
Its members are called **fields**.

A **regular** field (`field: value`) *must* be made concrete if it is exported
to a data format such as JSON or YAML.

An **optional field constraint** (`field?: value`) only restricts the field's
value if it is specified elsewhere as a regular field.
An optional field with a value of bottom (`_|_`) means the field *cannot* be
specified.

A **required field constraint** (`field!: value`) requires that the field be
specified as a regular field if it's exported.

{{{with code "en" "tour"}}}
! exec cue export file.cue
cmp stderr out
-- file.cue --
A: {
	foo!:  int    // required
	bar?:  string // optional
	baz:   float  // regular
	quux?: _|_    // cannot be specified
}

A: {
	bar: "42"
	baz: 42.0
}
-- out --
A.foo: field is required but not present:
    ./file.cue:2:2
{{{end}}}
