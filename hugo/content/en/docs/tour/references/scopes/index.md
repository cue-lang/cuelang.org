---
title: References and Scopes
weight: 10
---

A **reference** refers to the value of the field defined within the nearest
enclosing **scope**.

If a reference doesn't match a field within the same file,
then it may match a top-level field defined in any other file making up the
same CUE package.

If there is still no match then it may match a predefined value, such as a
[predefined bound]({{< relref "docs/tour/types/bounddef" >}}).

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
val: 1

A: {
	val: 2
	B:   val // Matches the inner val
}

A: {
	C: val // Matches the top-level val
}

B: val // Matches the top-level val
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgZmlsZS5jdWU=" >}}
$ cue eval file.cue
val: 1
A: {
    val: 2
    B:   2
    C:   1
}
B: 1
{{< /code-tab >}}
{{< /code-tabs >}}
