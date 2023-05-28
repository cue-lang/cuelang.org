---
title: Composite Schemas
weight: 50
draft: false
---

## Definitions

Fields whose name start with a `#` are called <def>definitions</def>.
Definitions are helper fields to define types that can be used to validate data.
They are not included in an export and thus can be used to define schema
alongside data.

{{{with sidetrack}}}
To output fields that start with a `#`, just use quotes. Quoted fields are
always output.
{{{end}}}


By convention, map definitions only include field constraints and no actual
fields.

## Field checks

By default, a value is checked against a schema may only have fields defined in
that schema.
This allows CUE to catch typos in field names, a common mistake in
configurations.

Including a `...` in a schema disables this check. Alternatively, one can use
pattern constraints to allow arbitrary other fields.

```coq

```

Lists that are defined within a definition are, analogously, of fixed length.
You can write `[a, b, ...]` to allow more items.

### `close([] | {})`

`close` converts a partially defined, or open, map or list to a fully defined,
or closed, map or list.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
c: close({a: 1})

a: c & {b: 2}
{{< /code-tab >}}
{{< code-tab name="ERR" language="err" type="terminal" area="top-right" >}}
a.b: field not allowed:
    ./in.cue:1:10
    ./in.cue:3:4
    ./in.cue:3:9
{{< /code-tab >}}
{{< /code-tabs >}}

{{{reference "why-cue-closedness-the-way-it-does-proto–intermezzo?"}}}


## Extending Schemas

Schemas can combine with other schemas by using embedding.
This circumvents the usual limitation that no new fields can be added to a
definition.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
#Base: {}
#Animal: {
	kind!: string
	name?: string
}
#Mammal: {
	#Base// embedded
	lungCapacityL: number
}
#Dog: {
	#Mammal// embedded
	kind!: "dog"
	house: string
}
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
#Base: {}
#Animal: {
    kind!: string
}
#Mammal: {
    lungCapacityL: number
}
#Dog: {
    kind!:         "dog"
    lungCapacityL: number
    house:         string
}
{{< /code-tab >}}
{{< /code-tabs >}}

Using embedding is not unlike extending a class in an object-oriented
programming language, with the notable difference that existing fields cannot be
overridden and must compose with the newly provided values.

A CUE value can also just make an existing schema more specific, for instance by
mixing in some policy that further restricts the allowed value of an API.

Combining schema can also serve the purpose of defining limitations on a schema,
for instance by mixing in some policy that further restricts the allowed value
of an API.

In general, CUE works by making values increasingly more specific. At the top
there are schema, at the bottom there are concrete instances.

Schemas are often composed of other schemas. You can embed schemas in another to
extend them:

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}

{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}

{{< /code-tab >}}
{{< /code-tabs >}}

{{{with sidetrack "en"}}}
Embedding of literal maps is also allowed. This is essentially what allows us to
elide the outer curly braces of JSON: in CUE the top-level production is a list
of fields, and the top-level curly braces of JSON are just seen as an embedded
literal map.
{{{end}}}


One cannot simply use `&` for this as it would trigger the closedness check.
Essentially, embedding allows recursively disabling the closedness check for a
definition.

{{{reference "cue-and-jsonschema"}}}


{{{reference "cue-and-rego"}}}


## Schema Instantiation

#Foo(a: "bar")

shorthand for #Foo & {a: "bar"}


