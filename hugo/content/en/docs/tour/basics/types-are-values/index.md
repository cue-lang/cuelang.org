---
title: Types are Values
weight: 60
---

CUE merges the concepts of values and types.
Fundamentally, in CUE, **types are values**.

Pragmatically, this means that values assigned to a field
on its right-hand side
can be concrete data, a predefined type such as `int` or `string`,
or something in between -
*less* specific than a concrete value
whilst being *more* specific than a predefined type.

To demonstrate this concept
these examples show
1\) some **CUE data**,
2\) a possible **CUE schema** for this data, and
3\) something intermediate: a typical **CUE constraint**.

{{< columns >}}

<center>1) CUE data</center>

```cue
kinshasa: {
	name:    "Kinshasa"
	pop:     16.32M
	capital: true
}
```

{{< columns-separator >}}

<center>2) CUE schema</center>

```cue
municipality: {
	name:    string
	pop:     int
	capital: bool
}
```

{{< columns-separator >}}

<center>3) CUE constraint</center>

```cue
largeCapital: {
	name:    string
	pop:     >5M
	capital: true
}
```

{{< /columns >}}

With CUE, we generally start with
a broad definition of a schema describing all possible instances
(**#2**, above)
and then
progressively narrow down these definitions for a particular use case
(**#3**)
until
a concrete data instance remains
(**#1**).
