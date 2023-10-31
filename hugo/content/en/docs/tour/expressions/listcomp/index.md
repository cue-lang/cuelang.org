---
title: "List Comprehensions"
weight: 4
---

Lists can be created with list comprehensions.

The example shows the use of `for` loops and `if` guards.

{{< code-tabs >}}
{{< code-tab name="listcomp.cue" language="text"  area="top-left" >}}
[ for x in #items if __rem(x, 2) == 0 {x * x}]

#items: [ 1, 2, 3, 4, 5, 6, 7, 8, 9]
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt"  area="top-right" >}}
[
    4,
    16,
    36,
    64
]
{{< /code-tab >}}
{{< /code-tabs >}}
