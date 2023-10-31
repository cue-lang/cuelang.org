---
title: "Hidden Fields"
weight: 7
---

A non-quoted field name that starts with an underscore (`_`) is not
emitted from the output.
To include fields in the configuration that start with an underscore
put them in quotes.

Quoted and non-quoted fields share the same namespace unless they start
with an underscore.

{{< code-tabs >}}
{{< code-tab name="CUE" language="text"  area="top-left" >}}
"_foo": 2
_foo:   3
foo:    4
_#foo:  5
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" type="terminal" area="top-right" >}}
{
    "_foo": 2,
    "foo": 4
}
{{< /code-tab >}}
{{< /code-tabs >}}
