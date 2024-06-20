---
title: Unification
weight: 90
aliases:
- duplicate-fields
---

CUE allows fields to be specified multiple times, so long as all the values
don’t conflict.
If the values don’t conflict we say they **unify** successfully.
**Unification** is the process of checking that values don't conflict,
and it happens implicitly whenever any field is redeclared. It also happens when the `&`
operator is used, as shown on the next page.

For concrete data, unification of basic types requires that
all values specified for a field must be equal.\
Within structs, fields are unified recursively.
Similarly, within lists, elements are unified recursively.

{{{with code "en" "tour"}}}
exec cue export file.cue --out yaml
cmp stdout out
-- file.cue --
A: 1
A: 1

B: {a: 2}
B: {b: 3}

C: [4, 5, {c: 6}]
C: [4, 5, {d: 7}]
-- out --
A: 1
B:
  a: 2
  b: 3
C:
  - 4
  - 5
  - c: 6
    d: 7
{{{end}}}
