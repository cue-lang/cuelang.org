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

```cue { title="file.cue" }
package example

x: 1
y: "2"
z: 3.33
```

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

```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9TVEFUU19GSUxFPXN0YXRzLmN1ZQpjdWUgdmV0IGZpbGUuY3VlCmNhdCBzdGF0cy5jdWU=" }
$ export CUE_STATS_FILE=stats.cue
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
	AllocBytes:   6005696
	AllocObjects: 71780
}
```


### Logging statistics to standard error

When `CUE_STATS_FILE` is set to the value `-`, statistics for each evaluation
are logged to the `cue` command's standard error stream as JSON.
As demonstrated here, a different format may be selected by adding a qualifier prefix:

```text { title="TERMINAL" codeToCopy="Q1VFX1NUQVRTX0ZJTEU9eWFtbDotIGN1ZSB2ZXQgZmlsZS5jdWU=" }
$ CUE_STATS_FILE=yaml:- cue vet file.cue
CUE:
  Unifications: 4
  Disjuncts: 4
  Conjuncts: 4
  Freed: 4
  Reused: 2
  Allocs: 2
  Retained: 0
Go:
  AllocBytes: 4920768
  AllocObjects: 56675
```

<!-- TODO: what do the emitted stats mean?
## Interpreting the statistics
-->

## Related content

- {{< issue 2856 >}}Issue #2856{{</issue>}} tracks future enhancements to the set of statistics captured by `cue`
- {{< linkto/related/reference "cli/cue-filetypes" >}}
