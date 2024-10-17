---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help mod publish"
aliases: ["/docs/reference/cli/cue-mod-publish/"]
weight: 1000
tags:
- cue command
- modules
---

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgbW9kIHB1Ymxpc2g=" }
$ cue help mod publish
Publish the current module to an OCI registry. It consults
$CUE_REGISTRY to determine where the module should be published (see
"cue help environment" for details). Also note that this command does
no dependency or other checks at the moment.

When the --dry-run flag is specified, nothing will actually be written
to a registry, but all other checks will take place.

The --json flag can be used to find out more information about the upload.

The --out flag can be used to write the module's contents to a directory
in OCI Image Layout format. See this link for more details on the format:
https://github.com/opencontainers/image-spec/blob/8f3820ccf8f65db8744e626df17fe8a64462aece/image-layout.md

Note that this command is not yet stable and may be changed.

Usage:
  cue mod publish <version> [flags]

Flags:
  -n, --dry-run      only run simulation
      --json         print verbose information in JSON format (implies --dry-run)
      --out string   write module contents to specified directory in OCI Image Layout format (implies --dry-run)

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
```

## Related content

- {{< linkto/related/reference "command/cue-help-environment" >}}