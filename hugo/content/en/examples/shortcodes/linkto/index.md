---
title: linkto
---

The `linkto` hierarchy contains convenience shims that generate well-formed and
consistently formatted links to commonly referenced pages.

### `linkto/related/{concept,howto,reference,tutorial}`

`linkto/related/` contains 4 shortcodes primarily aimed at generating links to
Tutorials, How-to Guides, Concept Guides, and References. The links contain the
linked-to page's title field. They are intended to be used in a page's "Related
content" section, placed inside a list element. They only generate content
suitable for inclusion in a list, and do not generate self-contained list
elements.

Only these 4 hierarchies are currently supported as they make up the majority
of related content links, and have reduced implementation complexity (relative
to, say, linking to the Language Guide or the Tour) due to their flat page
hierarchies.

#### Parameters

The first positional parameter is the path component of the related page
**within** the relevant hierarchy. I.e. **without** a leading "docs/tutorial/",
"docs/reference/", etc.

#### Examples

```
- {{</* linkto/related/concept "the-logic-of-cue" */>}}
- {{</* linkto/related/howto "use-strings-replace" */>}}
- {{</* linkto/related/reference "modules" */>}}
- {{</* linkto/related/tutorial "working-with-a-custom-module-registry" */>}}
```

- {{< linkto/related/concept "the-logic-of-cue" >}}
- {{< linkto/related/howto "use-strings-replace" >}}
- {{< linkto/related/reference "modules" >}}
- {{< linkto/related/tutorial "working-with-a-custom-module-registry" >}}
