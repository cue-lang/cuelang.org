---
title: Using the builtin functions "div", "mod", "quo", and "rem"
tags:
- language
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin functions `div()` and `mod()` to perform
[Euclidean division](https://en.wikipedia.org/wiki/Euclidean_division), and how
to use `quo()` and `rem()` to perform truncated division.

The behaviours of these functions are defined in
[the CUE language specification]({{< relref "docs/reference/spec#div-mod-quo-and-rem" >}}).

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue"  area="top-left" >}}
package example

// div() returns Euclidean
// division's integer quotient
euclidean: quotient: {
	a: div(15, 4)
	b: div(15, -4)
	c: div(-15, 4)
	d: div(-15, -4)
}

// mod() returns Euclidean
// division's integer remainder
euclidean: remainder: {
	a: mod(15, 4)
	b: mod(15, -4)
	c: mod(-15, 4)
	d: mod(-15, -4)
}

// quo() returns truncated
// division's integer quotient
truncated: quotient: {
	a: quo(15, 4)
	b: quo(15, -4)
	c: quo(-15, 4)
	d: quo(-15, -4)
}

// rem() returns truncated
// division's integer remainder
truncated: remainder: {
	a: rem(15, 4)
	b: rem(15, -4)
	c: rem(-15, 4)
	d: rem(-15, -4)
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="top-right" >}}
$ cue export .:example --out yaml
euclidean:
  quotient:
    a: 3
    b: -3
    c: -4
    d: 4
  remainder:
    a: 3
    b: 3
    c: 1
    d: 1
truncated:
  quotient:
    a: 3
    b: -3
    c: -3
    d: 3
  remainder:
    a: 3
    b: 3
    c: -3
    d: -3
{{< /code-tab >}}
{{< /code-tabs >}}
