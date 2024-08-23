---
title: linkto
---

The `linkto` hierarchy contains convenience shims that generate well-formed and
consistently formatted links to commonly referenced pages.

## `linkto/related/ {concept,howto,reference,tutorial,tour}`

`linkto/related/` contains 5 shortcodes primarily aimed at generating links to
Tutorials, How-to Guides, Concept Guides, Tour pages, and References.

The links contain the linked-to page's title because they are intended to be
used in a "Related content" section, placed inside a list element.
They generate content suitable for *inclusion* in a list, but do not generate
self-contained list elements.

The currently supported hierarchies make up the majority of related content
links, but could be expanded if needed.

### Parameters

The first and only positional parameter is the path component of the related
page **within** the relevant hierarchy. I.e. **without** a leading
`docs/tutorial/`, `docs/reference/`, etc.

The related page must exist, and must have a title.

URL fragments cannot be included, which makes the shortcode less useful when
linking to the language spec.

### Examples

```
- {{</* linkto/related/concept "the-logic-of-cue" */>}}
- {{</* linkto/related/howto "use-strings-replace" */>}}
- {{</* linkto/related/reference "modules/manual" */>}}
- {{</* linkto/related/tutorial "working-with-a-custom-module-registry" */>}}
- {{</* linkto/related/tour "expressions/fieldcomp" */>}}
```

- {{< linkto/related/concept "the-logic-of-cue" >}}
- {{< linkto/related/howto "use-strings-replace" >}}
- {{< linkto/related/reference "modules/manual" >}}
- {{< linkto/related/tutorial "working-with-a-custom-module-registry" >}}
- {{< linkto/related/tour "expressions/fieldcomp" >}}

## `linkto/inline`

`linkto/inline` emits a HTML link to a specific page, with the anchor text
being the page's title. No prefix or suffix is present.

Any page that Hugo knows about can be linked to, from any hierarchy in the
site, so long as the page has a title. A build error will occur if the page
lacks a title.

### Parameters

The first and only positional parameter is the path component of the related
page within the docs hierarchy. I.e. **with** a leading `tutorial/`,
`reference/`, etc.

The related page must exist, and must have a title.
URL fragments cannot be included.

### Examples

```
There are several relevant pages: 
{{</* linkto/inline "concept/the-logic-of-cue" */>}},
{{</* linkto/inline "howto/use-strings-replace" */>}},
{{</* linkto/inline "reference/modules/manual" */>}},
{{</* linkto/inline "tutorial/working-with-a-custom-module-registry" */>}}, and
{{</* linkto/inline "tour/expressions/fieldcomp" */>}}.
```

There are several relevant pages: 
{{< linkto/inline "concept/the-logic-of-cue" >}},
{{< linkto/inline "howto/use-strings-replace" >}},
{{< linkto/inline "reference/modules/manual" >}},
{{< linkto/inline "tutorial/working-with-a-custom-module-registry" >}}, and
{{< linkto/inline "tour/expressions/fieldcomp" >}}.
