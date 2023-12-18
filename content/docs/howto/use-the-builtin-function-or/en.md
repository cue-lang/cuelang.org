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
exec cue eval -i .:example
cmp stdout out
-- example.cue --
package example

_source: ["a", "b", "c"]

// _result is assigned "a" | "b" | "c"
_result: or(_source)

// each field in "test" must adhere to the
// constraints of the "_result" disjunction
test: [string]: _result
test: {
	one:   "a"
	two:   "b"
	three: "c"
	four:  "X" // invalid value
}
-- out --
test: {
    one:   "a"
    two:   "b"
    three: "c"
    four:  _|_ // test.four: 3 errors in empty disjunction: (and 3 more errors)
}
{{{end}}}
