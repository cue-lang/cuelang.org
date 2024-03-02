---
title: Bottom / Error
weight: 20
---

Specifying a field multiple times with conflicting values results in an error,
or **bottom**, written `_|_`.

Bottom is a special value in CUE, and is the value that results from any error.
Logically, all errors are equal,
although CUE may associate them with metadata such as an error message.

An error is *not* the same as the value `null`.
`_|_` isn't a valid value for a field, but `null` is.

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

Notice how the `-i` flag changes how `cue eval` behaves.
It causes errors to be represented as literal error values in the output, with
error messages as inline comments.
These literal `_|_` values *invalidate* the CUE that's output.
