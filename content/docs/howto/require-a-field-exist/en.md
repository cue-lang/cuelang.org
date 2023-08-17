---
title: Require that a field exist
tags:
- level:user
- field constraints
- language
relatedIssues:
- https://github.com/cue-lang/cue/issues/2553: "failing CUE commands"
- https://github.com/cue-lang/cue/issues/2564: "link from content to Issue"
---

This [CUE By Example](FIXME:CBE-explainer) FIXME:Howto Guide demonstrates using
**required field constraints** to mark mandatory fields with an exclamation
mark ("`!`").

{{< code-tabs >}}

{{< code-tab name="example.cue" area="top-left" >}}
package example

// f1 is required, and can be any value
f1!: _

// f-2 is required, and must be a string
"f-2"!: string

s1: {
	// f3 is required, must be inside struct
	// s1, and must be an integer under 10
	f3!: int & <10
}
{{< /code-tab >}}

{{< code-tab name="data.yml" language="yaml" area="bottom-left" >}}
f1: "some string value"
#   field f-2 is missing
s1:
  f3: 7
{{< /code-tab >}}

{{< code-tab name="$ cue vet .:example data.yml" type="terminal" area="bottom-right" >}}
"f-2": field is required but not present:
    ./example.cue:7:1
{{< /code-tab >}}

{{< /code-tabs >}}

## Related content

- [**Required field constraints**]({{< ref
    "docs/language-guide/schemas-and-validation/field-constraints#required-field-constraints"
  >}})
