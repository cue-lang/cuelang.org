---
title: Marking a field as optional
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
demonstrates using an **optional field** marker to constrain a field's value -
*but only if it is present*.

{{{with code "en" "cc"}}}
! exec cue vet .:example data.yml
cmp stderr out.err
-- schema.cue --
package example

// CUE indicates optional fields with a question
// mark: "?"

// f1 is optional. If it is present it can be any
// value
f1?: _

// f-2 is optional. If it is present it must be a
// string
"f-2"?: string

// s1 is a regular field containing a struct
// which will be present no matter what the input
// data contains
s1: {
	// f3 is optional. If it is present it
	// must be an integer less than 10
	f3?: int & <10
}
-- data.yml --
# f1 is a nested struct
f1:
  f1.1:
    f1.2: some string

# f-2 is floating point number, not a string
f-2: 42.137

# s1 only contains the field x, not f3.
s1:
  x: some other string
-- out.err --
"f-2": conflicting values 42.137 and string (mismatched types float and string):
    ./data.yml:7:6
    ./schema.cue:12:9
{{{end}}}

## Related content

- [**Optional field constraints**]({{< relref
    "docs/tour/types/structs"
  >}})
- [**Commented CUE guides**]({{< relref
    "docs/howto#commented-cue-guides"
  >}})
<!-- TODO:postLG
- [**Regular fields**]({{</* relref
    "docs/language-guide/data/maps-and-fields#field-names"
  */>}})
- [**Value constraints**]({{</* relref
    "docs/language-guide/schemas-and-validation/value-constraints"
  */>}})
-->
