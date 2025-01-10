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

{{{with code "en" "pass 1"}}}
#location top-left top-right bottom
exec cue vet -c . data.json
cmp stdout out
-- a.cue --
package alpha

A: int & <100
-- data.json --
{
    "A": 42
}
-- out --
{{{end}}}

If a data input fails to validate against its constraints then an error message is reported:

{{{with code "en" "fail 1"}}}
#location top-left top-right bottom
! exec cue vet -c . data.json
cmp stderr out
-- a.cue --
package alpha

A: int & <100
-- data.json --
{
    "A": 4200
}
-- out --
A: invalid value 4200 (out of bound <100):
    ./a.cue:3:10
    ./data.json:2:10
{{{end}}}

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

{{{with code "en" "fail 2"}}}
#location top-left top-left top-right top-right bottom
! exec cue vet -c .:alpha data.json dir/data.yml
cmp stderr out
-- constraint-1.cue --
package alpha

A: int
-- constraint-2.cue --
package alpha

A: <100
-- data.json --
{
    "A": 42
}
-- dir/data.yml --
A: 4200
-- out --
A: invalid value 4200 (out of bound <100):
    ./constraint-2.cue:3:4
    ./dir/data.yml:1:4
{{{end}}}

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

{{{with code "en" "fail 3"}}}
#location top-left top-right top-right bottom
! exec cue vet -c . yaml: foo.data bar.data
cmp stderr out
-- a.cue --
package alpha

A: number & <100
B: number & <100
-- foo.data --
A: 4.2
B: 42
-- bar.data --
A: 42
B: 4242
-- out --
B: invalid value 4242 (out of bound <100):
    ./a.cue:4:13
    ./bar.data:2:4
{{{end}}}

A qualifier affects all the files that come after it in the list of inputs,
until the next qualifier.

You can also use a qualifier to cause the `cue vet` command to read its
standard input as data, instead of as CUE constraints. For example, to read
standard input as JSON, use "`json: -`".

## Validating data against named constraints

If your CUE contains several contraints, but only one of them should be used to
validate your data, then use the `--schema`/`-d` flag to select the appropriate
constraint:

{{{with code "en" "-d success"}}}
exec cue vet -c . -d '#SmallB' data.yaml
cmp stderr out
-- small.cue --
package alpha

#SmallB: {
	B: number & <10
}
#UnrelatedConstraint: X!: "some string"
-- data.yaml --
B: 4.2
-- out --
{{{end}}}

You can specify `--schema`/`-d` multiple times to validate a data input against
multiple constraints:

{{{with code "en" "multiple -d fail"}}}
#location top-left top-left top-right bottom
! exec cue vet -c . -d '#SmallB' -d '#LargeB' data.yaml
cmp stderr out
-- large.cue --
package alpha

#LargeB: {
	B: number & >100
}
-- small.cue --
package alpha

#SmallB: {
	B: number & <10
}
-- data.yaml --
B: 4.2
-- out --
B: invalid value 4.2 (out of bound >100):
    ./large.cue:4:14
    ./data.yaml:1:4
{{{end}}}

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
