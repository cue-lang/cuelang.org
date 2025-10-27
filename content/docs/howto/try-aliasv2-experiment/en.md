---
title: Trying the "aliasv2" experiment
authors: [jpluscplusm]
toc_hide: true
tags: [language]
---
{{<sidenote text="Requires CUE v0.15.0 or later">}}

CUE v0.15.0 introduced the `aliasv2`
[experiment]({{<relref "docs/reference/command/cue-help-experiments" >}}),
which FIXME.
The experiment needs to be enabled on a per-file basis, and behaves like this:

{{{with code "en" "cue export success"}}}
exec cue export -e output
cmp stdout out
-- file.cue --
@experiment(structcmp) // Enable the experiment.
package example

// The comparison operator can now compare
// concrete structs.
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

## Related content

- {{< linkto/related/reference "command/cue-help-experiments" >}}
