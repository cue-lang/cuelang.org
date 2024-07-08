---
title: Conditionally including multiple elements in a list
authors: [jpluscplusm]
toc_hide: true
tags: [commented cue]
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to include multiple elements in a list conditionally, based on
the value of an unrelated field.

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
package example

A: "yes"
B: [
	1,
	2,
	if A == "yes" for e in [
		3, // B will include
		4, // these two elements.
	] {e},
	if A == "no" for e in [
		5, // B will not include
		6, // these two elements.
	] {e},
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWw=" >}}
$ cue eval
A: "yes"
B: [1, 2, 3, 4]
{{< /code-tab >}}
{{< /code-tabs >}}
