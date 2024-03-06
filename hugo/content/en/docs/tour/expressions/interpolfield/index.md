---
title: Interpolation of Field Names
weight: 30
---

String interpolations can be used to construct field names.

Referring to the value of such an interpolated field requires the reference to
be resolved via the context of some containing struct reference.

This limitation is automatically mitigated when accessing a field from outside
the containing struct, as the context is a necessary part of the context.
However, when referencing the field inside the same struct in which it is
defined, an alias is often used to provide the context by referencing the
containing struct.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
sandwich: X={
	type:         "Cheese"
	hasButter:    true
	"has\(type)": true

	// Invalid: no containing context.
	//butterAndCheese: hasButter && hasCheese

	// Valid: an alias provides context.
	butterAndCheese: hasButter && X.hasCheese

	// Valid: containing struct provides context.
	butterAndCheese: hasButter && sandwich.hasCheese
}

// Valid: containing struct provides context.
cheeseIsNeeded: *sandwich.hasCheese | false
hamIsNeeded:    *sandwich.hasHam | false
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgZmlsZS5jdWU=" >}}
$ cue eval file.cue
sandwich: {
    type:            "Cheese"
    hasButter:       true
    hasCheese:       true
    butterAndCheese: true
}
cheeseIsNeeded: true
hamIsNeeded:    false
{{< /code-tab >}}
{{< /code-tabs >}}
