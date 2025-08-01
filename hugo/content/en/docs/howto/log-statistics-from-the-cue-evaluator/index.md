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
[`cue help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes" >}}).
Statistics for each evaluation are written into the named file using the file's
implied data format.
The file is overwritten on each `cue` invocation, without confirmation.

<!--more-->

```text { title="TERMINAL" type="terminal" codeToCopy="ZXhwb3J0IENVRV9TVEFUU19GSUxFPXN0YXRzLmN1ZQpjdWUgdmV0IC1jIHNvbWVGaWxlLmN1ZQpjYXQgc3RhdHMuY3Vl" }
$ export CUE_STATS_FILE=stats.cue
$ cue vet -c someFile.cue
$ cat stats.cue
CUE: {
	EvalVersion:          3
	Unifications:         4
	Disjuncts:            0
	Notifications:        0
	Conjuncts:            4
	NumCloseIDs:          0
	ConjunctInfos:        4
	MaxConjunctInfos:     1
	MaxReqSets:           0
	MaxRedirect:          0
	GenerationMismatch:   0
	MisalignedConjunct:   0
	MisalignedConstraint: 0
	SkippedNotification:  0
	Freed:                4
	Reused:               0
	Allocs:               4
	Retained:             0
}
Go: {
	AllocBytes:   1413392
	AllocObjects: 7522
}
```

Specifying the filename `-` causes `cue` to log statistics to its standard error stream as JSON.
A different format may be selected using a qualifier prefix as outlined in
[`cue help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes" >}}).
For example: to emit YAML, specify `yaml:-`.

<!-- TODO: what do the emitted stats mean?
## Interpreting the statistics
-->

## Related content

- {{< issue 2856 >}}Issue #2856{{</issue>}} tracks enhancements to the set of statistics captured by `cue`
- {{< linkto/related/reference "command/cue-help-filetypes" >}}
