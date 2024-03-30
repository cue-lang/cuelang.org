---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue completion"
tags:
- cue command
---

```text { title="TERMINAL" codeToCopy="Y3VlIGhlbHAgY29tcGxldGlvbg==" }
$ cue help completion
Generate completion script

Usage:
  cue completion [bash zsh fish powershell] [flags]

Examples:

Bash:

$ source <(cue completion bash)

# To load completions for each session, execute once:
Linux:
  $ cue completion bash > /etc/bash_completion.d/cue
MacOS:
  $ cue completion bash > /usr/local/etc/bash_completion.d/cue

Zsh:

$ source <(cue completion zsh)

# To load completions for each session, execute once:
$ cue completion zsh > "${fpath[1]}/_cue"

Fish:

$ cue completion fish | source

# To load completions for each session, execute once:
$ cue completion fish > ~/.config/fish/completions/cue.fish


Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --strict       report errors for lossy mappings
      --trace        trace computation
  -v, --verbose      print information about progress
```
