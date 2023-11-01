---
title: Order is Irrelevant
weight: 210
---

CUE's basic operations are defined in a way that the order in which
you combine two configurations is irrelevant to the outcome.

This is crucial property of CUE
that makes it easy for humans _and_ machines to reason over values and
makes advanced tooling and automation possible.

{{< code-tabs >}}
{{< code-tab name="order.cue" language="text"  area="top-left" >}}
a: {x: 1, y: int}
a: {x: int, y: 2}

b: {x: int, y: 2}
b: {x: 1, y: int}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="top-right" >}}
$ cue eval -i order.cue
a: {
    x: 1
    y: 2
}
b: {
    x: 1
    y: 2
}
{{< /code-tab >}}
{{< /code-tabs >}}
