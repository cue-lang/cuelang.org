---
title: Marking a field as required
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

{{{with code "en" "cc"}}}
! exec cue vet .:example data.yml
cmp stderr out.err
-- schema.cue --
package example

// CUE indicates required fields with an
// exclamation mark: "!"

// f1 is required, and can be any value
f1!: _

// f-2 is required, and must be a string
"f-2"!: string

s1: {
	// f3 is required. It must be an integer
	// less than 10
	f3!: int & <10
}
-- data.yml --
f1: "some string value"
# f-2: field is missing
s1:
  f3: 7
-- out.err --
"f-2": field is required but not present:
    ./schema.cue:10:1
{{{end}}}

## Related content

- [**Required field constraints**]({{< relref
    "docs/tour/types/structs"
  >}})
