---
title: Searching for content on cuelang.org
authors: [jpluscplusm]
toc_hide: true
---

There are several ways to find the CUE documentation you're looking for.
This site's section indexes link to pages matching specific *content types*,
whilst indexes such as {{<tag modules>}} and {{<tag "commented cue">}} display
all content that's marked with the relevant *tag*.
These filters can be combined with the site's full-text search features,
letting you quickly pinpoint the documentation you need.

Here are some links to search results pages that demonstrate various ways the site's search feature can help:

- Pages with a specific tag:
  [`tag:"commented cue"`](/search/?q=tag:%22commented%20cue%22)
- Pages with multiple tags:
  [`tag:"commented cue" tag:"encodings"`](/search/?q=tag:%22commented%20cue%22%20tag:%22encodings%22)
- Pages with a specific content type:
  [`contentType:"How-to Guides"`](/search/?q=contentType:%22How-to%20Guides%22)
- Pages with a content type and tag:
  [`contentType:"How-to Guides" tag:"commented cue"`](/search/?q=contentType:%22How-to%20Guides%22%20tag:%22commented%20cue%22)
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
- Pages with a specific content type and tag that also contain a specific phrase:
  [`"encoding/json" contentType:"How-to Guides" tag:"commented cue"`](/search/?q=%22encoding/json%22%20contentType:%22How-to%20Guides%22%20tag:%22commented%20cue%22)
<!-- TODO(jcm): why doesn't this work? (0 results)
- Pages containing a specific word that do *not* contain a specific phrase:
  [`json -"json schema"`](/search/?q=json%20-%22json%20schema%22)
-->
