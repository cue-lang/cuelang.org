---
title: Using the built-in functions "div", "mod", "quo", and "rem"
tags:
- language
authors:
- jpluscplusm
toc_hide: true
---

This guide demonstrates how to perform integer division using the two pairs of
built-in functions
[`div()`]({{< relref "docs/reference/glossary#div-built-in-function" >}}) and
[`mod()`]({{< relref "docs/reference/glossary#mod-built-in-function" >}}),
and
[`quo()`]({{< relref "docs/reference/glossary#quo-built-in-function" >}}) and
[`rem()`]({{< relref "docs/reference/glossary#rem-built-in-function" >}})
-- as defined in
[the CUE language specification]({{< relref "docs/reference/spec#div-mod-quo-and-rem" >}}).

When used with integers that divide exactly (leaving no remainder),
the `div()` and `quo()` functions behave identically, and
the `mod()` and `rem()` functions return zero:

{{< code-tabs >}}
{{< code-tab name="no-remainder.cue" language="cue" area="top-left" >}}
// No remainder results in identical behaviours.
quotient:  div(15, 3) & quo(15, 3)
remainder: mod(15, 3) & rem(15, 3)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgbm8tcmVtYWluZGVyLmN1ZQ==" >}}
$ cue eval no-remainder.cue
quotient:  5
remainder: 0
{{< /code-tab >}}
{{< /code-tabs >}}

The `div()` and `mod()` functions implement
[Euclidean division](https://en.wikipedia.org/wiki/Euclidean_division),
which behaves as follows when used with integers that don't divide exactly,
leaving a non-zero remainder:

{{< code-tabs >}}
{{< code-tab name="euclidean.cue" language="cue" area="top-left" >}}
// div() and mod() implement Euclidean division.
"15 divided by 4": {
	quotient:  div(15, 4)
	remainder: mod(15, 4)
}
"15 divided by negative 4": {
	quotient:  div(15, -4)
	remainder: mod(15, -4)
}
"negative 15 divided by 4": {
	quotient:  div(-15, 4)
	remainder: mod(-15, 4)
}
"negative 15 divided by negative 4": {
	quotient:  div(-15, -4)
	remainder: mod(-15, -4)
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgZXVjbGlkZWFuLmN1ZQ==" >}}
$ cue eval euclidean.cue
"15 divided by 4": {
    quotient:  3
    remainder: 3
}
"15 divided by negative 4": {
    quotient:  -3
    remainder: 3
}
"negative 15 divided by 4": {
    quotient:  -4
    remainder: 1
}
"negative 15 divided by negative 4": {
    quotient:  4
    remainder: 1
}
{{< /code-tab >}}
{{< /code-tabs >}}

The `quo()` and `rem()` functions implement truncated division, with `quo()`'s
value being truncated towards zero:

{{< code-tabs >}}
{{< code-tab name="truncated.cue" language="cue" area="top-left" >}}
// quo() and rem() implement truncated division.
"15 divided by 4": {
	quotient:  quo(15, 4)
	remainder: rem(15, 4)
}
"15 divided by negative 4": {
	quotient:  quo(15, -4)
	remainder: rem(15, -4)
}
"negative 15 divided by 4": {
	quotient:  quo(-15, 4)
	remainder: rem(-15, 4)
}
"negative 15 divided by negative 4": {
	quotient:  quo(-15, -4)
	remainder: rem(-15, -4)
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgdHJ1bmNhdGVkLmN1ZQ==" >}}
$ cue eval truncated.cue
"15 divided by 4": {
    quotient:  3
    remainder: 3
}
"15 divided by negative 4": {
    quotient:  -3
    remainder: 3
}
"negative 15 divided by 4": {
    quotient:  -3
    remainder: -3
}
"negative 15 divided by negative 4": {
    quotient:  3
    remainder: -3
}
{{< /code-tab >}}
{{< /code-tabs >}}
