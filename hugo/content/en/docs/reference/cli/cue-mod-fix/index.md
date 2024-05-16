---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue mod fix"
tags:
- cue command
---

```text { title="TERMINAL" codeToCopy="Y3VlIGhlbHAgbW9kIGZpeA==" }
$ cue help mod fix
WARNING: THIS COMMAND IS EXPERIMENTAL.

Fix provides a way to migrate from a legacy module.cue file
to the new standard syntax. It

- adds a language.version field
- moves unrecognized fields into the custom.legacy field
- adds a major version to the module path

If there is no module path, it chooses an arbitrary path (test.example@v0).

If the module.cue file is already compatible with the new syntax,
it is just formatted without making any other changes.

Note: you must enable the modules experiment with:
	export CUE_EXPERIMENT=modules
for this command to work.

Usage:
  cue mod fix [flags]

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --strict       report errors for lossy mappings
      --trace        trace computation
  -v, --verbose      print information about progress
```
