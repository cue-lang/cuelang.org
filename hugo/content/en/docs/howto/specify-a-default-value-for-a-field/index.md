---
title: Specify a default value for a field
tags:
- level:user
- cue theory
---

## Default values

In CUE, a
[regular field]({{< ref "docs/language-guide/data/maps-and-fields#field-names" >}})
may have a single concrete value specified as its default. CUE will use this
default as the field's value if (and only if) the field's value isn't made
concrete elsewhere, through unification.

{{< info >}}
Both required and optional
[field constraints]({{< ref "docs/language-guide/schemas-and-validation/field-constraints" >}})
may include a default value, but the default will not have any effect unless
the field is brought into existence elsewhere, through unification with a
regular field.
{{< /info >}}

The default value must be provided alongside at least one other element in a
[disjunction]({{< ref "docs/language-guide/schemas-and-validation/disjunctions" >}}),
and is specified by prefixing any single element of a disjunction with an
asterisk.

FIXME: convert all these to side-by-sides when I understand LHS:cue/RHS:command.

```CUE
a_field_with_a_default_value: string | *"some default value"
```
```console
$ cue export .:example
{
    "a_field_with_a_default_value": "some default value"
}
```

The non-default elements present in the disjunction will be evaluated as
constraints if the field's value is made concrete elsewhere, through
unification, and evaluates to a value that's different from the default. 

```CUE
a_field_with_a_default_value: string | *"some default value"
a_field_with_a_default_value: 1000000
```
```console
$ cue export .:example
a_field_with_a_default_value: 2 errors in empty disjunction:
a_field_with_a_default_value: conflicting values 1000000 and "some default value" (mismatched types int and string):
    -:1:41
    -:2:31
a_field_with_a_default_value: conflicting values 1000000 and string (mismatched types int and string):
    -:1:31
    -:2:31
```

### Multiple identical defaults

The default marker may be repeated across multiple disjunctions if and only the
concrete values they specify are identical. The position of the default element
in any disjunction doesn't matter.

```CUE
package example

a_field_with_a_default_value: string | *"some default value" | int
_some_string:                 "some default"
a_field_with_a_default_value: int | *(_some_string + " value")
```
```console
$ cue export .:example
{
    "a_field_with_a_default_value": "some default value"
}
```

The number and order of other elements in any disjunction doesn't matter, so
long as each disjunction is syntactically valid and includes at least one
element *other* than the default.

```CUE
package example

a_field_with_a_default_value: string | *"some default value" | int
_some_string:                 "some default"
a_field_with_a_default_value: int | *(_some_string + " value")
```
```console
$ cue export .:example
{
    "a_field_with_a_default_value": "some default value"
}
```

### Unopinionated defaults

To provide a default that only applies if the field is missing from data, but
which permits absolutely any other value to override it through unification,
create a disjunction with top (`_`):

```CUE
a_field_with_a_default_value: *"some default value" | _
a_field_with_a_default_value: {
	some: "complex struct"
	with: many: {
		nested: "fields"
	}
}
```
```console
$ cue export .:example
{
    "a_field_with_a_default_value": {
        "some": "complex struct",
        "with": {
            "many": {
                "nested": "fields"
            }
        }
    }
}
```

### Multiple non-identical defaults

If multiple default values apply to a field through unification, then they must
evaluate to identical concrete values.

If they aren't identical then CUE behaves as if *all* the field's default markers
hadn't been specified, and therefore the disjunction must be resolved
elsewhere, though unification.

```CUE
a_field: string | *"first default value"
a_field: string | *"second default value"
```
```console
$ cue export FIXME
a_field: incomplete value string | "second default value" | "first default value"
```

## See also

- [**Regular fields**](FIXME)
- [**Disjunctions**](FIXME)
- [**Unification**](FIXME)
- [**Field constraints**](FIXME)

