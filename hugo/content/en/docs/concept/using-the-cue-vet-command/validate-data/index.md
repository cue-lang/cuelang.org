---
title: Validating Data
weight: 20
tags: [cue command]
authors: [jpluscplusm]
toc_hide: false
---

As mentioned
[earlier in this guide]({{< relref "docs/concept/using-the-cue-vet-command/validate-cue" >}}),
the `cue vet` command accepts any number of inputs, and validates them.

When you specify one or more constraint inputs (such as CUE) along with
*at least one data input* (such as JSON, YAML, or TOML files) then `cue vet`
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
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuIGRhdGEuanNvbg==" >}}
$ cue vet -c . data.json
{{< /code-tab >}}
{{< /code-tabs >}}

If a data input fails to validate against its constraints then an error message is reported:

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
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuIGRhdGEuanNvbg==" >}}
$ cue vet -c . data.json
A: invalid value 4200 (out of bound <100):
    ./a.cue:3:10
    ./data.json:2:10
{{< /code-tab >}}
{{< /code-tabs >}}

## Constraining data

As mentioned above, "data" mode is activated if you mention one or more inputs
that contain constraints along with one or more data inputs.
You can specify constraint inputs as:
- CUE packages and CUE files as described on
  [the first page of this guide]({{< relref "docs/concept/using-the-cue-vet-command/validate-cue" >}})
  and in
  `{{<linkto/inline "reference/command/cue-help-inputs" >}}`; and
- non-CUE encodings such as JSON Schema and Protocol Buffers as listed in
  `{{<linkto/inline "reference/command/cue-help-filetypes">}}`.

You can specify data inputs as:
- absolute or relative paths to data files (but not filesystem globs) anywhere
  on your computer; and
- the command's standard input, as described below.

All your constraint inputs will be unified,
and each data input will be validated separately against that unification:

{{< code-tabs >}}
{{< code-tab name="constraint-1.cue" language="cue" area="top-left" >}}
package alpha

A: int
{{< /code-tab >}}
{{< code-tab name="constraint-2.cue" language="cue" area="top-left" >}}
package alpha

A: <100
{{< /code-tab >}}
{{< code-tab name="data.json" language="json" area="top-right" >}}
{
    "A": 42
}
{{< /code-tab >}}
{{< code-tab name="dir/data.yml" language="yaml" area="top-right" >}}
A: 4200
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOmFscGhhIGRhdGEuanNvbiBkaXIvZGF0YS55bWw=" >}}
$ cue vet -c .:alpha data.json dir/data.yml
A: invalid value 4200 (out of bound <100):
    ./constraint-2.cue:3:4
    ./dir/data.yml:1:4
{{< /code-tab >}}
{{< /code-tabs >}}

{{< info >}}

### Why two modes?

The key difference between
"data" mode (this page) and
"CUE" mode ([the previous page]({{< relref "docs/concept/using-the-cue-vet-command/validate-cue" >}}))
is that
data mode validates each data file **separately**
whereas
CUE mode validates all inputs **simultaneously**.

This difference is critically important because it lets `cue vet` do the right
thing when validating multiple data files. Data files often contain similar
kinds of data -- where the same keys exist, but with different values. If data
files were unified before being validated, the values they contain might well
conflict.

That's why data mode exists: to allow you to validate each data file input
*independently* from the others.
{{< /info >}}

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
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuIHlhbWw6IGZvby5kYXRhIGJhci5kYXRh" >}}
$ cue vet -c . yaml: foo.data bar.data
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

## Validating data against named constraints

If your CUE contains several contraints, but only one of them should be used to
validate your data, then use the `--schema`/`-d` flag to select the appropriate
constraint:

{{< code-tabs >}}
{{< code-tab name="small.cue" language="cue" area="top-left" >}}
package alpha

#SmallB: {
	B: number & <10
}
#UnrelatedConstraint: X!: "some string"
{{< /code-tab >}}
{{< code-tab name="data.yaml" language="yaml" area="top-right" >}}
B: 4.2
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuIC1kICcjU21hbGxCJyBkYXRhLnlhbWw=" >}}
$ cue vet -c . -d '#SmallB' data.yaml
{{< /code-tab >}}
{{< /code-tabs >}}

You can specify `--schema`/`-d` multiple times to validate a data input against
multiple constraints:

{{< code-tabs >}}
{{< code-tab name="large.cue" language="cue" area="top-left" >}}
package alpha

#LargeB: {
	B: number & >100
}
{{< /code-tab >}}
{{< code-tab name="small.cue" language="cue" area="top-left" >}}
package alpha

#SmallB: {
	B: number & <10
}
{{< /code-tab >}}
{{< code-tab name="data.yaml" language="yaml" area="top-right" >}}
B: 4.2
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuIC1kICcjU21hbGxCJyAtZCAnI0xhcmdlQicgZGF0YS55YW1s" >}}
$ cue vet -c . -d '#SmallB' -d '#LargeB' data.yaml
B: invalid value 4.2 (out of bound >100):
    ./large.cue:4:14
    ./data.yaml:1:4
{{< /code-tab >}}
{{< /code-tabs >}}

Each data input is validated against each constraint, and
`cue vet` succeeds if all validations are successful.

## Also in this guide ...

{{< cards >}}
{{< card href="/docs/concept/using-the-cue-vet-command/output/" title="Command Output" label=" " >}}
  Change some aspects of `cue vet`'s output to suit your processes and workflows.
{{< /card >}}
{{< /cards >}}

## Related content

- {{< linkto/related/concept "how-cue-enables-data-validation" >}}
- {{< linkto/related/reference "command/cue-help-inputs" >}}
  -- help text explaining how CUE's inputs can be specified
- {{< linkto/related/reference "command/cue-vet" >}}
- {{< linkto/related/reference "command/cue-help-vet" >}}
  -- the help text displayed by `cue help vet`
- {{<issue"3733">}}Issue #3733{{</issue>}} tracks an effort to re-think how
  `cue vet` operates -- if you'd like to provide feedback about ways that the
  command could be improved to help your workflows, the CUE project would love
  to hear it in that issue!
