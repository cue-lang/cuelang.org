---
title: Interpolation of Field Names
weight: 30
---

String interpolations can be used to construct field names.

Referring to these generated fields requires the reference to be made through
the context of some containing struct.

This happens automatically when accessing a field from *outside* the containing struct.
An alias is often used to provide the context when referencing the field from
*inside* the same struct.

{{{with code "en" "tour"}}}
exec cue eval file.cue
cmp stdout out
-- file.cue --
sandwich: X={
	type:         "Cheese"
	hasButter:    true
	"has\(type)": true

	// Valid: context from an alias.
	butterAndCheese: X.hasCheese && hasButter

	// Valid: context from the containing struct.
	butterAndCheese: sandwich.hasCheese && hasButter

	// Invalid: no context provided.
	//butterAndCheese: hasCheese && hasButter
}

// Valid: automatic context from the containing
// struct, as access is from outside the struct.
cheeseIsNeeded: *sandwich.hasCheese | false
hamIsNeeded:    *sandwich["hasHam"] | false
-- out --
sandwich: {
    type:            "Cheese"
    hasButter:       true
    hasCheese:       true
    butterAndCheese: true
}
cheeseIsNeeded: true
hamIsNeeded:    false
{{{end}}}
