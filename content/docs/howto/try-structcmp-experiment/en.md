---
title: Trying the "structcmp" experiment
authors: [jpluscplusm]
toc_hide: true
tags: [language]
---
{{<sidenote text="Requires CUE v0.14.0 or later">}}

CUE v0.14.0 introduced the "structcmp" experiment, which
allows both forms of the `==` operator to compare structs.

Enable the experiment on a per-file basis using the
`@experiment(structcmp)`
attribute.
It behaves like this:

{{{with code "en" "cue export success"}}}
exec cue export -e output
cmp stdout out
-- file.cue --
@experiment(structcmp) // Enable the experiment.
package example

// The binary comparison operator can now
// compare concrete structs.
output: {
	"a == a": a == a
	"a == b": a == b
	"a == c": a == c
	"a == d": a == d
}

// The unary operator can now assert that one
// struct has the same concrete value as another.
a: ==b

a: foo: 1
b: foo: 1
c: {foo: 1, bar: 1}
d: foo: 2
-- out --
{
    "a == a": true,
    "a == b": true,
    "a == c": false,
    "a == d": false
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

## Conclusion

The "structcmp" experiment allows both unary and binary forms of the `==`
operator to compare concrete structs.

As with all CUE language experiments, one of this experiment's aims is to
gather feedback from users. Please do join [the CUE community](/community/)
and tell us about your experience with the experiment!

## Related content

- {{< linkto/related/reference "command/cue-help-experiments" >}} --
  a list of the language experiments that can be enabled or disabled
