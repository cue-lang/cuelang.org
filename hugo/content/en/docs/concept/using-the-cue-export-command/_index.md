---
title: Using the cue export command
tags: [cue command]
authors: [jpluscplusm]
toc_hide: true
index_hide: true
---

The `cue export` command evaluates a configuration, and emits the value of an
expression if the value is concrete.
The command fails with an error message
if evaluation of the configuration is unsuccessful,
or if the value of the expression to be emitted is not concrete.

The default configuration evaluated is the single package found in the current directory.
The default expression whose value is emitted is the top-level of the configuration evaluated.
The value is emitted to the command's standard output stream encoded as JSON, by default.
To override these defaults:
- the configuration to be evaluated can be specified using positional parameters
- the expression to be emitted can be specified with the `--expression`/`-e` flag
- the encoding can be specified with the `--out` flag
- a file that should receive the data can be specified with the `--outfile`/`-o` flag

{{< code-tabs >}}
{{< code-tab name="p1.cue" language="cue" area="top-left" >}}
package one

data: message: "This is package one"
{{< /code-tab >}}
{{< code-tab name="p2.cue" language="cue" area="top-right" >}}
package two

message: "this is package two"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAuOm9uZSAtLW91dCB5YW1sIC0tZXhwcmVzc2lvbiAnZGF0YSc=" >}}
$ cue export .:one --out yaml --expression 'data'
message: This is package one
{{< /code-tab >}}
{{< /code-tabs >}}

The rest of this guide shows you how to manage `cue export`'s inputs and
output, and the evaluation it performs:

1. [Inputs]({{< relref "inputs" >}}) -- learn how the inputs you provide are
   assembled and combined
1. [Evaluation]({{< relref "evaluation" >}}) -- find out about the aspects of
   the command's operation you can control
1. [Output]({{< relref "output" >}}) -- see how the command output's encoding
   can be selected, and directed into a specific file

{{<info>}}
Continue reading with the next page in this guide:
[Inputs]({{< relref "inputs" >}})
{{</info>}}

<!--

### The Basics

By default, the `cue export` command:

- evaluates the configuration in the single package found in the current directory
- emits the value of the top-level of the configuration evaluated
- encodes the value as JSON and prints it to the command's standard output stream:

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="left" >}}
package a

Aa: 1
Ba: 2.2
Ca: 3*Aa + Ba
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "Aa": 1,
    "Ba": 2.2,
    "Ca": 5.2
}
{{< /code-tab >}}
{{< /code-tabs >}}

You can override these defaults:
- the configuration to be evaluated can be specified using positional parameters
- the expression to be emitted can be specified with the `--expression`/`-e` flag
- the encoding can be specified with the `--out` flag
- a file that should receive the data can be specified with the `--outfile`/`-o` flag:

{{< code-tabs >}}
{{< code-tab name="package-b.cue" language="cue" area="left" >}}
package b

data: {
	Ab: 1
	Bb: 2.2
	Cb: 3*Ab + Bb
}
{{< /code-tab >}}
{{< code-tab name="package-c.cue" language="cue" area="left" >}}
package c

data: {
	Ac: "some string"
	Bc: 42
	Cc: true
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLWV4cHJlc3Npb24gZGF0YSAtLW91dCB5YW1sIC46Yw==" >}}
$ cue export --expression data --out yaml .:c
Ac: some string
Bc: 42
Cc: true
{{< /code-tab >}}
{{< /code-tabs >}}
-->
