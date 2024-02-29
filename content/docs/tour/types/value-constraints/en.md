---
title: Value constraints
weight: 95
---

Value constraints
limit the values that a field can contain.

In other words,
they constrain the right-hand-side of a field,
but say nothing about
its *existence* through field optionality or requirement.

Conceptually, every field whose existence is permitted in a given context
starts out with the unopinionated constraint of top ("`_`"), which allows the
field to be assigned any value. Value constraints that are applied to the field
reduce the set of values that the field can be assigned, until a specific,
concrete value is either assigned, or can be inferred from the field's unified
value constraints.

CUE's basic types (such as `int`, `string`, `bool`, and others introduced
earlier in this tour) can all be used as value constraints but, by themselves,
cannot result in a concrete value being inferred. This is because all basic
types (except `null`!) permit more than one concrete value. In CUE's
terminology, the basic types (except `null`) contain *multiple instances*, and
the combination of value constraints through unification allows these values to
be excluded - until only a single, concrete, value remains.

The most effective value constraint is to directly assign a concrete value, as
it only permits the field to hold that single value. However, any constraint
that restricts a field's value is a value constraint, such as those we
introduce next: **disjunctions** and **bounds** - both of which can result in
concrete values being inferred.

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
