---
title: Writing a type switch
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to write a **type switch**, where output needs to differ based
on the type of data being processed. Because the CUE language does not include
a switch statement, a mechanism is shown that *behaves* like a switch statement
in some other languages.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

input: [
	42,
	139.4,
	"some string",
	["some", "list"],
	{some: "struct"},
	true,
	false,
]

// output is derived from input, and adheres to the following schema:
output: [...{
	source!:    _      // the value being examined
	type!:      string // source's type, in words
	isANumber!: bool   // true iff source is a number
}]

output: [for v in input {
	source: v

	// type's trailing "[0]" acts like a switch statement, selecting the
	// first value whose conditional evaluates to true.
	type: [
		if (v & string) != _|_ {"a string"},
		if (v & int) != _|_ {"an int"},
		if (v & float) != _|_ {"a float"},
		if (v & bool) != _|_ {"a boolean"},
		if (v & [...]) != _|_ {"a list"},
		if (v & {...}) != _|_ {"a struct"},
	][0]

	// Here, isANumber is implemented as a switch. Other, simpler,
	// representations are also possible.
	isANumber: [
		if (v & number) != _|_ {true},
		if (v & number) == _|_ {false},
	][0]
}]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV2YWwgLXMgLWUgb3V0cHV0" >}}
$ cue eval -s -e output
[{
    source:    42
    type:      "an int"
    isANumber: true
}, {
    source:    139.4
    type:      "a float"
    isANumber: true
}, {
    source:    "some string"
    type:      "a string"
    isANumber: false
}, {
    source: ["some", "list"]
    type:      "a list"
    isANumber: false
}, {
    source: some: "struct"
    type:      "a struct"
    isANumber: false
}, {
    source:    true
    type:      "a boolean"
    isANumber: false
}, {
    source:    false
    type:      "a boolean"
    isANumber: false
}]
{{< /code-tab >}}
{{< /code-tabs >}}

{{< info >}}
The method of testing a value's type shown in this guide is likely to be
replaced by tests using more specific and precise builtins when
{{< issue 943 />}} is implemented, such as `isconcrete`.

The builtins mentioned in that issue **are not yet available**, but we mention
them here to help guide the implementation choices you make in the interim.
{{< /info >}}
