---
title: Interpolation
weight: 20
---

String and bytes literals support **interpolation**,
in both their single- and multi-line forms.

Any valid CUE expression may be used inside escaped parentheses.

{{{with code "en" "tour"}}}
exec cue export file.cue
cmp stdout out
-- file.cue --
a: "You are \(#cost-#budget) dollars over budget!"

#cost:   102
#budget: 88
-- out --
{
    "a": "You are 14 dollars over budget!"
}
{{{end}}}
