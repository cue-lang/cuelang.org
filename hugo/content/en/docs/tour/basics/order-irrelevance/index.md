---
title: Order is Irrelevant
weight: 210
---

CUE's core operations are defined so that
the order in which configurations are combined is unimportant.\
We say that **order is irrelevant** in CUE.

This crucial property explains how CUE is able to handle a field being specified
[multiple times]({{< relref "unification" >}}).
Because each occurrence of a field is as important as every other,
*all* occurrences must not conflict with each other.

Order irrelevance makes it easy for humans _and_ machines to reason about values, and
makes advanced tooling and automation possible.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
a: {X: 1, O: int}
a: {X: int, O: 2}

b: {X: int, O: 2}
b: {X: 1, O: int}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgZmlsZS5jdWU=" >}}
$ cue eval file.cue
a: {
    X: 1
    O: 2
}
b: {
    X: 1
    O: 2
}
{{< /code-tab >}}
{{< /code-tabs >}}
