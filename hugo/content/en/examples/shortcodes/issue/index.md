---
title: cue-lang/cue GitHub Issue
weight: 35
---

The site's Netlify deployment redirects all HTTP requests to URLs starting
`/issue/[:number]` to `https://github.com/cue-lang/cue/issue/[:number]`, and
the `issue` shortcode generates links to these URLs.

Standard Hugo shortcodes such as `relref` and `ref` can't be used for this
purpose as the Netlify redirect doesn't exist on disk (as far as Hugo is
concerned), so the build-time page-existence check fails.

### Usage

To emit a link to an issue with the user-visible text `issue #<issue-number>`,
use the shortcode with a self-closing tag:

```
Check out {{</*issue 123/*/>}}.
```

To use custom user-visible text, use a non-self-closing tag and include the
text between the tags.

```
{{</*issue 123*/>}}Issue #123{{</*/issue*/>}} is worth checking out.
```

Markdown works inside such links, and this shortcode works inside
info/warning/etc blocks:

```
... info opening tag omitted ...
Be aware of {{</*issue 123*/>}}`cue-lang/cue` *issue* **#123**{{</*/issue*/>}}.
... info closing tag omitted ...
```

## Attributes

None.

## Examples

```markdown
This is {{</*issue 123/*/>}} directly followed by a whitespace character.
This is {{</*issue 123*/>}}discussion #123{{</*/issue*/>}} directly followed by a whitespace character.
There is punctuation directly following {{</*issue 123/*/>}}.
There is punctuation directly following {{</*issue 123*/>}}discussion #123{{</*/issue*/>}}.
{{</*info*/>}}
Be aware of {{</*issue 123*/>}}`cue-lang/cue` *issue* **#123**{{</*/issue*/>}}.
{{</*/info*/>}}
```

This is {{<issue 123/>}} directly followed by a whitespace character.\
This is {{<issue 123>}}discussion #123{{</issue>}} directly followed by a whitespace character.\
There is punctuation directly following {{<issue 123/>}}.\
There is punctuation directly following {{<issue 123>}}discussion #123{{</issue>}}.

{{<info>}}
Be aware of {{<issue 123>}}`cue-lang/cue` *issue* **#123**{{</issue>}}.
{{</info>}}
