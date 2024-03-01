---
title: Folding of Single-Field Structs
weight: 240
---

In JSON, nested values are defined one value at a time.
A JSON configuration is a set of path-value pairs.

In CUE, we define a set of paths,
to which a concrete value or constraint applies all at once.
Because of CUE's
[order irrelevance]({{< relref "order-irrelevance" >}}),
values get unified.
This also happens to give us a convenient shorthand for writing structs with
single fields.

This example shows some path-value pairs and a constraint that is applied to
validate them.

{{{with code "en" "tour"}}}
#nofmt(fold.cue) https://github.com/cue-lang/cue/issues/722

exec cue export file.cue
cmp stdout out
-- file.cue --
// Some path-value pairs
outer: middle1: inner: 3
outer: middle2: inner: 7

// A collection-constraint pair that validates.
outer: [string]: inner: int

// A more convenient way to write deep nesting.
a: nested: struct: with: only: one: field: "banana"
-- out --
{
    "outer": {
        "middle1": {
            "inner": 3
        },
        "middle2": {
            "inner": 7
        }
    },
    "a": {
        "nested": {
            "struct": {
                "with": {
                    "only": {
                        "one": {
                            "field": "banana"
                        }
                    }
                }
            }
        }
    }
}
{{{end}}}
