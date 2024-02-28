---
title: Maps and Fields
weight: 60
draft: true
---

A map associates a value with a given set of keys. Each key-value pair is called
a field.

## Field names

A field of a map may have any name that is allowed by JSON.
Double quotes can be omitted if the name is a valid {{{def "identifier"}}}
that starts with a letter or `$` and otherwise only contains letters, digits,
`$` or `_`.
Identifiers may also start with `#` or `_`, in which case the field is a
[helper field]({{< relref "#helper-field" >}}) with special meaning.

{{{with code "en" "field-names-double-quotes"}}}
-- in.cue --
a1:    1
"a-b": 2 // quotes are needed here
$id:   "yipee"
-- out.json --
{
    "a1": 1,
    "a-b": 2,
    "$id": "yipee"
}
{{{end}}}

Both quoted and unquoted fields in the above form are referred to as regular
fields.

When combining two maps, their fields are matched and merged based on their
names.
Names of regular fields are considered equal if their string values are equal,
regardless of whether the strings are quoted or not.

{{{with code "en" "merging-of-quoted-and-unquoted"}}}
-- in.cue --
a: x:   1
"a": y: 2
-- out.cue --
a: {
    x: 1
    y: 2
}
{{{end}}}

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
[Templating]({{< relref "docs/language-guide/templating" >}}) section.

{{{with code "en" "helper-fields"}}}
-- in.cue --
one: {
	value:     1
	#typeName: "int"
}

two: value:     "two"
two: _typeName: "string"
-- out.json --
{
    "one": {
        "value": 1
    },
    "two": {
        "value": "two"
    }
}
{{{end}}}

## Embedded Scalars

It is possible to associate helper fields with scalar types by placing both in
curly braces (`{}`).

{{{with code "en" "embedded-scalars"}}}
-- in.cue --
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
-- out.cue --
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
{{{end}}}

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
