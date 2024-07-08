---
title: Conditionally including elements in a list
authors: [jpluscplusm]
toc_hide: true
tags: [commented cue]
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to include elements in a list based on some testable condition.

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
package example

#a: "yes"

A: [
	1,
	2,

	// Include a single element using this form:
	if #a == "yes" {
		3
	},

	// Include multiple elements using this form,
	// which only tests the condition once:
	if #a == "yes" for e in [
		4,
		5,
		6,
	] {e},
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "A": [
        1,
        2,
        3,
        4,
        5,
        6
    ]
}
{{< /code-tab >}}
{{< /code-tabs >}}
