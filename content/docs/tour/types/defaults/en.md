---
title: Default Values
weight: 110
---

**Default values** allow CUE to decide which element of a disjunction should be
chosen when a configuration doesn't provide a concrete value, leaving more than
one of the disjunction's elements as valid options.

A default value is an element in a disjunction that has been prefixed with the
preference marker `*`.

CUE will select and use the default value when a concrete value is required
but none has been explicitly specified.

{{{with code "en" "tour"}}}
exec cue export file.cue
cmp stdout out
-- file.cue --
#def: string | int | *1

A: #def
B: #def & 42
C: #def & "foo"
-- out --
{
    "A": 1,
    "B": 42,
    "C": "foo"
}
{{{end}}}
