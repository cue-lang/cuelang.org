---
title: Disjunctions
weight: 20
draft: false
---

### Enums and Sum types

### Default values

<!--

- disjunctions of values and types
- default values
- default value semantics
- more than one default
-->

### Dynamic disjunctions

Enums can be constructed dynamically using the function `or`, which
takes a list and returns the result of applying the `|` operator to all elements in the list.
It returns bottom for the empty list.

```coq
Expression:          Result
or([a, b])           a | b
or([a])              a
or([])               _|_
```

```coq
{{{with sidebyside "en" "core-builtin-or"}}}
#check - succeeded when it should have failed?
exec cue eval -f -i in.cue
cmp stdout out.cue

-- in.cue --
a: or([1, 2, 3, 4, 5])
b: or([2])
c: or(empty)

empty: []

withDefault: *2 | or([1, 2, 3, 4])
x:           withDefault & 3
-- out.cue --
a: 1 | 2 | 3 | 4 | 5
b: 2
c: or(empty)
empty: []
withDefault: 2
x:           3
{{{end}}}
```
