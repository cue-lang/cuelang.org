---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help mod mirror"
weight: 1000
tags:
- cue command
---
{{<info>}}
This command is still in an experimental stage -- it may be changed or removed at any time.
{{</info>}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgbW9kIG1pcnJvcg==" }
$ cue help mod mirror
WARNING: THIS COMMAND IS EXPERIMENTAL.

This commmand ensures that a set of modules and their dependencies
are available ("mirrored") in a registry.

For each module specified on the command line, it ensures that the module and
all the modules it depends on are present in both the "from" registry and the
"to" registry, and that the contents are the same in each. If --no-deps is
specified then the module will be mirrored without its dependencies.

A module may be specified as <module>@<version>, in which case the
specified version will be mirrored. If the version is canonical (for example v1.2.3), then
exactly that version will be mirrored, otherwise (for example v1) the latest
corresponding version will be mirrored (or all corresponding versions if --all-versions
is specified).

For example:

	# Copy from $CUE_REGISTRY (usually the Central Registry) to my.registry.example
	cue mod mirror --to my.registry.example foo.com/m1@v1.2.3 bar.org@v2

will copy the exact module foo.com/m1@v1.2.3 but the latest version
of bar.org@2, or all v2.x.y versions if --all-versions is given.
If no major version is specified, the latest major version will be chosen.

By default the latest version is chosen by consulting the source registry,
unless the --mod flag is specified, in which case the current module's
dependencies will be used. When --mod is given and no modules
are specified on the command line, all the current module's dependencies will
be mirrored.

Note that this command is not yet stable and may be changed.

Usage:
  cue mod mirror [module...] [flags]

Flags:
  -a, --all-versions   copy all available versions of the specified modules
  -n, --dry-run        only run simulation
      --from string    source registry (defaults to $CUE_REGISTRY)
  -m, --mod            mirror the current main module's dependency modules by default
      --no-deps        do not copy module dependencies
      --to string      destination registry (defaults to $CUE_REGISTRY)

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
```
