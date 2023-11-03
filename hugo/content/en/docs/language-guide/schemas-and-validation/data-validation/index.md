---
title: Data Validation
weight: 70
draft: false
---

Schema can compose with data, for instance to validate data.
For instance, this is valid:

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a:  1
a?: int
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
a: 1
{{< /code-tab >}}
{{< /code-tabs >}}

This is not

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a:  1
a?: string
{{< /code-tab >}}
{{< code-tab name="ERR" language="err" type="terminal" area="top-right" >}}
a: conflicting values 1 and string (mismatched types int and string):
    ./in.cue:1:5
    ./in.cue:2:5
{{< /code-tab >}}
{{< /code-tabs >}}

It is also possible to combine schemas. For instance, the following CUE defines
restrictions on what values are allowed for another schema.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}

{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}

{{< /code-tab >}}
{{< /code-tabs >}}

The result is a schema that is more strict for validating data.

<--

Also of interest:.

Validating JSON with CUE.

-->
