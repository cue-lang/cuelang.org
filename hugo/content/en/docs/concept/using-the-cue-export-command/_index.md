---
title: Using the cue export command
toc_hide: true
tags: [cue command]
authors: [jpluscplusm]
---

The `cue export` command evaluates a configuration and emits a value if the
value is concrete -- in other words, as data. The command can emit data in a
variety of encodings, including JSON, YAML, and CUE.

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

