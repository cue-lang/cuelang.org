---
title: Types are Values
weight: 60
---

CUE merges the concepts of values and types.
In CUE, *types **are** values*.

A field can be specified with:

- a concrete value such as `"foo"`, `42`, or `true` - something that could be
  represented in JSON,
- a type such as `int` or  `string`,
- or something in between the two such as `>=500`, or `!="foo"` - not concrete,
  but more specific than a basic type.

The following examples show
a **CUE schema**;
a typical **CUE constraint** that *refines* the schema;
and some **concrete values** that satisfy both the constraint and, therefore, the schema.

{{< columns >}}

<center>CUE schema</center>

```cue
municipality: {
	name:    string
	pop:     int
	capital: bool
}
```

{{< columns-separator >}}

<center>CUE constraint</center>

```cue
largeCapital: {
	name:    string
	pop:     >5M
	capital: true
}
```

{{< columns-separator >}}

<center>Concrete values</center>

```cue
kinshasa: {
	name:    "Kinshasa"
	pop:     16.32M
	capital: true
}
```

{{< /columns >}}

With CUE, we generally start with
a broad definition of a schema describing all possible instances
and then
progressively narrow down these definitions for a particular use case
until
a concrete data instance remains.
