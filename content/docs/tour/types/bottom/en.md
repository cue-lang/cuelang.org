---
title: Bottom / Error
weight: 20
---

Specifying duplicate fields with conflicting values results in an error,
or **bottom**,
denoted `_|_`.

Bottom is a special value in CUE,
and is the value that results from any error.
Logically all errors are equal,
although CUE may associate them with metadata such as an error message.

An error is not the same as `null`.
`null` is a valid value and can be assigned to a field
\- but `_|_` cannot.

In this example,
notice how the `-i` flag modifies `cue eval`'s behaviour,
placing literal `_|_` values in the output wherever errors have occurred,
instead of the errors causing an evaluation and invocation failure.
The presence of these values invalidates the output CUE,
with each error's message being recorded as an inline comment.

{{{with code "en" "tour"}}}
exec cue eval -i file.cue
cmp stdout out
-- file.cue --
a: 1
a: 2

b: [50, 100]
b: [50, 200]

c: [0, 1, 2]

d: c[5]
-- out --
a: _|_ // a: conflicting values 2 and 1
b: [50, _|_, // b.1: conflicting values 200 and 100
]
c: [0, 1, 2]
d: _|_ // d: invalid list index 5 (out of bounds)
{{{end}}}
