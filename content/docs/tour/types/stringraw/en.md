---
title: '"Raw" Strings'
weight: 50
---

CUE does not support raw strings in the *strictest* sense.

Instead,
CUE allows the escape delimiter to be modified on a per-string basis,
which allows any given string to be encoded without requiring escapes.
The default escape delimiter is backslash (`\`), but it can be modified to
include an arbitrary number of trailing hash symbols, such as "`\##`".

For a specific string, the delimiter is modified by including the required
number of hash symbols before and after the string's opening and closing
quotes, respectively.

Both normal and multi-line strings allow their delimeters to be modified in
this way.
The change affects all types of escape, including Unicode code points and
interpolations.
Changing a string's escape delimiter is particularly useful
when encoding strings containing quotes or backslashes,
as neither character needs to be escaped in such strings.

{{{with code "en" "tour"}}}
#location top bottom

exec cue eval file.cue
cmp stdout out
-- file.cue --
_happyFace: "\U0001F604"

// Two equivalent representations of the same string unify successfully.
a: #"The sequence "\U0001F604" renders as \#U0001F604. \#(_happyFace)!"#
a: "The sequence \"\\U0001F604\" renders as \U0001F604. \(_happyFace)!"

// This string uses a double-hash-symbol delimiter so that it can encode an
// example of the single-hash-symbol delimiter without needing to escape any
// part of that example.
b: ##"""
	A regular expression can conveniently be written as:
	    #"\d{3}"#
	This construct works for bytes, strings and their multi-line variants.
	This should make you feel \##(_happyFace), not \##U0001F622.
	"""##
-- out --
a: "The sequence \"\\U0001F604\" renders as 😄. 😄!"
b: """
    A regular expression can conveniently be written as:
        #"\\d{3}"#
    This construct works for bytes, strings and their multi-line variants.
    This should make you feel 😄, not 😢.
    """
{{{end}}}
