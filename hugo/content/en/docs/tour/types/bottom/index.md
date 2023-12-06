---
title: "Bottom / Error"
weight: 2
---

Specifying duplicate fields with conflicting values results in an error
or bottom.
_Bottom_ is a special value in CUE, denoted `_|_`, that indicates an
error such as conflicting values.
Any error in CUE results in `_|_`.
Logically all errors are equal, although errors may be associated with
metadata such as an error message.

Note that an error is different from `null`: `null` is a valid value,
whereas `_|_` is not.

{{< code-tabs >}}
{{< code-tab name="bottom.cue" language="cue"  area="top-left" >}}
a: 4
a: 5

l: [1, 2]
l: [1, 3]

list: [0, 1, 2]
val: list[3]
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt"  area="top-right" >}}
a: _|_ // a: conflicting values 5 and 4
l: [1, _|_, // l.1: conflicting values 3 and 2
]
list: [0, 1, 2]
val: _|_ // val: index out of range [3] with length 3
{{< /code-tab >}}
{{< /code-tabs >}}
