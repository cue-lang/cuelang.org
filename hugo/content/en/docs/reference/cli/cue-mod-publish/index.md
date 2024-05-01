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

When the --dryrun flag is specified, nothing will actually be written
to a registry, but all other checks will take place.

The --json flag can be used to find out more information about the upload.

The --out flag can be used to write the module's contents to a directory
in OCI Image Layout format. See this link for more details on the format:
https://github.com/opencontainers/image-spec/blob/8f3820ccf8f65db8744e626df17fe8a64462aece/image-layout.md

Usage:
  cue mod publish <version> [flags]

Flags:
  -n, --dryrun       only run simulation
      --json         print verbose information in JSON format (implies --dryrun)
      --out string   write module contents to specified directory in OCI Image Layout format (implies --dryrun)

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --strict       report errors for lossy mappings
      --trace        trace computation
  -v, --verbose      print information about progress
```
