---
title: Mark a field as optional
tags:
- level:user
- field constraints
- language
authors:
    - xonathanmatthews
relatedIssues:
- https://github.com/cue-lang/cue/issues/2553: "failing CUE commands"
- https://github.com/cue-lang/cue/issues/2564: "link from content to Issue"
- https://github.com/cue-lang/docs-and-content/issues/114: "CC explainer"
---

This [Commented CUE](TODO:CC-explainer) demonstrates using an **optional
field** marker to constrain a field's value - *but only if it's present*.

{{< code-tabs >}}

{{< code-tab name="example.cue" area="top-left" >}}
package example

// CUE indicates optional fields
// with a question mark: "?"

// f1 is optional.
// if it's present it can be
// any value

f1?: _

// f-2 is optional.
// if it's present it must be
// a string

"f-2"?: string

// s1 is a regular field
// containing a struct which will
// be present no matter what the
// input data contains

s1: {
	// f3 is optional.
	// if it's present it
	// must be an integer
	// less than 10

	f3?: int & <10
}
{{< /code-tab >}}

{{< code-tab name="data.yml" language="yaml" area="top-right" >}}
# f1 is a nested struct
f1: 
  f1.1:
    f1.2: some string

# f-2 is floating point number,
# not a string
f-2: 42.137

# s1 only contains the field x,
# not f3.
s1:
  x: some other string
{{< /code-tab >}}

{{< code-tab name="$ cue vet .:example data.yml" type="terminal" area="bottom" >}}
"f-2": conflicting values 42.137 and string (mismatched types float and string):
    ./data.yml:8:7
    ./example.cue:9:9
{{< /code-tab >}}

{{< /code-tabs >}}

## Related content

- [**Optional field constraints**]({{< ref
    "docs/language-guide/schemas-and-validation/field-constraints#optional-field-constraints"
  >}})
- [**Regular fields**]({{< ref
    "docs/language-guide/data/maps-and-fields#field-names"
  >}})
- [**Value constraints**]({{< ref
    "docs/language-guide/schemas-and-validation/value-constraints"
  >}})
- TODO:Commented CUE explainer
