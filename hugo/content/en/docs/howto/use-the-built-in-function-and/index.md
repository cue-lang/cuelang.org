---
title: Using the built-in function "and" to unify the elements of a list
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
[`and()`]({{< relref "docs/reference/glossary#and-built-in-function" >}})
to unify all the elements of a list.

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
package example

// c is a list of constraints
c: [int, >99, <1000]

// Each field in data must adhere to all of the
// constraints contained in c
data: [string]: and(c)
data: {
	a: 4.2
	b: 42
	c: 500 // a valid value
	d: 1001
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAuOmV4YW1wbGU=" >}}
$ cue vet .:example
data.a: conflicting values 4.2 and int & >99 & <1000 (mismatched types float and int):
    ./example.cue:8:17
    ./example.cue:10:5
data.b: invalid value 42 (out of bound >99):
    ./example.cue:4:10
    ./example.cue:11:5
data.d: invalid value 1001 (out of bound <1000):
    ./example.cue:4:15
    ./example.cue:13:5
{{< /code-tab >}}
{{< /code-tabs >}}
