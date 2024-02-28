---
title: String values
weight: 40
draft: true
---

CUE extends JSON strings with:

- multiline strings
- additional escape sequences
- alternate escape sequences

## Multiline strings

A multiline string starts and ends with a `"""`, the latter being on a line by itself.
The string contents are on separate lines between these two.
The whitespace preceding the last `"""` must prefix each non-empty line of the
string contents and is stripped from all lines.

{{{with code "en" "multiline-strings"}}}
#nofmt TODO: \ at end of line in multiline string
#norun TODO: \ at end of line in multiline string
-- in.cue --
msg: """
    Hello World!

    This is a \
    real treat.
    """
-- out.json --
{
    "msg": "Hello World!\n\nThis is a real treat."
}
{{{end}}}

{{{with sidetrack}}}
CUE multiline strings originate from Swift.
{{{end}}}

## Escape sequences

Just like JSON, CUE uses `\` as the escape character.
These are the ones supported in CUE, with a comparison to JSON and Go.

| Escape | Name | JSON | Go | Examples |
| --- | --- | --- | --- | --- |
| \" | double quote | ✓ | depends |  |
| \' | single quote |  | depends |  |
| \\ | backslash | ✓ | ✓ |  |
| \/ | slash (solidus) | ✓ |  |  |
| \a | alert or bell |  | ✓ |  |
| \b | backspace | ✓ | ✓ |  |
| \f | form feed | ✓ | ✓ |  |
| \n | newline | ✓ | ✓ |  |
| \r | carriage return | ✓ | ✓ |  |
| \t | tab | ✓ | ✓ |  |
| \v | vertical tab |  | ✓ |  |
| \unnnn | 16-bit Unicode | ✓ | ✓ | \u2014 |
| \unnnnnnnn | 32-bit Unicode |  | ✓ | \U00102345 |
| \() | interpolation |  |  | See Templating%20f4e21af73d744a77aa2c91203a8dbe4f.md |

CUE bytes values allow some additional escape sequences.

## Alternate escape sequences

A string literal enclosed with an equal number of hashes on both sides allows
the usual escape sequences to appear in text verbatim. A string enclosed in a
single pair of hashes uses `\#` as the escape character, instead of `\`. A
string enclosed in two hashes uses `\##`, and so on.

{{{with code "en" "alternative-escape-sequences"}}}
#nofmt TODO: unclear what the bug is
#norun TODO: unclear what the bug is
-- in.cue --
a: #"A newline is\#nwritten as "\n"."#

b: ##"Use \#n to write a newline in that case.”##
-- out.json --
{
    "a": "A newline is\nwritten as "\\n"."
    "b": "Use \#n to write a newline in that case."
}
{{{end}}}

{{{with sidetrack}}}
CUE alternate escape sequences originate from Swift.
{{{end}}}

Alternate escape sequences work analogously for multiline strings.
