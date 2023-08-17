---
title: How do I make a field optional?
tags:
- level:user
- field constraints
- language
---

Allowing a field to be absent from data, whilst also placing constraints on the
field's value *if it exists*, is a first-class concept in CUE.

This FIXME:"How-to Guide" demonstrates using CUE's **optional field
constraint** syntax.

## Using optional fields

CUE uses a question mark to indicate that a field is permitted to be missing.\
Using this indicator results in a **optional field constraint**.

Place the question mark between the field's identifier and its colon
separator:

```CUE
// field 'a' is optional
a?: _

// field '"a-a"' is optional
"a-a"?: _
```

## Value constraints on optional fields

An optional field's FIXME:"right hand side" may take any form that would also
be allowed if the question mark *weren't* present. Any such **value
constraints** are enforced if *and only if* the field is present.

```CUE
// field 'a' is optional
// if present it must be a string
a?: string

// field '"a-a"' is optional
// if present it must be an int greater than 10
"a-a"?: int & >10

// fields 'b' and 'b.c' are marked as being optional, in line
// with the CUE guidelines for container types in schemata
// FIXME: point to schema guidance on this topic
b?: c?: {

	// field 'd' is optional
	// if present it must be a boolean
	d?: bool

	// field '"d-d"' is optional
	// if present it must be the string "e"
	"d-d"!: "e"
}
```

If an optional field's value constraint is FIXME:violated then unification
fails and an error results:

{{< code-tabs >}}

{{< code-tab name="fields.cue" area="top-left" >}}
package example

a?: string
b?: int
{{< /code-tab >}}

{{< code-tab name="data.cue" area="bottom-left" >}}
package example

b: "a string value"
{{< /code-tab >}}

{{< code-tab name="$ cue export .:example" type="terminal" area="top-right" >}}
b: conflicting values int and "a string value" (mismatched types int and string):
    ./fields.cue:4:5
    ./data.cue:3:4
{{< /code-tab >}}

{{< /code-tabs >}}

## Optional fields aren't implicitly regular fields

A field marked with an optional field constraint doesn't appear in a concrete
export *unless* it's unified with a **regular field** in some data:

{{< code-tabs >}}

{{< code-tab name="fields.cue" area="top-left" >}}
package example

a?: string
b?: int
{{< /code-tab >}}

{{< code-tab name="data.cue" area="bottom-left" >}}
package example

b: 100
{{< /code-tab >}}

{{< code-tab name="$ cue export .:example" type="terminal" area="top-right" >}}
{
    "b": 100
}
{{< /code-tab >}}

{{< /code-tabs >}}

## Concrete value constraints don't make an optional field regular

Concrete value constraints placed on optional fields only constrain the field's
value if it's present. An optional field constraint alongside a concrete value
constraint doesn't cause the field to become regular and exportable:

{{< code-tabs >}}

{{< code-tab name="fields.cue" area="top-left" >}}
package example

a?: string & "b"
c?: int
{{< /code-tab >}}

{{< code-tab name="data.cue" area="bottom-left" >}}
package example

c: 200
{{< /code-tab >}}

{{< code-tab name="$ cue export .:example" type="terminal" area="top-right" >}}
{
    "c": 200
}
{{< /code-tab >}}

{{< /code-tabs >}}

## See also

- [**Optional field constraints**]({{< ref
    "docs/language-guide/schemas-and-validation/field-constraints#optional-field-constraints"
  >}})
- [**Value constraints**]({{< ref
    "docs/language-guide/schemas-and-validation/value-constraints"
  >}})
- [**Regular fields**]({{< ref
    "docs/language-guide/data/maps-and-fields#field-names"
  >}})
