---
title: Types are Values
weight: 60
---

CUE merges the concepts of values and types.
Below is a demonstration of this concept,
showing respectively
some data, a possible schema for this data,
and something in between: a typical CUE constraint.

{{< columns >}}

<center>Data</center>

{{{with code "en" "data"}}}
-- data.cue --
moscow: {
	name:    "Moscow"
	pop:     11.92M
	capital: true
}
{{{end}}}

{{< columns-separator >}}

<center>Schema</center>

{{{with code "en" "schema"}}}
-- schema.cue --
municipality: {
	name:    string
	pop:     int
	capital: bool
}
{{{end}}}

{{< columns-separator >}}

<center>CUE</center>

{{{with code "en" "cue"}}}
-- cue.cue --
largeCapital: {
	name:    string
	pop:     >5M
	capital: true
}
{{{end}}}

{{< /columns >}}

In general, in CUE one starts with a broad definition of a schema,
describing all possible instances,
and then narrows down these definitions for particular use cases
until a concrete data instance remains.
