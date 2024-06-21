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

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
// Alias A provides access to a top-level field
// with a name that is not a valid identifier.
A="a top level field": 1

// Alias B provides access to a dynamic field.
#b:     "a dynamic field"
B=(#b): 2

a: A
b: B

// Alias C provides access to a field that is
// shadowed in the innermost scope of x.
x: C={
	x: 3
	d: {
		x: 4
		e: x
		f: C.x
	}
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZQ==" >}}
$ cue export file.cue
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
{{< /code-tab >}}
{{< /code-tabs >}}

The CUE language specification defines
[the full list of positions]({{< relref "docs/reference/spec#aliases" >}})
where an alias can be declared.
