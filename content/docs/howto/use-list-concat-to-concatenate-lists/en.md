---
title: Using "list.Concat" to concatenate lists
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.Concat`](https://pkg.go.dev/cuelang.org/go/pkg/list#Concat)
to concatenate a list of lists.

{{{with code "en" "cc"}}}
exec cue export -e output
cmp stdout out
-- file.cue --
package example

import "list"

output: list.Concat([listA, listB, listC, listB])

listA: [1, 2, 3, 4]
listB: ["hello", "world"]
listC: [{
	a: 10
	b: "10"
}, {
	a: 11
	b: "11"
}, {
	a: 12
	b: "12"
}]
-- out --
[
    1,
    2,
    3,
    4,
    "hello",
    "world",
    {
        "a": 10,
        "b": "10"
    },
    {
        "a": 11,
        "b": "11"
    },
    {
        "a": 12,
        "b": "12"
    },
    "hello",
    "world"
]
{{{end}}}

## Related content

- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
