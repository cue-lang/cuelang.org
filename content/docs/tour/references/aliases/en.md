---
title: Aliases
weight: 30
---

**Aliases** provide a way to refer to a value by a different identifier.
They are declared using an equals sign (`=`).

An alias is typically used to access a field in an outer scope that has been
made inaccessible, or *shadowed*.\
Some of their other uses are also demonstrated in the example below.

Aliases are *not* members of a struct.\
They do not appear in output, and can only be referenced within the scope in
which they are defined.

{{{with code "en" "tour"}}}
#codetab(file.cue) linenos="table"

exec cue export file.cue
cmp stdout out
-- file.cue --
// This alias appears in front of a label that is
// not a valid identifier. It binds its identifier
// (A) to the same value that the label would be
// bound to if it were a valid identifier.
A="a top level field": 1

// This alias appears in front of a dynamic field
// expression. It binds its identifier (B) to the
// concrete label resulting from the evaluation of
// the expression.
B=(#b): 2
#b:     "a dynamic field"

a: A
b: B

// This alias appears before a value. It binds its
// identifier (C) to the value it precedes, but
// only within the scope of that value.
x: C={
	x: 3
	d: {
		x: 4
		e: x
		f: C.x
	}
}
-- out --
{
    "a top level field": 1,
    "a": 1,
    "b": 2,
    "a dynamic field": 2,
    "x": {
        "x": 3,
        "d": {
            "x": 4,
            "e": 4,
            "f": 3
        }
    }
}
{{{end}}}

The CUE language specification defines
[the full list of positions]({{< relref "docs/reference/spec#aliases" >}})
where an alias can appear.
