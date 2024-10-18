---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help login"
aliases: ["/docs/reference/cli/cue-login/"]
weight: 1000
tags:
- cue command
- modules
---

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgbG9naW4=" }
$ cue help login
WARNING: THIS COMMAND IS EXPERIMENTAL.

Log into a CUE registry via the OAuth 2.0 Device Authorization Grant.
Without an argument, CUE_REGISTRY is used if it points to a single registry.

Once the authorization is successful, a token is stored in a logins.json file
inside $CUE_CONFIG_DIR; see 'cue help environment'.

Usage:
  cue login [registry] [flags]

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
```
