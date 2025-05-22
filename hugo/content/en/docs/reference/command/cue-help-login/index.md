---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help login"
weight: 1000
tags:
- cue command
- modules
---
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgbG9naW4=" }
$ cue help login
Log into a CUE registry via the OAuth 2.0 Device Authorization Grant.
Without an argument, CUE_REGISTRY is used if it points to a single registry.

Use the --token flag to provide a token generated via the web interface,
removing the need for a human to interact with the OAuth device flow.

Once the authorization is successful, a token is stored in a logins.json file
inside $CUE_CONFIG_DIR; see 'cue help environment'.

Usage:
  cue login [registry] [flags]

Flags:
      --token string   provide an access token rather than starting the OAuth device flow

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
```
