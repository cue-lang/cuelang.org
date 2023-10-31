---
title: "Accessing Fields"
weight: 2
---

Selectors access fields within a struct using the `.` notation.
This only works if a field name is a valid identifier and it is not computed.
For other cases one can use the indexing notation.

{{< code-tabs >}}
{{< code-tab name="selectors.cue" language="text"  area="top-left" >}}
a: {
	b:     2
	"c-e": 5
}
v: a.b
w: a["c-e"]
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt"  area="top-right" >}}
a: {
    b:     2
    "c-e": 5
}
v: 2
w: 5
{{< /code-tab >}}
{{< /code-tabs >}}
