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

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top-left" >}}
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
{{< /code-tab >}}
{{< code-tab name="data.cue" language="cue"  area="top-right" >}}
package example

aStruct: "nested field": "this field is inside aStruct"

"top level field": "this field is at CUE's top level"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue export .:example -e output
{
    "topLevelField": "this field is at CUE's top level",
    "nestedField": "this field is inside aStruct"
}
{{< /code-tab >}}
{{< /code-tabs >}}
