---
title: Conditional Fields
weight: 40
---

Field comprehensions can be used to add fields conditionally.

{{{with code "en" "tour"}}}
! exec cue export file.cue
cmp stderr out
-- file.cue --
price: 200

// High prices require a reason and the name of
// the authorising person.
if price > 100 {
	reason!:       string
	authorisedBy!: string
}
-- out --
authorisedBy: field is required but not present:
    ./file.cue:5:1
reason: field is required but not present:
    ./file.cue:5:1
{{{end}}}
