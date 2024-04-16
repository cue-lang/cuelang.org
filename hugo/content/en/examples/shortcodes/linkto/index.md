---
title: linkto
---

The `linkto` hierarchy contains convenience shims that generate well-formed and
consistently formatted links to commonly referenced pages.

### `linkto/related/{concept,howto,reference,tutorial,tour}`

`linkto/related/` contains 5 shortcodes primarily aimed at generating links to
Tutorials, How-to Guides, Concept Guides, Tour pages, and References.

The links contain the linked-to page's title because they are intended to be
used in a "Related content" section, placed inside a list element.
They generate content suitable for *inclusion* in a list, but do not generate
self-contained list elements.

The currently supported hierarchies make up the majority of related content
links, but could be expanded if needed.

#### Parameters

The first and only positional parameter is the path component of the related
page **within** the relevant hierarchy. I.e. **without** a leading
"docs/tutorial/", "docs/reference/", etc.

The related page must exist, and must have a title.

URL fragments cannot be included, which makes the `linkto/reference` shortcode
less useful when linking to the language spec.

#### Examples

```
- {{</* linkto/related/concept "the-logic-of-cue" */>}}
- {{</* linkto/related/howto "use-strings-replace" */>}}
- {{</* linkto/related/reference "modules" */>}}
- {{</* linkto/related/tutorial "working-with-a-custom-module-registry" */>}}
- {{</* linkto/related/tour "expressions/fieldcomp" */>}}
```

- {{< linkto/related/concept "the-logic-of-cue" >}}
- {{< linkto/related/howto "use-strings-replace" >}}
- {{< linkto/related/reference "modules" >}}
- {{< linkto/related/tutorial "working-with-a-custom-module-registry" >}}
- {{< linkto/related/tour "expressions/fieldcomp" >}}
