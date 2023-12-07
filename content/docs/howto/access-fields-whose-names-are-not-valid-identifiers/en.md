---
title: Accessing fields whose names are not valid identifiers
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

Some fields have names that are not valid
[CUE identifiers]({{< relref "docs/reference/spec#identifiers" >}}).
This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to access these fields, both at CUE's top level and elsewhere.

{{{with code "en" "emit"}}}
exec cue export .:example -e output
cmp stdout out
-- file.cue --
package example

// declare an alias
X="top level field": _

output: {
	// use an alias to access a
	// top-level field's value
	topLevelField: X

	// use index notation to access
	// a non-top-level field's value
	nestedField: aStruct["nested field"]
}
-- data.cue --
package example

aStruct: "nested field": "this field is inside aStruct"

"top level field": "this field is at CUE's top level"
-- out --
{
    "topLevelField": "this field is at CUE's top level",
    "nestedField": "this field is inside aStruct"
}
{{{end}}}
