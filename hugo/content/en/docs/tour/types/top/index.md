---
title: Top / Any
weight: 25
---

**Top**, written "`_`", represents any CUE value.
It can be thought of as a placeholder,
waiting to be given a more specific value elsewhere.

A field with a value of top can't be exported
because data formats such as JSON and YAML
don't have any way to represent non-concrete values.

Constraining a regular field with top brings that field into existence,
whilst allowing its value to be constrained and defined elsewhere.

{{< code-tabs >}}
{{< code-tab name="fields.cue" language="cue" area="top-left" >}}
a: _
b: _
c: _
d: _
e: _
f: _
{{< /code-tab >}}
{{< code-tab name="values.cue" language="cue" area="top-right" >}}
a: 1
b: 2.2
c: "three"
d: {four: "five"}
e: [6, 7.7, "eight"]
f: true
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWVsZHMuY3VlIHZhbHVlcy5jdWU=" >}}
$ cue export fields.cue values.cue
{
    "a": 1,
    "b": 2.2,
    "c": "three",
    "d": {
        "four": "five"
    },
    "e": [
        6,
        7.7,
        "eight"
    ],
    "f": true
}
{{< /code-tab >}}
{{< /code-tabs >}}
