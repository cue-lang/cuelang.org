---
title: Mark a field as required
tags:
- language
- commented cue
authors:
- jpluscplusm
relatedIssues:
- https://github.com/cue-lang/cue/issues/2553: "failing CUE commands"
- https://github.com/cue-lang/cue/issues/2564: "link from content to Issue"
- https://github.com/cue-lang/docs-and-content/issues/114: "CC explainer"
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates using the **required field** marker in a schema to make sure that a
field is present in data.

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue"  area="top-left" >}}
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
	// less than 10
	f3!: int & <10
}
{{< /code-tab >}}
{{< code-tab name="data.yml" language="yml"  area="top-right" >}}
f1: "some string value"
# f-2: field is missing
s1:
  f3: 7
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="err" type="terminal" area="bottom" >}}
$ cue vet .:example data.yml
"f-2": field is required but not present:
    ./schema.cue:12:1
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- [**Required field constraints**]({{< relref
    "docs/language-guide/schemas-and-validation/field-constraints#required-field-constraints"
  >}})
