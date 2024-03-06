---
title: Accessing Fields
weight: 20
---

**Selectors** access fields within a struct using dot notation (`.name`) or
indexing notation (`["name"]`).

Dot notation can be used if a field name is a valid CUE identifier, and it is
not computed.
A valid identifier is sequence of one or more Unicode letters (which includes
`_` and `$`) and digits, starting with a letter. The sequence may be preceded
by `#` or `_#`.

In all cases, including where a field name is *not* a valid identifer, indexing
notation can be used.

{{{with code "en" "tour"}}}
exec cue eval file.cue -e y
cmp stdout out
-- file.cue --
x: {
	a:       1
	"b":     2
	"c-d":   3
	" e":    4
	#f_ve:   5
	"6six":  6
	$even:   7
	"e!ght": 8
}
y: {
	one:   x.a & x["a"] // 2 equivalent references.
	two:   x.b
	three: x["c-d"]
	four:  x[" e"]
	five:  x.#f_ve
	six:   x["6six"]
	seven: x.$even
	eight: x["e!ght"]
}
-- out --
one:   1
two:   2
three: 3
four:  4
five:  5
six:   6
seven: 7
eight: 8
{{{end}}}
