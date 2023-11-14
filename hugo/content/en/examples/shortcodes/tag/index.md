---
title: Tag
weight: 33
---

To use tags inline use the `{{</* tag */>}}` shortcode. Just add the tag name to the shortcode.
Use quotes around the tag name if it contains a space. Only the tags added to the site Params will work.
If a new tag is needed, also add that one to the params.toml.

## Examples

```
Ecosystem: {{</* tag ecosystem */>}}

Encodings: {{</* tag encodings */>}}

Cue command: {{</* tag "cue command" */>}}

Language: {{</* tag language */>}}

Validation: {{</* tag validation */>}}

Tooling: {{</* tag tooling */>}}

Commented Cue: {{</* tag "commented cue" */>}}
```

Ecosystem: {{< tag ecosystem >}}

Encodings: {{< tag encodings >}}

Cue command: {{< tag "cue command" >}}

Language: {{< tag language >}}

Validation: {{< tag validation >}}

Tooling: {{< tag tooling >}}

Commented Cue: {{< tag "commented cue" >}}
