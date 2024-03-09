---
title: Ensuring that an integer value is either odd or even
tags:
- commented cue
authors:
- noamtd
toc_hide: true

---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to ensure that a given integer is either odd or even.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

#Even: num={2 * (__div(num, 2))}
#Odd:  num={1 + 2*(__div(num, 2))}

evens: [string]: #Even
evens: {
	positive:    42
	negative:    -22
	badPositive: 37
	badNegative: -27
}

odds: [string]: #Odd
odds: {
	positive:    41
	negative:    -3
	badPositive: 12
	badNegative: -40
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWlj" >}}
$ cue eval -ic
evens: {
    positive:    42
    negative:    -22
    badPositive: _|_ // evens.badPositive: conflicting values 36 and 37
    badNegative: _|_ // evens.badNegative: conflicting values -28 and -27
}
odds: {
    positive:    41
    negative:    -3
    badPositive: _|_ // odds.badPositive: conflicting values 13 and 12
    badNegative: _|_ // odds.badNegative: conflicting values -39 and -40
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

* {{< linkto/related/howto "use-the-built-in-functions-div-mod-quo-rem" >}}
