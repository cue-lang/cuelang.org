---
title: Duplicate Fields
weight: 90
draft: false
---

CUE allows duplicated field definitions as long as they don't conflict.

For values of basic types this means they must be equal.

For structs, fields are merged and duplicated fields are handled recursively.

For lists, all elements must match accordingly
<!-- ([we discuss open-ended lists later](/language-guide/data/lists/).) -->

{{< columns >}}

```{title="dup.cue"}
a: 4
a: 4

s: { b: 2 }
s: { c: 2 }

l: [ 1, 2 ]
l: [ 1, 2 ]
```

{{< columns-separator >}}

```{title="$ cue eval dup.cue"}
a: 4
s: {
    b: 2
    c: 2
}
l: [1, 2]
```

{{< /columns >}}
