---
title: Interpolation of Field Names
weight: 30
---

String interpolations can be used to construct field names.

Referring to the value of such an interpolated field needs the reference to be
resolved through the context of some containing struct,
which happens automatically when accessing a field from *outside* the
containing struct.
An alias is often used to provide the necessary context when referencing the
field from *inside* the same struct.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
sandwich: X={
	type:         "Cheese"
	hasButter:    true
	"has\(type)": true

	// Valid: context from an alias.
	butterAndCheese: hasButter && X.hasCheese

	// Valid: context from the containing struct.
	butterAndCheese: hasButter && sandwich.hasCheese

	// Invalid: no context provided.
	//butterAndCheese: hasButter && hasCheese
}

// Valid: context from the containing struct.
cheeseIsNeeded: *sandwich.hasCheese | false
hamIsNeeded:    *sandwich["hasHam"] | false
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
