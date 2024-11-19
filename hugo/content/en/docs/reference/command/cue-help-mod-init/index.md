---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help mod init"
aliases: ["/docs/reference/cli/cue-mod-init/"]
weight: 1000
tags:
- cue command
- modules
---

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgbW9kIGluaXQ=" }
$ cue help mod init
Init initializes a cue.mod directory in the current directory, in effect
creating a new module rooted at the current directory. The cue.mod
directory must not already exist. A legacy cue.mod file in the current
directory is moved to the new subdirectory.

If the module name is not provided, a default module path (cue.example) will be
used.

Usage:
  cue mod init [module] [flags]

Flags:
  -f, --force                     force moving old-style cue.mod file
      --language-version string   set the language version ('current' means current language version) (default "current")
      --source string             set the source field

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
```
