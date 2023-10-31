---
title: "Operators"
weight: 1
---

CUE supports many common arithmetic and boolean operators.

The operators for division and remainder are different for `int` and `float`.
For `float` CUE supports the `/` operator with the usual meaning.
For `int` CUE supports both Euclidean division (`div` and `mod`)
and truncated division (`quo` and `rem`).

{{< code-tabs >}}
{{< code-tab name="CUE" language="text"  area="top-left" >}}
a: 3 / 2       // type float
b: __div(3, 2) // type int: Euclidean division

c: 3 * "blah"
d: 3 * [1, 2, 3]

e: 8 < 10
{{< /code-tab >}}
{{< code-tab name="CUE" language="text" type="terminal" area="top-right" >}}
a: 1.5
b: 1
c: "blahblahblah"
d: [1, 2, 3, 1, 2, 3, 1, 2, 3]
e: true
{{< /code-tab >}}
{{< /code-tabs >}}
