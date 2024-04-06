---
title: Producing a set of strings from a list
tags:
- commented cue
authors:
- noamtd
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to produce a list of unique strings from a list of strings.

{{{with code "en" "cc"}}}
#location left right

exec cue eval
cmp stdout out
-- file.cue --
package example

stringList: ["d", "a", "b", "a", "c", "b", "b"]

stringSet: {
	let map = {for v in stringList {(v): _}}
	[for k, _ in map {k}]
}
-- out --
stringList: ["d", "a", "b", "a", "c", "b", "b"]
stringSet: ["d", "a", "b", "c"]
{{{end}}}

## Related content

- [**Field Comprehensions**]({{< relref "docs/tour/expressions/fieldcomp" >}})
- [**List Comprehensions**]({{< relref "docs/tour/expressions/listcomp" >}})