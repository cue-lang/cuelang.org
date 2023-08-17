---
title: Mark a field as required
tags:
- level:user
- field constraints
- language
relatedIssues:
- https://github.com/cue-lang/cue/issues/2553: "failing CUE commands"
- https://github.com/cue-lang/cue/issues/2564: "link from content to Issue"
- https://github.com/cue-lang/docs-and-content/issues/114: "CUE By Example explainer"
---

This [CUE By Example](FIXME:explainer) guide demonstrates using the **required
field** marker to make sure that a field is present.

{{< code-tabs >}}

{{< code-tab name="example.cue" area="top-left" >}}
package example

// CUE indicates required fields
// with an exclamation mark: "!"

// f1 is required, and can be
// any value

f1!: _

// f-2 is required, and must be
// a string

"f-2"!: string

s1: {
	// f3 is required.
	// it must be an integer
	// under 10

	f3!: int & <10
}
{{< /code-tab >}}

{{< code-tab name="data.yml" language="yaml" area="bottom-left" >}}
f1: "some string value"
# f-2: field is missing
s1:
  f3: 7
{{< /code-tab >}}

{{< code-tab name="$ cue vet .:example data.yml" type="terminal" area="bottom-right" >}}
"f-2": field is required but not present:
    ./example.cue:14:1
{{< /code-tab >}}

{{< /code-tabs >}}

## Related content

- [**Required field constraints**]({{< ref
    "docs/language-guide/schemas-and-validation/field-constraints#required-field-constraints"
  >}})
