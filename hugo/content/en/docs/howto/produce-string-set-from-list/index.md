---
title: Producing a set of strings from a list
tags:
- commented cue
authors:
- noamtd
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to produce a list of unique strings from a list of strings that might include duplicate values.

_NOTE: It is not strictly necessary to sort the elements of the set - we do this to ensure a deterministic output._
{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="left" >}}
package example

import "list"

stringList: ["d", "a", "b", "a", "c", "b", "b"]

stringSet: {
	let map = {for v in stringList {(v): _}}
	list.SortStrings([for k, _ in map {k}])
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV2YWw=" >}}
$ cue eval
stringList: ["d", "a", "b", "a", "c", "b", "b"]
stringSet: ["a", "b", "c", "d"]
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- Language Tour: [**Field Comprehensions**]({{< relref "docs/tour/expressions/fieldcomp" >}})
- Language Tour: [**List Comprehensions**]({{< relref "docs/tour/expressions/listcomp" >}})
- Spec: [Embedding](https://cuelang.org/docs/reference/spec/#embedding)