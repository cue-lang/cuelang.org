---
title: "Structs"
weight: 70
aliases:
- optional
---

CUE's most important composite type is the struct.
Its members are called fields.

A field may be optional.
An **optional** field constraint ("`?`")
restricts the field's type
if it is defined elsewhere.

On the other hand,
**regular** fields
and **required** fields ("`!`")
must be made concrete
to allow a configuration to be exported.

A field marked with
an optional field constraint
and a value of bottom ("`_|_`")
is *prevented* from being specified.

{{< code-tabs >}}
{{< code-tab name="structs.cue" language="cue" area="top-left" >}}
_a: {
	foo?:  int    // optional
	bar:   string // regular
	baz!:  float  // required
	quux?: _|_    // cannot be specified
}

b: _a & {
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
