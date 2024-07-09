---
title: Using the cue export command
toc_hide: true
tags: [cue command]
authors: [jpluscplusm]
---

The `cue export` command evaluates a configuration and emits a value if the
value is concrete -- in other words, as data. The command can emit data in a
variety of encodings, including JSON, YAML, and CUE.

## The Basics

By default, the `cue export` command:

- evaluates the configuration in the single package found in the current directory
- emits the value of the top-level of the configuration evaluated
- encodes the value as JSON and prints it to the command's standard output stream:

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="left" >}}
package one

A: 1
B: 2.2
C: 3*A + B
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "A": 1,
    "B": 2.2,
    "C": 5.2
}
{{< /code-tab >}}
{{< /code-tabs >}}

You can override these defaults:
- the configuration to be evaluated can be specified using positional parameters
- the expression to be emitted can be specified with the `--expression`/`-e` flag
- the encoding can be specified with the `--out` flag
- a file that should receive the data can be specified with the `--outfile`/`-o` flag:

{{< code-tabs >}}
{{< code-tab name="p2.cue" language="cue" area="left" >}}
package two

data: {
	A: 1
	B: 2.2
	C: 3*A + B
}
{{< /code-tab >}}
{{< code-tab name="p3.cue" language="cue" area="left" >}}
package three

data: {
	A: "some string"
	B: 42
	C: true
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLWV4cHJlc3Npb24gZGF0YSAtLW91dCB5YW1sIC46dGhyZWU=" >}}
$ cue export --expression data --out yaml .:three
A: some string
B: 42
C: true
{{< /code-tab >}}
{{< /code-tabs >}}


The command fails with an error message:

- if evaluation of the configuration is unsuccessful
  - such as when concrete data values are unified with constraints that forbid
    those same values, or if the configuration to be evaluated can't be loaded
- if the value of the expression to be emitted isn't concrete
  - which is when the value *wouldn't* be able to be represented in a data-only
    format such as JSON. Examples of non-concrete values include types such as
    `string` and constraints such as `>=100`:

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="left" >}}
package two

A: 1
B: float
C: >=A
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
B: incomplete value float:
    ./data.cue:4:4
C: incomplete value >=1:
    ./data.cue:5:4
{{< /code-tab >}}
{{< /code-tabs >}}

## More detail ...

FIXME
