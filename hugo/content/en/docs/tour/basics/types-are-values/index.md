---
title: Types are Values
weight: 60
---

CUE merges the concepts of values and types.
Below is a demonstration of this concept,
showing respectively
some data, a possible schema for this data,
and something in between: a typical CUE constraint.

{{< columns >}}

<center>Data</center>

```text
moscow: {
	name:    "Moscow"
	pop:     11.92M
	capital: true
}
```

{{< columns-separator >}}

<center>Schema</center>

```text
municipality: {
	name:    string
	pop:     int
	capital: bool
}
```

{{< columns-separator >}}

<center>CUE</center>

```text
largeCapital: {
	name:    string
	pop:     >5M
	capital: true
}
```

{{< /columns >}}

In general, in CUE one starts with a broad definition of a schema,
describing all possible instances,
and then narrows down these definitions for particular use cases
until a concrete data instance remains.
