---
title: Logging statistics from the CUE evaluator
tags:
- tooling
- cue command
toc_hide: true
---

## Introduction

The `cue` tool can log various summary statistics about each evaluation it
performs, in order to assist with the diagnosis of performance-related and
other issues. The format and location where `cue` writes these statistics is
controlled by the `CUE_STATS_FILE` environment variable, which must be set in
the `cue` tool's invocation environment.

In this guide we will demonstrate various values that `CUE_STATS_FILE` accepts,
and their effects on the output format and location.

## Context

All the demonstrations shown in this guide are with the following CUE file in
scope. Its specific contents are unimportant.

```cue { title="file.cue" }
package example

x: 1
y: "2"
z: 3.33
```

## `CUE_STATS_FILE`'s value

The value of the `CUE_STATS_FILE` environment variable is interpreted through
the same rules that the `cue export` command applies to its `--outfile`
argument.

The rules are documented in
[`cue filetypes`]({{< relref "docs/reference/cli/cue-filetypes" >}}).

## Example: `CUE_STATS_FILE` set to a CUE, JSON, or YAML filename

Setting `CUE_STATS_FILE` to a value ending in `.cue`, `.json`, `.yml` or
`.yaml` results in the value being interpreted as a filename. The statistics
for each evaluation are written into the file using the data format indicated
by the filename suffix. The file is overwritten on each `cue` invocation,
without confirmation.

For example:

```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9TVEFUU19GSUxFPXN0YXRzLmN1ZQplY2hvICJUaGlzIHdpbGwgYmUgb3ZlcndyaXR0ZW4iID4kQ1VFX1NUQVRTX0ZJTEUKY3VlIHZldCBmaWxlLmN1ZQpjYXQgc3RhdHMuY3VlCg==" }
$ export CUE_STATS_FILE=stats.cue
$ echo "This will be overwritten" >$CUE_STATS_FILE
$ cue vet file.cue
$ cat stats.cue
CUE: {
	Unifications: 4
	Disjuncts:    4
	Conjuncts:    4
	Freed:        4
	Reused:       2
	Allocs:       2
	Retained:     0
}
Go: {
	AllocBytes:   5942152
	AllocObjects: 71556
}
```

{{< info >}}
Any CUE files emitted by the statistics logging do not contain a package
statement, so they do not belong to any package - hence their contents are not
unified during future `cue` invocations.

It is safe to instruct `cue` to create such a CUE file in the `cue` tool's
working directory **unless** you invoke the tool with globs such as `cue export
*.cue`.
{{< /info >}}

## Example: `CUE_STATS_FILE` set to the filename "`-`"

Setting `CUE_STATS_FILE` to the string `-` indicates that statistics should be
logged to the `cue` tool's standard error stream, using the default data format
of JSON:

```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9TVEFUU19GSUxFPS0KY3VlIGV4cG9ydCBmaWxlLmN1ZSA+L2Rldi9udWxsCg==" }
$ export CUE_STATS_FILE=-
$ cue export file.cue >/dev/null
{
    "CUE": {
        "Unifications": 4,
        "Disjuncts": 4,
        "Conjuncts": 4,
        "Freed": 4,
        "Reused": 2,
        "Allocs": 2,
        "Retained": 0
    },
    "Go": {
        "AllocBytes": 4911816,
        "AllocObjects": 56746
    }
}
```

A different format may be selected with a qualifier, as documented in
[`cue filetypes`]({{< relref "docs/reference/cli/cue-filetypes" >}}):

```text { title="TERMINAL" codeToCopy="Q1VFX1NUQVRTX0ZJTEU9Y3VlOi0gY3VlIGV4cG9ydCBmaWxlLmN1ZSA+L2Rldi9udWxsCg==" }
$ CUE_STATS_FILE=cue:- cue export file.cue >/dev/null
CUE: {
	Unifications: 4
	Disjuncts:    4
	Conjuncts:    4
	Freed:        4
	Reused:       2
	Allocs:       2
	Retained:     0
}
Go: {
	AllocBytes:   5986376
	AllocObjects: 71843
}
```

{{< warning >}}
Using the `text` qualifier prevents any statistics from being logged.

Additionally, only those qualifiers relating to valid `cue` tool output formats
are permitted. For example, including the `go` modifier causes `cue`
invocations to fail.
{{< /warning >}}

<!-- TODO: what do the emitted stats mean?
## Interpreting the statistics
-->

## Related content

- {{< linkto/related/reference "cli/cue-filetypes" >}}
