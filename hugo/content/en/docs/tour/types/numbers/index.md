---
title: "Numbers"
weight: 3
---
CUE defines two kinds of numbers.
Integers, denoted `int`, are whole, or integral, numbers.
Floats, denoted `float`, are decimal floating point numbers.

An integer literal (e.g. `4`) can be of either type, but defaults to `int`.
A floating point literal (e.g. `4.0`) is only compatible with `float`.

In the example, the result of `b` is a `float` and cannot be
used as an `int` without conversion.

CUE also adds a variety of sugar for writing numbers.

{{< code-tabs >}}
{{< code-tab name="numbers.cue" language="text"  area="top-left" >}}
a: int
a: 4 // type int

b: number
b: 4.0 // type float

c: int
c: 4.0

d: 4 // will evaluate to type int (default)

e: [
	1_234,       // 1234
	5M,          // 5_000_000
	1.5Gi,       // 1_610_612_736
	0x1000_0000, // 268_435_456
]
{{< /code-tab >}}
{{< code-tab name="$ cue eval -i numbers.cue" language="text"  area="top-right" >}}
a: 4
b: 4.0
c: _|_ // c: conflicting values int and 4.0 (mismatched types int and float)
d: 4
e: [1_234, 5M, 1.5Gi, 0x1000_0000]
{{< /code-tab >}}
{{< /code-tabs >}}
