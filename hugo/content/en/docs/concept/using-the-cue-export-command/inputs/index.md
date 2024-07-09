---
title: Inputs
weight: 10
authors: [jpluscplusm]
toc_hide: false
---

<!-- SENSE CHECK
A note to the content author/reviewer/updater:
This guide contains several upload&script blocks inside HTML comments.
They are present to act as invisible build-time sense checks on the truth of
the statements presented above them, where explicitly presenting a rendered
block validating each statement would make the page too long and verbose for
the reader.

Because we don't have a formal spec for `cue export` (modulo the actual code),
these scripts will check that the significant points exposed in prose remain
true across CUE releases. Exact output is *not* tested, as these blocks aren't
meant to be byte-for-byte output checks. Content checks (e.g. grep) /can/
follow a command invocation, but only insofar as they're needed to assert the
applicability of the command's success or failure, or to avoid the situation
where a "cmp" check might be semi-silently neutered by a preprocessor execution
with the "--update" flag specified during the preparation for a CUE upgrade.

These blocks are *not* "hidden" blocks, but they're invisible because they're
inside an HTML comment (which Hugo strips out when processing). They're encoded
like this so that they *can* be rendered, in order to to assist with debugging
if they start failing in the future. Enable their rendering by removing the
opening HTML comment element.

When upgrading the site to a new CUE version, if something *does* change and
break an assertion, then new wording for this page doesn't need to be written
mid-upgrade. Just comment out ("#") or negate ("!") the failing command (and
its optional trailing content checks) as needed to get the page to build, and
open a cue-lang/docs-and-content issue tracking the breakage, labelled as
"bug". -->

<!-- A warning block is used only to gain access to the yellow background site colour -->
{{<warning>}}
### In [this guide]({{< relref "." >}}):
1. **This page** --
   learn how the inputs you provide are interpreted and combined
1. [Evaluation]({{< relref "evaluation" >}}) --
   find out about the aspects of the command's operation that you can control
1. [Output]({{< relref "output" >}}) --
   see how the command output's encoding can be selected, and directed into a
   specific location
{{</warning>}}

The `cue export` command can be given any number of inputs to evaluate via the
command's positional parameters -- that is, parameters that aren't associated
with some preceding flag. This page explains how the command interprets,
assembles, and combines these inputs when handed different kinds and quantities
of input.

## No positional parameters

When `cue export` is invoked with zero arguments
its input is the single package in the current directory:

{{< code-tabs >}}
{{< code-tab name="default-input.cue" language="cue" area="top-left" >}}
package example

A: 1
B: 2.2 + A
C: 3.33 * B
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "A": 1,
    "B": 3.2,
    "C": 10.656
}
{{< /code-tab >}}
{{< /code-tabs >}}

This package is loaded as a *package instance* -- a concept which is explained
later in this guide. FIXME

The command fails if more than one package exists in the current directory
and the input isn't explicitly specified:

{{< code-tabs >}}
{{< code-tab name="1.cue" language="cue" area="left" >}}
package one

message: "this is package one"
{{< /code-tab >}}
{{< code-tab name="2.cue" language="cue" area="left" >}}
package two

message: "this is package two"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
found packages "one" (1.cue) and "two" (2.cue) in "."
{{< /code-tab >}}
{{< /code-tabs >}}

## One positional parameter

If you want to export the contents of a CUE package, but there is more than one
package in the current directory, tell `cue export` which package to process by
providing its *import path* as a positional parameter:

{{< code-tabs >}}
{{< code-tab name="1.cue" language="cue" area="left" >}}
package one

message: "this is package one"
{{< /code-tab >}}
{{< code-tab name="2.cue" language="cue" area="left" >}}
package two

message: "this is package two"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAuOnR3bw==" >}}
$ cue export .:two
{
    "message": "this is package two"
}
{{< /code-tab >}}
{{< /code-tabs >}}

CUE *import paths* are described in
[`cue help inputs`]({{< relref "docs/reference/command/cue-help-inputs" >}}).
The previous example shows a *rooted* import path (`.:two`), as explained in
`cue help inputs`.
<!-- TODO(jcm) "how cue finds CUE", when available -->

If the sole positional parameter is the path to a data file then the file's
contents are interpreted in the encoding implied by its filename suffix,
and the input processed by `cue export` is the resulting data:

{{< code-tabs >}}
{{< code-tab name="path/to/some/data.yaml" language="yaml" area="left" >}}
message: this is a YAML data file
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBwYXRoL3RvL3NvbWUvZGF0YS55YW1s" >}}
$ cue export path/to/some/data.yaml
{
    "message": "this is a YAML data file"
}
{{< /code-tab >}}
{{< /code-tabs >}}

