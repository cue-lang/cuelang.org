---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue get"
tags:
- cue command
---

```text { title="TERMINAL" codeToCopy="Y3VlIGhlbHAgZ2V0Cg==" }
$ cue help get
Get downloads packages or modules for CUE or another language
to include them in the module's pkg directory.

Get requires an additional language field to determine for which
language definitions should be fetched. If get fetches definitions
for a language other than CUE, the definitions are extracted from
the source of the respective language and stored.
The specifics on how dependencies are fechted and converted vary
per language and are documented in the respective subcommands.

Usage:
  cue get <language> [packages] [flags]
  cue get [command]

Available Commands:
  go          add Go dependencies to the current module

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --strict       report errors for lossy mappings
      --trace        trace computation
  -v, --verbose      print information about progress

Use "cue get [command] --help" for more information about a command.
```
