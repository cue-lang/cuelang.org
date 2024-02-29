---
title: Structs
weight: 70
aliases:
- optional
---

CUE's most important composite type is the **struct**.
Its members are called **fields**.

A field may be optional.
An **optional** field constraint (`?`)
restricts the field's type
*if it is defined elsewhere*.

Both **regular** fields
and **required** fields (`!`)
*must* be made concrete
to allow a configuration to be exported.

A field marked with an optional field constraint
and a value of bottom (`_|_`)
is *prevented* from being specified.

{{{with code "en" "tour"}}}
exec cue export file.cue -e b
cmp stdout out
-- file.cue --
a: {
	foo?:  int    // optional
	bar:   string // regular
	baz!:  float  // required
	quux?: _|_    // cannot be specified
}

b: a & {
	bar: "some string"
	baz: 42.0
}
-- out --
{
    "bar": "some string",
    "baz": 42.0
}
{{{end}}}
