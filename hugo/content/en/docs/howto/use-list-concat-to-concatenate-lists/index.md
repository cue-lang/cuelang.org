---
title: Using "list.Concat" to concatenate lists
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.Concat`](https://pkg.go.dev/cuelang.org/go/pkg/list#Concat)
to concatenate a list of lists.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtZSBvdXRwdXQ=" >}}
$ cue export -e output
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
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
