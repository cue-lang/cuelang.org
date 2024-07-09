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

{{{with code "en" "cue export # package x1"}}}
exec cue export
cmp stdout out
-- default-input.cue --
package example

A: 1
B: 2.2 + A
C: 3.33 * B
-- out --
{
    "A": 1,
    "B": 3.2,
    "C": 10.656
}
{{{end}}}

This package is loaded as a *package instance* -- a concept which is explained
later in this guide. FIXME

The command fails if more than one package exists in the current directory
and the input isn't explicitly specified:

{{{with code "en" "! cue export # package x2"}}}
#location left left right
! exec cue export
cmp stderr out
-- 1.cue --
package one

message: "this is package one"
-- 2.cue --
package two

message: "this is package two"
-- out --
found packages "one" (1.cue) and "two" (2.cue) in "."
{{{end}}}

## One positional parameter

If you want to export the contents of a CUE package, but there is more than one
package in the current directory, tell `cue export` which package to process by
providing its *import path* as a positional parameter:

{{{with code "en" "cue export .:one"}}}
#location left left right
exec cue export .:two
cmp stdout out
-- 1.cue --
package one

message: "this is package one"
-- 2.cue --
package two

message: "this is package two"
-- out --
{
    "message": "this is package two"
}
{{{end}}}

CUE *import paths* are described in
[`cue help inputs`]({{< relref "docs/reference/command/cue-help-inputs" >}}).
The previous example shows a *rooted* import path (`.:two`), as explained in
`cue help inputs`.
<!-- TODO(jcm) "how cue finds CUE", when available -->

If the sole positional parameter is the path to a data file then the file's
contents are interpreted in the encoding implied by its filename suffix,
and the input processed by `cue export` is the resulting data:

{{{with code "en" "cue export data.yaml"}}}
#location left right
exec cue export path/to/some/data.yaml
cmp stdout out
-- path/to/some/data.yaml --
message: this is a YAML data file
-- out --
{
    "message": "this is a YAML data file"
}
{{{end}}}

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

{{{with code "en" "cue export yaml: some.yaml.data"}}}
#location left right
exec cue export yaml: some-yaml.data
cmp stdout out
-- some-yaml.data --
message: this YAML file has a .data suffix
-- out --
{
    "message": "this YAML file has a .data suffix"
}
{{{end}}}

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
  (a "**{{{.package}}}**")
- Individual CUE files that have a `package` clause near the top of the file
  (a "**{{{.packageFile}}}**")
- CUE files that do *not* have a `package` clause near the top
  (a "**{{{.packagelessFile}}}**")
- Non-CUE data files
  (a "**{{{.dataFile}}}**")
- Non-CUE schema or constraint files, such as JSON Schema, OpenAPI, or Protobuf
  (a "**{{{.constraintFile}}}**")

These types and names aren't formally defined or specified - they're just
informal classifications that you can keep in mind as you read this guide.

### {{{.Hpackage}}} inputs

A {{{.package}}} input can either be combined with other {{{.package}}} inputs,
or it can be combined with any other input types.
A {{{.package}}} input cannot be combined with other {{{.package}}} inputs
and other input types at the same time.

<!-- SENSE CHECK
{{{with upload "en" "test cue package inputs prose"}}}
#nofmt # Priorise fewer lines over nice formatting, as it's only here for the author to read.
-- packageA.cue --
package A
x: "foo"
-- packageB.cue --
package B
y: 2
-- data.cue --
x: "foo"
-- data.yml --
y: 2
-- schema.json --
{ "$schema": "http://json-schema.org/draft-07/schema#", "type": "object",
  "properties": { "x": { "type": "string", "minLength": 1 } } }
{{{end}}}
{{{with script "en" "test cue package inputs prose"}}}

# "A {{{.package}}} input can either be combined with other {{{.package}}} inputs,"
cue export .:A .:B

# "or with any other types of input."
cue export .:A data.cue
cue export .:A packageB.cue
cue export .:A data.yml
cue export .:A schema.json

