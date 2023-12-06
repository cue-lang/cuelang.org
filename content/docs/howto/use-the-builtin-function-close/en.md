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
demonstrates how to use the
[builtin]({{< relref "docs/reference/glossary#builtin-functions" >}})
function
[`close()`]({{< relref "docs/reference/glossary#close-builtin-function" >}})
to close a
[struct]({{< relref "docs/reference/glossary#struct" >}}).

{{{with code "en" "cc"}}}
exec cue eval -i .:example
cmp stdout out
-- example.cue --
package example

// source is an open struct
_source: {
	a?: int
	b!: bool
	c?: string
}

// "ok" is an open struct
ok: _source & {
	a: 42
	b: true
	c: "a string"
	d: "an additional field"
}

// "notOk" is a closed struct
notOk: close(_source) & {
	a: 42
	b: true
	c: "a string"
	d: "an additional field"
}
-- out --
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
{{{end}}}
