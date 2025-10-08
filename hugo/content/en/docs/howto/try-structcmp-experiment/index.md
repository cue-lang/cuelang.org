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

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "A": true,
    "B": true,
    "C": false,
    "D": false
}
{{< /code-tab >}}
{{< /code-tabs >}}

The `==` operator requires **concrete** operands,
otherwise evaluation fails:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
@experiment(structcmp)
package example

A: foo:  1
_B: foo: int

A: ==_B
C: A == _B
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
A: invalid right-hand value to '==' (type struct): _B.foo: incomplete value int:
    ./file.cue:7:4
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{< linkto/related/reference "command/cue-help-experiments" >}}
