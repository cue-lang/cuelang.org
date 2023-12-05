---
title: Using the builtin function "len()" to calculate lengths
tags:
- language
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin function `len()` to calculate the lengths
of different CUE types.

{{{with code "en" "cc"}}}
exec cue export .:example -e output
cmp stdout out
-- example.cue --
package example

output: {
	a: len(data.a)
	b: len(data.b)
	c: len(data.c)
	d: len(data.d)
}
output: [_]: int

// a is a list that contains 4
// elements of different types
data: a: [
	1,
	"2",
	3 * 3,
	{key: "value"},
]

// b is a struct that contains
// 1 hidden field, 2 regular
// fields, and 4 definitions
data: b: {
	_hidden1: true
	regular1: "val"
	regular2: "val"
	#def1:    1
	#def2:    2
	#def3:    3
	#def4:    4
}

// c is a string value that
// contains 6x single-byte and
// 1x 4-byte characters
data: c: "abc123😎" & string

// d is a bytes value that
// contains the same contents
// as c
data: d: 'abc123😎' & bytes
-- out --
{
    "a": 4,
    "b": 2,
    "c": 10,
    "d": 10
}
{{{end}}}
