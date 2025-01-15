---
title: Value constraints
weight: 95
draft: true
no_index: true
---

Value constraints restrict a field's value by limiting the set of *potential*
values that the field might contain. Because they live on the right-hand side
of a field's label they don't say anything about the field's *existence*.

Conceptually, every field starts out constrained by top ("`_`"), which allows
the field to be assigned any value. Value constraints that are applied to the
field reduce the set of potential values that the field could be assigned,
until either a specific, concrete value is assigned, or one can be inferred
from the unification of all the value constraints that apply to the field.

CUE's basic types (such as `int`, `string`, `bool`, and others introduced
earlier) can be used as value constraints but, by themselves, cannot result in
a concrete value being inferred. This is because the basic types (except
`null`) permit more than one concrete value. In CUE's terminology, the basic
types (except `null`) contain *multiple instances*. The unification of all the
value constraints that apply to a field allows instances to be excluded, until
only a single, concrete, value remains.

The most effective value constraint is a directly assigned concrete value as it
excludes all potential values apart from the single assigned value. However,
any constraint that restricts a field's value is a value constraint, such as
those we introduce next: **disjunctions** and **bounds** - both of which can
result in concrete values being inferred.

{{{with code "en" "value constraint"}}}
exec cue eval constraints.cue
cmp stdout out
-- constraints.cue --
a: int // a's value is constrained to be an int

// b's value is constrained to be a string
b: string

// c's value is constrained to be a struct
c: {...}

// d's value is constrained to be a list
d: [...]

// e's value is constrained to this exact string
e: "some string"

// f's value is technically constrained, but can
// be any value because top unifies with every
// other value
f: _
-- out --
a: int
b: string
c: {}
d: []
e: "some string"
f: _
{{{end}}}
