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

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top" >}}
package example

// output is a list of structs. Each struct contains a source element from
// the data struct along with a string field describing the type of the source
// element. Where the source is a number type, an additional field is also
// added.
output: [for v in data {
	// The source data is included, for reference, irrespective of type.
	{source: v}

	// A unification test for all types contained in the input data should
	// be included. The type tests must either be mutually exclusive, or
	// non-exclusive tests must emit data that is able to unify across all
	// all such tests. Failing to do this will result in an evaluation
	// error due to unification failure.
	if (v & string) != _|_ {{type: "a string"}}
	if (v & int) != _|_ {{type: "an int"}}
	if (v & float) != _|_ {{type: "a float"}}
	if (v & bool) != _|_ {{type: "a boolean"}}
	if (v & [...]) != _|_ {{type: "a list"}}
	if (v & {...}) != _|_ {{type: "a struct"}}

	if (v & number) != _|_ {{sourceSquared: v * v}}
}]
data: [42, 139.4, "some string", ["some", "list"], {some: "struct"}, true, false]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue eval -s -e output
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
{{< /code-tab >}}
{{< /code-tabs >}}
