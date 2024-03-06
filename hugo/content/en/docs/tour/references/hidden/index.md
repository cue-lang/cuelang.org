---
title: Hidden Fields
weight: 70
---

A field name that starts with an underscore (`_`) is referred to as a **hidden field**.
Hidden fields are not included in the exported output.

If a field's name is enclosed in quotes then it is *not* hidden from exported
output - even if it starts with an underscore.
To output a field whose name starts with an underscore, enclose its name in
quotes.

Quoted and non-quoted fields share the same namespace *unless* they start
with an underscore.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
foo: int & <100 // This is a regular field.

// This is the same regular field as above, so
// both their values must unify successfully.
"foo": 1

// These two declarations refer to different
// fields, only one of which will be included in
// exported output.
_foo:   2
"_foo": 3

// This is a hidden definition, which is not
// included in exported output.
_#foo: 4
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZQ==" >}}
$ cue export file.cue
{
    "foo": 1,
    "_foo": 3
}
{{< /code-tab >}}
{{< /code-tabs >}}
