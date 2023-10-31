---
title: "Interpolation of Field Names"
weight: 3
---

String interpolations may also be used in field names.

One cannot refer to generated fields with references.

{{< code-tabs >}}
{{< code-tab name="genfield.cue" language="text"  area="top-left" >}}
sandwich: {
	type:            "Cheese"
	"has\(type)":    true
	hasButter:       true
	butterAndCheese: hasButter && hasCheese
}
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt"  area="top-right" >}}
sandwich.butterAndCheese: reference "hasCheese" not found:
    ./genfield.cue:5:32
{{< /code-tab >}}
{{< /code-tabs >}}
