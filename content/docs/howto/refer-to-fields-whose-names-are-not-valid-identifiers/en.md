---
title: Refering to fields whose names are not valid identifiers
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

Some fields have names that are not valid
[CUE identifiers]({{< relref "docs/reference/spec#identifiers" >}}).
This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to refer to these fields, both at CUE's top level and elsewhere.

{{{with code "en" "emit"}}}
exec cue export -e output
cmp stdout out
-- data.cue --
package example

// data.cue contains fields we want to refer to
// in file.cue

"top level field": "a top-level value"

aStruct: "nested field": "a nested value"
-- file.cue --
package example

// Declare an alias
X="top level field": _

output: {
	// Use the alias to refer to a top-level
	// field's value
	topLevelField: X

	// Use index notation to refer to a
	// non-top-level field's value
	nestedField: aStruct["nested field"]
}
-- out --
{
    "topLevelField": "a top-level value",
    "nestedField": "a nested value"
}
{{{end}}}

## Related content

- How to
  [export fields whose names are not valid identifiers]({{< relref
    "../export-fields-whose-names-are-not-valid-identifiers"
  >}}), and where *a separate CUE file cannot be created*.
