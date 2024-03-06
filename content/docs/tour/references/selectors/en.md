---
title: Accessing Fields
weight: 20
---

**Selectors** access fields within a struct using dot notation (`.name`) or
indexing notation (`["name"]`).

Dot notation can be used if a field name is a valid CUE identifier.
A valid identifier is sequence of one or more digits and Unicode letters
(including `_` and `$`) that starts with a letter.
The sequence may be preceded by `#` or `_#`.

In all cases, including where a field name is *not* a valid identifer, indexing
notation can be used.

{{{with code "en" "tour"}}}
exec cue export file.cue -e B
cmp stdout out
-- file.cue --
A: {
	a:       1
	"b":     2
	"c-d":   3
	" e":    4
	#f_ve:   5
	"6six":  6
	$even:   7
	"e!ght": 8
	_nine:   9
}
B: {
	one:   A.a & A["a"] // Equivalent references.
	two:   A.b
	three: A["c-d"]
	four:  A[" e"]
	five:  A.#f_ve
	six:   A["6six"]
	seven: A.$even
	eight: A["e!ght"]
	nine:  A._nine
}
-- out --
{
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9
}
{{{end}}}
