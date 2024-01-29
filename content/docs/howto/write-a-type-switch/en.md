---
title: Writing a type switch
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to write a basic **type switch**, where output needs to differ
based on the type of data being processed.

{{{with code "en" "cc"}}}
#location top bottom

exec cue eval -s -e output
cmp stdout out
-- file.cue --
package example

// output is a list of structs. Each struct contains a source element from
// the "data" list, along with a string field describing the type of the source
// element. Where the source element is a number type, an additional derived
// field is also added.
output: [for v in data {
	// The source data is included, for reference, irrespective of type.
	{source: v}

	// A unification test for all types contained in the input data should
	// be included. Unification tests check if the result of unifying the
	// source data with a built-in type is *not* equal to bottom ("_|_").
	if (v & string) != _|_ {{type: "a string"}}
	if (v & int) != _|_ {{type: "an int"}}
	if (v & float) != _|_ {{type: "a float"}}
	if (v & bool) != _|_ {{type: "a boolean"}}
	if (v & [...]) != _|_ {{type: "a list"}}
	if (v & {...}) != _|_ {{type: "a struct"}}

	// All type tests must either be mutually exclusive, or any
	// non-exclusive tests must only emit data that is able to unify across
	// all such tests - as is shown here, where the tests above for ints
	// and floats are able to unify with the following number test.
	// Failing to do this will result in an evaluation error due to
	// unification failure.
	if (v & number) != _|_ {{sourceSquared: v * v}}
}]
data: [42, 139.4, "some string", ["some", "list"], {some: "struct"}, true, false]
-- out --
[{
    source:        42
    type:          "an int"
    sourceSquared: 1764
}, {
    source:        139.4
    type:          "a float"
    sourceSquared: 19432.36
}, {
    source: "some string"
    type:   "a string"
}, {
    source: ["some", "list"]
    type: "a list"
}, {
    source: some: "struct"
    type: "a struct"
}, {
    source: true
    type:   "a boolean"
}, {
    source: false
    type:   "a boolean"
}]
{{{end}}}

{{< info >}}
The unification tests demonstrated in this guide are likely to be replaced by
tests using more specific and precise builtins when {{< issue 943 />}} is
implemented, such as `isconcrete`.

The builtins mentioned in that issue **are not yet available**, but we mention
them here to help guide the implementation choices you make in the interim.
{{< /info >}}
