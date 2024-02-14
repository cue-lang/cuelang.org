---
title: Logging statistics from the CUE evaluator
tags:
- tooling
- cue command
authors:
- jpluscplusm
toc_hide: true
---

{{< columns >}}
The `cue` command can log various summary statistics about each evaluation it
performs, in order to assist with the diagnosis of performance-related and
other issues.

This guide demonstrates how to instruct `cue` to capture these statistics,
while evaluating this example CUE:

{{< columns-separator >}}
{{{with upload "en" "file"}}}
-- file.cue --
package example

x: 1
y: "2"
z: 3.33
{{{end}}}
{{< /columns >}}

## How to log statistics

Statistics are logged when the `CUE_STATS_FILE` environment variable is set.

{{< columns >}}
{{{with script "en" "filename cue"}}}
export CUE_STATS_FILE=stats.cue
cue vet file.cue
cat stats.cue
{{{end}}}

{{< columns-separator >}}
<!-- a little vertical whitespace makes the flow much nicer -->
&nbsp;\
The value of the variable is interpreted through the same rules that the `cue
export` command applies to its\
`--outfile` argument, as outlined in
[`cue filetypes`]({{< relref "docs/reference/cli/cue-filetypes" >}}).

Statistics for each evaluation are written into the named file using its
implied data format.

The file is overwritten on each `cue` invocation, without confirmation.
{{< /columns >}}

{{< columns >}}
&nbsp;\
The value `-` causes `cue` to log statistics to its standard error stream as JSON.

A different format may be selected by adding a qualifier prefix, as per
[`cue filetypes`]({{< relref "docs/reference/cli/cue-filetypes" >}}).

{{< columns-separator >}}

{{{with script "en" "stderr yaml"}}}
CUE_STATS_FILE=yaml:- cue vet file.cue
{{{end}}}
{{< /columns >}}

<!-- TODO: what do the emitted stats mean?
## Interpreting the statistics
-->

## Related content

- {{< issue 2856 >}}Issue #2856{{</issue>}} tracks future enhancements to the set of statistics captured by `cue`
- {{< linkto/related/reference "cli/cue-filetypes" >}}
