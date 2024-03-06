---
title: Conditional Fields
weight: 40
---

Field comprehensions can be used to add fields conditionally.

{{{with code "en" "tour"}}}
! exec cue export file.cue -e aSale
cmp stderr out
-- file.cue --
#Sale: {
	price!: number
	// High prices require a reason and the
	// name of the authorising manager.
	if price > 100 {
		reason!:       string
		authorisedBy!: string
	}
}

aSale: #Sale & {
	price: 200
}
-- out --
aSale.authorisedBy: field is required but not present:
    ./file.cue:5:2
aSale.reason: field is required but not present:
    ./file.cue:5:2
{{{end}}}
