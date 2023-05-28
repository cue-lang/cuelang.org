---
title: Maps and Fields
weight: 60
draft: false
---

A map associates a value with a given set of keys. Each key-value pair is called
a field.

## Field names

A field of a map may have any name that is allowed by JSON.
Double quotes can be omitted if the name is a valid {{{def "identifier"}}}

that starts with a letter or `$` and otherwise only contains letters, digits,
`$` or `_`.
Identifiers may also start with `#` or `_`, in which case the field is a
[[Helper fields](Data%201b448a6f417b4e08b2d41b3b33cf2a45.md)](helper field) with
special meaning.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a1:    1
"a-b": 2 // quotes are needed here
$id:   "yipee"
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" type="terminal" area="top-right" >}}
{
    "a1": 1,
    "a-b": 2,
    "$id": "yipee"
}
{{< /code-tab >}}
{{< /code-tabs >}}

Both quoted and unquoted fields in the above form are referred to as regular
fields.

When combining two maps, their fields are matched and merged based on their
names.
Names of regular fields are considered equal if their string values are equal,
regardless of whether the strings are quoted or not.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a: x:   1
"a": y: 2
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
a: {
    x: 1
    y: 2
}
{{< /code-tab >}}
{{< /code-tabs >}}

`a: 1` and `"a": 1` mean the same thing.

## Data fields

Regular fields as well as list elements are collectively called data fields.
When converting CUE to data, such as JSON or YAML, only data fields are emitted.

## Helper fields

Unquoted fields that start with a `#` or a single `_` have a special meaning in
CUE and are collectively called helper fields.
Helper fields are omitted when converting CUE to data, like to JSON or YAML.

Quoted field names that start with either `#` or `_`, such as `"#foo"` are not
special and are just regular fields.
Unquoted field names starting with `__` are reserved by CUE and cannot be used
to define helper fields.

Helper fields allow reuse of CUE code when composing larger configurations.
More on this in the
[Templating](Templating%20f4e21af73d744a77aa2c91203a8dbe4f.md) section.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
one: {
	value:     1
	#typeName: "int"
}

two: value:     "two"
two: _typeName: "string"
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" type="terminal" area="top-right" >}}
{
    "one": {
        "value": 1
    },
    "two": {
        "value": "two"
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Embedded Scalars

It is possible to associate helper fields with scalar types by placing both in
curly braces (`{}`).

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
one: {
	1
	#typeName: "int"
}

two: "two"
two: {_, #typeName: "string"}

three: {
	a:         1
	#typeName: "map"
}
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
one: {
    1
    #typeName: "int"
}
two: {
    "two"
    #typeName: "string"
}
three: {
    a:         1
    #typeName: "map"
}
{{< /code-tab >}}
{{< /code-tabs >}}

Note for field `two` we need to include a `_` within the map to make things
work.
This is because without it `{}` is only compatible with map values.

## Field overview

Fields starting with `#` are also called definitions in CUE.
They are used for defining schemas and APIs, but can also be used for defining
data.

Fields starting with `_` are not visible outside of a package and can be used by
package writers to hide CUE code from outside users.
Package writers can change these fields without worry that external users will
break.

| Prefix | Examples | Field Type | Data | Comment |
| --- | --- | --- | --- | --- |
| letter or `$` | `a` `"a"` `$a` `”#a”` | data field | Yes | Some applications may assign special meaning to `$`. It is just a letter to CUE, though. |
| `#` | `#a` | definition | No | Visible outside a package. Definitions are often used to define schema, API, or reusable templates. |
| `_` | `_a` | hidden field | No | Not visible outside a package. |
| `_#` | `_#a` | hidden definition | No | Like schema, but not visible outside a package. |
| `__` | `__close`, `__int` | predeclared identifier | No | Reserved for CUE builtin functions and values. |
