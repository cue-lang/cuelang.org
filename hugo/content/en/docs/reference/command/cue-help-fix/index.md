---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help fix"
aliases: ["/docs/reference/cli/cue-fix/"]
weight: 1000
tags:
- cue command
---

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgZml4" }
$ cue help fix
Fix finds CUE programs that use old syntax and old APIs and rewrites them to use newer ones.
After you update to a new CUE release, fix helps make the necessary changes
to your program.

Without any packages, fix applies to all files within a module.

Usage:
  cue fix [packages] [flags]

Flags:
  -f, --force   rewrite even when there are errors

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
```
