---
title: "Structs"
weight: 7
aliases:
- optional
---

Struct is the most important composite type in CUE.
Its members are called fields.

A field may be optional. An **optional** field constraint (`foo?: _`) restricts
the field's type if it is defined elsewhere.

On the other hand, **regular** fields (`bar: _`) and **required** fields
(`baz!: _`) must be made concrete to allow a configuration to be exported.

To prevent a specific field from being defined, mark it with an optional field
constraint and a value of bottom (`_|_`).

{{{with code "en" "structs"}}}
exec cue export structs.cue
cmp stdout out
-- structs.cue --
#a: {
	foo?:  int    // foo is optional
	bar:   string // bar is regular
	baz!:  float  // baz is required
	quux?: _|_    // quux *cannot* be specified
}
b: #a & {
	bar: "some string"
	baz: 42.0
}
-- out --
{
    "b": {
        "bar": "some string",
        "baz": 42.0
    }
}
{{{end}}}
