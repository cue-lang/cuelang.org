---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help mod registry"
weight: 1000
tags:
- cue command
---
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgbW9kIHJlZ2lzdHJ5" }
$ cue help mod registry
This command starts an OCI-compliant server that stores all its
contents in memory. It can serve as a scratch CUE modules registry
for use in testing.

For example, start a local registry with:

	cue mod registry localhost:8080

and point CUE_REGISTRY to it to publish a module version:

	CUE_REGISTRY=localhost:8080 cue mod publish v0.0.1

Note: this command might be removed or changed significantly in the future.

Usage:
  cue mod registry [listen-address] [flags]

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
```
