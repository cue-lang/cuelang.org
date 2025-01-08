---
title: Searching for content on cuelang.org
authors: [jpluscplusm]
toc_hide: true
---

There are several ways to find the CUE documentation you're looking for.
They can all be combined to help you find the page you need, fast!

The full text of this site can be searched by selecting the search icon
(&#x1f50d;) at the top of any page. Use double quotes around any *precise*
words or phrases that you're searching for, and use a leading dash (`-`) to
rule out pages containing any unwanted words:

- Pages containing a specific word:
  [`json`](/search/?q=json)
- Pages containing multiple, independent words:
  [`json schema`](/search/?q=json%20schema)
- Pages containing a specific phrase (multiple words next to each other):
  [`"json schema"`](/search/?q=%22json%20schema%22) *(NB quotation marks)*
- Pages mentioning a specific phrase containing punctuation characters:
  [`"--with-context"`](/search/?q=%22--with-context%22) *(NB quotation marks)*
- Pages containing a specific word that do *not* contain some other word:
  [`json -schema`](/search/?q=json%20-schema)
<!-- TODO(jcm): https://github.com/cue-lang/cue/issues/3724
- Pages containing a specific word that do *not* contain a specific phrase:
  [`json -"json schema"`](/search/?q=json%20-%22json%20schema%22)
-->

Each page on the site has a *content type*, such as "How-to Guide", "Tutorial",
and "Concept Guide". Pages with the same content type are gathered together in
the related sections linked from the site's navigation menu, and you can search
for specific content types:

- How-to Guides: [`contentType:"How-to Guides"`](/search/?q=contentType:%22How-to%20Guides%22)
- Tutorials: [`contentType:"Tutorials"`](/search/?q=contentType:%22Tutorials%22)

Many pages have also been given one or more *tags*, such as {{<tag modules>}}
and {{<tag "commented cue">}}:

- Pages with a specific tag:
  [`tag:"commented cue"`](/search/?q=tag:%22commented%20cue%22)
- Pages with multiple tags:
  [`tag:"commented cue" tag:"encodings"`](/search/?q=tag:%22commented%20cue%22%20tag:%22encodings%22)

**Combine any of these search tools to pinpoint the documentation you need**:

- Pages with a content type and tag:
  [`contentType:"How-to Guides" tag:"commented cue"`](/search/?q=contentType:%22How-to%20Guides%22%20tag:%22commented%20cue%22)
- Pages with a content type and a tag that *also* contain a specific phrase:
  [`"encoding/json" contentType:"How-to Guides" tag:"commented cue"`](/search/?q=%22encoding/json%22%20contentType:%22How-to%20Guides%22%20tag:%22commented%20cue%22)
