---
title: List Comprehensions
weight: 50
---

Lists can be specified using **list comprehensions**.

List comprehensions are constructed from
`for` loops, `if` guards, and `let` declarations.\
They can be combined in any order,
on a single line or split across multiple lines.

{{{with code "en" "tour"}}}
exec cue export file.cue --out cue
cmp stdout out
-- file.cue --
#n: [1, 2, 3, 4, 5, 6, 7, 8, 9]
#s: ["a", "b", "c"]

// Large square numbers.
a: [
	for x in #n
	let s = x * x
	if s > 50 {s},
]

// Squares of even numbers.
b: [for x in #n if rem(x, 2) == 0 {x * x}]

// The Cartesian product of two lists.
c: [
	for letter in #s
	for number in #n
	if number < 3 {
		"\(letter)-\(number)"
	},
]
-- out --
// Large square numbers.
a: [64, 81]

// Squares of even numbers.
b: [4, 16, 36, 64]

// The Cartesian product of two lists.
c: ["a-1", "a-2", "b-1", "b-2", "c-1", "c-2"]
{{{end}}}
