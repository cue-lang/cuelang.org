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

{{{with code "en" "pass 1"}}}
#location top-left top-right bottom
exec cue vet -c .:alpha data.json
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

If a data input fails to validate against the constraints then an error message is reported:

{{{with code "en" "fail 1"}}}
#location top-left top-right bottom
! exec cue vet -c .:alpha data.json
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

To activate "data" mode you must mention one or more inputs that contain
constraints along with your data inputs.

Specify constraint inputs as CUE packages and CUE files (as described on
[the first page of this guide]({{<relref "validate-cue">}})), and non-CUE
encodings such as JSON Schema and Protocol Buffers (as listed in
`{{<linkto/inline "reference/command/cue-help-filetypes">}}`).

Specify data inputs as absolute or relative paths to data files anywhere on
your computer, or the command's standard input as described below. The `cue
vet` command does not expand globs, such as `*.yml`.

All the constraints you mention will be unified,
and each data input will be validated separately against that unification:

{{{with code "en" "fail 2"}}}
#location top-left top-left top-right top-right bottom
! exec cue vet -c .:alpha data.json dir/data.yml
cmp stderr out
-- a1.cue --
package alpha

A: int
-- a2.cue --
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
    ./a2.cue:3:4
    ./dir/data.yml:1:4
{{{end}}}

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

{{{with code "en" "fail 3"}}}
#location top-left top-right top-right bottom
! exec cue vet -c .:alpha yaml: foo.data bar.data
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
exec cue vet -c .:a -d '#SmallB' data.yaml
cmp stderr out
-- small.cue --
package a

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
! exec cue vet -c .:a -d '#SmallB' -d '#LargeB' data.yaml
cmp stderr out
-- large.cue --
package a

#LargeB: {
	B: number & >100
}
-- small.cue --
package a

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

## Next in this guide

### Validation output

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
