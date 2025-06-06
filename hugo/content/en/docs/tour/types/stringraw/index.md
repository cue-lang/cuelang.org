---
title: '"Raw" Strings'
weight: 50
---

CUE doesn't strictly support raw strings.
Instead, the default escape delimiter (`\`) can be modified for a specific string.

The escape delimiter for a string can be modified to add
an arbitrary number of trailing hash symbols to the default.\
It is changed by *surrounding* the string with the required number of hash symbols:
`#"string value"#`.

<!--more-->

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
// Changing the escape delimiter can simplify strings.
// These two lines specify the same string, but the first line
// is easier to read because of its modified escape delimiter.
A: #"The hazard symbol \#U00002622 is Unicode code point "\U00002622"."#
A: "The hazard symbol \U00002622 is Unicode code point \"\\U00002622\"."

// Making the escape delimiter longer can simplify
// representations of shorter escape delimeters.
B: ##"""
	A regular expression can conveniently be written as:
	    #"\d{3}"#
	This construct works for bytes, strings and their multi-line variants.
	"""##
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZSAtLW91dCB5YW1s" >}}
$ cue export file.cue --out yaml
A: The hazard symbol ☢ is Unicode code point "\U00002622".
B: |-
  A regular expression can conveniently be written as:
      #"\d{3}"#
  This construct works for bytes, strings and their multi-line variants.
{{< /code-tab >}}
{{< /code-tabs >}}

Both normal and multi-line strings allow their delimeters to be modified in this way.
The change affects all types of escape, including Unicode code points and interpolations.
Changing a string's escape delimiter is particularly useful when encoding
strings containing quotes or backslashes, as neither character needs to be
escaped in such strings.
