---
title: Top
weight: 25
---

**Top**,
denoted "`_`",
is a wholly unopinionated value.
It represents
any value that CUE can contain.

A regular field
constrained by top
can be unified with any value -
its value has not been restricted in any way.\
Or, to put it differently:
top can unify successfully with any other value.

A field
with the value of top
cannot be exported
because data formats
such as JSON and YAML
do not have any way to
represent non-concrete values.

Constraining a regular field
with top
is the canonical way
to bring that field into existence,
whilst allowing
its value to be constrained and defined elsewhere,
through unification.

{{{with code "en" "top"}}}
exec cue export top.cue
cmp stdout out
-- top.cue --
a: _
b: _
c: _
d: _
e: _
f: _

a: 1
b: 2.2
c: "three"
d: {four: "five"}
e: [6, 7.7, "eight"]
f: true
-- out --
{
    "a": 1,
    "b": 2.2,
    "c": "three",
    "d": {
        "four": "five"
    },
    "e": [
        6,
        7.7,
        "eight"
    ],
    "f": true
}
{{{end}}}
