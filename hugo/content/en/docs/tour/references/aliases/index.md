---
title: Aliases
weight: 30
---

**Aliases** provide a way to refer to a value by a different identifier.
They are declared using an equals sign (`=`).

An alias is typically used to access a field in an outer scope that has been
made inaccessible (or *shadowed*) by a field in some inner scope that has the
same identifier. Some of their other uses are also demonstrated in the
example below.

Aliases are *not* members of a struct,
do *not* appear in output,
and can *only* be referenced within the scope in which they are defined.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
// Alias A provides access to a top-level field
// with a name that is not a valid identifier.
A="a top level field": 1

// Alias B provides access to a dynamic field.
B=(#b): 2
#b:     "some dynamic field"

a: A
b: B

// Alias C refers to the value that's on the right
// hand side of field "c", and demonstrates one way
// that shadowed fields can be accessed.
c: C={
	d: 3
	e: {
		d: 4
		e: d
		f: C.d
	}
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZQ==" >}}
$ cue export file.cue
{
    "a top level field": 1,
    "a": 1,
    "b": 2,
    "some dynamic field": 2,
    "c": {
        "d": 3,
        "e": {
            "d": 4,
            "e": 4,
            "f": 3
        }
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

The CUE language specification defines
[the full list of positions]({{< relref "docs/reference/spec#aliases" >}})
where an alias can appear. A longer example exploring a problem that
aliases are able to solve can be found in the concept guide
{{< linkto/inline "concept/alias-and-reference-scopes" >}}.
