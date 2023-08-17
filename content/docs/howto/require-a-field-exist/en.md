---
title: How do I make CUE require that a field exist?
tags:
- level:user
- field constraints
- language
---

Requiring that a field exist is a first-class concept in CUE.

This FIXME:HOWTO Guide demonstrates using CUE's **required field constraint**
syntax.

## Required fields

CUE uses an exclamation mark to indicate that a field must exist.

Using this indicator results in a **required field constraint** that forces the
field to be present when its FIXME:container is used in a FIXME:"concrete
context".

Place the exclamation mark between the field's identifier and its colon
separator:

```CUE
// field 'a' is required
a!: _

// field '"a-a"' is required
"a-a"!: _
```

The field's FIXME:"right hand side" may take any form that would be legal if
the marker *weren't* present.

```CUE
// field 'a' is required, and must be a string
a!: string

// field '"a-a"' is required, and must be an int greater than 10
"a-a"!: int & >10

// fields 'b' and 'b.c' aren't required, as they're container types
// FIXME: point to schema guidance on this topic
b: c: {

	// field 'd' is required, and must be a bool
	d!: bool

	// field '"d-d"' is required, and must be the string value "e"
	"d-d"!: "e"
}
```

Any constraints placed on a required field apply, as usual, to the field's
concrete value arrived at through unification.

Even if the value constraint is concrete, as with `b.c."d-d".e` above, there
must be a regular field elsewhere that satisfies this constraint. A required
field constraint alongside a concrete value constraint doesn't cause the field
to become **regular** and exportable:

{{< columns >}}
```CUE {title="file.cue"}
package example

a!: "b"
```
{{< columns-separator >}}
```console {title="$ cue export .:example"}
a: field is required but not present:
    ./file.cue:3:1
```

{{< /columns >}}

## See also

- [**Regular fields**]({{<
    ref "docs/language-guide/data/maps-and-fields#field-names"
  >}})
- [**Required field constraints**]({{<
    ref "docs/language-guide/schemas-and-validation/field-constraints#required-field-constraints"
  >}})
