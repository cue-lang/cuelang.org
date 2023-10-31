---
title: "Interpolation of Field Names"
weight: 3
---

String interpolations may also be used in field names.

One cannot refer to generated fields with references.

{{{with code "en" "genfield"}}}
-- in.cue --
sandwich: {
	type:            "Cheese"
	"has\(type)":    true
	hasButter:       true
	butterAndCheese: hasButter && hasCheese
}
-- out.err --
sandwich.butterAndCheese: reference "hasCheese" not found:
    ./in.cue:5:32
{{{end}}}
