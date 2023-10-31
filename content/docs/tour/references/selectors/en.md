---
title: "Accessing Fields"
weight: 2
---

Selectors access fields within a struct using the `.` notation.
This only works if a field name is a valid identifier and it is not computed.
For other cases one can use the indexing notation.

{{{with code "en" "selectors"}}}
exec cue eval selectors.cue
cmp stdout result.txt
-- selectors.cue --
a: {
	b:     2
	"c-e": 5
}
v: a.b
w: a["c-e"]
-- result.txt --
a: {
    b:     2
    "c-e": 5
}
v: 2
w: 5
{{{end}}}
