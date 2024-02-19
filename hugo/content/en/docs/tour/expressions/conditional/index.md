---
title: "Conditional Fields"
weight: 6
---

Field comprehensions can also be used to
add a single field conditionally.

Converting the resulting configuration to JSON results in an error
as `justification` is required yet no concrete value is given.

{{< code-tabs >}}
{{< code-tab name="conditional.cue" language="cue" area="top-left" >}}
price: number

// Require a justification if price is too high
if price > 100 {
	justification: string
}

price: 200
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt" area="top-right" >}}
justification: string
price:         200
{{< /code-tab >}}
{{< /code-tabs >}}
