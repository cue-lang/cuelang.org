---
title: "Structs"
weight: 7
aliases:
- optional
---

Struct is the most important composite type in CUE.
Its members are called fields.

A field may be optional. An **optional** field constraint (`foo?: _`) restricts
the field's type if it is defined elsewhere.

On the other hand, **regular** fields (`bar: _`) and **required** fields
(`baz!: _`) must be made concrete to allow a configuration to be exported.

To prevent a specific field from being defined, mark it with an optional field
constraint and a value of bottom (`_|_`).

{{< code-tabs >}}
{{< code-tab name="structs.cue" language="cue" area="top-left" >}}
#a: {
	foo?:  int    // foo is optional
	bar:   string // bar is regular
	baz!:  float  // baz is required
	quux?: _|_    // quux *cannot* be specified
}
b: #a & {
	bar: "some string"
	baz: 42.0
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBzdHJ1Y3RzLmN1ZQ==" >}}
$ cue export structs.cue
{
    "b": {
        "bar": "some string",
        "baz": 42.0
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}
