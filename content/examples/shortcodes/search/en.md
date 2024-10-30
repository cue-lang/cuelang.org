---
title: Search
weight: 25
---

With this shortcode you can embed a search results widget on the page.

## Example

```
{{</* search contentType="How-to Guides" showContentTypes=false tags="encodings,commented cue" */>}}
```

{{< search contentType="How-to Guides" showContentTypes=false tags="encodings,commented cue" >}}


## Attributes

contentType
: required when showContentTypes is false - Enter the preselected content type

showContentTypes
: optional - If set to false the content type dropdown won't show

tags
: optional - Adds preselected tags
