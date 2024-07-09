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

{{< code-tabs >}}
{{< code-tab name="p1.cue" language="cue" area="top-left" >}}
package one

data: message: "this is package 'one'"
{{< /code-tab >}}
{{< code-tab name="p2.cue" language="cue" area="top-right" >}}
package two

data: "this is package 'two'"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLWV4cHJlc3Npb24gZGF0YSAtLW91dCB5YW1sIC46b25l" >}}
$ cue export --expression data --out yaml .:one
message: this is package 'one'
{{< /code-tab >}}
{{< /code-tabs >}}

The operation and output of the command can be controlled by various other flags.
To learn more about `cue export` please refer to:

- {{< linkto/related/concept "using-the-cue-export-command" >}} --
  an in-depth guide to `cue export`
- {{< linkto/related/reference "command/cue-help-export" >}} --
  the built-in help text for the `cue export` command
