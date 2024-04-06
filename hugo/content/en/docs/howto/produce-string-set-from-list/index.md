---
title: Producing a set of strings from a list
tags:
- commented cue
authors:
- noamtd
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how produce a list of unique strings from a list of strings.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="left" >}}
package example

stringList: ["d", "a", "b", "a", "c", "b", "b"]

stringSet: {
	let map = {for a in stringList {(a): _}}
	[for b, _ in map {b}]
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV2YWw=" >}}
$ cue eval
stringList: ["d", "a", "b", "a", "c", "b", "b"]
stringSet: ["d", "a", "b", "c"]
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- [**Field Comprehensions**]({{< relref "docs/tour/expressions/fieldcomp" >}})
- [**List Comprehensions**]({{< relref "docs/tour/expressions/listcomp" >}})