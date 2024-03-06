---
title: Operators
weight: 10
---

CUE supports common arithmetic and boolean operators - a subset of which apply
to `string`, `bytes`, and list types in addition to the standard numerical
types.
The [CUE languge specification]({{< relref "docs/reference/spec#operators" >}})
details their precedence levels.

{{< code-tabs >}}
{{< code-tab name="operators.cue" language="cue" area="top-left" >}}
a: 1 + 1
b: 2 * 2
c: 2 * 2.0
d: 3.14159265358 - 0.14159265358

e: 1 <= 2.0
f: 3.0 > 3
g: "AAA" < "AAB"
h: "aaa" >= "ZZZ" // ASCII orders lowercase later.

i: "X" * 10
j: "XXX" + "OOO"
k: [1, "2"] * 3
l: [1, 2, "3"] + [4, "5", 6]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgb3BlcmF0b3JzLmN1ZQ==" >}}
$ cue eval operators.cue
a: 2
b: 4
c: 4.0
d: 3.00000000000
e: true
f: false
g: true
h: true
i: "XXXXXXXXXX"
j: "XXXOOO"
k: [1, "2", 1, "2", 1, "2"]
l: [1, 2, "3", 4, "5", 6]
{{< /code-tab >}}
{{< /code-tabs >}}

The operators for division and remainder are different, based on the return
type required: `int` versus `float`.

To produce a `float`, CUE supports the infix `/` operator with the standard
mathematical meaning.\
Arguments can be `float`, `int`, or a mixture of the two.

For integer division, to produce an `int` from dividing one integer by another,
CUE supports two different modes through built-in functions:

- Euclidean division via `__div` (division) and `__mod` (remainder)
- truncated division via `__quo` (division) and `__rem` (remainder)

{{< code-tabs >}}
{{< code-tab name="division.cue" language="cue" area="top-left" >}}
a: 3 / 2     // type: float
b: 3.0 / 2   // type: float
c: 3 / 2.0   // type: float
d: 3.0 / 2.0 // type: float

// Euclidean division
eucDiv: __div(-23, 7) // type: int (division)
eucRem: __mod(-23, 7) // type: int (remainder)

// Truncated division
truncDiv: __quo(-23, 7) // type: int (division)
truncRem: __rem(-23, 7) // type: int (remainder)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgZGl2aXNpb24uY3Vl" >}}
$ cue eval division.cue
a:        1.5
b:        1.5
c:        1.5
d:        1.5
eucDiv:   -4
eucRem:   5
truncDiv: -3
truncRem: -2
{{< /code-tab >}}
{{< /code-tabs >}}
