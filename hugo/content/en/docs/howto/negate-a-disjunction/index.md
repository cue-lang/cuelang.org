---
title: Negating a disjunction
tags:
- validation
- commented cue
authors:
- hansbogert
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to negate a disjunction. This allows a field to be constrained
such that evaluation is only successful if the field's value would **not** be
permitted by the disjunction.

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
package example

// This disjunction permits a single value from a
// small set of options.
#OneTwoThree: "one" | "two" | "three"

A: "three"
B: "four"

// These hidden fields ensure that the data fields
// they reference do not contain values permitted
// by the #OneTwoThree disjunction.
_A_ok: true & ((A & #OneTwoThree) == _|_)
_B_ok: true & ((B & #OneTwoThree) == _|_)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
_A_ok: conflicting values false and true:
    ./example.cue:13:8
    ./example.cue:13:16
{{< /code-tab >}}
{{< /code-tabs >}}

{{< info >}}
The method of negating a disjunction shown in this guide is likely to be
replaced by a constraint using a more specific and precise builtin when
{{< issue 943 />}} is implemented.

The builtins mentioned in that issue **are not yet available**, but we mention
them here to help guide the implementation choices you make in the interim.
{{< /info >}}
