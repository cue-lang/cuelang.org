---
title: Order is Irrelevant
weight: 210
---

CUE's basic operations are defined in a way that the order in which
you combine two configurations is irrelevant to the outcome.

This is crucial property of CUE
that makes it easy for humans _and_ machines to reason over values and
makes advanced tooling and automation possible.

{{{with code "en" "example"}}}
# TODO: is the "-i" needed here, or is it extra complexity for a CUE newcomer?
exec cue eval -i order.cue
cmp stdout out.golden
-- order.cue --
a: {x: 1, y: int}
a: {x: int, y: 2}

b: {x: int, y: 2}
b: {x: 1, y: int}
-- out.golden --
a: {
    x: 1
    y: 2
}
b: {
    x: 1
    y: 2
}
{{{end}}}
