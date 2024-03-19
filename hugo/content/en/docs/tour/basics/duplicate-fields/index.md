---
title: Duplicate Fields
weight: 90
---

CUE allows fields to be specified multiple times, so long as all the values
don’t conflict.
If the values don’t conflict we say they **unify** successfully.
**Unification** is the process of checking that values don't conflict,
and it happens implicitly whenever any field is redeclared.

For concrete data, unification of basic types requires that
all values specified for a field must be equal.\
Within structs, fields are unified recursively.
Similarly, within lists, elements are unified recursively.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
A: 1
A: 1

B: {a: 2}
B: {b: 3}

C: [4, 5, {c: 6}]
C: [4, 5, {d: 7}]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZSAtLW91dCB5YW1s" >}}
$ cue export file.cue --out yaml
A: 1
B:
  a: 2
  b: 3
C:
  - 4
  - 5
  - c: 6
    d: 7
{{< /code-tab >}}
{{< /code-tabs >}}
