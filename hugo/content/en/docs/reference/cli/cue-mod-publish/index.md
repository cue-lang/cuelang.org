---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue mod publish"
tags:
- cue command
---

```text { title="TERMINAL" codeToCopy="Y3VlIGhlbHAgbW9kIHB1Ymxpc2g=" }
$ cue help mod publish
WARNING: THIS COMMAND IS EXPERIMENTAL.

Publish the current module to an OCI registry. It consults
$CUE_REGISTRY to determine where the module should be published (see
"cue help environment" for details). Also note that this command does
no dependency or other checks at the moment.

Note: you must enable the modules experiment with:
	export CUE_EXPERIMENT=modules
for this command to work.

Usage:
  cue mod publish <version> [flags]

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --strict       report errors for lossy mappings
      --trace        trace computation
  -v, --verbose      print information about progress
```
