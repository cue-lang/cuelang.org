---
title: Using the built-in function "close" to close a struct
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
[`close()`]({{< relref "docs/reference/glossary#close-built-in-function" >}})
to close a
[struct]({{< relref "docs/reference/glossary#struct" >}}).

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
package example

// _x is an open struct
_x: {
	a?: int
	b!: bool
	c?: string
}

// "ok" is an open struct
ok: _x & {
	a: 42
	b: true
	c: "a string"
	d: "an additional field"
}

// "notOk" is the result of unifying a closed
// struct with at least one field not mentioned
// by the struct ("d")
notOk: close(_x) & {
	a: 42
	b: true
	c: "a string"
	d: "an additional field"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWk=" >}}
$ cue eval -i
ok: {
    a: 42
    b: true
    c: "a string"
    d: "an additional field"
}
notOk: {
    a: 42
    b: true
    c: "a string"
    d: _|_ // notOk.d: field not allowed
}
{{< /code-tab >}}
{{< /code-tabs >}}
