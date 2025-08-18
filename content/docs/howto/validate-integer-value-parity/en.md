---
title: Validating an integer value's parity
tags:
- commented cue
- validation
authors:
- noamtd
toc_hide: true
---
{{<sidenote text="Requires CUE v0.14.0 or later">}}

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to validate an integer value's parity using either of the
`#Odd` or `#Even` schemas defined on this page.

<!--more-->

{{{with code "en" "cc"}}}
# location top bottom
exec cue eval -ic
cmp stdout out
-- file.cue --
package example

#Even: N={2 * (div(N, 2))} | error("\(N) is not even")
#Odd:  N={1 + 2*(div(N, 2))} | error("\(N) is not odd")

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
-- out --
valid: {
    "-27": -27
    "-22": -22
    "42":  42
    "47":  47
}
invalid: {
    "-37": _|_ // invalid."-37": -37 is not even
    "-32": _|_ // invalid."-32": -32 is not odd
    "52":  _|_ // invalid."52": 52 is not odd
    "57":  _|_ // invalid."57": 57 is not even
}
{{{end}}}

This CUE uses
[the built-in `error` function]({{<relref"docs/howto/use-the-built-in-function-error">}})
that was introduced in CUE v0.14.0.

## Related content

- {{< linkto/related/howto "use-the-built-in-functions-div-mod-quo-rem" >}}
- {{< linkto/related/howto "use-the-built-in-function-error">}}
