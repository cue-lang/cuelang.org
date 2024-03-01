---
title: Order is Irrelevant
weight: 210
---

CUE's
foundational operations
are defined so that
the order in which configurations are combined is irrelevant.

This crucial property
underpins [duplicate fields]({{< relref "duplicate-fields" >}})' behaviour,
and explains why they are so trivial for CUE to handle.

Whether
it's the first,
or the last,
or the tenth
occurrence of a field
that's considered a "duplicate" is unimportant.
All definitions of a field *must* agree with each other,
irrespective of which definition is encountered first,
because there *is* no "first", "last", or "tenth" occurrence.
CUE is deliberately designed so that
**order is irrelevant**,
which means that
each "duplicate" definition of a field
is as important as every other.

Order irrelevance makes it easy for humans _and_ machines to reason about values, and
makes advanced tooling and automation possible.

{{{with code "en" "tour"}}}
exec cue eval file.cue
cmp stdout out
-- file.cue --
a: {X: 1, O: string}
a: {X: int, O: "2"}

b: {X: int}
b: {X: 10, O: "20"}
b: {O: string}
b: {O: "20"}

a: {O: "2", O: string}
-- out --
a: {
    X: 1
    O: "2"
}
b: {
    X: 10
    O: "20"
}
{{{end}}}
