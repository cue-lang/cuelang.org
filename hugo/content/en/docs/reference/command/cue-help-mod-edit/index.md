---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help mod edit"
weight: 1000
tags:
- cue command
- modules
---
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgbW9kIGVkaXQ=" }
$ cue help mod edit
Edit provides a command-line interface for editing cue.mod/module.cue.
It reads only that file; it does not look up information about the modules
involved.

The editing flags specify a sequence of editing operations.

The --require=path@version and --drop-require=path@majorversion flags add
and drop a requirement on the given module path and version. Note that
--require overrides any existing requirements on path. These flags are
mainly for tools that understand the module graph. Users should prefer
'cue mod get path@version' which makes other cue.mod adjustments as
needed to satisfy constraints imposed by other modules.

The --replace=path@majorversion=replacement and
--drop-replace=path@majorversion flags add and drop a module replace for
the given module path. A replacement is either a local directory or a module
path with version (e.g. example.com/bar@v0.1.0). Because module replaces
are not permitted in published modules, these edits are applied to
cue.mod/local-module.cue rather than cue.mod/module.cue.

The --module flag changes the module's path (the module.cue file's module field).
The --source flag changes the module's declared source.
The --drop-source flag removes the source field.

Usage:
  cue mod edit [flags]

Flags:
      --drop-replace string       remove a module replace from local-module.cue
      --drop-require string       remove a requirement
      --drop-source               remove the source field
      --language-version string   set language.version ('current' means current language version)
      --module string             set the module path
      --replace string            add a module replace (path@majorversion=replacement) to local-module.cue
      --require string            add a required module@version
      --source string             set the source field

Global Flags:
  -E, --all-errors     print all available errors
  -C, --chdir string   change working directory before running command (must be the first flag)
  -i, --ignore         proceed in the presence of errors
  -s, --simplify       simplify output
````

