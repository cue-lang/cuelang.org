---
title: Validating Data
weight: 20
tags: [cue command]
authors: [jpluscplusm]
toc_hide: false
---

As mentioned earlier [in this guide]({{<relref "validate-cue">}}), the `cue vet`
command accepts any number of inputs, and validates them.

## Validating data inputs

If any inputs represent data (such as JSON, YAML, or TOML files) then `cue
vet` operates in "data" mode and validates each data input seperately:

{{{with code "en" "fail 1"}}}
#location top-left top-right top-right bottom
! exec cue vet .:alpha data.json data.yaml
cmp stderr out
-- a.cue --
package alpha

A: int
-- data.json --
{
    "A": 42
}
-- data.yaml --
A: 4.2
-- out --
A: conflicting values 4.2 and int (mismatched types float and int):
    ./a.cue:3:4
    ./data.yaml:1:4
{{{end}}}

["CUE" mode]({{<relref "validate-cue">}}), which is engaged when no data
inputs are mentioned, performs a slightly different check: it validates that
all the inputs can unify *simultaneously*.

{{<info>}}
This change in behaviour from "CUE" mode to "data" mode is *critical:*
given two files containing similarly-shaped but different data, it would be
generally impossible for their data to unify successfully.
Entirely validly, they could specify different values for any of their fields,
which would conflict when unified.

This is why `cue vet` validates data files using "data" mode, as described on
this page.
{{</info>}}

## Constraining data

To activate "data" mode you need to mention one or more inputs that contain
constraints, along with your data inputs.
Specify your contraints as described on the
[previous page of this guide]({{<relref "validate-cue">}}):

- you can mention any one CUE package, and it must be the first input mentioned
- you can mention individual CUE files, each of which must *either* belong to
  the same package as each other, *or* must contain no `package` clause
- if the `cue vet` command's standard input stream is read as CUE then it's
  treated like an individual CUE file, and has identical `package` clause
  requirements as individual CUE files
- constraints found in non-CUE encodings such as JSON Schema and Protocol
  Buffers can be included by mentioning their files as inputs.
  See `{{<linkto/inline "reference/command/cue-help-filetypes">}}` for the full
  list of supported types.

All the constraints you mention will be unified before each data input is
validated *independently and separately* against the result of the unification.
If all your data inputs validate successfully, the `cue vet` command is silent:

{{{with code "en" "pass 1"}}}
#location top-left top-left top-right top-right bottom
exec cue vet .:alpha b.cue foo/data.yaml bar/baz/data.json
cmp stdout out
-- a.cue --
package alpha

A: number & <100
-- b.cue --
package beta

B: number & <100
-- foo/data.yaml --
A: 4.2
B: 42
-- bar/baz/data.json --
{
    "A": 42,
    "B": 42.42
}
-- out --
{{{end}}}

Data files can be mentioned from anywhere on your system. Globs (such as
`*.yaml`) can be used only if they're expanded by your shell.
Each data input is assumed to contain the type of data implied by its filename
extension.

You can change this assumption by using a *qualifier*, as described in
`{{<linkto/inline "reference/command/cue-help-filetypes">}}`:

{{{with code "en" "fail 2"}}}
#location top-left top-right top-right bottom
! exec cue vet .:alpha yaml: foo.data bar.data
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
until the next qualifier. You can use a qualifier to cause the `cue vet`
command to read its standard input as data, instead of as CUE constraints.
For example, to read standard input as JSON, use "`json: -`".

### Validating data against named constraints

If your CUE contains several contraints, but only one of them should be used to
validate your data, then use the `--schema`/`-d` flag to select the appropriate
constraint:

{{{with code "en" "-d success"}}}
exec cue vet .:A data.yaml -d '#SmallAB'
cmp stderr out
-- a.cue --
package A

#SmallAB: {
	A: number & <10
	B: number & <10
}
#LargeAB: {
	A: number & >100
	B: number & >100
}
-- data.yaml --
A: 4.2
B: 4.2
-- out --
{{{end}}}

You can specify `--schema`/`-d` multiple times to validate a data input against
multiple constraints:

{{{with code "en" "multiple -d fail"}}}
! exec cue vet .:A data.yaml -d '#SmallAB' -d '#LargeAB'
cmp stderr out
-- a.cue --
package A

#SmallAB: {
	A: number & <10
	B: number & <10
}
#LargeAB: {
	A: number & >100
	B: number & >100
}
-- data.yaml --
A: 4.2
B: 4.2
-- out --
A: invalid value 4.2 (out of bound >100):
    ./a.cue:8:14
    ./data.yaml:1:4
B: invalid value 4.2 (out of bound >100):
    ./a.cue:9:14
    ./data.yaml:2:4
{{{end}}}

Each data input is validated against each constraint.
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
