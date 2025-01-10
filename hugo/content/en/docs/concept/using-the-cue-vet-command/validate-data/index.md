---
title: Validating Data
weight: 20
tags: [cue command]
authors: [jpluscplusm]
toc_hide: false
---

As you saw on [the previous page](FIXME), the `cue vet` command accepts an
arbitrary number of input parameters and validates those inputs.

When any of those inputs are data files, then `cue vet` validates each data
file independently, instead of checking if they can all unify successfully
(which is "CUE" mode, described on the previous page of this guide).

This change in behaviour is essential:
given two files containing similarly-shaped but different data, it would be
generally impossible for their data to unify successfully.
They could validly specify different values for each field, which would
conflict when unified.
This is why `cue vet` validates data files using its "data" mode, as described
on this page.

## Validating data

To activate "data" mode you must mention one or more inputs that contain
constraints, alongside one or more inputs that contain data.

Constraints are found inside CUE package, CUE files, and non-CUE encodings like
JSON Schema and Protocol Buffers. Data is contained in non-CUE encodings such
as YAML, JSON, and TOML.
See `{{<linkto/inline "reference/command/cue-help-filetypes">}}` for the full
list of supported types.

### Constraints

The CUE and non-CUE constraint inputs that will validate your
data need to be mentioned exactly as described on the previous page of this
guide ([Validating CUE](FIXME)):

- you can mention any single CUE package, and it must be the first input
  mentioned
- you can mention individual CUE files, which must either belong to the same
  package as each other, or must contain no `package` clause
- if the `cue` command's standard input stream is read as CUE, then it's
  treated like an individual CUE file and has identical `package` clause
  requirements
- constraints found in non-CUE encodings such as JSON Schema and Protocol
  Buffers can be included by mentioning their files as inputs.

All the constraints will be unified before each data input is then validated
*independently* against the result of the unification, one by one.

### Data

To validate data against the unification of all the constraint inputs, just
mention the file containing the data:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package A

X!: int
{{< /code-tab >}}
{{< code-tab name="data.yaml" language="yaml" area="top-right" >}}
X: 4.2
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAuOkEgZGF0YS55YW1s" >}}
$ cue vet .:A data.yaml
X: conflicting values 4.2 and int (mismatched types float and int):
    ./a.cue:3:5
    ./data.yaml:1:4
{{< /code-tab >}}
{{< /code-tabs >}}

To validate more than one data file independently, mention them explicitly.
Both relative and absolute file paths can be used.
If all data files validate successfully, the `cue vet` command is silent:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package A

X!: number & <100
O!: number & <100
{{< /code-tab >}}
{{< code-tab name="data/foo.yaml" language="yaml" area="top-right" >}}
X: 4.2
O: 42
{{< /code-tab >}}
{{< code-tab name="data/bar.json" language="json" area="top-right" >}}
{
    "X": 42,
    "O": 42.42
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAuOkEgZGF0YS9mb28ueWFtbCBkYXRhL2Jhci5qc29u" >}}
$ cue vet .:A data/foo.yaml data/bar.json
{{< /code-tab >}}
{{< /code-tabs >}}

Globs (such as `*.yaml`) are only available if they're supported by your shell.

By default, data files are interpreted according to the encoding implied by
their filename extension.
To change the encoding applied to an input use a qualifier prefix, as described in
`{{<linkto/inline "reference/command/cue-help-inputs">}}`:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package A

X!: number & <100
O!: number & <100
{{< /code-tab >}}
{{< code-tab name="foo.data" language="data" area="top-right" >}}
X: 4.2
O: 42
{{< /code-tab >}}
{{< code-tab name="bar.data" language="data" area="top-right" >}}
X: 42
O: 4242
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAuOkEgeWFtbDogZm9vLmRhdGEgYmFyLmRhdGE=" >}}
$ cue vet .:A yaml: foo.data bar.data
O: invalid value 4242 (out of bound <100):
    ./a.cue:4:14
    ./bar.data:2:4
{{< /code-tab >}}
{{< /code-tabs >}}

A qualifier affects all files that follow it in the list of inputs, up until
another qualifier is used. You can use a qualifier to cause the `cue vet`
command to read its standard input as data (instead of CUE constraints).
For example, to read standard input as JSON, use `json: -`.

### Placing data with `-l`
{{<todo "FIXME">}}

#### `--with-context`

### Validating against a named constraint with `-d`
{{<todo "FIXME">}}

### Misc

{{<todo "FIXME">}}
- Tagged fields.
- `--list` / `--merge`

## Validation output

{{<todo "FIXME: same as previous page - either copy or reference">}}

## Related content

{{<todo "FIXME">}}
