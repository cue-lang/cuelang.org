---
title: Conditionally including CUE files using build attributes
toc_hide: true
authors:
- jpluscplusm
tags:
- language
---

<!-- TODO: consider demonstrating more complex tag usage when https://github.com/cue-lang/cue/issues/3228 is resolved -->

This guide demonstrates how to include CUE files in an evaluation
conditionally, using build attributes.

The `example` CUE package is composed of three files:

{{< columns >}}
{{{with upload "en" "A.cue"}}}
-- A.cue --
package example

"data from A.cue": true
{{{end}}}
{{< columns-separator >}}
{{{with upload "en" "B.cue"}}}
-- B.cue --
@if(foo)
package example

"data from B.cue": true
{{{end}}}
{{< columns-separator >}}
{{{with upload "en" "C.cue"}}}
-- C.cue --
@if(!bar)
package example

"data from C.cue": true
{{{end}}}
{{< /columns >}}

The contents of `A.cue` are unconditionally included in each evaluation of the
package, but the contents of `B.cue` are only included when the `foo` tag is
present:

{{{with script "en" "no tags"}}}
cue export
{{{end}}}

{{{with script "en" "foo"}}}
cue export -t foo
{{{end}}}

The contents of `C.cue` are included only when the `bar` tag is *not* present:

{{{with script "en" "bar"}}}
cue export -t bar
{{{end}}}

Multiple tags may be present, which include and exclude files from the
evaluation as expected:

{{{with script "en" "foo & bar"}}}
cue export -t foo -t bar
{{{end}}}

## Related content

- {{< linkto/related/reference "cli/cue-injection" >}}
  -- injecting tags and values into `cue` command invocations
