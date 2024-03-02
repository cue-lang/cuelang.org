---
title: Numbers
weight: 30
---

CUE defines two types of numbers, **integers** and **floats**,
and various syntactic sugar for their literal representations.

Integers, denoted `int`, are whole (or integral) numbers.
Floats, denoted `float`, are decimal floating point numbers.
Both integers and floats are instances of the generic `number` type.
CUE numbers have arbitrary precision.

An integer literal (e.g. `4`) is only compatible with `int`.\
A floating point literal (e.g. `5.0`) is only compatible with `float`,
even if it is a whole number.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
a: 4 & int      // int type
b: 5.0 & float  // float type
c: 4 & number   // int type
d: 5.0 & number // float type
e: 4 & float    // Type mismatch
f: 5.0 & int    // Type mismatch

// Syntactic sugar for numeric literals.
s: [
	// ints
	1_234,       // 1234
	5M,          // 5_000_000
	1.5Gi,       // 1_610_612_736
	0x1000_0000, // 268_435_456
	1e6,         // 1_000_000

	// floats
	000072.40,   // 72.40
	6.67428e-11, // 0.0000000000667428
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWkgZmlsZS5jdWU=" >}}
$ cue eval -i file.cue
a: 4
b: 5.0
c: 4
d: 5.0
e: _|_ // e: conflicting values 4 and float (mismatched types int and float)
f: _|_ // f: conflicting values 5.0 and int (mismatched types float and int)
s: [1_234, 5M, 1.5Gi, 0x1000_0000, 1e6, 000072.40, 6.67428e-11]
{{< /code-tab >}}
{{< /code-tabs >}}
