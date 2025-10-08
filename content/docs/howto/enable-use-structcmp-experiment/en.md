---
title: Enable and use the "structcmp" experiment
authors: [jpluscplusm]
toc_hide: true
tags: [language]
---
{{<sidenote text="Requires CUE v0.14.0 or later">}}

CUE v0.14.0 introduced the `structcmp`
[experiment]({{<relref "docs/reference/command/cue-help-experiments" >}}),
which expands two closely related operators with the capability to handle
*concrete composite values:*

- the comparison operator `A == B` can now compare the equality of concrete
  composite values
- the unary operator `==A` now validates the equality of its operand and any
  concrete composite field it's applied to

The `structcmp` experiment is enabled on a per-CUE-file basis, like this:

{{{with code "en" "cue export success"}}}
exec cue export
cmp stdout out
-- file.cue --
@experiment(structcmp)
package p

_data: {
	a: foo: 1
	b: foo: 1
	c: {foo: 1, bar: 2}
	d: foo: 3
}

// The unary operator asserts that a field has the
// same concrete value as some expression.
_data: a: ==_data.b

// The comparison operator compares concrete values
A: _data.a == _data.a
B: _data.a == _data.b
C: _data.a == _data.c
D: _data.a == _data.d
-- out --
{
    "A": true,
    "B": true,
    "C": false,
    "D": false
}
{{{end}}}

Both forms of the `==` operator require **concrete** composite operands,
otherwise evaluation fails:

{{{with code "en" "cue export failure 1"}}}
! exec cue export
cmp stderr out
-- file.cue --
@experiment(structcmp)
package p

A: foo:  1
_B: foo: int

A: ==_B
-- out --
A: invalid right-hand value to '==' (type struct): _B.foo: incomplete value int:
    ./file.cue:7:4
{{{end}}}

In particular, note that the comparison operator doesn't report a `false`
boolean value when asked to compare a non-concrete value. If either operand is
non-concrete, evaluation fails:

{{{with code "en" "cue export failure 2"}}}
! exec cue export
cmp stderr out
-- file.cue --
@experiment(structcmp)
package p

_A: foo: 1
_B: foo: int

C: _A == _B
D: _B == _A
-- out --
C: invalid right-hand value to '==' (type struct): _B.foo: incomplete value int:
    ./file.cue:7:4
D: invalid left-hand value to '==' (type struct): _B.foo: incomplete value int:
    ./file.cue:8:4
{{{end}}}

## Related content

- {{< linkto/related/reference "command/cue-help-experiments" >}}
