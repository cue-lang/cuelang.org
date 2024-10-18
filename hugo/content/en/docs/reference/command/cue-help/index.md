---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help"
aliases: ["/docs/reference/cli/cue/"]
weight: 1000
tags:
- cue command
---

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHA=" }
$ cue help
cue evaluates CUE files, an extension of JSON, and sends them
to user-defined commands for processing.

Commands are defined in CUE as follows:

	import "tool/exec"
	command: deploy: {
		exec.Run
		cmd:   "kubectl"
		args:  ["-f", "deploy"]
		in:    json.Encode(userValue) // encode the emitted configuration.
	}

cue can also combine the results of http or grpc request with the input
configuration for further processing. For more information on defining commands
run 'cue help cmd' or go to cuelang.org/pkg/cmd.

For more information on writing CUE configuration files see cuelang.org.

Usage:
  cue [command]

Available Commands:
  cmd         run a user-defined workflow command
  completion  Generate completion script
  def         print consolidated definitions
  eval        evaluate and print a configuration
  export      output data in a standard format
  fix         rewrite packages to latest standards
  fmt         formats CUE configuration files
  get         add non-CUE dependencies to the current module
  import      convert other formats to CUE files
  login       log into a CUE registry
  mod         module maintenance
  trim        remove superfluous fields
  version     print CUE version
  vet         validate data

Use "cue help [command]" for more information about a command.

Additional help topics:
  cue help commands       user-defined commands
  cue help embed          file embedding
  cue help environment    environment variables
  cue help filetypes      supported file types and qualifiers
  cue help flags          common flags for composing packages
  cue help injection      inject files or values into specific fields for a build
  cue help inputs         package list, patterns, and files
  cue help modules        module support
  cue help registryconfig module registry configuration
```
