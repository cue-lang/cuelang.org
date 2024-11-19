---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help get"
aliases: ["/docs/reference/cli/cue-get/"]
weight: 1000
tags:
- cue command
---

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgZ2V0" }
$ cue help get
Get downloads packages or modules for non-CUE languages
to include them in the module's pkg directory.

Get requires an additional language field to determine for which
language definitions should be fetched. Definitions are extracted
from the source of the respective language and stored.
The specifics on how dependencies are fetched and converted vary
per language and are documented in the respective subcommands.

For information on native CUE modules:

    cue help modules

Usage:
  cue get <language> [packages] [flags]
  cue get [command]

Available Commands:
  go          add Go dependencies to the current module

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress

Use "cue get [command] --help" for more information about a command.
```
