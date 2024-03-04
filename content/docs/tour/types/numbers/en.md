---
title: Numbers
weight: 30
---

CUE defines two types of numbers, **integers** and **floats**,
and various syntactic sugar for their literal representations.

Integers, denoted `int`, are whole (or integral) numbers.
Floats, denoted `float`, are decimal floating point numbers.

Both integers and floats are instances of the generic `number` type.

An integer literal (e.g. `4`) defaults to `int` but is also compatible with
`float`.\
A floating point literal (e.g. `5.0`) is only compatible with `float`.

{{{with code "en" "tour"}}}
exec cue eval -i file.cue
cmp stdout out
-- file.cue --
a: int
a: 4 // Type int.

// b cannot be used as an int without
// explicit conversion.
b: number
b: 5.0 // Type float.

c: int
c: 5.0 // Evaluation error.

d: number
d: 4 // Defaults to type int.

// Syntactic sugar for numeric literals.
e: [
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
-- out --
a: 4
b: 5.0
c: _|_ // c: conflicting values int and 5.0 (mismatched types int and float)
d: 4
e: [1_234, 5M, 1.5Gi, 0x1000_0000, 1e6, 000072.40, 6.67428e-11]
{{{end}}}
