---
title: Order is Irrelevant
weight: 210
draft: false
---

CUE's basic operations are defined in a way that the order in which
you combine two configurations is irrelevant to the outcome.

This is crucial property of CUE
that makes it easy for humans _and_ machines to reason over values and
makes advanced tooling and automation possible.

{{< columns >}}
```{title="order.cue"}
a: {x: 1, y: int}
a: {x: int, y: 2}

b: {x: int, y: 2}
b: {x: 1, y: int}
```
{{< columns-separator >}}

```{title="$ cue eval -i order.cue"}
a: {
    x: 1
    y: 2
}
b: {
    x: 1
    y: 2
}
```
{{< /columns >}}