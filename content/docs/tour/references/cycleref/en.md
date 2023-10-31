---
title: "Cycles in Fields"
weight: 6
---

Also, we know that unifying a field with itself will result in the same value.
Thus if we have a cycle between some fields, all we need to do is ignore
the cycle and unify their values once to achieve the same result as
merging them ad infinitum.

{{{with code "en" "cycle"}}}
-- in.cue --
labels: selectors
labels: {app: "foo"}

selectors: labels
selectors: {name: "bar"}
-- out.cue --
labels: {
    app:  "foo"
    name: "bar"
}
selectors: {
    name: "bar"
    app:  "foo"
}
{{{end}}}
