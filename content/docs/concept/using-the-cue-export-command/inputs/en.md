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
later in this guide.

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
*next* qualifier. In each isolated `cue export` invocation, reading its
parameters in order, once a qualifier has been used all files are interpreted
through that qualifier or a subsequent one. There is no way for the invocation
to restart the interpretation of filename suffixes.
Qualifiers are described in
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

# "A *CUE package* input can either be combined with other *CUE package* inputs,"
cue export .:A .:B

# "or with any other types of input."
cue export .:A data.cue
cue export .:A packageB.cue
cue export .:A data.yml
cue export .:A schema.json

# "A *CUE package* input cannot be combined with other *CUE package* inputs
# **and** other types of input."
! cue export .:A .:B data.cue
! cue export .:A .:B pacakgeB.cue
! cue export .:A .:B data.yml
! cue export .:A .:B schema.json 

# Tidy up.
rm -f *.cue data.yml schema.json *.out
{{{end}}}
-->

#### Combining multiple CUE package inputs

When multiple *CUE package* inputs are specified then the resulting CUE
evaluation is executed once for each package. Multiple *CUE package* inputs
cannot be combined with any other input types - only other *CUE package*
inputs.

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

# "When multiple *CUE package* inputs are specified then the resulting CUE
# evaluation is executed once for each package."
cue export .:one .:two > 2-packages.out
cat 2-packages.out | grep -c '^{$'  | grep -x 2
cat 2-packages.out | grep -c '^}$'  | grep -x 2
cat 2-packages.out | grep -c '"x":' | grep -x 2

# "Multiple *CUE package* inputs
# cannot be combined with any other input types"
! cue export .:one .:two data.cue
! cue export .:one .:two data.yml
! cue export .:one .:two schema.json

# "- only other *CUE package* inputs."
# Already handled, above.

# Tidy up.
rm -f *.cue data.yml schema.json *.out
{{{end}}}
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

If *CUE package file* inputs are present then their package clauses need to be
the same as each other, but don't need to match the name of any *CUE package*
input that's present.
*Packageless CUE file* inputs don't contain a package clause, by definition, so
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
# package* input with a *constraint file* and one or more other input types)."
! cue export .:A schema.json data.yml >3341.out 2>&1 
grep "cannot combine packages with individual schema files" 3341.out

# "The *CUE package* input must be the first input specified in the list of
# positional parameters."
  cue export .:A data.cue
! cue export data.cue .:A
  cue export .:A data.yml
! cue export data.yml .:A
  cue export .:A packageB.cue
! cue export packageB.cue .:A

# "If *CUE package file* inputs are present then their package clauses need to be
# the same as each other"
  cue export packageA.cue packageA.cue
! cue export packageA.cue packageB.cue

# "but don't need to match the name of any *CUE package*
# input that's present."
cue export .:A packageB.cue

# Tidy up.
rm -f *.cue data.yml schema.json *.out
{{{end}}}
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
