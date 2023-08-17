---
title: How do I make a field optional?
tags:
- level:user
- field constraints
- language
relatedIssues:
- https://github.com/cue-lang/cue/issues/2553: "failing CUE commands"
- https://github.com/cue-lang/cue/issues/2564: "link from content to Issue"
- https://github.com/cue-lang/docs-and-content/issues/114: "CUE By Example explainer"
---

This [CUE By Example](FIXME:explainer) FIXME:Howto Guide demonstrates using
**optional field constraints** to mark optional fields with a question mark
("`?`").

{{< code-tabs >}}

{{< code-tab name="example.cue" area="top-left" >}}
package example

// f1 is optional.
// if it's present it can be any value
f1?: _

// f-2 is optional.
// if it's present it must be a string
"f-2"?: string

// s1 is a regular field containing a
// struct which will be present no matter
// what the input data contains
s1: {
	// f3 is optional, inside s1.
	// if it's present it must be an
	// integer less than 10
	f3?: int & <10
}
{{< /code-tab >}}

{{< code-tab name="data.yml" language="yaml" area="bottom-left" >}}
# f1 is a nested struct
f1: 
  f1.1:
    f1.2: some string

# f-2 is floating point number,
# not a string
f-2: 42.137

# s1 only contains the field x, not f3.
s1:
  x: some other string
{{< /code-tab >}}

{{< code-tab name="$ cue vet .:example data.yml" type="terminal" area="bottom-right" >}}
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
- CUE By Example explainer
