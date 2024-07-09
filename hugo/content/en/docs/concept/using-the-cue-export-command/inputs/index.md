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
B: 2.2
C: A + B + 3.33
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "A": 1,
    "B": 2.2,
    "C": 6.53
}
{{< /code-tab >}}
{{< /code-tabs >}}

This package is loaded as a *package instance* -- a concept which is explained
later in this guide.

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
[`cue help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes" >}}),
including `.json`, `.yml`, `.yaml`, and `.cue`. If a filename suffix is
recognised, then `cue export` automatically interprets the file through the
related data encoding. If the encoding of a file doesn't match its filename
suffix, use a qualifier to specify the encoding:

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
*next* qualifier. The qualifiers that `cue export` understands are described in
[`cue help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes" >}}),
including `json:`, `yaml:`, and `cue:`.

## Multiple positional parameters

When you specify more than one positional parameter, the input that
`cue export` evaluates varies, based on what *types* of input you provide.
Informally, you can think about all potential inputs being subdivided into
these five types:

- Complete CUE packages
  (a "**CUE package**")
- Individual CUE files that have a `package` clause near the top of the file
  (a "**CUE package file**")
- CUE files that do *not* have a `package` clause near the top
  (a "**packageless CUE file**")
- Non-CUE data files
  (a "**data file**")
- Non-CUE schema or constraint files, such as JSON Schema, OpenAPI, or Protobuf
  (a "**constraint file**")

(These types and names aren't formally defined or specified - they're just
informal classifications that you can keep in mind as you read this guide)

### CUE package inputs

A *CUE package* input can either be combined with other *CUE package* inputs,
or it can be combined with any other input types.
A *CUE package* input cannot be combined with other *CUE package* inputs
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
# "A *CUE package* input can either be combined with other *CUE package* inputs,"
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

# "A *CUE package* input cannot be combined with other *CUE package* inputs
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

When multiple *CUE package* inputs are specified then the resulting CUE
evaluation is executed once for each package. Multiple *CUE package* inputs
cannot be combined with any other input types - only other *CUE package*
inputs.

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
# "When multiple *CUE package* inputs are specified then the resulting CUE
# evaluation is executed once for each package."
$ cue export .:one .:two >2-packages.out
$ cat 2-packages.out | grep -c '^{$' | grep -x 2
2
$ cat 2-packages.out | grep -c '^}$' | grep -x 2
2
$ cat 2-packages.out | grep -c '"x":' | grep -x 2
2

# "Multiple *CUE package* inputs
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

When one *CUE package* input is specified alongside other input types
(i.e. not with another *CUE package*), then `cue export`
[unifies]({{< relref "docs/tour/basics/unification" >}}) all the inputs and
evaluates the result of this unification.

Any number of inputs and input types may be combined with a *CUE package*
input, unless other *CUE package* inputs are present.
({{<issue 3341>}}Issue #3341{{</issue>}} tracks a problem when combining a *CUE
package* input with a *constraint file* and one or more other input types).
The *CUE package* input must be the first input specified in the list of
positional parameters.

Each input contributes the kind of information to the unification that you
would expect:
*data file* inputs contribute data;
*constraint file* inputs contribute constraints;
*CUE package file* and *packageless CUE file* inputs contribute data and
constraints, depending on the CUE they contain.

Here's an example demonstrating multiple input types being specified alongside
a single *CUE package*:

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

If *CUE package file* inputs are present then their package clauses need to be
the same as each other, but don't need to match the name of any *CUE package*
input that's present.
*Packageless CUE file* inputs don't contain a package clause, by definition, so
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
# package* input with a *constraint file* and one or more other input types)."
$ cue export .:A schema.json data.yml >3341.out 2>&1
$ grep "cannot combine packages with individual schema files" 3341.out
cannot combine packages with individual schema files

# "The *CUE package* input must be the first input specified in the list of
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

# "If *CUE package file* inputs are present then their package clauses need to be
# the same as each other"
$ cue export packageA.cue packageA.cue
{
    "x": "foo"
}
$ cue export packageA.cue packageB.cue
found packages "A" (packageA.cue) and "B" (packageB.cue) in "/home/runner"

# "but don't need to match the name of any *CUE package*
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

As a reminder, *CUE package file* inputs are CUE files that contain a `package`
clause near the top, and are distinguished from *CUE package* inputs as they're
referenced *individually* during an invocation, and not by a package import
path. In other words, *CUE package file* inputs are any `.cue` files containing
a package clause that you *explicitly* tell `cue export` to process.

When you mention a *CUE package file* input alongside a *data file* input, the
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

When you tell `cue export` to process a *CUE package file* input alongside a
*CUE package* input, their package names don't need to match. However, if you
mention multiple *CUE package file* inputs, then the package names of **all**
the *CUE package file* inputs must be the same as each other - but they still
don't need to match any *CUE package* input that's also present.
*Packageless CUE file* inputs (CUE files that don't contain a package clause)
can be included alongside *CUE package file* and *CUE package* inputs.

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

`cue export` handles *packageless CUE file* inputs identically to
[*data file* inputs]({{< relref "#data-file-inputs" >}}) - they're treated
equivalently, and are interchangeable as `cue export` positional parameters.
However, where *data file* inputs can only introduce concrete data,
*packageless CUE file* inputs can also include constraints, calculated fields,
and all other CUE language features *alongside* their concrete data.
Their contributions to the evaluation are unified as you might expect - their
constraints add to the set of constraints that validate the concrete data, and
their concrete data is validated against the set of constraints derived from
all constraint-related input types.

### Data file inputs

*Data file* inputs are files that contain JSON or YAML.
If they are specified alongside other input types then they are treated as
described in the sections above.
If they are processed without other input types being present, then 
`cue export` [unifies]({{< relref "docs/tour/basics/unification" >}}) the data
they contain.
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

TODO

## Still TODO

Leave a TODO for "how cue finds CUE" or similar; don't write it all here.
--path/-l
--with-context
Placing non-CUE somewhere other than the root.
Leave a TODO for linking to a future --with-context guide.
stdin

### Injecting values

Demo briefly; link to to other guides.

--name/-n

### Package instances
