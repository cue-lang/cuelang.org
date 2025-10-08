---
title: Trying the "structcmp" experiment
authors: [jpluscplusm]
toc_hide: true
tags: [language]
---
{{<sidenote text="Requires CUE v0.14.0 or later">}}

CUE v0.14.0 introduced the `structcmp`
[experiment]({{<relref "docs/reference/command/cue-help-experiments" >}}),
which allows both forms of the `==` operator to compare structs.
The experiment needs to be enabled on a per-file basis, and behaves like this:

{{{with code "en" "cue export success"}}}
exec cue export
cmp stdout out
-- file.cue --
@experiment(structcmp) // Enable the experiment.
package example

// The comparison operator can now compare concrete
// structs.
A: _a == _a
B: _a == _b
C: _a == _c
D: _a == _d

// The unary operator can now assert that one
// struct has the same concrete value as another.
_a: ==_b

_a: foo: 1
_b: foo: 1
_c: {foo: 1, bar: 1}
_d: foo: 2
-- out --
{
    "A": true,
    "B": true,
    "C": false,
    "D": false
}
{{{end}}}

The `==` operator requires **concrete** operands,
otherwise evaluation fails:

{{{with code "en" "cue export failure"}}}
! exec cue export
cmp stderr out
-- file.cue --
@experiment(structcmp)
package example

A: foo:  1
_B: foo: int

A: ==_B
C: A == _B
-- out --
A: invalid right-hand value to '==' (type struct): _B.foo: incomplete value int:
    ./file.cue:7:4
{{{end}}}

## Related content

- {{< linkto/related/reference "command/cue-help-experiments" >}}
