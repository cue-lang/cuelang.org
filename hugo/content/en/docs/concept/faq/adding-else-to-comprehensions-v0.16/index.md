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

{{<columns>}}
{{< code-tabs >}}
{{< code-tab name="if-without-else.cue" language="cue" area="top-left" >}}
foo: true
bar: true

if foo && bar {
	out: "condition met"
}
if !(foo && bar) {
	out: "condition not met"
}
{{< /code-tab >}}{{< /code-tabs >}}

{{<columns-separator>}}

{{< code-tabs >}}
{{< code-tab name="if-with-else.cue" language="cue" area="top-left" >}}
foo: true
bar: true

if foo && bar {
	out: "condition met"
} else {
	out: "condition not met"
}
{{< /code-tab >}}{{< /code-tabs >}}

{{</columns>}}

{{<columns>}}
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCBpZi13aXRob3V0LWVsc2UuY3Vl" }
$ cue export if-without-else.cue
{
    "foo": true,
    "bar": true,
    "out": "condition met"
}
````
{{<columns-separator>}}
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCBpZi13aXRoLWVsc2UuY3Vl" }
$ cue export if-with-else.cue
{
    "foo": true,
    "bar": true,
    "out": "condition met"
}
````
{{</columns>}}

An `else` clause can also be used as a fallback for loops that produce zero values:

{{< code-tabs >}}
{{< code-tab name="for-with-else.cue" language="cue" area="top-left" >}}
inputs: ["foo.txt", "bar.xml", "baz.toml"]

for i, name in inputs
if name =~ #"\.cue$"# {
	cueInputs: (name): i
} else {
	cueInputs: "fallback.cue": -1
}
{{< /code-tab >}}{{< /code-tabs >}}

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCBmb3Itd2l0aC1lbHNlLmN1ZQ==" }
$ cue export for-with-else.cue
{
    "inputs": [
        "foo.txt",
        "bar.xml",
        "baz.toml"
    ],
    "cueInputs": {
        "fallback.cue": -1
    }
}
````
