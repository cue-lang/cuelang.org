---
title: Validating Data
weight: 20
tags: [cue command]
authors: [jpluscplusm]
toc_hide: false
---

As mentioned earlier [in this guide]({{<relref "validate-cue">}}), the `cue vet`
command accepts any number of inputs, and validates them.
When you specify one or more constraint inputs (such as CUE) along with at
least one data input (such as JSON, YAML, or TOML files) then `cue vet`
operates in "data" mode and validates each data input against the constraints.

## Data inputs

If your data inputs validate successfully then the `cue vet` command succeeds
and produces no output:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package alpha

A: int & <100
{{< /code-tab >}}
{{< code-tab name="data.json" language="json" area="top-right" >}}
{
    "A": 42
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOmFscGhhIGRhdGEuanNvbg==" >}}
$ cue vet -c .:alpha data.json
{{< /code-tab >}}
{{< /code-tabs >}}

If a data input fails to validate against the constraints then an error message is reported:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package alpha

A: int & <100
{{< /code-tab >}}
{{< code-tab name="data.json" language="json" area="top-right" >}}
{
    "A": 4200
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOmFscGhhIGRhdGEuanNvbg==" >}}
$ cue vet -c .:alpha data.json
A: invalid value 4200 (out of bound <100):
    ./a.cue:3:10
    ./data.json:2:10
{{< /code-tab >}}
{{< /code-tabs >}}

## Constraining data

To activate "data" mode you must mention one or more inputs that contain
constraints along with your data inputs.

Specify your constraints as CUE packages and CUE files (as described on
[the first page of this guide]({{<relref "validate-cue">}})), and non-CUE
encodings such as JSON Schema and Protocol Buffers (as listed in
`{{<linkto/inline "reference/command/cue-help-filetypes">}}`).

Specify data inputs as absolute or relative paths to data files anywhere on
your computer, or the command's standard input as described below. The `cue
vet` command does not expand globs, such as `*.yml`.

All the constraints you mention will be unified,
and each data input will be validated separately against that unification:

{{< code-tabs >}}
{{< code-tab name="a1.cue" language="cue" area="top-left" >}}
package alpha

A: int
{{< /code-tab >}}
{{< code-tab name="a2.cue" language="cue" area="top-left" >}}
package alpha

A: <100
{{< /code-tab >}}
{{< code-tab name="data.json" language="json" area="top-right" >}}
{
    "A": 42
}
{{< /code-tab >}}
{{< code-tab name="dir/data.yml" language="yml" area="top-right" >}}
A: 4200
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOmFscGhhIGRhdGEuanNvbiBkaXIvZGF0YS55bWw=" >}}
$ cue vet -c .:alpha data.json dir/data.yml
A: invalid value 4200 (out of bound <100):
    ./a2.cue:3:4
    ./dir/data.yml:1:4
{{< /code-tab >}}
{{< /code-tabs >}}

The separate validation of each data file is the key difference between
"data" mode (described on this page) and
["CUE" mode ]({{<relref "validate-cue">}}),
which unifies and then validates all inputs simultaneously.
This difference is important because it allows `cue vet` to do the right thing
when validating more than one data file. It's very likely that several files,
each containing similar kinds of data, wouldn't be able to unify successfully.
They likely contain *different data values*, which would be a problem if "CUE"
mode were trying to unify them together. That's why "data" mode exists: to
allow you use `cue vet` to validate each data file input independently from the
rest.

## Data encodings

By default, each data input is decoded from the format implied by its filename
extension. You can override this by using a *qualifier*, as described in
`{{<linkto/inline "reference/command/cue-help-filetypes">}}`:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package alpha

A: number & <100
B: number & <100
{{< /code-tab >}}
{{< code-tab name="foo.data" language="data" area="top-right" >}}
A: 4.2
B: 42
{{< /code-tab >}}
{{< code-tab name="bar.data" language="data" area="top-right" >}}
A: 42
B: 4242
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOmFscGhhIHlhbWw6IGZvby5kYXRhIGJhci5kYXRh" >}}
$ cue vet -c .:alpha yaml: foo.data bar.data
B: invalid value 4242 (out of bound <100):
    ./a.cue:4:13
    ./bar.data:2:4
{{< /code-tab >}}
{{< /code-tabs >}}

A qualifier affects all the files that come after it in the list of inputs,
until the next qualifier.

You can also use a qualifier to cause the `cue vet` command to read its
standard input as data, instead of as CUE constraints. For example, to read
standard input as JSON, use "`json: -`".

### Validating data against named constraints

If your CUE contains several contraints, but only one of them should be used to
validate your data, then use the `--schema`/`-d` flag to select the appropriate
constraint:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package A

#SmallAB: {
	A: number & <10
	B: number & <10
}
#UnrelatedConstraint: X!: "some string"
{{< /code-tab >}}
{{< code-tab name="data.yaml" language="yaml" area="top-right" >}}
A: 4.2
B: 4.2
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOkEgLWQgJyNTbWFsbEFCJyBkYXRhLnlhbWw=" >}}
$ cue vet -c .:A -d '#SmallAB' data.yaml
{{< /code-tab >}}
{{< /code-tabs >}}

You can specify `--schema`/`-d` multiple times to validate a data input against
multiple constraints:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package A

#SmallAB: {
	A: number & <10
	B: number & <10
}
#LargeAB: {
	A: number & >100
	B: number & >100
}
{{< /code-tab >}}
{{< code-tab name="data.yaml" language="yaml" area="top-right" >}}
A: 4.2
B: 4.2
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOkEgLWQgJyNTbWFsbEFCJyAtZCAnI0xhcmdlQUInIGRhdGEueWFtbA==" >}}
$ cue vet -c .:A -d '#SmallAB' -d '#LargeAB' data.yaml
A: invalid value 4.2 (out of bound >100):
    ./a.cue:8:14
    ./data.yaml:1:4
B: invalid value 4.2 (out of bound >100):
    ./a.cue:9:14
    ./data.yaml:2:4
{{< /code-tab >}}
{{< /code-tabs >}}

Each data input is validated against each constraint, and
`cue vet` succeeds if all validations are successful.

## Validation output

The `cue vet` command succeeds silently when data validation succeeds, which
means that the command produces no output and its exit code is 0.

If there's a problem with your data then `cue vet` displays error messages, as
described above. The
[next page of this guide]({{<relref"output">}}) shows you how to change the
command's output, and how it checks for *incomplete* values.

## Related content

- {{<linkto/related/concept "how-cue-enables-data-validation">}}
- {{<linkto/related/reference"command/cue-help-inputs">}} -- help text explaining how CUE's inputs can be specified
- {{<linkto/related/reference "command/cue-vet">}}
- {{<linkto/related/reference "command/cue-help-vet">}} -- the help text displayed by `cue help vet`
- {{<issue"3733">}}Issue #3733{{</issue>}} tracks an effort to re-think how
  `cue vet` operates -- if you'd like to provide feedback about ways that the
  command could be improved to help your workflows, the CUE project would love
  to hear it in that issue!
