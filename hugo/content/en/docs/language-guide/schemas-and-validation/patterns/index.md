---
title: Patterns
weight: 60
draft: false
---


This section presents some common, idiomatic patterns for schema.

## Alternates

The enum construct can also be used to enumerate alternative schemas.
To CUE, treating values and types alike, this is all the same.

{{{with sidetrack}}}
In programming languages this is called a *sum type*.
{{{end}}}

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
#Base: kind!: string
#A: {
	kind!: "a"
	a:     int
}
#B: {
	kind!: "b"
	b:     string
}
#X: #A | #B

fooInt: #X
fooInt: {kind: "a", a: 43}
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
#Base: {
    kind!: string
}
#A: {
    kind!: "a"
    a:     int
}
#B: {
    kind!: "b"
    b:     string
}
#X: {
    kind!: "a"
    a:     int
} | {
    kind!: "b"
    b:     string
}
fooInt: {
    kind: "a"
    a:    43
}
{{< /code-tab >}}
{{< /code-tabs >}}

It may be cumbersome to maintain a list of all implemented alternatives.
This following approach accepts all implementations of `#Base`, retaining
all additional fields.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
#Base: kind!: string

#X: {#Base, ...} // anyof(#Base)
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
#Base: {
    kind!: string
}
#X: {
    kind!: string
}
{{< /code-tab >}}
{{< /code-tabs >}}

The following approach allows all implementations of `#Base` while discarding excess fields.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
#Base: kind!: string
#X: #Base

a: {
    kind: "a"
    a:    int
}
fooInt: #X
fooInt: a.{#Base}
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
{{< /code-tab >}}
{{< /code-tabs >}}

## Default values in schemas

In the above examples we required users to explicitly specify discriminator fields.
It may be tempting to remove the `!` so that the user does not have to supply the field.
In general, this is not recommended, as it removes the ability for that schema to check whether a given piece of data is fully and correctly defined.

A package that provides schemas with required discriminator fields could provide a convenience variant, though, with those already filled out:

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
#Schema: {
	kind!: "a"
	name:  string
}

Schema: #Schema & {kind: _} // provide ‘kind’ by default
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
#Schema: {
    kind!: "a"
    name:  string
}
Schema: {
    kind: "a"
    name: string
}
{{< /code-tab >}}
{{< /code-tabs >}}

By convention, names of the form `#Schema` should be defined for “pure” schema.
A package that defines `#Schema` could define `Schema` which would reflect `#Schema` with template fields that fills out derived values and template fields that will always be fixed.

Similarly, various `SchemaX` could be provided with default values.

### Limiting field combinations

It is sometimes necessary to indicate that only a certain combination of fields may exist.

### Recursive data types
