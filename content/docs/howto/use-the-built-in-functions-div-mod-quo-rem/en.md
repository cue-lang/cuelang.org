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

{{{with code "en" "no remainder"}}}
exec cue eval no-remainder.cue
cmp stdout out
-- no-remainder.cue --
// No remainder results in identical behaviours.
quotient:  div(15, 3) & quo(15, 3)
remainder: mod(15, 3) & rem(15, 3)
-- out --
quotient:  5
remainder: 0
{{{end}}}

The `div()` and `mod()` functions implement
[Euclidean division](https://en.wikipedia.org/wiki/Euclidean_division),
which behaves as follows when used with integers that don't divide exactly,
leaving a non-zero remainder:

{{{with code "en" "div and mod"}}}
exec cue eval euclidean.cue
cmp stdout out
-- euclidean.cue --
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
-- out --
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
{{{end}}}

The `quo()` and `rem()` functions implement truncated division, with `quo()`'s
value being truncated towards zero:

{{{with code "en" "quo and rem"}}}
exec cue eval truncated.cue
cmp stdout out
-- truncated.cue --
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
-- out --
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
{{{end}}}
