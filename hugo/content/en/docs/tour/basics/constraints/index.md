---
title: Constraints
weight: 120
---

**Constraints** specify what values are allowed.
Constraints are values because
[all types are values]({{< relref "types-are-values" >}}).

Constraints can **reduce boilerplate** and simplify the specification of data.
If a constraint specifies a field then the field and its value are present
everywhere the constraint is unified, and don't need to be repeated.

In this example, the `cue export` output includes the data that Viola is a human.
This is because the `viola` field is specified as the unification of a struct
which declares Viola's name and age, and the `person` constraint which
additionally declares the `human` field.
This unification uses the **explicit unification operator `&`**.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
person: {
	name:  string
	age:   int & >=0
	human: true // People are always humans
}

viola: person & {
	name: "Viola"
	age:  38
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZSAtZSB2aW9sYQ==" >}}
$ cue export file.cue -e viola
{
    "name": "Viola",
    "age": 38,
    "human": true
}
{{< /code-tab >}}
{{< /code-tabs >}}

Unification succeeds because `person`'s `name` field constraint of `string`
doesn't conflict with the concrete value `"Viola"`, and `age`'s unified
constraint of `int & >=0` doesn't conflict with the value `38`.
