---
title: "List Comprehensions"
weight: 40
---

Lists can be created with list comprehensions.

The example shows the use of `for` loops and `if` guards.

{{{with code "en" "listcomp"}}}
exec cue export listcomp.cue
cmp stdout result.txt
-- listcomp.cue --
[for x in #items if __rem(x, 2) == 0 {x * x}]

#items: [1, 2, 3, 4, 5, 6, 7, 8, 9]
-- result.txt --
[
    4,
    16,
    36,
    64
]
{{{end}}}