# "A {{{.package}}} input cannot be combined with other {{{.package}}} inputs
# **and** other types of input."
! cue export .:A .:B data.cue
! cue export .:A .:B pacakgeB.cue
! cue export .:A .:B data.yml
! cue export .:A .:B schema.json

# Tidy up.
rm -f *.cue data.yml schema.json *.out
{{{end}}}
-->

#### Combining multiple {{{.Hpackage}}} inputs

When multiple {{{.package}}} inputs are specified then the resulting CUE
evaluation is executed once for each package:

{{{with code "en" "cue export .:one .:two .:three"}}}
#location left left left right
exec cue export .:one :two .:three
cmp stdout out

-- 1.cue --
package one

A: 1
-- 2.cue --
package two

B: 2
-- 3.cue --
package three

C: 3
-- out --
{
    "A": 1
}
{
    "B": 2
}
{
    "C": 3
}
{{{end}}}

Multiple {{{.package}}} inputs cannot be combined with any other input types -
only other {{{.package}}} inputs.

<!-- SENSE CHECK
{{{with upload "en" "test multiple cue package inputs prose"}}}
#nofmt
-- 1.cue --
package one
x: 1
-- 2.cue --
package two
x: 2
-- data.cue --
y: "a string"
-- data.yml --
y: "a string"
-- schema.json --
{ "$schema": "http://json-schema.org/draft-07/schema#", "type": "object",
  "properties": { "x": { "type": "integer" } } }
{{{end}}}
{{{with script "en" "test multiple cue package inputs prose"}}}

# "When multiple {{{.package}}} inputs are specified then the resulting CUE
# evaluation is executed once for each package."
cue export .:one .:two > 2-packages.out
cat 2-packages.out | grep -c '^{$'  | grep -x 2
cat 2-packages.out | grep -c '^}$'  | grep -x 2
cat 2-packages.out | grep -c '"x":' | grep -x 2

# "Multiple {{{.package}}} inputs
# cannot be combined with any other input types"
! cue export .:one .:two data.cue
! cue export .:one .:two data.yml
! cue export .:one .:two schema.json

# "- only other {{{.package}}} inputs."
# Already handled, above.

# Tidy up.
rm -f *.cue data.yml schema.json *.out
{{{end}}}
-->

#### Combining one {{{.Hpackage}}} input with other input types

When a single {{{.package}}} input is specified alongside other input types then
`cue export` [unifies]({{< relref "docs/tour/basics/unification" >}}) all the
inputs and evaluates the result of this unification.

Any number of inputs belonging to other input types may be combined with a
single {{{.package}}} input.
({{<issue 3341>}}Issue #3341{{</issue>}} tracks a problem when combining a
{{{.package}}} input with a {{{.constraintFile}}} and one or more other input
types). The {{{.package}}} input must be the first input specified in the list
of positional parameters.

Each input contributes the kind of information to the unification that you
would expect:
{{{.dataFile}}} inputs contribute data;
{{{.constraintFile}}} inputs contribute constraints;
{{{.packageFile}}} and {{{.packagelessFile}}} inputs contribute data and
constraints, depending on the CUE they contain.

Here's an example demonstrating multiple input types being specified alongside
a single {{{.package}}}:

{{{with code "en" "cue export package + package file + data + packageless"}}}
#location left left left left right
exec cue export .:one min.cue data.yml max.cue
cmp stdout out
-- 1.cue --
package one

// Field x must be present.
x!: _
-- min.cue --
package min

x: >10
-- max.cue --
x: <=99
-- data.yml --
x: 50
-- out --
{
    "x": 50
}
{{{end}}}

If {{{.packageFile}}} inputs are present then their package clauses need to be
the same as each other, but don't need to match the name of any {{{.package}}}
input that's present.
By definition, {{{.packagelessFile}}} inputs don't contain a package clause, so
this requirement doesn't affect them.

<!-- SENSE CHECK
{{{with upload "en" "test cue package + other input types prose"}}}
#nofmt
-- packageA.cue --
package A
x: "foo"
-- packageB.cue --
package B
y: 2
-- data.cue --
x: "foo"
-- data.yml --
y: 2
-- schema.json --
{ "$schema": "http://json-schema.org/draft-07/schema#", "type": "object",
  "properties": { "x": { "type": "string", "minLength": 1 } } }
{{{end}}}
{{{with script "en" "test cue package + other input types prose"}}}

