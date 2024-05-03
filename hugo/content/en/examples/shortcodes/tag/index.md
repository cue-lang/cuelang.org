---
title: Tag
weight: 33
---

To use tags inline use the `{{</* tag */>}}` shortcode.

The shortcode requires a single tag name as its first parameter,
with quotes being optional *unless* the tag name contains a space.
**Only tags present in the site Params will be displayed on pages.**

If a new tag is needed then add it:

- to `hugo/config/_default/params.toml` (via `site.cue`)
- to this example page, in both the source and preview forms

## Examples

```
Ecosystem: {{</* tag ecosystem */>}}
Encodings: {{</* tag encodings */>}}
Cue command: {{</* tag "cue command" */>}}
Language: {{</* tag language */>}}
Validation: {{</* tag validation */>}}
Tooling: {{</* tag tooling */>}}
Commented CUE: {{</* tag "commented cue" */>}}
User question: {{</* tag "user question" */>}}
Modules: {{</* tag modules */>}}
Go API: {{</* tag "go api" */>}}
```

Ecosystem: {{< tag ecosystem >}}\
Encodings: {{< tag encodings >}}\
Cue command: {{< tag "cue command" >}}\
Language: {{< tag language >}}\
Validation: {{< tag validation >}}\
Tooling: {{< tag tooling >}}\
Commented CUE: {{< tag "commented cue" >}}\
User question: {{< tag "user question" >}}\
Modules: {{< tag modules >}}\
Go API: {{< tag "go api" >}}
