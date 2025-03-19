---
title: Using the built-in functions "div", "mod", "quo", and "rem"
tags:
- language
authors:
- jpluscplusm
toc_hide: true
---

This guide demonstrates integer division using the pairs of built-in functions
[`div()`]({{< relref "docs/reference/glossary#div-built-in-function" >}}) &
[`mod()`]({{< relref "docs/reference/glossary#mod-built-in-function" >}}),
and
[`quo()`]({{< relref "docs/reference/glossary#quo-built-in-function" >}}) &
[`rem()`]({{< relref "docs/reference/glossary#rem-built-in-function" >}}).

When used with two integers where one divides the other evenly
the `div()` and `quo()` functions behave identically, and
the `mod()` and `rem()` functions return zero:

{{< code-tabs >}}
{{< code-tab name="no-remainder.cue" language="cue" area="top-left" >}}
// 15 divides 3 evenly, leaving no remainder.
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
which behaves as follows when used with integers that don't divide evenly
(leaving a non-zero remainder):

{{< code-tabs >}}
{{< code-tab name="euclidean.cue" language="cue" area="top-left" >}}
// div() and mod() implement Euclidean division.
"div(15, 4)":   div(15, 4)
"mod(15, 4)":   mod(15, 4)
"div(15, -4)":  div(15, -4)
"mod(15, -4)":  mod(15, -4)
"div(-15, 4)":  div(-15, 4)
"mod(-15, 4)":  mod(-15, 4)
"div(-15, -4)": div(-15, -4)
"mod(-15, -4)": mod(-15, -4)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgZXVjbGlkZWFuLmN1ZQ==" >}}
$ cue eval euclidean.cue
"div(15, 4)":   3
"mod(15, 4)":   3
"div(15, -4)":  -3
"mod(15, -4)":  3
"div(-15, 4)":  -4
"mod(-15, 4)":  1
"div(-15, -4)": 4
"mod(-15, -4)": 1
{{< /code-tab >}}
{{< /code-tabs >}}

The `quo()` and `rem()` functions implement *truncated division*,
with `quo()`'s value being truncated towards zero:

{{< code-tabs >}}
{{< code-tab name="truncated.cue" language="cue" area="top-left" >}}
// quo() and rem() implement truncated division.
"quo(15, 4)":   quo(15, 4)
"rem(15, 4)":   rem(15, 4)
"quo(15, -4)":  quo(15, -4)
"rem(15, -4)":  rem(15, -4)
"quo(-15, 4)":  quo(-15, 4)
"rem(-15, 4)":  rem(-15, 4)
"quo(-15, -4)": quo(-15, -4)
"rem(-15, -4)": rem(-15, -4)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgdHJ1bmNhdGVkLmN1ZQ==" >}}
$ cue eval truncated.cue
"quo(15, 4)":   3
"rem(15, 4)":   3
"quo(15, -4)":  -3
"rem(15, -4)":  3
"quo(-15, 4)":  -3
"rem(-15, 4)":  -3
"quo(-15, -4)": 3
"rem(-15, -4)": -3
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The behaviours of the integer divison functions are defined in
  [The CUE Language Specification]({{< relref "docs/reference/spec#div-mod-quo-and-rem" >}})
