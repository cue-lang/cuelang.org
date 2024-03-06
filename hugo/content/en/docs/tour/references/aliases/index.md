---
title: Aliases
weight: 30
---

**Aliases** provide a way to access a value via a different name.
They assign this value to an identifier using an equals sign (`=`).

An alias is typically used to access a field in an outer scope that has been
made inaccessible (or *shadowed*) by the same field name existing in an inner
scope.
Some of their other uses are also demonstrated in the example below.

Aliases are *not* members of a struct.
They do not appear in output, and can only be referenced within the scope in
which they are defined.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
resultA: A
// Alias A provides access to a top-level field
// with a name that is not a valid identifier.
A="a top level field": 1

resultB: B
// Alias B provides access to a dynamic field.
#b:     "a dynamic field"
B=(#b): 2

// Alias C provides access to a shadowed field.
shadowed: C={
	field: value: 3
	c: {
		// This "field" shadows the
		// higher-level "field".
		field: C.field.value
	}
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZQ==" >}}
$ cue export file.cue
{
    "resultA": 1,
    "a top level field": 1,
    "resultB": 2,
    "a dynamic field": 2,
    "shadowed": {
        "field": {
            "value": 3
        },
        "c": {
            "field": 3
        }
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

The CUE language specification defines
[the full list of positions]({{< relref "docs/reference/spec#aliases" >}})
where an alias can be declared.
