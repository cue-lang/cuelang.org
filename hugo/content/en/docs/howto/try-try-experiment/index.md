---
title: Trying the "try" experiment
authors: [mvdan]
tags: [language]
toc_hide: false
---

{{<sidenote text="Requires CUE v0.16.0 or later">}}

CUE v0.16.0-alpha.2 introduced the "try" experiment, which adds a `try` clause
in comprehensions as well as the use of `?` in field references.

This addition to the language intends to provide a more concise syntax for
handling missing optional fields, reducing the boilerplate of explicit error
checks.

To use this language feature, update your module to target language version v0.16.0
or later with [`cue mod edit`]({{<relref "docs/reference/command/cue-help-mod-edit" >}}):

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBlZGl0IC0tbGFuZ3VhZ2UtdmVyc2lvbiB2MC4xNi4w" }
$ cue mod edit --language-version v0.16.0
````

You can now enable the experiment on a per-file basis using `@experiment(try)`.

A `try` clause can be used to improve the conditional definition of a field
based on the presence of another field:

{{< code-tabs >}}
{{< code-tab name="without-try.cue" language="cue" area="top-left" >}}
// No experiment required

package p

a?: int
if a != _|_ {
	b: a + 1
}
{{< /code-tab >}}
{{< code-tab name="with-try.cue" language="cue" area="top-right" >}}
@experiment(try)

package p

a?: int
try {
    b: a? + 1
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{}
{{< /code-tab >}}
{{< /code-tabs >}}

A `try` clause can also bind an identifier to a value
for use in subsequent clauses and the comprehension body:

{{< code-tabs >}}
{{< code-tab name="try-with-bind.cue" language="cue" area="top" >}}
@experiment(try)

package p

a?: int

try x = {
    value: a? + 1
} if x.value > 5 {
    b: x
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{}
{{< /code-tab >}}
{{< /code-tabs >}}

Finally, you can also use an `else` clause for a fallback value:

{{< code-tabs >}}
{{< code-tab name="try-with-else.cue" language="cue" area="top" >}}
@experiment(try)

package p

a?: int

try {
    b: a? + 1
} else {
    b: -1
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "b": -1
}
{{< /code-tab >}}
{{< /code-tabs >}}