# "Issue #3341 tracks a problem when combining a *CUE
# package* input with a {{{.constraintFile}}} and one or more other input types)."
! cue export .:A schema.json data.yml >3341.out 2>&1
grep "cannot combine packages with individual schema files" 3341.out

# "The {{{.package}}} input must be the first input specified in the list of
# positional parameters."
  cue export .:A data.cue
! cue export data.cue .:A
  cue export .:A data.yml
! cue export data.yml .:A
  cue export .:A packageB.cue
! cue export packageB.cue .:A

# "If {{{.packageFile}}} inputs are present then their package clauses need to be
# the same as each other"
  cue export packageA.cue packageA.cue
! cue export packageA.cue packageB.cue

# "but don't need to match the name of any {{{.package}}}
# input that's present."
cue export .:A packageB.cue

# Tidy up.
rm -f *.cue data.yml schema.json *.out
{{{end}}}
-->

### {{{.HpackageFile}}} inputs

As a reminder, {{{.packageFile}}} inputs are CUE files that contain a `package`
clause near the top, and are distinguished from {{{.package}}} inputs as they're
referenced *individually* during an invocation, and not by a package import
path. In other words, {{{.packageFile}}} inputs are any CUE files containing a
package clause that you *explicitly* tell `cue export` to process.

When you mention a {{{.packageFile}}} input alongside a {{{.dataFile}}} input, the
inputs are [unified]({{< relref "docs/tour/basics/unification" >}}), with any
resulting concrete data being validated against any constraints that are
present in the CUE:

{{{with code "en" "package file + data"}}}
#location left left right
! exec cue export 1.cue data.yml
cmp stderr out
-- 1.cue --
package one

A:  1    // A is the concrete value 1.
B?: >100 // B must be greater than 100.
-- data.yml --
A: "some string"
B: 99
-- out --
A: conflicting values "some string" and 1 (mismatched types string and int):
    ./1.cue:3:5
    ./data.yml:1:4
B: invalid value 99 (out of bound >100):
    ./1.cue:4:5
    ./data.yml:2:4
{{{end}}}

When you tell `cue export` to process a {{{.packageFile}}} input alongside a
{{{.package}}} input, their package names don't need to match. However, if you
mention multiple {{{.packageFile}}} inputs, then the package names of **all**
the {{{.packageFile}}} inputs must be the same as each other - but they still
don't need to match any {{{.package}}} input that's also present.
A {{{.packagelessFile}}} input (a CUE file that doesn't contain a package
clause) can be included alongside {{{.packageFile}}} and {{{.package}}} inputs.

In all these situations the inputs are
[unified]({{< relref "docs/tour/basics/unification" >}}), with any data being
validated against any constraints that are present:

{{{with code "en" "cue export package + 2x package file + data + packageless"}}}
#location left left left left left right
exec cue export .:one min.cue max.cue data.yml calc.cue
cmp stdout out
-- package.cue --
package one

// Field x must be present.
x!: _
-- min.cue --
package two

x: >10
-- max.cue --
package two

x: <=99
-- calc.cue --
z: x * 2
-- data.yml --
x: 50
-- out --
{
    "z": 100,
    "x": 50
}
{{{end}}}

### {{{.HpackagelessFile}}} inputs

`cue export` handles {{{.packagelessFile}}} inputs identically to
{{{.dataFile}}} inputs - they're treated equivalently, and are interchangeable
as `cue export` positional parameters.
However, where {{{.dataFile}}} inputs can only introduce concrete data,
{{{.packagelessFile}}} inputs can also include constraints, calculated fields,
and all other CUE language features *alongside*
their concrete data.
Their contributions to the evaluation are unified as you might expect - their
constraints add to the set of constraints that validate the concrete data, and
their concrete data is validated against the set of constraints derived from
all constraint-related input types.

### {{{.HdataFile}}} inputs

