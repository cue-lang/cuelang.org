---
title: Specify a default value for a field
tags:
- level:user
- language
toc_hide: true
---

CUE allows fields to be given a value which is used only if **unification**
results in no other value being provided.

This guide demonstrates CUE's **default value** syntax.

## Specifing defaults

Specify a default by marking one element of a **disjunction** with an asterisk
prefix:

```cue
// field 'a' has a default value of "A".
// it can also be set to any other value,
// through unification
a: *"A" | _
```

If a field's value is not provided through unification then the default is
used.

If a regular field has a value provided elsewhere, through unification, then
that value is used instead:

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="top-left" >}}
package example

a: *"A" | _
b: *"B" | _
{{< /code-tab >}}
{{< code-tab name="data.cue" language="cue" area="top-right" >}}
package example

a: "some value"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="txt" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAuOmV4YW1wbGU=" >}}
$ cue export .:example
{
    "a": "some value",
    "b": "B"
}
{{< /code-tab >}}
{{< /code-tabs >}}

{{< info >}}
Both **required fields** and **optional fields** may include a default in a
disjunction.\
Such a default will *only* have an effect if the field is *also* unified with a
regular field.\
If this unification occurs, the default behaves as demonstrated in this guide.
{{< /info >}}

## The purpose of the disjunction

If a default is provided, it must take the form of a single element of a valid
disjunction - that is, a disjunction containing at least 2 elements.

If the field has a value provided elsewhere, through unification, then at least
one of the disjunction's elements must unify with the field's concrete value.
The concrete value provided through unification may be the same as the default
value:

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="top-left" >}}
package example

a: *"A" | string
b: *5 | int
{{< /code-tab >}}
{{< code-tab name="data.cue" language="cue" area="top-right" >}}
package example

a: "A"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="txt" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAuOmV4YW1wbGU=" >}}
$ cue export .:example
{
    "a": "A",
    "b": 5
}
{{< /code-tab >}}
{{< /code-tabs >}}

If no element unifies with the value that has been provided, a disjunction
resolution error results:

{{< code-tabs >}}
{{< code-tab name="policy.cue" language="cue" area="top-left" >}}
package example

a: *"A" | string
b: *5 | int
{{< /code-tab >}}
{{< code-tab name="data.cue" language="cue" area="top-right" >}}
package example

b: "a string"
{{< /code-tab >}}
{{< code-tab name="stderr.txt" language="txt" area="bottom" >}}
b: 2 errors in empty disjunction:
b: conflicting values "a string" and 5 (mismatched types string and int):
    ./data.cue:3:4
    ./policy.cue:4:5
b: conflicting values "a string" and int (mismatched types string and int):
    ./data.cue:3:4
    ./policy.cue:4:9
{{< /code-tab >}}
{{< /code-tabs >}}

## Defaults are usually specified as concrete values

Defaults are used by the CUE evaluator when a field's value needs to be used in
a <!-- FIXME:"concrete context"? -->concrete context, but where no specific
value has been provided elsewhere, through unification.

Therefore, *in order to be useful*, defaults need to evaluate to a concrete
value. If CUE needs to use a default but the value provided is not concrete, an
error results:

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
package example

a: *"A" | _
b: *string | _
{{< /code-tab >}}
{{< code-tab name="ERR" language="err" area="top-right" type="terminal" >}}
b: incomplete value string:
    ./in.cue:4:5
{{< /code-tab >}}
{{< /code-tabs >}}

## Defaults can include references

Defaults are commonly specified as explicit concrete values, but if CUE can
resolve a default to a concrete value via references then the result can be
successfully used as a default:

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
package example

a: 5
b: *( a + 10) | int

c: "hello"
d: *( c + ", world!") | string
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" area="top-right" type="terminal" >}}
{
    "a": 5,
    "b": 15,
    "c": "hello",
    "d": "hello, world!"
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Defaults can be complex values

Defaults are often specified as primitive types (`bool`, `string`, `number`,
`int` or `float`) but they can also <!-- FIXME:take? -->take complex types.

These values can either be provided inline, or by reference.

In this example, both defaults for the field `a` are equivalent:

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
package example

a: string | *_s
a: string | *{
	x: "value"
	y: [
		"hello",
		"world",
	]
}
_s: {
	x: "value"
	y: [
		"hello",
		"world",
	]
}
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" area="top-right" type="terminal" >}}
{
    "a": {
        "x": "value",
        "y": [
            "hello",
            "world"
        ]
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Specifying multiple defaults is usually not useful

A single field may have multiple defaults specified in parallel, provided that
*all* the defaults unify successfully:

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
package example

a: *"A" | _
a: *string | _
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" area="top-right" type="terminal" >}}
{
    "a": "A"
}
{{< /code-tab >}}
{{< /code-tabs >}}

If multiple defaults are provided but they do not unify successfully, then CUE
treats the field as if no defaults were provided. If unification then finishes
without a concrete value being specified elsewhere, or without sufficient
information being provided to resolve the disjunction, then the result is an
error:

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
package example

a: *"A" | _
a: *int | _
{{< /code-tab >}}
{{< code-tab name="ERR" language="err" area="top-right" type="terminal" >}}
a: incomplete value "A" | int | _
{{< /code-tab >}}
{{< /code-tabs >}}

However, even if multiple defaults are provided and they unify successfully,
doing so is *usually* not a useful technique.

This is because in the case where CUE needs to use the unified default (because
no concrete, regular value was discovered through unification) the result of
unifying all the defaults must be concrete. Such concreteness *can* be derived
from the unification of multiple *non-concrete* defaults - but as the following
example demonstrates, this has a higher change of leading to unclear CUE that
could confuse the reader:

{{< code-tabs >}}
{{< code-tab name="policy-upper-bound.cue" language="cue" area="top-left" >}}
package example

port_x: *<=8080 | string
port_y: *<=8080 | string
{{< /code-tab >}}
{{< code-tab name="policy-lower-bound.cue" language="cue" area="top-left" >}}
package example

port_x: *>=8080 | string
port_y: *>=8080 | string
{{< /code-tab >}}
{{< code-tab name="data.cue" language="cue" area="top-right" >}}
package example

port_x: "a string, for some reason"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAuOmV4YW1wbGU=" >}}
$ cue export .:example
{
    "port_x": "a string, for some reason",
    "port_y": 8080
}
{{< /code-tab >}}
{{< /code-tabs >}}

The preceding example is *not* an example of clear and straightforward CUE, and
the reader would be better served by having an explicit and concrete default
specified (e.g. `port_x: *8080 | string`). Having specified such a concrete
default, there is usually little point in *also* specifying non-concrete
defaults in parallel.

There are specific, nuanced, situations where this advice might not hold true.
However, in general, using multiple defaults is unnecessary and risks confusing
the reader.

## Defaults provide only a single preference layer

As demonstrated above, if a field has multiple defaults provided but they do
not all unify successfully, then CUE behaves as if no default had been
provided.

For this reason, defaults cannot be used as a system of multi-layered,
overriding values.

## See also

- [**Default values**]({{< relref
    "docs/tour/types/defaults"
  >}})
- [**Disjunctions**]({{< relref
    "docs/tour/types/disjunctions"
  >}})
- [**Field constraints**]({{< relref
    "docs/tour/types/optional"
  >}})
<!-- TODO:postLG
- [**Value constraints**]({{</* relref
    "docs/language-guide/schemas-and-validation/value-constraints"
  */>}})
- [**Regular fields**]({{</* relref
    "docs/language-guide/data/maps-and-fields#field-names"
  */>}})
- [**Unification**](TODO)
-->
