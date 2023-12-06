---
title: Using the builtin function "close" to close a struct
tags:
- language
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin function `close()` to close a struct.

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue"  area="top-left" >}}
package example

// Source is an open struct
// containing 3 field constraints
Source: {
	a?: int
	b!: bool
	c?: string
}

// Result is the closed
// equivalent of Source
Result: close(Source)

// TestSource unifies Source
// with the 3 fields that it
// mentions, along with 1
// additional field
TestSource: Source & {
	a: 42
	b: true
	c: "a string"
	d: "an additional field"
}

// TestResult unifies Result
// with the contents of
// TestSource
TestResult: Result & {
	TestSource
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="top-right" >}}
$ cue vet .:example
TestResult.d: field not allowed:
    ./example.cue:5:9
    ./example.cue:19:13
    ./example.cue:23:2
    ./example.cue:29:13
    ./example.cue:29:22
    ./example.cue:30:2
{{< /code-tab >}}
{{< /code-tabs >}}
