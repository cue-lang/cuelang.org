---
title: Validating an integer value's parity
tags:
- commented cue
- validation
authors:
- noamtd
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to validate an integer value's parity.

Two schemas `#Odd` and `#Even` are presented that validate an integer is either odd or even respectively.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

#Even: num={2 * (div(num, 2))}
#Odd:  num={1 + 2*(div(num, 2))}

valid: {
	"-27": -27 & #Odd
	"-22": -22 & #Even
	"42":  42 & #Even
	"47":  47 & #Odd
}

invalid: {
	"-37": -37 & #Even
	"-32": -32 & #Odd
	"52":  52 & #Odd
	"57":  57 & #Even
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWlj" >}}
$ cue eval -ic
valid: {
    "-27": -27
    "-22": -22
    "42":  42
    "47":  47
}
invalid: {
    "-37": _|_ // invalid."-37": conflicting values -38 and -37
    "-32": _|_ // invalid."-32": conflicting values -31 and -32
    "52":  _|_ // invalid."52": conflicting values 53 and 52
    "57":  _|_ // invalid."57": conflicting values 56 and 57
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{< linkto/related/howto "use-the-built-in-functions-div-mod-quo-rem" >}}
