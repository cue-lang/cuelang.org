---
title: "Interpolation"
weight: 2
---

String and bytes literals support interpolation.

Any valid CUE expression may be used inside the escaped parentheses.
Interpolation may also be used in multiline string and byte literals.

{{{with code "en" "interpolation"}}}
-- in.cue --
"You are \( #cost-#budget ) dollars over budget!"

#cost:   102
#budget: 88
-- out.cue --
"You are 14 dollars over budget!"
#cost:   102
#budget: 88
{{{end}}}
