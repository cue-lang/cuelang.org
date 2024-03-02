---
title: '"Raw" Strings'
weight: 50
---

CUE doesn't strictly support raw strings.
Instead, the default escape delimiter (`\`) can be modified for a specific string.

Any given string's delimiter can be modified to add
an arbitrary number of trailing hash symbols to the default delimiter.\
The delimiter is changed by
*surrounding* the string with the required number of hash symbols: `#"string value"#`.

{{{with code "en" "tour"}}}
#location top bottom

exec cue export file.cue --out yaml
cmp stdout out
-- file.cue --
// Changing the escape delimiter can simplify strings.
// These two lines specify the same string, but the first line
// is easier to read because of its modified escape delimiter.
A: #"The hazard symbol \#U00002622 is Unicode code point "\U00002622"."#
A: "The hazard symbol \U00002622 is Unicode code point \"\\U00002622\"."

// Making the escape delimiter longer can simplify
// representations of shorter escape delimeters.
C: ##"""
	A regular expression can conveniently be written as:
	    #"\d{3}"#
	This construct works for bytes, strings and their multi-line variants.
	"""##
-- out --
A: The hazard symbol ☢ is Unicode code point "\U00002622".
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