{{{.UCdataFile}}} inputs contain concrete data, encoded as JSON or YAML.
If they are specified alongside other input types then they are treated as
described in the sections above.
If they are processed without other input types being present, then `cue
export` simply [unifies]({{< relref "docs/tour/basics/unification" >}}) the
data they contain.
As always, unification is recursive, processing nested data structures to an
arbitrary depth:

{{{with code "en" "data file inputs"}}}
#location left left right
exec cue export data.yml data.json
cmp stdout out
-- data.json --
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
-- data.yml --
A: 1
B:
  D: 3
E:
  - 4
  - G: 6
  - 7
-- out --
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
{{{end}}}

If any values don't unify successfully, at any depth, an error message is printed:

{{{with code "en" "data file inputs failure"}}}
#location left left right
! exec cue export data.yml data.json
cmp stderr out
-- data.yml --
A:
  - 1
  - B: 2
  - 4
-- data.json --
{
    "A": [
        1,
        {
            "B": 3
        }
    ]
}
-- out --
A: incompatible list lengths (2 and 3)
A.1.B: conflicting values 2 and 3:
    ./data.json:5:18
    ./data.yml:3:8
{{{end}}}

### {{{.HconstraintFile}}} inputs

A {{{.constraintFile}}} input contains one or more data constraints expressed
in a non-CUE encoding such as JSON Schema, OpenAPI or Protocol Buffers. They
can be combined with all other input types, with their constraints being
[unified]({{< relref "docs/tour/basics/unification" >}}) with constraints from
any other inputs, which are then used to validate any data inputs.

A {{{.constraintFile}}} input can be used without any CUE-based inputs.
`cue export` can validate data directly against a {{{.constraintFile}}} input:

{{{with code "en" "constraint file validating data"}}}
#location left left right
! exec cue export data.yml schema.json
cmp stderr out
-- schema.json --
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
-- data.yml --
A: 50
B: 1000
-- out --
A: invalid value 50 (out of bound >=100):
    ./schema.json:7:13
    ./data.yml:1:4
B: invalid value 1000 (out of bound <=99):
    ./schema.json:11:13
    ./data.yml:2:4
{{{end}}}

{{<issue 3341>}}Issue #3341{{</issue>}} tracks a problem when combining a
{{{.package}}} input with a {{{.constraintFile}}} and some other input types.

`cue export` recognizes JSON Schema and OpenAPI {{{.constraintFile}}} inputs
through their signature fields. This behaviour can be changed by
[using a qualifier]({{< relref "#input-file-encodings" >}}) to instruct the
command to treat the {{{.constraintFile}}} input as pure data:

{{{with code "en" "constraint file exported as data"}}}
exec cue export json: schema.json
cmp stdout out
-- schema.json --
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
-- out --
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
{{{end}}}

## Standard input stream

The standard input stream of the `cue export` command is available for
processing as any file-based input type, through its pseudo-filename of "`-`".
By default, standard input is processed as CUE -- either as a
{{{.packageFile}}} or {{{.packagelessFile}}} input, depending if the stream
contains a `package` clause or not.

To indicate that `cue export` should interpret the stream through a different
encoding, use
[a qualifier]({{< relref "#input-file-encodings" >}}):

{{{with upload "en" "stdin data"}}}
-- data.yml --
A:
  - b
  - c
{{{end}}}
{{{with script "en" "process stdin as yaml"}}}
cat data.yml | cue export yaml: -
{{{end}}}

## Non-CUE data location

During evaluation, `cue export` unifies all its inputs and, by default, places
the contents of any {{{.dataFile}}} inputs at the top-level of the evaluation
space. You can change this behaviour by specifying a static or dynamic location
for all {{{.dataFile}}} inputs using the `--path`/`-l` flag. This flag is
described in
[`cue help flags`]({{< relref "/docs/reference/command/cue-help-flags" >}}),
and is demonstrated below.

### Static locations

To specify a static location for the {{{.dataFile}}} inputs during evaluation,
provide the `--path`/`-l` flag with a CUE expression that ends with a colon (`:`):

