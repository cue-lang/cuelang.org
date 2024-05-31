---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue mod edit"
tags:
- cue command
---

```text { title="TERMINAL" codeToCopy="Y3VlIGhlbHAgbW9kIGVkaXQ=" }
$ cue help mod edit
Edit provides a command-line interface for editing cue.mod/module.cue.
It reads only that file; it does not look up information about the modules
involved.

The editing flags specify a sequence of editing operations.

The -require=path@version and -drop-require=path@majorversion flags add
and drop a requirement on the given module path and version. Note that
-require overrides any existing requirements on path. These flags are
mainly for tools that understand the module graph. Users should prefer
'cue get path@version' which makes other go.mod adjustments as needed
to satisfy constraints imposed by other modules.

The --module flag changes the module's path (the module.cue file's module field).
The --source flag changes the module's declared source.
The --drop-source flag removes the source field.

Note that this command is not yet stable and may be changed.

Usage:
  cue mod edit [flags]

Flags:
      --drop-require string   remove a requirement
      --drop-source           remove the source field (default )
      --module string         set the module path
      --require string        add a required module@version
      --source string         set the source field

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --strict       report errors for lossy mappings
      --trace        trace computation
  -v, --verbose      print information about progress
```
