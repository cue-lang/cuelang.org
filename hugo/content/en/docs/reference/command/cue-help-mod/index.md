---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help mod"
aliases: ["/docs/reference/cli/cue-mod/"]
weight: 1000
tags:
- cue command
- modules
---

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgbW9k" }
$ cue help mod
Mod groups commands which operate on CUE modules.

Note that support for modules is built into all the cue commands, not
just 'cue mod'.

See also:
	cue help modules

Usage:
  cue mod <cmd> [arguments] [flags]
  cue mod [command]

Available Commands:
  edit        edit cue.mod/module.cue
  fix         fix a legacy cue.mod/module.cue file
  get         add and upgrade module dependencies
  init        initialize new module in current directory
  publish     publish the current module to a registry
  resolve     Show how a module path resolves to a registry
  tidy        download and tidy module dependencies

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress

Use "cue mod [command] --help" for more information about a command.
```

## Related content

- {{< linkto/related/reference "command/cue-help-modules" >}}
- {{< linkto/related/reference "command/cue-help-mod-edit" >}}
- {{< linkto/related/reference "command/cue-help-mod-fix" >}}
- {{< linkto/related/reference "command/cue-help-mod-get" >}}
- {{< linkto/related/reference "command/cue-help-mod-init" >}}
- {{< linkto/related/reference "command/cue-help-mod-publish" >}}
- {{< linkto/related/reference "command/cue-help-mod-resolve" >}}
- {{< linkto/related/reference "command/cue-help-mod-tidy" >}}