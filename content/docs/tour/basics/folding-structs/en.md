---
title: Folding of Single-Field Structs
weight: 240
---

In JSON, one defines nested values one value at a time.
Another way to look at this is that a JSON configuration is a set of
path-value pairs.

In CUE one defines a set of paths of which to apply
a concrete value or constraint all at once.
Because of CUE's order independence, values get merged

This example shows some path-value pairs, as well as
a constraint that is applied to those to validate them.
<!--
This also gives a handy shorthand for writing structs with single
members.
-->

{{{with code "en" "example"}}}
#nofmt(fold.cue) https://github.com/cue-lang/cue/issues/722

exec cue export fold.cue
cmp stdout out.golden
-- fold.cue --
// path-value pairs
outer: middle1: inner: 3
outer: middle2: inner: 7

// collection-constraint pair
outer: [string]: inner: int
-- out.golden --
{
    "outer": {
        "middle1": {
            "inner": 3
        },
        "middle2": {
            "inner": 7
        }
    }
}
{{{end}}}
