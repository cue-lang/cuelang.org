---
title: Operators
weight: 10
---

CUE supports common arithmetic and boolean operators, which apply to its
numerical types `int`, `float`, and `number`.
Some of these operators also apply to the `string` and `bytes` types.

CUE provides three different *division* operations.
To produce a `float`, CUE supports the infix `/` operator with the standard
mathematical meaning.
Arguments can be `float`, `int`, or a mixture of the two.
CUE also provides
[built-in functions]({{< relref "docs/howto/use-the-built-in-functions-div-mod-quo-rem" >}})
that produce an `int` by calculating *integer division and remainder*.
They support Euclidean division (`div` / `mod`) and truncated division (`quo` / `rem`).

{{{with code "en" "operators"}}}
exec cue eval operators.cue
cmp stdout out
-- operators.cue --
a: 1 + 1             // type int
b: "XXX" + "OOO"     // type string
c: 2 * 2             // type int
d: 2 * 2.0           // type float
e: 3.14159 - 0.14159 // type float

f: 6 / 2     // type: float
g: 6.0 / 2.0 // type: float

h: 1 <= 2.0 // type bool
i: 3.0 > 3  // type bool
// String types are compared lexically byte-wise
j: "aaa" >= "ZZZ" // type bool

k: div(10, 3) // type int
l: mod(10, 3) // type int
-- out --
a: 2
b: "XXXOOO"
c: 4
d: 4.0
e: 3.00000
f: 3.0
g: 3.0
h: true
i: false
j: true
k: 3
l: 1
{{{end}}}

The [CUE languge specification]({{< relref "docs/reference/spec#operators" >}})
details the operator precedence levels.
