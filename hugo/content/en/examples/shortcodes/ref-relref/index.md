---
title: Ref & relref
weight: 29
---

These shortcodes will look up the pages by their relative path (e.g., blog/post.md) or their logical name (post.md) and return the permalink (ref) or relative permalink (relref) for the found page.

Read a more extensive description of `ref` and `relref` in the [Hugo cross references documentation](https://gohugo.io/content-management/cross-references/).

`ref` and `relref` take exactly one required parameter of reference, quoted and in position `0` (zero).

## Example

```
[Links example]({{</* ref "examples/basic/text/index.md#links" */>}})

[Buttons example]({{</* relref "buttons/index.md" */>}})
```

The result will be just like a link. But the difference is that with ref/relref you link to a file instead of an url.

[Links example]({{< ref "examples/basic/text/index.md#links" >}})

[Buttons example]({{< relref "buttons/index.md" >}})

