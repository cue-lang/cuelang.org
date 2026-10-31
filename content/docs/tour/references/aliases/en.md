---
title: Aliases
weight: 30
---

**Aliases** provide a way to refer to a field by a different identifier.
They are declared by following a field's label with a tilde (`~`) and the
alias name in parentheses.
The predeclared identifier `self` refers to the innermost enclosing struct,
and can be bound with `let` to give a field's value a name.

An alias is typically used to access a field in an outer scope that has been
made inaccessible (or *shadowed*) by a field in some inner scope that has the
same identifier. Some of their other uses are also demonstrated in the
example below.

Aliases are *not* members of a struct,
do *not* appear in output,
and can *only* be referenced within the scope in which they are defined.

<!--more-->

{{{with code "en" "tour"}}}
exec cue export file.cue
cmp stdout out
-- file.cue --
// Alias A provides access to a top-level field
// with a name that is not a valid identifier.
"a top level field"~(A): 1

// Alias B provides access to a dynamic field.
(#b)~(B): 2
#b:       "some dynamic field"

a: A
b: B

// C refers to the value that's on the right hand
// side of field "c", and demonstrates one way that
// shadowed fields can be accessed.
c: {
	let C = self
	d: 3
	e: {
		d: 4
		e: d
		f: C.d
	}
}
-- out --
{
    "a top level field": 1,
    "some dynamic field": 2,
    "a": 1,
    "b": 2,
    "c": {
        "d": 3,
        "e": {
            "d": 4,
            "e": 4,
            "f": 3
        }
    }
}
{{{end}}}

The CUE language specification defines
[the full list of positions]({{< relref "docs/reference/spec#aliases" >}})
where an alias can appear. A longer example exploring a problem that
aliases are able to solve can be found in the concept guide
{{< linkto/inline "concept/alias-and-reference-scopes" >}}.