Individual CUE files can also be referred to directly, by filename, instead of
being used through their import path at the package level. Import paths,
however, are the *suggested* way to refer to CUE as they automatically include
new and renamed files in the package. Referring directly to CUE files requires
you to keep `cue export` invocations up to date, manually, if you change the
names of the files being used.

## Input file encodings

The filename suffixes that `cue export` understands are described in
[`cue help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes" >}}).
These include `.json`, `.yml`, `.yaml`, and `.cue`. If a filename suffix is
recognised, then `cue export` automatically interprets the file as the encoding
implied by the suffix.

If the encoding of a file doesn't match its filename suffix,
use a qualifier to specify the encoding:

{{< code-tabs >}}
{{< code-tab name="some-yaml.data" language="data" area="left" >}}
message: this YAML file has a .data suffix
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCB5YW1sOiBzb21lLXlhbWwuZGF0YQ==" >}}
$ cue export yaml: some-yaml.data
{
    "message": "this YAML file has a .data suffix"
}
{{< /code-tab >}}
{{< /code-tabs >}}

A qualifier dicates the encoding of every file that follows it, up to the
*next* qualifier. In each separate `cue export` invocation (considering its
parameters in order) after a qualifier has been used, all files are interpreted
through that qualifier's encoding until it's overridden by a subsequent
qualifier. There is no way for the invocation to re-engage the interpretation
of filename suffixes. Qualifiers include `json:`, `yaml:`, and `cue:`, and are
described in `{{< linkto/inline "reference/command/cue-help-filetypes" >}}`.

## Multiple positional parameters

When you specify more than one positional parameter, the input that
`cue export` evaluates varies, based on what *types* of input you provide.
Informally, you can think about all potential inputs being subdivided into
these five types:

- Complete CUE packages
  (a "**<u style='text-decoration-style: dotted;'>CUE package</u>**")
- Individual CUE files that have a `package` clause near the top of the file
  (a "**<u style='text-decoration-style: dotted;'>CUE package file</u>**")
- CUE files that do *not* have a `package` clause near the top
  (a "**<u style='text-decoration-style: dotted;'>packageless CUE file</u>**")
- Non-CUE data files
  (a "**<u style='text-decoration-style: dotted;'>data file</u>**")
- Non-CUE schema or constraint files, such as JSON Schema, OpenAPI, or Protobuf
  (a "**<u style='text-decoration-style: dotted;'>constraint file</u>**")

These types and names aren't formally defined or specified - they're just
informal classifications that you can keep in mind as you read this guide.

### CUE package inputs

A <u style='text-decoration-style: dotted;'>CUE package</u> input can either be combined with other <u style='text-decoration-style: dotted;'>CUE package</u> inputs,
or it can be combined with any other input types.
A <u style='text-decoration-style: dotted;'>CUE package</u> input cannot be combined with other <u style='text-decoration-style: dotted;'>CUE package</u> inputs
and other input types at the same time.

<!-- SENSE CHECK
{{< code-tabs >}}
{{< code-tab name="packageA.cue" language="cue" area="top-left" >}}
package A
x: "foo"
{{< /code-tab >}}{{< code-tab name="packageB.cue" language="cue" area="top-left" >}}
package B
y: 2
{{< /code-tab >}}{{< code-tab name="data.cue" language="cue" area="top-left" >}}
x: "foo"
{{< /code-tab >}}{{< code-tab name="data.yml" language="yml" area="top-left" >}}
y: 2
{{< /code-tab >}}{{< code-tab name="schema.json" language="json" area="top-left" >}}
{ "$schema": "http://json-schema.org/draft-07/schema#", "type": "object",
  "properties": { "x": { "type": "string", "minLength": 1 } } }
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAuOkEgLjpCCmN1ZSBleHBvcnQgLjpBIGRhdGEuY3VlCmN1ZSBleHBvcnQgLjpBIHBhY2thZ2VCLmN1ZQpjdWUgZXhwb3J0IC46QSBkYXRhLnltbApjdWUgZXhwb3J0IC46QSBzY2hlbWEuanNvbgpjdWUgZXhwb3J0IC46QSAuOkIgZGF0YS5jdWUKY3VlIGV4cG9ydCAuOkEgLjpCIHBhY2FrZ2VCLmN1ZQpjdWUgZXhwb3J0IC46QSAuOkIgZGF0YS55bWwKY3VlIGV4cG9ydCAuOkEgLjpCIHNjaGVtYS5qc29uCnJtIC1mICouY3VlIGRhdGEueW1sIHNjaGVtYS5qc29uICoub3V0" }
# "A <u style='text-decoration-style: dotted;'>CUE package</u> input can either be combined with other <u style='text-decoration-style: dotted;'>CUE package</u> inputs,"
$ cue export .:A .:B
{
    "x": "foo"
}
{
    "y": 2
}

# "or with any other types of input."
$ cue export .:A data.cue
{
    "x": "foo"
}
$ cue export .:A packageB.cue
{
    "y": 2,
    "x": "foo"
}
$ cue export .:A data.yml
{
    "y": 2,
    "x": "foo"
}
$ cue export .:A schema.json
{
    "x": "foo"
}

# "A <u style='text-decoration-style: dotted;'>CUE package</u> input cannot be combined with other <u style='text-decoration-style: dotted;'>CUE package</u> inputs
# **and** other types of input."
$ cue export .:A .:B data.cue
too many packages defined (2) in combination with files
$ cue export .:A .:B pacakgeB.cue
could not find file /home/runner/pacakgeB.cue: stat: stat /home/runner/pacakgeB.cue: no such file or directory
$ cue export .:A .:B data.yml
too many packages defined (2) in combination with files
$ cue export .:A .:B schema.json
too many packages defined (2) in combination with files

# Tidy up.
$ rm -f *.cue data.yml schema.json *.out
```
-->

#### Combining multiple CUE package inputs

When multiple <u style='text-decoration-style: dotted;'>CUE package</u> inputs are specified then the resulting CUE
evaluation is executed once for each package:

{{< code-tabs >}}
{{< code-tab name="1.cue" language="cue" area="left" >}}
package one

A: 1
{{< /code-tab >}}
{{< code-tab name="2.cue" language="cue" area="left" >}}
package two

B: 2
{{< /code-tab >}}
{{< code-tab name="3.cue" language="cue" area="left" >}}
package three

C: 3
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAuOm9uZSA6dHdvIC46dGhyZWU=" >}}
$ cue export .:one :two .:three
{
    "A": 1
}
{
    "B": 2
}
{
    "C": 3
}
{{< /code-tab >}}
{{< /code-tabs >}}

Multiple <u style='text-decoration-style: dotted;'>CUE package</u> inputs cannot be combined with any other input types -
only other <u style='text-decoration-style: dotted;'>CUE package</u> inputs.

<!-- SENSE CHECK
{{< code-tabs >}}
{{< code-tab name="1.cue" language="cue" area="top-left" >}}
package one
x: 1
{{< /code-tab >}}{{< code-tab name="2.cue" language="cue" area="top-left" >}}
package two
x: 2
{{< /code-tab >}}{{< code-tab name="data.cue" language="cue" area="top-left" >}}
y: "a string"
{{< /code-tab >}}{{< code-tab name="data.yml" language="yml" area="top-left" >}}
y: "a string"
{{< /code-tab >}}{{< code-tab name="schema.json" language="json" area="top-left" >}}
{ "$schema": "http://json-schema.org/draft-07/schema#", "type": "object",
  "properties": { "x": { "type": "integer" } } }
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAuOm9uZSAuOnR3byA+Mi1wYWNrYWdlcy5vdXQKY2F0IDItcGFja2FnZXMub3V0IHwgZ3JlcCAtYyAnXnskJyB8IGdyZXAgLXggMgpjYXQgMi1wYWNrYWdlcy5vdXQgfCBncmVwIC1jICdefSQnIHwgZ3JlcCAteCAyCmNhdCAyLXBhY2thZ2VzLm91dCB8IGdyZXAgLWMgJyJ4IjonIHwgZ3JlcCAteCAyCmN1ZSBleHBvcnQgLjpvbmUgLjp0d28gZGF0YS5jdWUKY3VlIGV4cG9ydCAuOm9uZSAuOnR3byBkYXRhLnltbApjdWUgZXhwb3J0IC46b25lIC46dHdvIHNjaGVtYS5qc29uCnJtIC1mICouY3VlIGRhdGEueW1sIHNjaGVtYS5qc29uICoub3V0" }
# "When multiple <u style='text-decoration-style: dotted;'>CUE package</u> inputs are specified then the resulting CUE
# evaluation is executed once for each package."
$ cue export .:one .:two >2-packages.out
$ cat 2-packages.out | grep -c '^{$' | grep -x 2
2
$ cat 2-packages.out | grep -c '^}$' | grep -x 2
2
$ cat 2-packages.out | grep -c '"x":' | grep -x 2
2

# "Multiple <u style='text-decoration-style: dotted;'>CUE package</u> inputs
# cannot be combined with any other input types"
$ cue export .:one .:two data.cue
too many packages defined (2) in combination with files
$ cue export .:one .:two data.yml
too many packages defined (2) in combination with files
$ cue export .:one .:two schema.json
too many packages defined (2) in combination with files

# Tidy up.
$ rm -f *.cue data.yml schema.json *.out
```
-->

#### Combining one CUE package input with other input types

When a single <u style='text-decoration-style: dotted;'>CUE package</u> input is specified alongside other input types then
`cue export` [unifies]({{< relref "docs/tour/basics/unification" >}}) all the
inputs and evaluates the result of this unification.

Any number of inputs belonging to other input types may be combined with a
single <u style='text-decoration-style: dotted;'>CUE package</u> input.
({{<issue 3341>}}Issue #3341{{</issue>}} tracks a problem when combining a
<u style='text-decoration-style: dotted;'>CUE package</u> input with a <u style='text-decoration-style: dotted;'>constraint file</u> and one or more other input
types). The <u style='text-decoration-style: dotted;'>CUE package</u> input must be the first input specified in the list
of positional parameters.

Each input contributes the kind of information to the unification that you
would expect:
<u style='text-decoration-style: dotted;'>data file</u> inputs contribute data;
<u style='text-decoration-style: dotted;'>constraint file</u> inputs contribute constraints;
<u style='text-decoration-style: dotted;'>CUE package file</u> and <u style='text-decoration-style: dotted;'>packageless CUE file</u> inputs contribute data and
constraints, depending on the CUE they contain.

Here's an example demonstrating multiple input types being specified alongside
a single <u style='text-decoration-style: dotted;'>CUE package</u>:

{{< code-tabs >}}
{{< code-tab name="1.cue" language="cue" area="left" >}}
package one

// Field x must be present.
x!: _
{{< /code-tab >}}
{{< code-tab name="min.cue" language="cue" area="left" >}}
package min

x: >10
{{< /code-tab >}}
{{< code-tab name="max.cue" language="cue" area="left" >}}
x: <=99
{{< /code-tab >}}
{{< code-tab name="data.yml" language="yml" area="left" >}}
x: 50
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAuOm9uZSBtaW4uY3VlIGRhdGEueW1sIG1heC5jdWU=" >}}
$ cue export .:one min.cue data.yml max.cue
{
    "x": 50
}
{{< /code-tab >}}
{{< /code-tabs >}}

If <u style='text-decoration-style: dotted;'>CUE package file</u> inputs are present then their package clauses need to be
the same as each other, but don't need to match the name of any <u style='text-decoration-style: dotted;'>CUE package</u>
input that's present.
By definition, <u style='text-decoration-style: dotted;'>packageless CUE file</u> inputs don't contain a package clause, so
this requirement doesn't affect them.

<!-- SENSE CHECK
{{< code-tabs >}}
{{< code-tab name="packageA.cue" language="cue" area="top-left" >}}
package A
x: "foo"
{{< /code-tab >}}{{< code-tab name="packageB.cue" language="cue" area="top-left" >}}
package B
y: 2
{{< /code-tab >}}{{< code-tab name="data.cue" language="cue" area="top-left" >}}
x: "foo"
{{< /code-tab >}}{{< code-tab name="data.yml" language="yml" area="top-left" >}}
y: 2
{{< /code-tab >}}{{< code-tab name="schema.json" language="json" area="top-left" >}}
{ "$schema": "http://json-schema.org/draft-07/schema#", "type": "object",
  "properties": { "x": { "type": "string", "minLength": 1 } } }
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAuOkEgc2NoZW1hLmpzb24gZGF0YS55bWwgPjMzNDEub3V0IDI+JjEKZ3JlcCAiY2Fubm90IGNvbWJpbmUgcGFja2FnZXMgd2l0aCBpbmRpdmlkdWFsIHNjaGVtYSBmaWxlcyIgMzM0MS5vdXQKY3VlIGV4cG9ydCAuOkEgZGF0YS5jdWUKY3VlIGV4cG9ydCBkYXRhLmN1ZSAuOkEKY3VlIGV4cG9ydCAuOkEgZGF0YS55bWwKY3VlIGV4cG9ydCBkYXRhLnltbCAuOkEKY3VlIGV4cG9ydCAuOkEgcGFja2FnZUIuY3VlCmN1ZSBleHBvcnQgcGFja2FnZUIuY3VlIC46QQpjdWUgZXhwb3J0IHBhY2thZ2VBLmN1ZSBwYWNrYWdlQS5jdWUKY3VlIGV4cG9ydCBwYWNrYWdlQS5jdWUgcGFja2FnZUIuY3VlCmN1ZSBleHBvcnQgLjpBIHBhY2thZ2VCLmN1ZQpybSAtZiAqLmN1ZSBkYXRhLnltbCBzY2hlbWEuanNvbiAqLm91dA==" }
# "Issue #3341 tracks a problem when combining a *CUE
# package* input with a <u style='text-decoration-style: dotted;'>constraint file</u> and one or more other input types)."
$ cue export .:A schema.json data.yml >3341.out 2>&1
$ grep "cannot combine packages with individual schema files" 3341.out
cannot combine packages with individual schema files

# "The <u style='text-decoration-style: dotted;'>CUE package</u> input must be the first input specified in the list of
# positional parameters."
$ cue export .:A data.cue
{
    "x": "foo"
}
$ cue export data.cue .:A
no encoding specified for file ".:A"
$ cue export .:A data.yml
{
    "y": 2,
    "x": "foo"
}
$ cue export data.yml .:A
no encoding specified for file ".:A"
$ cue export .:A packageB.cue
{
    "y": 2,
    "x": "foo"
}
$ cue export packageB.cue .:A
no encoding specified for file ".:A"

# "If <u style='text-decoration-style: dotted;'>CUE package file</u> inputs are present then their package clauses need to be
# the same as each other"
$ cue export packageA.cue packageA.cue
{
    "x": "foo"
}
$ cue export packageA.cue packageB.cue
found packages "A" (packageA.cue) and "B" (packageB.cue) in "/home/runner"

# "but don't need to match the name of any <u style='text-decoration-style: dotted;'>CUE package</u>
# input that's present."
$ cue export .:A packageB.cue
{
    "y": 2,
    "x": "foo"
}

# Tidy up.
$ rm -f *.cue data.yml schema.json *.out
```
-->

### CUE package file inputs

As a reminder, <u style='text-decoration-style: dotted;'>CUE package file</u> inputs are CUE files that contain a `package`
clause near the top, and are distinguished from <u style='text-decoration-style: dotted;'>CUE package</u> inputs as they're
referenced *individually* during an invocation, and not by a package import
path. In other words, <u style='text-decoration-style: dotted;'>CUE package file</u> inputs are any CUE files containing a
package clause that you *explicitly* tell `cue export` to process.

When you mention a <u style='text-decoration-style: dotted;'>CUE package file</u> input alongside a <u style='text-decoration-style: dotted;'>data file</u> input, the
inputs are [unified]({{< relref "docs/tour/basics/unification" >}}), with any
resulting concrete data being validated against any constraints that are
present in the CUE:

{{< code-tabs >}}
{{< code-tab name="1.cue" language="cue" area="left" >}}
package one

A:  1    // A is the concrete value 1.
B?: >100 // B must be greater than 100.
{{< /code-tab >}}
{{< code-tab name="data.yml" language="yml" area="left" >}}
A: "some string"
B: 99
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAxLmN1ZSBkYXRhLnltbA==" >}}
$ cue export 1.cue data.yml
A: conflicting values "some string" and 1 (mismatched types string and int):
    ./1.cue:3:5
    ./data.yml:1:4
B: invalid value 99 (out of bound >100):
    ./1.cue:4:5
    ./data.yml:2:4
{{< /code-tab >}}
{{< /code-tabs >}}

When you tell `cue export` to process a <u style='text-decoration-style: dotted;'>CUE package file</u> input alongside a
<u style='text-decoration-style: dotted;'>CUE package</u> input, their package names don't need to match. However, if you
mention multiple <u style='text-decoration-style: dotted;'>CUE package file</u> inputs, then the package names of **all**
the <u style='text-decoration-style: dotted;'>CUE package file</u> inputs must be the same as each other - but they still
don't need to match any <u style='text-decoration-style: dotted;'>CUE package</u> input that's also present.
A <u style='text-decoration-style: dotted;'>packageless CUE file</u> input (a CUE file that doesn't contain a package
clause) can be included alongside <u style='text-decoration-style: dotted;'>CUE package file</u> and <u style='text-decoration-style: dotted;'>CUE package</u> inputs.

In all these situations the inputs are
[unified]({{< relref "docs/tour/basics/unification" >}}), with any data being
validated against any constraints that are present:

{{< code-tabs >}}
{{< code-tab name="package.cue" language="cue" area="left" >}}
package one

// Field x must be present.
x!: _
{{< /code-tab >}}
{{< code-tab name="min.cue" language="cue" area="left" >}}
package two

x: >10
{{< /code-tab >}}
{{< code-tab name="max.cue" language="cue" area="left" >}}
package two

x: <=99
{{< /code-tab >}}
{{< code-tab name="calc.cue" language="cue" area="left" >}}
z: x * 2
{{< /code-tab >}}
{{< code-tab name="data.yml" language="yml" area="left" >}}
x: 50
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAuOm9uZSBtaW4uY3VlIG1heC5jdWUgZGF0YS55bWwgY2FsYy5jdWU=" >}}
$ cue export .:one min.cue max.cue data.yml calc.cue
{
    "z": 100,
    "x": 50
}
{{< /code-tab >}}
{{< /code-tabs >}}

### Packageless CUE file inputs

`cue export` handles <u style='text-decoration-style: dotted;'>packageless CUE file</u> inputs identically to
<u style='text-decoration-style: dotted;'>data file</u> inputs - they're treated equivalently, and are interchangeable
as `cue export` positional parameters.
However, where <u style='text-decoration-style: dotted;'>data file</u> inputs can only introduce concrete data,
<u style='text-decoration-style: dotted;'>packageless CUE file</u> inputs can also include constraints, calculated fields,
and all other CUE language features *alongside*
their concrete data.
Their contributions to the evaluation are unified as you might expect - their
constraints add to the set of constraints that validate the concrete data, and
their concrete data is validated against the set of constraints derived from
all constraint-related input types.

### Data file inputs

<u style='text-decoration-style: dotted;'>Data file</u> inputs contain concrete data, encoded as JSON or YAML.
If they are specified alongside other input types then they are treated as
described in the sections above.
If they are processed without other input types being present, then `cue
export` simply [unifies]({{< relref "docs/tour/basics/unification" >}}) the
data they contain.
As always, unification is recursive, processing nested data structures to an
arbitrary depth:

{{< code-tabs >}}
{{< code-tab name="data.json" language="json" area="left" >}}
{
    "A": 1,
    "B": {
        "C": 2
    },
    "E": [
        4,
        {
            "F": 5
        },
        7
    ]
}
{{< /code-tab >}}
{{< code-tab name="data.yml" language="yml" area="left" >}}
A: 1
B:
  D: 3
E:
  - 4
  - G: 6
  - 7
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLnltbCBkYXRhLmpzb24=" >}}
$ cue export data.yml data.json
{
    "A": 1,
    "B": {
        "C": 2,
        "D": 3
    },
    "E": [
        4,
        {
            "F": 5,
            "G": 6
        },
        7
    ]
}
{{< /code-tab >}}
{{< /code-tabs >}}

If any values don't unify successfully, at any depth, an error message is printed:

{{< code-tabs >}}
{{< code-tab name="data.yml" language="yml" area="left" >}}
A:
  - 1
  - B: 2
  - 4
{{< /code-tab >}}
{{< code-tab name="data.json" language="json" area="left" >}}
{
    "A": [
        1,
        {
            "B": 3
        }
    ]
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLnltbCBkYXRhLmpzb24=" >}}
$ cue export data.yml data.json
A: incompatible list lengths (2 and 3)
A.1.B: conflicting values 2 and 3:
    ./data.json:5:18
    ./data.yml:3:8
{{< /code-tab >}}
{{< /code-tabs >}}

### Constraint file inputs

A <u style='text-decoration-style: dotted;'>constraint file</u> input contains one or more data constraints expressed
in a non-CUE encoding such as JSON Schema, OpenAPI or Protocol Buffers. They
can be combined with all other input types, with their constraints being
[unified]({{< relref "docs/tour/basics/unification" >}}) with constraints from
any other inputs, which are then used to validate any data inputs.

A <u style='text-decoration-style: dotted;'>constraint file</u> input can be used without any CUE-based inputs.
`cue export` can validate data directly against a <u style='text-decoration-style: dotted;'>constraint file</u> input:

{{< code-tabs >}}
{{< code-tab name="schema.json" language="json" area="left" >}}
{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "properties": {
        "A": {
            "type": "integer",
            "minimum": 100
        },
        "B": {
            "type": "number",
            "maximum": 99
        }
    }
}
{{< /code-tab >}}
{{< code-tab name="data.yml" language="yml" area="left" >}}
A: 50
B: 1000
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLnltbCBzY2hlbWEuanNvbg==" >}}
$ cue export data.yml schema.json
A: invalid value 50 (out of bound >=100):
    ./schema.json:7:13
    ./data.yml:1:4
B: invalid value 1000 (out of bound <=99):
    ./schema.json:11:13
    ./data.yml:2:4
{{< /code-tab >}}
{{< /code-tabs >}}

{{<issue 3341>}}Issue #3341{{</issue>}} tracks a problem when combining a
<u style='text-decoration-style: dotted;'>CUE package</u> input with a <u style='text-decoration-style: dotted;'>constraint file</u> and some other input types.

`cue export` recognizes JSON Schema and OpenAPI <u style='text-decoration-style: dotted;'>constraint file</u> inputs
through their signature fields. This behaviour can be changed by
[using a qualifier]({{< relref "#input-file-encodings" >}}) to instruct the
command to treat the <u style='text-decoration-style: dotted;'>constraint file</u> input as pure data:

{{< code-tabs >}}
{{< code-tab name="schema.json" language="json" area="top-left" >}}
{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "properties": {
        "A": {
            "type": "integer",
            "minimum": 100
        },
        "B": {
            "type": "number",
            "maximum": 99
        }
    }
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBqc29uOiBzY2hlbWEuanNvbg==" >}}
$ cue export json: schema.json
{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "properties": {
        "A": {
            "type": "integer",
            "minimum": 100
        },
        "B": {
            "type": "number",
            "maximum": 99
        }
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Standard input stream

The standard input stream of the `cue export` command is available for
processing as any file-based input type, through its pseudo-filename of "`-`".
By default, standard input is processed as CUE -- either as a
<u style='text-decoration-style: dotted;'>CUE package file</u> or <u style='text-decoration-style: dotted;'>packageless CUE file</u> input, depending if the stream
contains a `package` clause or not.

To indicate that `cue export` should interpret the stream through a different
encoding, use
[a qualifier]({{< relref "#input-file-encodings" >}}):

{{< code-tabs >}}
{{< code-tab name="data.yml" language="yml" area="top-left" >}}
A:
  - b
  - c
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y2F0IGRhdGEueW1sIHwgY3VlIGV4cG9ydCB5YW1sOiAt" }
$ cat data.yml | cue export yaml: -
{
    "A": [
        "b",
        "c"
    ]
}
```

## Non-CUE data location

During evaluation, `cue export` unifies all its inputs and, by default, places
the contents of any <u style='text-decoration-style: dotted;'>data file</u> inputs at the top-level of the evaluation
space. You can change this behaviour by specifying a static or dynamic location
for all <u style='text-decoration-style: dotted;'>data file</u> inputs using the `--path`/`-l` flag. This flag is
described in
[`cue help flags`]({{< relref "/docs/reference/command/cue-help-flags" >}}),
and is demonstrated below.

### Static locations

To specify a static location for the <u style='text-decoration-style: dotted;'>data file</u> inputs during evaluation,
provide the `--path`/`-l` flag with a CUE expression that ends with a colon (`:`):

{{< code-tabs >}}
{{< code-tab name="data.yml" language="yml" area="top-left" >}}
data: true
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLnltbCAtLXBhdGggZm9vOg==" >}}
$ cue export data.yml --path foo:
{
    "foo": {
        "data": true
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

Increase the depth and nesting of the location by adding more components to the
expression:

{{< code-tabs >}}
{{< code-tab name="data.yml" language="yml" area="top-left" >}}
data: true
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLnltbCAtbCBmb286YmFyOmJhejo=" >}}
$ cue export data.yml -l foo:bar:baz:
{
    "foo": {
        "bar": {
            "baz": {
                "data": true
            }
        }
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

You can also provide multiple path components through repeated instances of the
flag. For example, the previous example is equivalent to `-l foo: -l bar: -l
baz:`.

The combined values of all `--path`/`-l` flags that are present in a
`cue export` invocation apply to *all* the <u style='text-decoration-style: dotted;'>data file</u> inputs. The flags'
positions in the invocation are irrelevant, no matter where they sit relative
to any positional parameters defining the inputs to be processed. When
specifying a static location, this means that the data in all <u style='text-decoration-style: dotted;'>data file</u>
inputs is unified at the location provided. If there are multiple
<u style='text-decoration-style: dotted;'>data file</u> inputs, all their contents must be capable of being unified:

{{< code-tabs >}}
{{< code-tab name="data.json" language="json" area="top-left" >}}
{
    "data": false
}
{{< /code-tab >}}
{{< code-tab name="data.yml" language="yml" area="top-right" >}}
data: true
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtbCBmb286IGRhdGEueW1sIC1sIGJhcjogZGF0YS5qc29uIC1sIGJhejo=" >}}
$ cue export -l foo: data.yml -l bar: data.json -l baz:
foo.bar.baz.data: conflicting values true and false:
    ./data.json:2:13
    ./data.yml:1:7
{{< /code-tab >}}
{{< /code-tabs >}}

### Dynamic locations

As you saw in the previous section, a trailing colon (`:`) tells `cue export`
that a value in the location expression should be interpreted statically.
If the colon is omitted, then the value is resolved dynamically - in the
context of the data that's present:

{{< code-tabs >}}
{{< code-tab name="data.yml" language="yml" area="top-left" >}}
foo: "a"
data: true
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLnltbCAtbCBmb28=" >}}
$ cue export data.yml -l foo
{
    "a": {
        "foo": "a",
        "data": true
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

Functions from the CUE
[standard library]({{< relref "/docs/tour/packages/standard-library" >}}) may
be included in the specification of a dynamic expression, without their
containing packages being imported:

{{< code-tabs >}}
{{< code-tab name="data.yml" language="yml" area="top-left" >}}
foo: "a"
data: true
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLnltbCAtbCAnc3RyaW5ncy5Ub1VwcGVyKGZvbykn" >}}
$ cue export data.yml -l 'strings.ToUpper(foo)'
{
    "A": {
        "foo": "a",
        "data": true
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}

Adding the `--with-context` flag changes the context in which the dynamic
expression is evaluated, allowing it to refer to information about a
<u style='text-decoration-style: dotted;'>data file</u> input (such as the file's name) as described in
[`cue help flags`]({{< relref "/docs/reference/command/cue-help-flags" >}}):
<!-- TODO(jcm): link to a --with-context guide when it's available -->

{{< code-tabs >}}
{{< code-tab name="data.yml" language="yml" area="top" >}}
data: true
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLnltbCAtbCAncGF0aC5CYXNlKGZpbGVuYW1lKScgLS13aXRoLWNvbnRleHQ=" >}}
$ cue export data.yml -l 'path.Base(filename)' --with-context
{
    "data.yml": {
        "data": true
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}


## Data files with multiple documents

Some encodings, such as YAML, permit multiple documents to be contained in a
single file. When processing such <u style='text-decoration-style: dotted;'>data file</u> inputs, `cue export` offers a
choice of how to combine these documents.

The default behaviour is to merge the documents normally, as is done via
unification. Because they are merged, their contents must have values that are
*capable* of being unified:

{{< code-tabs >}}
{{< code-tab name="data.yml" language="yml" area="top-left" >}}
---
A: 1
---
B: 2
---
C: 3
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLnltbCAtLW1lcmdl" >}}
$ cue export data.yml --merge
{
    "A": 1,
    "B": 2,
    "C": 3
}
{{< /code-tab >}}
{{< /code-tabs >}}

Merging is the command's default behaviour, so the `--merge` flag is optional.

Alternatively, you can opt for multiple documents to be placed in a list by
providing the `--list` flag. This behaviour permits documents to be processed
that contain incompatible values that can't unify successfully:

{{< code-tabs >}}
{{< code-tab name="data.yml" language="yml" area="top-left" >}}
---
A: 1
---
A: 2
---
A: 3
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLnltbCAtLWxpc3Q=" >}}
$ cue export data.yml --list
[
    {
        "A": 1
    },
    {
        "A": 2
    },
    {
        "A": 3
    }
]
{{< /code-tab >}}
{{< /code-tabs >}}

## Information injection

System information and arbitrary values can be made available to an evaluation
by using *tag variables* and *tag attributes*. They are described in
[`cue help injection`]({{< relref "/docs/reference/command/cue-help-injection/" >}}),
and are demonstrated in the how-to guides
{{< linkto/inline "howto/inject-system-information-into-evaluation-using-tag-variable" >}}
and {{< linkto/inline "howto/inject-value-into-evaluation-using-tag-attribute" >}}.

<!-- A warning block is used only to gain access to the yellow background site colour -->
{{<warning>}}
### In [this guide]({{< relref "." >}}):
1. **This page** --
   learn how the inputs you provide are interpreted and combined
1. [Evaluation]({{< relref "evaluation" >}}) --
   find out about the aspects of the command's operation that you can control
1. [Output]({{< relref "output" >}}) --
   see how the command output's encoding can be selected, and directed into a
   specific location
{{</warning>}}

*Next page:* [Evaluation]({{< relref "evaluation" >}})
