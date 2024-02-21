---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue mod tidy"
tags:
- cue command
---

```text { title="TERMINAL" codeToCopy="Y3VlIGhlbHAgbW9kIHRpZHkK" }
$ cue help mod tidy
WARNING: THIS COMMAND IS EXPERIMENTAL.

Tidy resolves all module dependencies in the current module and updates
the cue.mod/module.cue file to reflect them.

It also removes dependencies that are not needed.

It will attempt to fetch modules that aren't yet present in the
dependencies by fetching the latest available version from
a registry.

See "cue help environment" for details on how $CUE_REGISTRY is used to
determine the modules registry.

Note: you must enable the modules experiment with:
	export CUE_EXPERIMENT=modules
for this command to work.

Usage:
  cue mod tidy [flags]

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --strict       report errors for lossy mappings
      --trace        trace computation
  -v, --verbose      print information about progress
```
