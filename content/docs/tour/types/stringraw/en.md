---
title: '"Raw" Strings'
weight: 50
---

CUE does not support raw strings in the *strictest* sense.
Instead,
CUE allows the escape delimiter to be modified on a per-string basis.

The default escape delimiter is backslash (`\`).
For a specific string, the default can be modified to include
an arbitrary number of trailing hash symbols, such as "`\##`",
by including the required number of hash symbols before and after the string's
opening and closing quotes respectively.

{{{with code "en" "tour"}}}
#location top bottom

exec cue export file.cue --out yaml
cmp stdout out
-- file.cue --
_hazard: "\U00002622"

// Changing the escape delimiter can simplify strings.
// A and B have the same contents, but B is simpler.
A: "Unicode \"\\U00002622\" renders as \(_hazard)."
B: #"Unicode "\U00002622" renders as \#(_hazard)."#

// Making the escape delimiter longer can simplify
// representations of shorter escape delimeters.
C: ##"""
	A regular expression can conveniently be written as:
	    #"\d{3}"#
	This construct works for bytes, strings and their multi-line variants.
	"""##
-- out --
A: Unicode "\U00002622" renders as ☢.
B: Unicode "\U00002622" renders as ☢.
C: |-
  A regular expression can conveniently be written as:
      #"\d{3}"#
  This construct works for bytes, strings and their multi-line variants.
{{{end}}}

Both normal and multi-line strings allow their delimeters to be modified in this way.
The change affects all types of escape, including Unicode code points and interpolations.
Changing a string's escape delimiter is particularly useful when encoding
strings containing quotes or backslashes, as neither character needs to be
escaped in such strings.
