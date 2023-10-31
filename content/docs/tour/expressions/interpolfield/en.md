---
title: "Interpolation of Field Names"
weight: 3
---

String interpolations may also be used in field names.

One cannot refer to generated fields with references.

{{{with code "en" "genfield"}}}
! exec cue eval genfield.cue
cmp stderr result.txt
-- genfield.cue --
sandwich: {
	type:            "Cheese"
	"has\(type)":    true
	hasButter:       true
	butterAndCheese: hasButter && hasCheese
}
-- result.txt --
sandwich.butterAndCheese: reference "hasCheese" not found:
    ./genfield.cue:5:32
{{{end}}}
