---
title: "Interpolation"
weight: 2
---

String and bytes literals support interpolation.

Any valid CUE expression may be used inside the escaped parentheses.
Interpolation may also be used in multiline string and byte literals.

{{< code-tabs >}}
{{< code-tab name="CUE" language="text"  area="top-left" >}}
"You are \( #cost-#budget ) dollars over budget!"

#cost:   102
#budget: 88
{{< /code-tab >}}
{{< code-tab name="CUE" language="text" type="terminal" area="top-right" >}}
"You are 14 dollars over budget!"
#cost:   102
#budget: 88
{{< /code-tab >}}
{{< /code-tabs >}}
