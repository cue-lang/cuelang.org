---
title: Using the built-in function "or" to create a disjunction
tags:
- language
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the
[built-in]({{< relref "docs/reference/glossary#built-in-functions" >}})
function
[`or()`]({{< relref "docs/reference/glossary#or-built-in-function" >}})
to create a
[disjunction]({{< relref "docs/reference/glossary#disjunction" >}})
from a list.

This allows the list to be used as a constraint that only permits values that
are present in the list.

<!--more-->

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
package example

source: ["a", "b", "c"]
result: or(source)

// Each field in "test" must have a value that
// unifies successfully with a value in "source".
test: [string]: result
test: {
	one:   "a"
	two:   "b"
	three: "c"
	four:  "XYZ" // invalid value
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWkgLjpleGFtcGxl" >}}
$ cue eval -i .:example
source: ["a", "b", "c"]
result: "a" | "b" | "c"
test: {
    one:   "a"
    two:   "b"
    three: "c"
    four:  _|_ // test.four: 3 errors in empty disjunction: (and 3 more errors)
}
{{< /code-tab >}}
{{< /code-tabs >}}
