---
title: Search
weight: 25
---

With this shortcode you can embed a search results widget on the page.

## Example

```
{{</* search contentType="Tutorials" showContentTypes=false tags="encodings,cue command" searchTerm="\"json schema\"" */>}}
```

{{< search contentType="Tutorials" showContentTypes=false tags="encodings,cue command" searchTerm="\"json schema\"" >}}


## Attributes

contentType
: required when showContentTypes is false - Enter the preselected content type

showContentTypes
: optional - If set to false the content type dropdown won't show

tags
: optional - Adds preselected tags

searchTerm
: optional - Prefills the search bar
