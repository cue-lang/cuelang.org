---
title: Conditionally including CUE files using build attributes
toc_hide: true
authors:
- jpluscplusm
tags:
- language
---

This guide demonstrates how to include CUE files in an evaluation
conditionally, using build attributes.

Our `example` CUE package is composed of four files:

{{{with upload "en" "examples"}}}
# Separate the tagged files from the non-tagged, so that an example of a tagged
# file is always visible when the user scrolls back up the page from the
# command output.
#location left left left right
-- foo.cue --
@if(foo)
package example

"data from foo.cue": true
-- bar.cue --
@if(!bar)
package example

"data from bar.cue": true
-- qux.cue --
@if((foo && !bar) || (!foo && bar))
package example

"data from qux.cue": true
-- baz.cue --
package example

"data from baz.cue": true
{{{end}}}

The first three of these files contain
[build attributes]({{<relref"docs/reference/command/cue-help-injection">}}),
which control if the
file's contents are included in evaluations of the `example` package based on
the presence or absence of tags:

- `foo.cue` is only included when the `foo` tag is present.
- `bar.cue` is only included when the `bar` tag is *not* present.
- `qux.cue` is only included when one of the `bar` or `foo` tags is present
  (but not when both or neither are present).
- `baz.cue` is always included.

{{{with script "en" "no tags"}}}
cue export
cue export -t foo
cue export -t bar
cue export -t foo -t bar
{{{end}}}

{{< info >}}
The `foo` and `bar` tags are only aligned with their respective filenames to
help you understand their relationships in this example. **Tags and filenames
do not need to overlap in any way:** they are entirely unrelated strings.
{{< /info >}}

## Related content

- {{< linkto/related/reference "command/cue-help-injection" >}}
  -- injecting tags and values into `cue` command invocations
