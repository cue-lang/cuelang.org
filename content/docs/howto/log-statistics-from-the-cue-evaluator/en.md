---
title: Logging statistics from the CUE evaluator
tags:
- tooling
- cue command
authors:
- jpluscplusm
toc_hide: true
---

## Introduction

The `cue` tool can log various summary statistics about each evaluation it
performs, in order to assist with the diagnosis of performance-related and
other issues. The output format and location of these statistics are controlled
by the `CUE_STATS_FILE` environment variable, which must be set in `cue`'s
invocation environment.

This guide demonstrates various values that `CUE_STATS_FILE` accepts, and their
effects on the output format and location.

## Context

All the examples shown in this guide run with the following CUE file in scope.
Its specific contents are unimportant.

{{{with upload "en" "file"}}}
-- file.cue --
package example

x: 1
y: "2"
z: 3.33
{{{end}}}

## CUE_STATS_FILE's value

The value of the `CUE_STATS_FILE` environment variable is interpreted through
the same rules that the `cue export` command applies to its `--outfile`
argument. These rules are documented in
[`cue filetypes`]({{< relref "docs/reference/cli/cue-filetypes" >}}).

## CUE_STATS_FILE set to a CUE, JSON, or YAML filename

Setting `CUE_STATS_FILE` to a value ending in `.cue`, `.json`, `.yml` or
`.yaml` results in the value being interpreted as a filename. Relative
filenames are resolved with respect to `cue`'s working directory.

The statistics for each evaluation are written into the named file using the
data format implied by the filename suffix. The file is overwritten on each
`cue` invocation, without confirmation.

For example:

{{{with script "en" "set to a filename"}}}
export CUE_STATS_FILE=stats.cue
echo "This will be overwritten" >$CUE_STATS_FILE
cue vet file.cue
cat stats.cue
{{{end}}}

{{< info >}}
Any CUE files emitted by the statistics logging do not contain a package
statement, so they do not belong to any package and their contents are
generally not included in package-level unification by future `cue`
invocations.

It is safe to allow `cue` to create a packageless CUE file in its working
directory **unless** you invoke the tool with globs, such as `cue export
*.cue`.
{{< /info >}}

## CUE_STATS_FILE set to the string "-"

Setting `CUE_STATS_FILE` to the string `-` indicates that statistics should be
logged to `cue`'s standard error stream, using the default output format of
JSON:

{{{with script "en" "stderr"}}}
export CUE_STATS_FILE=-
cue export file.cue >/dev/null
{{{end}}}

A different format may be selected with a qualifier, as documented in
[`cue filetypes`]({{< relref "docs/reference/cli/cue-filetypes" >}}):

{{{with script "en" "stderr-cue"}}}
CUE_STATS_FILE=yaml:- cue export file.cue >/dev/null
{{{end}}}

{{< warning >}}
Using the `text` qualifier prevents any statistics from being logged.

Only those qualifiers relating to valid `cue` output formats are permitted. For
example, including the `go` qualifier causes `cue` invocations to fail.
{{< /warning >}}

<!-- TODO: what do the emitted stats mean?
## Interpreting the statistics
-->

## Related content

- {{< linkto/related/reference "cli/cue-filetypes" >}}
