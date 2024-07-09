---
title: Inputs
weight: 10
authors: [jpluscplusm]
toc_hide: false
---

<!-- SENSE CHECK
A note to the content author/reviewer/updater:
This guide contains several upload&script blocks inside HTML comments.
They are present to act as sense checks on the truth of the statements
presented above them, where explicitly presenting a rendered block validating
each statement would make the page too long and verbose for the reader.

Because we don't have a formal spec for `cue export` (modulo the actual code!),
these scripts will check that the significant points exposed in prose remain
true across CUE releases. Exact output is *not* tested, as these blocks aren't
meant to be byte-for-byte output checks. Content checks (e.g. grep) /can/
follow a command invocation, but only insofar as they're needed to assert the
applicability of the command's success or failure.

These blocks are *not* "hidden" blocks, but they're invisible because they're
inside an HTML comment (which Hugo strips out when processing). They're encoded
like this so that they *can* be rendered to assist with debugging why they've
started failing, in the future, simply by removing the opening HTML comment element.

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
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAuOm9uZQ==" >}}
$ cue export .:one
{
    "message": "this is package one"
}
{{< /code-tab >}}
{{< /code-tabs >}}

CUE *import paths* are described in
[`cue help inputs`]({{< relref "docs/reference/command/cue-help-inputs" >}}).
The previous example shows one which is a *rooted path* (also explained in
`cue help inputs`).

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

Individual CUE files can be referred to in this way, instead of using them
through their import path at the package level. Import paths, however, are the
*suggested* way to refer to CUE as they automatically include new and renamed
files in the package. Referring directly to CUE files requires you to keep
`cue export` invocations up to date, manually, if you change the names of the
files being used.

## Input file encodings

The filename suffixes that `cue export` understands are described in
[`cue help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes" >}}),
including `.json`, `.yml`, `.yaml`, and `.cue`. If a filename suffix is
recognised, then `cue export` automatically interprets the file through the
related data encoding. If the encoding of a file doesn't match its filename
suffix, use a qualifier to specify the encoding:

{{< code-tabs >}}
{{< code-tab name="some.yaml.data" language="data" area="left" >}}
message: this YAML data file has a .data suffix
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCB5YW1sOiBzb21lLnlhbWwuZGF0YQ==" >}}
$ cue export yaml: some.yaml.data
{
    "message": "this YAML data file has a .data suffix"
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

- Complete CUE packages (a "**CUE package**")
- CUE files that have a `package` clause at the top of the file and therefore
  belong to their named package (a "**CUE package file**")
- CUE files that don't have a `package` clause at the top, and don't belong to
  any package (a "**packageless CUE file**")
- Non-CUE data files: (a "**data file**")
- Non-CUE schema or constraint files, such as JSON Schema, OpenAPI, or Protobuf
  (a "**constraint file**")

(These types and names aren't formally defined or specified - they're just
informal classifications that you can keep in mind as you read this guide)

### CUE package inputs

A *CUE package* input can either be combined with other *CUE package* inputs,
or with any other types of input.
A *CUE package* input cannot be combined with other *CUE package* inputs
**and** other types of input.

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
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAuOkEgLjpCCmN1ZSBleHBvcnQgLjpBIGRhdGEuY3VlCmN1ZSBleHBvcnQgLjpBIHBhY2thZ2VCLmN1ZQpjdWUgZXhwb3J0IC46QSBkYXRhLnltbApjdWUgZXhwb3J0IC46QSBzY2hlbWEuanNvbgpjdWUgZXhwb3J0IC46QSAuOkIgZGF0YS5jdWUKY3VlIGV4cG9ydCAuOkEgLjpCIHBhY2FrZ2VCLmN1ZQpjdWUgZXhwb3J0IC46QSAuOkIgZGF0YS55bWwKY3VlIGV4cG9ydCAuOkEgLjpCIHNjaGVtYS5qc29uCnJtICouY3VlIGRhdGEueW1sIHNjaGVtYS5qc29u" }
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
$ rm *.cue data.yml schema.json
```
-->

#### Combining multiple CUE package inputs

When multiple *CUE package* inputs are specified then the resulting CUE
evaluation is executed once for each package. Multiple *CUE package* inputs
cannot be combined with any other input types - only other *CUE package*
inputs.

{{< code-tabs >}}
{{< code-tab name="package-one.cue" language="cue" area="left" >}}
package one

A: 1
{{< /code-tab >}}
{{< code-tab name="package-two.cue" language="cue" area="left" >}}
package two

B: 2
{{< /code-tab >}}
{{< code-tab name="package-three.cue" language="cue" area="left" >}}
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

#### Combining one CUE package input with other input types

When one *CUE package* input is specified alongside other input types (i.e.
**not** with another *CUE package*), then `cue export`
[unifies]({{< relref "docs/tour/basics/unification" >}}) all the inputs and
evaluates the result of this unification. Any number of inputs and input types
may be combined with a *CUE package* input, except other *CUE package* inputs.
The *CUE package* input must be the first input specified in the list of
positional parameters.

Each input contributes the kind of information to the unification that you
would expect:
*data file* inputs contribute data;
*constraint file* inputs contribute constraints;
*CUE package file* and *packageless CUE file* inputs contribute data and
constraints, depending on the CUE they contain.

{{<issue 3341>}}Issue #3341{{</issue>}} tracks a problem with combining a *CUE
package* input with a *constraint file* and one or more other input types.

Here's an example demonstrating multiple input types being specified alongside
a single *CUE package*:

{{< code-tabs >}}
{{< code-tab name="file" language="" area="top-left" >}}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="ZWNobyBGSVhNRQ==" >}}
$ echo FIXME
FIXME
{{< /code-tab >}}
{{< /code-tabs >}}

If *CUE package file* inputs are present then their package clauses need to be
the same as each other, but the package they belong to does not need to match
the name of the *CUE package* input (if one is present).
*Packageless CUE file* inputs don't contain a package clause, by definition, so
this requirement doesn't affect them.

### CUE package file inputs



### .cue + data

unification & validation.

### .cue + data + data

unification & validation.

### .cue + .cue + data

package names must align, or be packageless.
unification & validation.

### .cue + .cue + data + data

package names must align, or be packageless.
unification & validation.

### CUE + CUE

oddness.

### CUE + CUE + data

not allowed.

### data + data

unification

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
