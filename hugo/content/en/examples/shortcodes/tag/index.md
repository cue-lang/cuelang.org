---
title: Tag
weight: 33
---

To use tags inline use the `{{</* tag */>}}` shortcode. Just add the tag name to the shortcode.
Use quotes around the tag name if it contains a space.

Only tags present in the site Params will be displayed.

If a new tag is needed then add it to `hugo/config/_default/params.toml` (via
`site.cue`), and also to this example page (to confirm that it has been added
correctly, and as a preview).

## Examples

```
Ecosystem: {{</* tag ecosystem */>}}

Encodings: {{</* tag encodings */>}}

Cue command: {{</* tag "cue command" */>}}

Language: {{</* tag language */>}}

Validation: {{</* tag validation */>}}

Tooling: {{</* tag tooling */>}}

Commented Cue: {{</* tag "commented cue" */>}}

Modules: {{</* tag modules */>}}
```

Ecosystem: {{< tag ecosystem >}}

Encodings: {{< tag encodings >}}

Cue command: {{< tag "cue command" >}}

Language: {{< tag language >}}

Validation: {{< tag validation >}}

Tooling: {{< tag tooling >}}

Commented Cue: {{< tag "commented cue" >}}

Modules: {{< tag modules >}}
