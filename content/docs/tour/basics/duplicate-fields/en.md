---
title: Duplicate Fields
weight: 90
---

CUE allows fields to be specified multiple times, so long as all the values
don’t conflict.
If the values don’t conflict we say they **unify** successfully.
**Unification** is the process of checking that values don't conflict,
and it happens implicitly whenever any field is redeclared.

For concrete data,
unification of basic types requires that all duplicate field values must be equal.

Within structs, fields are unified and duplicates are handled recursively.

Similarly, within lists, elements are unified and duplicates are handled recursively.

{{{with code "en" "tour"}}}
exec cue export file.cue --out yaml
cmp stdout out
-- file.cue --
A: 1
A: 1

B: {a: 2}
B: {b: 3}

C: [4, {c: 5}]
C: [4, {d: 6}]
-- out --
A: 1
B:
  a: 2
  b: 3
C:
  - 4
  - c: 5
    d: 6
{{{end}}}
