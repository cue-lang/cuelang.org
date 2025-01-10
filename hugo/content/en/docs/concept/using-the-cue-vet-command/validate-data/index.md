---
title: Validating Data
weight: 20
tags: [cue command]
authors: [jpluscplusm]
toc_hide: false
---

As you saw on [the previous page]({{<relref "validate-cue">}}), the `cue vet`
command accepts an arbitrary number of input parameters and validates those
inputs.

If any of those inputs are data, such as JSON, YAML, or TOML files, then `cue
vet` operates in "data" mode, where it validates each data input independently.
"CUE" mode, which is engaged when no data inputs are mentioned, performs a
slightly different check: it validates that all the inputs provided can unify
simultaneously.
"CUE" mode is described earlier in this guide.

This change in behaviour from "CUE" mode to "data" mode is *critical:*
given two files containing similarly-shaped but different data, it would be
generally impossible for their data to unify successfully.
Entirely validly, they could specify different values for any of their fields,
which would conflict when unified.
This is why `cue vet` validates data files using "data" mode, as described on
this page.

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
data need to be mentioned in the same way as described in
[Validating CUE]({{<relref "validate-cue">}}), earlier in this guide:

- you can mention any single CUE package, and it must be the first input
  mentioned
- you can mention individual CUE files, each of which must *either* belong to
  the same package as each other, *or* must contain no `package` clause
- if the `cue vet` command's standard input stream is read as CUE then it's
  treated like an individual CUE file, and has identical `package` clause
  requirements as individual CUE files
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

Globs (such as `*.yaml`) can only be used if they're supported by your shell.

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

### Validating data against named constraints

If your CUE contains several contraints, but only one of them should be used to
validate your data, then use the `--schema`/`-d` flag to select the appropriate
constraint:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package A

#SmallXO: {
	X: number & <10
	O: number & <10
}
#LargeXO: {
	X: number & >100
	O: number & >100
}
{{< /code-tab >}}
{{< code-tab name="data.yaml" language="yaml" area="top-right" >}}
X: 4.2
O: 4.2
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAuOkEgZGF0YS55YW1sIC1kICcjU21hbGxYTyc=" >}}
$ cue vet .:A data.yaml -d '#SmallXO'
{{< /code-tab >}}
{{< /code-tabs >}}

If the `--schema`/`-d` flag is repeated then each constraint selected will be
used to validate the data inputs in isolation:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package A

#SmallXO: {
	X: number & <10
	O: number & <10
}
#LargeXO: {
	X: number & >100
	O: number & >100
}
{{< /code-tab >}}
{{< code-tab name="data.yaml" language="yaml" area="top-right" >}}
X: 4.2
O: 4.2
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAuOkEgZGF0YS55YW1sIC1kICcjU21hbGxYTycgLWQgJyNMYXJnZVhPJw==" >}}
$ cue vet .:A data.yaml -d '#SmallXO' -d '#LargeXO'
X: invalid value 4.2 (out of bound >100):
    ./a.cue:8:14
    ./data.yaml:1:4
O: invalid value 4.2 (out of bound >100):
    ./a.cue:9:14
    ./data.yaml:2:4
{{< /code-tab >}}
{{< /code-tabs >}}

Each data input mentioned is independently validated against each constraint
selected, with `cue vet` only succeeding if *every* validation is successful.
Conceptually, for `N` data inputs mentioned and `M` constraints selected using
`--schema`/`-d` flags, `N * M` separate validations must succeed.

## Validation output

The `cue vet` command is silent when data validation succeeds.

The `--concrete`/`-c` flag can be used to change the error output when
*incomplete* values are present, and to ignore incomplete values that are
otherwise valid. The different ways this flag can be used are described on the
previous page of this guide, in the
[validation output]({{<relref "docs/concept/using-the-cue-vet-command/validate-cue">}}#validation-output)
section.

## Related content

- {{<linkto/related/reference "command/cue-vet">}}
- {{<linkto/related/concept "how-cue-enables-data-validation">}}
