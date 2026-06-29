---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help cmd"
weight: 1000
tags:
- cue command
- workflow command
---
````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgY21k" }
$ cue help cmd
cmd executes the named workflow command for each of the named instances.

Workflow commands are defined in tool files, which are regular CUE
files within the same package with a filename ending in _tool.cue.

Run "cue help commands" for more details on authoring tasks and
workflow commands.

Usage:
  cue cmd [flags] <name> [inputs]

Flags:
  -t, --inject stringArray   set the value of a tagged field
  -T, --inject-vars          inject system variables in tags (default true)

Global Flags:
  -E, --all-errors     print all available errors
  -C, --chdir string   change working directory before running command (must be the first flag)
  -i, --ignore         proceed in the presence of errors
  -s, --simplify       simplify output
````

## Related content

- {{< linkto/related/reference "command/cue-help-commands" >}}
