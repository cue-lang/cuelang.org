---
title: Reference Cycles
weight: 50
---

CUE can handle many types of **cycle**, resolving and inferring values that
depend on each other.

Because all values are final in CUE, a field with a concrete value
can only be valid if it ***is*** that value.
So if this concrete value is unified with some other expression, CUE delays its
evaluation of that unification until later.
By postponing that evaluation, cycles can often be broken.

This can prove useful for template authors who know that a user will provide
one out of several fields, but they may not know *which* one.

{{{with code "en" "tour"}}}
exec cue eval file.cue
cmp stdout out
-- file.cue --
x: 200

// This cycle can be resolved because of the
// concrete value specified above.
x: y + 100
y: x - 100

// This cycle cannot be resolved, so CUE will
// report the field's values as their given
// expressions.
a: b + 100
b: a - 100
-- out --
x: 200
y: 100
a: b + 100
b: a - 100
{{{end}}}
