---
title: Strings
weight: 40
---

**Strings** are instances of the `string` type.
String literals are defined within double quotes.

Strings allow a rich set of escape sequences,
including Unicode code points
and [interpolations]({{< relref "../expressions/interpolation" >}}).

CUE also supports multi-line strings, enclosed between a pair of triple quotes (`"""`).
The opening quotes of a multi-line string must be immediately followed by a newline,
and the closing quotes must be on a line by themselves, optionally preceded by whitespace.

{{{with code "en" "tour"}}}
exec cue export file.cue
cmp stdout out
-- file.cue --
a: "\U0001F60E" // A 21-bit Unicode character.
b: """
	This is a
	multi-line string \(a)
	"""
-- out --
{
    "a": "😎",
    "b": "This is a\nmulti-line string 😎"
}
{{{end}}}

Any whitespace prefix before the closing quotes of a multi-line string **must**
also be the prefix for all non-empty lines between the quotes.
The whitespace prefix is removed from all lines in the string, and it is an
error for a non-empty line to start with any other characters.
