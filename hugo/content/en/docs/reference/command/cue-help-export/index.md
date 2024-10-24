---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help export"
aliases: ["/docs/reference/cli/cue-export/"]
weight: 1000
tags:
- cue command
---

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgZXhwb3J0" }
$ cue help export
export evaluates the configuration found in the current
directory and prints the emit value to stdout.

Examples:
Evaluated and emit

	# a single file
	cue export config.cue

	# multiple files: these are combined at the top-level. Order doesn't matter.
	cue export file1.cue foo/file2.cue

	# all files within the "mypkg" package: this includes all files in the
	# current directory and its ancestor directories that are marked with the
	# same package.
	cue export -p cloud

	# the -p flag can be omitted if the directory only contains files for
	# the "mypkg" package.
	cue export

Emit value:
For CUE files, the generated configuration is derived from the top-level
single expression, the emit value. For example, the file

	// config.cue
	arg1: 1
	arg2: "my string"

	{
		a: arg1
		b: arg2
	}

yields the following JSON:

	{
		"arg1": 1,
		"a": 1,
		"arg2": "my string",
		"b": "my string"
	}

In absence of arguments, the current directory is loaded as a package instance.
A package instance for a directory contains all files in the directory and its
ancestor directories, up to the module root, belonging to the same package.
If the package is not explicitly defined by the '-p' flag, it must be uniquely
defined by the files in the current directory.


Formats

The following formats are recognized:

    cue  output as CUE
              Outputs any CUE value.

   json  output as JSON
              Outputs any CUE value.

   yaml  output as YAML
              Outputs any CUE value.

   text  output as raw text
              The evaluated value must be of type string.

 binary  output as raw binary
              The evaluated value must be of type string or bytes.

Usage:
  cue export [flags]

Flags:
      --escape                   use HTML escaping
  -e, --expression stringArray   export this expression only
  -f, --force                    force overwriting existing files
  -t, --inject stringArray       set the value of a tagged field
  -T, --inject-vars              inject system variables in tags
      --list                     concatenate multiple objects into a list
      --merge                    merge non-CUE files (default true)
  -n, --name string              glob filter for non-CUE file names in directories
      --out string               output format (run 'cue help filetypes' for more info)
  -o, --outfile string           filename or - for stdout with optional file prefix (run 'cue help filetypes' for more info)
  -p, --package string           package name for non-CUE files
  -l, --path stringArray         CUE expression for single path component (see 'cue help flags' for details)
      --proto_enum string        mode for rendering enums (int|json) (default "int")
  -I, --proto_path stringArray   paths in which to search for imports
  -d, --schema string            expression to select schema for evaluating values in non-CUE files
      --with-context             import as object with contextual data

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
```
