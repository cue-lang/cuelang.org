---
title: "Conditional Fields"
weight: 6
---

Field comprehensions can also be used to
add a single field conditionally.

Converting the resulting configuration to JSON results in an error
as `justification` is required yet no concrete value is given.

{{{with code "en" "conditional"}}}
exec cue eval conditional.cue
cmp stdout result.txt
-- conditional.cue --
price: number

// Require a justification if price is too high
if price > 100 {
	justification: string
}

price: 200
-- result.txt --
justification: string
price:         200
{{{end}}}
