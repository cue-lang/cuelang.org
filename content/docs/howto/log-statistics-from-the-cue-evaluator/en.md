---
title: Logging statistics from the CUE evaluator
tags:
- tooling
- cue command
authors:
- jpluscplusm
toc_hide: true
---

The `cue` command can log various summary statistics about each evaluation it
performs, in order to assist with the diagnosis of performance-related and
other issues.

This guide demonstrates how to instruct `cue` to capture these statistics,
while evaluating this example CUE:

{{{with upload "en" "file"}}}
-- file.cue --
package example

x: 1
y: "2"
z: 3.33
{{{end}}}

## Logging statistics

Statistics are logged when the `CUE_STATS_FILE` environment variable is set.

The value of the variable is interpreted through the same rules that the
`cue export` command applies to its\
`--outfile` argument, as outlined in
[`cue filetypes`]({{< relref "docs/reference/cli/cue-filetypes" >}}).

### Logging statistics to a file

When `CUE_STATS_FILE` is set to a filename, statistics for each evaluation are
written into the named file using its implied data format.
The file is overwritten on each `cue` invocation, without confirmation.

{{{with script "en" "filename cue"}}}
export CUE_STATS_FILE=stats.cue
cue vet file.cue
cat stats.cue
{{{end}}}


### Logging statistics to standard error

When `CUE_STATS_FILE` is set to the value `-`, statistics for each evaluation
are logged to the `cue` command's standard error stream as JSON.
As demonstrated here, a different format may be selected by adding a qualifier prefix:

{{{with script "en" "stderr yaml"}}}
CUE_STATS_FILE=yaml:- cue vet file.cue
{{{end}}}

<!-- TODO: what do the emitted stats mean?
## Interpreting the statistics
-->

## Related content

- {{< issue 2856 >}}Issue #2856{{</issue>}} tracks future enhancements to the set of statistics captured by `cue`
- {{< linkto/related/reference "cli/cue-filetypes" >}}
