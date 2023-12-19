---
title: "Reference Cycles"
weight: 5
---

CUE can handle many types of cycles just fine.
Because all values are final, a field with a concrete value of, say `200`,
can only be valid if it is that value.
So if it is unified with another expression, we can delay the evaluation of
this until later.

By postponing that evaluation, we can often break cycles.
This is very useful for template writers that may not know what fields
a user will want to fill out.

{{{with code "en" "cycle"}}}
#nofmt(cycle.cue) https://github.com/cue-lang/cue/issues/722

exec cue eval -i -c cycle.cue
cmp stdout result.txt
-- cycle.cue --
// CUE knows how to resolve the following:
x: 200
x: y + 100
y: x - 100

// If a cycle is not broken, CUE will just report
// it.
a: b + 100
b: a - 100
-- result.txt --
x: 200
y: 100
a: b + 100
b: a - 100
{{{end}}}
