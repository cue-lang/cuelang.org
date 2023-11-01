---
title: Constraints
weight: 120
---

Constraints specify what values are allowed.
To CUE they are just values like anything else,
but conceptually they can be explained as something in between types and concrete values.

Constraints can also reduce boilerplate.
If a constraint defines a concrete value, there is no need
to specify it in values to which this constraint applies.

{{< code-tabs >}}
{{< code-tab name="check.cue" language="text"  area="top-left" >}}
schema: {
	name:  string
	age:   int
	human: true // always true
}

viola: schema
viola: {
	name: "Viola"
	age:  38
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="top-right" >}}
$ cue eval check.cue
schema: {
    name:  string
    age:   int
    human: true
}
viola: {
    name:  "Viola"
    age:   38
    human: true
}
{{< /code-tab >}}
{{< /code-tabs >}}
