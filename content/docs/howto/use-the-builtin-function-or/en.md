---
title: Using the builtin function "or" to create a disjunction
tags:
- language
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the
[builtin]({{< relref "docs/reference/glossary#builtin-functions" >}})
function
[`or()`]({{< relref "docs/reference/glossary#or-builtin-function" >}})
to create a
[disjunction]({{< relref "docs/reference/glossary#disjunction" >}})
from a list.

{{{with code "en" "cc"}}}
! exec cue vet .:example
cmp stderr out
-- example.cue --
package example

source: ["a", "b", "c"]

// result is assigned "a" | "b" | "c"
result: or(source)

// each field in "test" must adhere to the
// constraints of the "result" disjunction
test: [string]: result
test: {
	one:   "a"
	two:   "b"
	three: "c"
	four:  "X" // invalid value
}
-- out --
test.four: 3 errors in empty disjunction:
test.four: conflicting values "a" and "X":
    ./example.cue:3:10
    ./example.cue:10:17
    ./example.cue:15:9
test.four: conflicting values "b" and "X":
    ./example.cue:3:15
    ./example.cue:10:17
    ./example.cue:15:9
test.four: conflicting values "c" and "X":
    ./example.cue:3:20
    ./example.cue:10:17
    ./example.cue:15:9
{{{end}}}
