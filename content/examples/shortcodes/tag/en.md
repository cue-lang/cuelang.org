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
- to this example page, in both the source and preview forms, **including a
  trailing description of the kinds of pages which should be tagged with the
  tag**

## Examples

```
{{</* tag "commented cue" */>}}: How To guides that use the "Commented CUE" form\
{{</* tag "cue command" */>}}: TODO\
{{</* tag "go api" */>}}: Pages including non-trivial mentions of the CUE Go API\
{{</* tag "user question" */>}}: Pages written in the specific Q&A narrative style\
{{</* tag "workflow command" */>}}: Pages including non-trivial mentions of workflow commands\
{{</* tag ecosystem */>}}: TODO\
{{</* tag encodings */>}}: TODO\
{{</* tag language */>}}: TODO\
{{</* tag modules */>}}: Pages including non-trivial mentions of CUE modules\
{{</* tag tooling */>}}: TODO\
{{</* tag validation */>}}: TODO
```

{{< tag "commented cue" >}}: How To guides that use the "Commented CUE" form\
{{< tag "cue command" >}}: TODO\
{{< tag "go api" >}}: Pages including non-trivial mentions of the CUE Go API\
{{< tag "user question" >}}: Pages written in the specific Q&A narrative style\
{{< tag "workflow command" >}}: Pages including non-trivial mentions of workflow commands\
{{< tag ecosystem >}}: TODO\
{{< tag encodings >}}: TODO\
{{< tag language >}}: TODO\
{{< tag modules >}}: Pages including non-trivial mentions of CUE modules\
{{< tag tooling >}}: TODO\
{{< tag validation >}}: TODO
