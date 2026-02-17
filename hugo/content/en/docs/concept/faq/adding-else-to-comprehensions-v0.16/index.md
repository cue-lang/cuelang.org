---
title: Adding "else" to comprehensions in CUE 0.16
authors: [mvdan]
tags: [language]
toc_hide: false
---

{{<sidenote text="Requires CUE v0.16.0 or later">}}

CUE v0.16.0-alpha.2 introduced a new optional `else` clause in comprehensions
for CUE modules targetting the language version v0.16.0 or later,
which you can opt into via
[`cue mod edit --language-version`]({{<relref "docs/reference/command/cue-help-mod-edit" >}}).

With this change to the language, an `if` or `for` comprehension may be followed
by an `else` clause which triggers when the comprehension produced zero values.
For example, this occurs when:
- An `if` clause condition is false
- A `for` clause iterates over an empty collection
- A `for` clause has all iterations filtered out by `if` clauses

An `else` clause can help avoid repetition or verbosity, for instance:

{{< code-tabs >}}
{{< code-tab name="if-without-else.cue" language="cue" area="top-left" >}}
package p

_foo: true
_bar: true

if _foo && _bar {
	withoutElse: "condition met"
}
if !(_foo && _bar) {
	withoutElse: "condition not met"
}
{{< /code-tab >}}
{{< code-tab name="if-with-else.cue" language="cue" area="top-right" >}}
package p

if _foo && _bar {
	withElse: "condition met"
} else {
	withElse: "condition not met"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="ZW52IFBBVEg9L2N1ZXMvJENVRUxBTkdfQ1VFX1RJUDokUEFUSA==" >}}
$ env PATH=/cues/$CUELANG_CUE_TIP:$PATH
withElse: condition met
withoutElse: condition met
{{< /code-tab >}}
{{< /code-tabs >}}

An `else` clause can also be used as a fallback for loops that produce zero values:

{{< code-tabs >}}
{{< code-tab name="for-with-else.cue" language="cue" area="top" >}}
_inputs: ["foo.txt", "bar.xml", "baz.toml"]

for i, name in _inputs
if name =~ #"\.cue$"# {
	cueInputs: (name): i
} else {
	cueInputs: "fallback.cue": -1
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="ZW52IFBBVEg9L2N1ZXMvJENVRUxBTkdfQ1VFX1RJUDokUEFUSA==" >}}
$ env PATH=/cues/$CUELANG_CUE_TIP:$PATH
cueInputs:
  fallback.cue: -1
{{< /code-tab >}}
{{< /code-tabs >}}

