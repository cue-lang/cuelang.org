---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help mod tidy"
aliases: ["/docs/reference/cli/cue-mod-tidy/"]
weight: 1000
tags:
- cue command
- modules
---

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgbW9kIHRpZHk=" }
$ cue help mod tidy
Tidy resolves all module dependencies in the current module and updates
the cue.mod/module.cue file to reflect them.

It also removes dependencies that are not needed.

It will attempt to fetch modules that aren't yet present in the
dependencies by fetching the latest available version from
a registry.

See "cue help environment" for details on how $CUE_REGISTRY is used to
determine the modules registry.

Note that this command is not yet stable and may be changed.

Usage:
  cue mod tidy [flags]

Flags:
      --check   check for tidiness only; do not update module.cue file

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
```

## Related content

- {{< linkto/related/reference "command/cue-help-environment" >}}