---
title: "Accessing Fields"
weight: 2
---

Selectors access fields within a struct using the `.` notation.
This only works if a field name is a valid identifier and it is not computed.
For other cases one can use the indexing notation.

{{{with code "en" "selectors"}}}
-- in.cue --
a: {
	b:     2
	"c-e": 5
}
v: a.b
w: a["c-e"]
-- out.cue --
a: {
    b:     2
    "c-e": 5
}
v: 2
w: 5
{{{end}}}
