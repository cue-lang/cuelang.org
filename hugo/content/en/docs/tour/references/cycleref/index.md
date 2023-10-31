---
title: "Cycles in Fields"
weight: 6
---

Also, we know that unifying a field with itself will result in the same value.
Thus if we have a cycle between some fields, all we need to do is ignore
the cycle and unify their values once to achieve the same result as
merging them ad infinitum.

{{< code-tabs >}}
{{< code-tab name="CUE" language="text"  area="top-left" >}}
labels: selectors
labels: {app: "foo"}

selectors: labels
selectors: {name: "bar"}
{{< /code-tab >}}
{{< code-tab name="CUE" language="text" type="terminal" area="top-right" >}}
labels: {
    app:  "foo"
    name: "bar"
}
selectors: {
    name: "bar"
    app:  "foo"
}
{{< /code-tab >}}
{{< /code-tabs >}}
