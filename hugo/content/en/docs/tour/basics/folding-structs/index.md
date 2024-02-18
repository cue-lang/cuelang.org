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

{{< code-tabs >}}
{{< code-tab name="fold.cue" language="cue" area="top-left" >}}
// path-value pairs
outer: middle1: inner: 3
outer: middle2: inner: 7

// collection-constraint pair
outer: [string]: inner: int
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt" area="top-right" >}}
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
{{< /code-tab >}}
{{< /code-tabs >}}
