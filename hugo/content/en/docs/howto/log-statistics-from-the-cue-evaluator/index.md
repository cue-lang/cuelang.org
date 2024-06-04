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
other issues. The command logs statistics when the `CUE_STATS_FILE` environment
variable is set to a filename.

The filename is interpreted through the same rules that `cue export` applies to
its `--outfile` argument, which are explained in
[`cue filetypes`]({{< relref "docs/reference/cli/cue-filetypes" >}}).
Statistics for each evaluation are written into the named file using the file's
implied data format.
The file is overwritten on each `cue` invocation, without confirmation.

```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9TVEFUU19GSUxFPXN0YXRzLmN1ZQpjdWUgdmV0IHNvbWVGaWxlLmN1ZQpjYXQgc3RhdHMuY3Vl" }
$ export CUE_STATS_FILE=stats.cue
$ cue vet someFile.cue
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
	AllocBytes:   4437456
	AllocObjects: 45187
}
```

Specifying the filename `-` causes `cue` to log statistics to its standard error stream as JSON.
A different format may be selected using a qualifier prefix as outlined in
[`cue filetypes`]({{< relref "docs/reference/cli/cue-filetypes" >}}).
For example: to emit YAML, specify `yaml:-`.

<!-- TODO: what do the emitted stats mean?
## Interpreting the statistics
-->

## Related content

- {{< issue 2856 >}}Issue #2856{{</issue>}} tracks enhancements to the set of statistics captured by `cue`
- {{< linkto/related/reference "cli/cue-filetypes" >}}
