---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help mod resolve"
aliases: ["/docs/reference/cli/cue-mod-resolve/"]
weight: 1000
tags:
- cue command
---

```text { title="TERMINAL" codeToCopy="Y3VlIGhlbHAgbW9kIHJlc29sdmU=" }
$ cue help mod resolve
This command prints information about how a given
module path will resolve to an actual registry in the
form of an OCI reference.

If the module version (which must be a canonical semver version)
is omitted, it omits the tag from the reference.

It only consults local information - it works lexically
with respect to the registry configuration (see "cue help registryconfig")
and does not make any network calls to check whether
the module exists.

Note that this command is not yet stable and may be changed.

Usage:
  cue mod resolve <modulepath>[@<version>] ... [flags]

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --strict       report errors for lossy mappings
      --trace        trace computation
  -v, --verbose      print information about progress
```
