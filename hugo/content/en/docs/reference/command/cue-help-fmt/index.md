---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help fmt"
aliases: ["/docs/reference/cli/cue-fmt/"]
weight: 1000
tags:
- cue command
---

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgZm10" }
$ cue help fmt
Fmt formats the given files or the files for the given packages in place

Arguments are interpreted as import paths (see 'cue help inputs') unless --files is set,
in which case the arguments are file paths to descend into and format all CUE files.
Directories named "cue.mod" and those beginning with "." and "_" are skipped unless
given as explicit arguments.

Usage:
  cue fmt [-s] [inputs] [flags]

Flags:
      --check   exits with non-zero status if any files are not formatted
  -d, --diff    display diffs instead of rewriting files
      --files   treat arguments as file paths to descend into rather than import paths

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
```
