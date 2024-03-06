---
title: Interpolation
weight: 20
---

String and bytes literals support **interpolation**,
in both their single- and multi-line forms.

Any valid CUE expression may be used inside escaped parentheses.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
a: "You are \(#cost-#budget) dollars over budget!"

#cost:   102
#budget: 88
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZQ==" >}}
$ cue export file.cue
{
    "a": "You are 14 dollars over budget!"
}
{{< /code-tab >}}
{{< /code-tabs >}}
