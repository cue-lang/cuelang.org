---
title: CUE syntax highlighting
weight: 13
---

Code blocks that set the language as `cue` can enjoy CUE syntax highlighting.

{{< warning >}}
This relies on an as-yet [unmerged
change](https://github.com/alecthomas/chroma/pull/858) to
[chroma](https://github.com/alecthomas/chroma). Once that change lands, a new
version of chroma will need to be tagged, at which point
[hugo](https://github.com/gohugoio/hugo) will need to update its dependencies to
include the new version of chroma, and a new version of hugo will need to be
tagged.
{{< /warning >}}

```cue
"this is a test"
5
false

// This is a comment
a: {
    foo:      string  // foo is a string
    [=~"^i"]: int     // all other fields starting with i are integers
    [=~"^b"]: bool    // all other fields starting with b are booleans
    [>"c"]:   string  // all other fields lexically after c are strings

    ...string         // all other fields must be a string. Note: default constraints are not yet implemented.
}

x: #"""

 \#(test)

"""

b: a & {
    i3:    3
    bar:   true
    other: "a string"
}

A: close({
    field1: string
    field2: string
})
```
