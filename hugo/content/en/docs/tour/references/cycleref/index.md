---
title: "Cycles in Fields"
weight: 60
---

Also, we know that unifying a field with itself will result in the same value.
Thus if we have a cycle between some fields, all we need to do is ignore
the cycle and unify their values once to achieve the same result as
merging them ad infinitum.

```cue
labels: selectors
labels: {app: "foo"}

selectors: labels
selectors: {name: "bar"}
- -result.txt
labels: {
	app:  "foo"
	name: "bar"
}
selectors: {
	name: "bar"
	app:  "foo"
}
```
