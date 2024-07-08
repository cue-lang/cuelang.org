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

	// Include a single element using one of these
	// two equivalent forms.
	// Multi-line form:
	if #a == "yes" {
		3
	},
	// Single-line form:
	if #a == "yes" {4},

	// Include multiple elements using one of these
	// two equivalent forms. Both forms perform
	// just the one test of the condition.
	// Multi-line form:
	if #a == "yes" for e in [
		5,
		6,
	] {e},
	// Single-line form:
	if #a == "yes" for e in [7, 8] {e},
]
-- out --
{
    "A": [
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8
    ]
}
{{{end}}}
