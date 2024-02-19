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

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="top-left" >}}
package example

// data.cue contains fields we want to refer to
// in file.cue

"top level field": "a top-level value"

aStruct: "nested field": "a nested value"
{{< /code-tab >}}
{{< code-tab name="file.cue" language="cue" area="top-right" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtZSBvdXRwdXQ=" >}}
$ cue export -e output
{
    "topLevelField": "a top-level value",
    "nestedField": "a nested value"
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{< linkto/related/howto "export-fields-whose-names-are-not-valid-identifiers" >}}
