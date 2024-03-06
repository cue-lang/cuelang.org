---
title: Reference Cycles
weight: 50
---

CUE can handle many types of **cycle**, resolving and inferring values that
depend on each other.

Because all values are final in CUE, a field with a concrete value
(e.g. `200`) can only be valid if it ***is*** that value.
If CUE sees this concrete value being unified with some other expression then
the evaluation of that expression is postponed, which often allows cycles to be
broken.

This can prove useful for template authors who know that a user will provide
one out of several fields, but they may not know *which* one.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
x: 200

// This cycle can be resolved because of the
// concrete value specified above.
x: y + 100
y: x - 100

// This cycle cannot be resolved, so "cue eval"
// report the field's values as their given
// expressions.
a: b + 100
b: a - 100
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgZmlsZS5jdWU=" >}}
$ cue eval file.cue
x: 200
y: 100
a: b + 100
b: a - 100
{{< /code-tab >}}
{{< /code-tabs >}}

This example uses `cue eval` because the cycle between the `a` and `b` fields
can't be resolved. Using `cue export` would fail because the fields' values
aren't concrete.