{{{with code "en" "-l static single"}}}
exec cue export data.yml --path foo:
cmp stdout out
-- data.yml --
data: true
-- out --
{
    "foo": {
        "data": true
    }
}
{{{end}}}

Increase the depth and nesting of the location by adding more components to the
expression:

{{{with code "en" "-l static multiple"}}}
exec cue export data.yml -l foo:bar:baz:
cmp stdout out
-- data.yml --
data: true
-- out --
{
    "foo": {
        "bar": {
            "baz": {
                "data": true
            }
        }
    }
}
{{{end}}}

You can also provide multiple path components through repeated instances of the
flag. For example, the previous example is equivalent to `-l foo: -l bar: -l
baz:`.

The combined values of all `--path`/`-l` flags that are present in a
`cue export` invocation apply to *all* the {{{.dataFile}}} inputs. The flags'
positions in the invocation are irrelevant, no matter where they sit relative
to any positional parameters defining the inputs to be processed. When
specifying a static location, this means that the data in all {{{.dataFile}}}
inputs is unified at the location provided. If there are multiple
{{{.dataFile}}} inputs, all their contents must be capable of being unified:

{{{with code "en" "-l static multiple files"}}}
#location top-left top-right bottom
! exec cue export -l foo: data.yml -l bar: data.json -l baz:
cmp stderr out
-- data.json --
{
    "data": false
}
-- data.yml --
data: true
-- out --
foo.bar.baz.data: conflicting values true and false:
    ./data.json:2:13
    ./data.yml:1:7
{{{end}}}

### Dynamic locations

As you saw in the previous section, a trailing colon (`:`) tells `cue export`
that a value in the location expression should be interpreted statically.
If the colon is omitted, then the value is resolved dynamically - in the
context of the data that's present:

{{{with code "en" "-l dynamic single"}}}
exec cue export data.yml -l foo
cmp stdout out
-- data.yml --
foo: "a"
data: true
-- out --
{
    "a": {
        "foo": "a",
        "data": true
    }
}
{{{end}}}

Functions from the CUE
[standard library]({{< relref "/docs/tour/packages/standard-library" >}}) may
be included in the specification of a dynamic expression, without their
containing packages being imported:

{{{with code "en" "-l dynamic single with function"}}}
exec cue export data.yml -l 'strings.ToUpper(foo)'
cmp stdout out
-- data.yml --
foo: "a"
data: true
-- out --
{
    "A": {
        "foo": "a",
        "data": true
    }
}
{{{end}}}

Adding the `--with-context` flag changes the context in which the dynamic
expression is evaluated, allowing it to refer to information about a
{{{.dataFile}}} input (such as the file's name) as described in
[`cue help flags`]({{< relref "/docs/reference/command/cue-help-flags" >}}):
<!-- TODO(jcm): link to a --with-context guide when it's available -->

{{{with code "en" "-l dynamic --with-context"}}}
#location top bottom
exec cue export data.yml -l 'path.Base(filename)' --with-context
cmp stdout out
-- data.yml --
data: true
-- out --
{
    "data.yml": {
        "data": true
    }
}
{{{end}}}


## {{{.HdataFile}}}s with multiple documents

Some encodings, such as YAML, permit multiple documents to be contained in a
single file. When processing such {{{.dataFile}}} inputs, `cue export` offers a
choice of how to combine these documents.

The default behaviour is to merge the documents normally, as is done via
unification. Because they are merged, their contents must have values that are
*capable* of being unified:

{{{with code "en" "multi-doc merge"}}}
exec cue export data.yml --merge
cmp stdout out
-- data.yml --
---
A: 1
---
B: 2
---
C: 3
-- out --
{
    "A": 1,
    "B": 2,
    "C": 3
}
{{{end}}}

Merging is the command's default behaviour, so the `--merge` flag is optional.

Alternatively, you can opt for multiple documents to be placed in a list by
providing the `--list` flag. This behaviour permits documents to be processed
that contain incompatible values that can't unify successfully:

{{{with code "en" "multi-doc list"}}}
exec cue export data.yml --list
cmp stdout out
-- data.yml --
---
A: 1
---
A: 2
---
A: 3
-- out --
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
{{{end}}}

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
