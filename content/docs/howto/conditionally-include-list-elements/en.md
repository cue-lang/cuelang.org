---
title: Conditionally including elements in a list
authors: [jpluscplusm]
toc_hide: true
tags: [commented cue]
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to include elements in a list based on some testable condition.

{{{with code "en" "cc"}}}
exec cue export
cmp stdout out
-- example.cue --
package example

#a: "yes"

A: [
	1,
	2,

	// Include single elements like this. The
	// single- and multi-line forms are equivalent:
	if #a == "yes" {
		3
	},
	if #a == "no" {4},

	// This mechanism can include multiple
	// elements using just one test. The single-
	// and multi-line forms are equivalent:
	if #a == "yes" for e in [
		5,
		6,
	] {e},
	if #a == "no" for e in [7, 8] {e},
]
-- out --
{
    "A": [
        1,
        2,
        3,
        5,
        6
    ]
}
{{{end}}}
