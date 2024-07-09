---
title: The cue export command
weight: 100
authors: [jpluscplusm]
tags: [cue command]
---

The `cue export` command evaluates a configuration, and emits the value of an
expression if the value is concrete.
The command fails with an error message
if evaluation of the configuration is unsuccessful,
or if the value of the expression to be emitted is not concrete.

The default configuration evaluated is the single package found in the current directory.
The default expression whose value is emitted is the top-level of the configuration evaluated.
The default encoding for the emitted value is JSON,
printed to the command's standard output stream.
To override these defaults:
- the configuration to be evaluated can be specified using positional parameters
- the expression to be emitted can be specified with the `--expression`/`-e` flag
- the encoding can be specified with the `--out` flag
- a file that should receive the data can be specified with the `--outfile`/`-o` flag

{{{with code "en" "export 1"}}}
#location top-left top-right bottom
exec cue export --expression data --out yaml .:one
cmp stdout out
-- p1.cue --
package one

data: message: "this is package 'one'"
-- p2.cue --
package two

data: "this is package 'two'"
-- out --
message: this is package 'one'
{{{end}}}

The operation and output of the command can be controlled by various other flags.
To learn more about `cue export` please refer to:

- {{< linkto/related/concept "using-the-cue-export-command" >}} --
  an in-depth guide to `cue export`
- {{< linkto/related/reference "command/cue-help-export" >}} --
  the built-in help text for the `cue export` command
