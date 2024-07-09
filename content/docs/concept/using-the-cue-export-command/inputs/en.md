---
title: Inputs
weight: 10
authors: [jpluscplusm]
toc_hide: false
---

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
B: 2.2
C: A + B + 3.33
-- out --
{
    "A": 1,
    "B": 2.2,
    "C": 6.53
}
{{{end}}}

This package is loaded as a *package instance* -- a concept which is
explained later, on this page.

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

If there is more than one package in the current directory, tell `cue export`
which package you want to process by providing its *import path* as a
positional parameter:

{{{with code "en" "cue export .:one"}}}
#location left left right
exec cue export .:one
cmp stdout out
-- 1.cue --
package one

message: "this is package one"
-- 2.cue --
package two

message: "this is package two"
-- out --
{
    "message": "this is package one"
}
{{{end}}}

CUE *import paths* are described in
[`cue help inputs`]({{< relref "docs/reference/command/cue-help-inputs" >}}).

If the sole positional parameter is the path to a data file then the file's
contents are interpreted in the encoding implied by its filename suffix,
and the input processed by `cue export` is the resulting data:

{{{with code "en" "cue export data.yaml"}}}
#location left right
exec cue export data.yaml
cmp stdout out
-- data.yaml --
message: this is a YAML data file
-- out --
{
    "message": "this is a YAML data file"
}
{{{end}}}

Individual CUE files can be referred to in this way, instead of using them
through their import path at the package level. Import paths are the suggested
way to refer to CUE, as they automatically pick up new and renamed files.
Referring directly to CUE files requires you to keep `cue export` invocations
up to date, manually, as the set of files changes.

## Input file encodings

The filename suffixes that `cue export` understands are described in
[`cue help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes" >}}),
including `.json`, `.yml`, `.yaml`, and `.cue`. If a filename suffix is
recognised, then `cue export` automatically interprets the file through the
related data encoding. If the encoding of a file doesn't match its filename
suffix, use a qualifier to specify the encoding:

{{{with code "en" "cue export yaml: some.yaml.data"}}}
#location left right
exec cue export yaml: some.yaml.data
cmp stdout out
-- some.yaml.data --
message: this YAML data file has a .data suffix
-- out --
{
    "message": "this YAML data file has a .data suffix"
}
{{{end}}}

A qualifier dicates the encoding of every file that follows it, up to the
*next* qualifier. The qualifiers that `cue export` understands are described in
[`cue help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes" >}}),
including `json:`, `yaml:`, and `cue:`.

## Multiple positional parameters

When you specify more than one positional parameter, the behaviour of
`cue export` varies, based on what *types* of input you provide. Informally,
you can think about inputs being subdivided into these five types:

- Complete CUE packages (a "*CUE package*")
- CUE files that have a `package` clause at the top of the file and therefore
  belong to their named package (a "*CUE package file*")
- CUE files that don't have a `package` clause at the top, and don't belong to
  any package (a "*packageless CUE file*")
- Non-CUE data files: (a "*data file*")
- Non-CUE schema or constraint files, such as JSON Schema, OpenAPI, or Protobuf
  (a "*constraint file*")

### CUE package inputs

A *CUE package* can be combined with all types of input but, in the list of
positional parameters, it must not be preceded by any input type except a *CUE
package*. In other words, `cue export` requires any and all *CUE package*
inputs to be specified before any other type of input.

When a **single** *CUE package* input is specified alongside one or more
different input types (i.e. not with another *CUE package*), then `cue export`
[unifies]({{< relref "docs/tour/basics/unification" >}}) all the inputs and
evaluates the result of this unification. Each input file contributes the kind
of data to the unification that you would expect: *data files* contribute data;
*constraint files* contribute constraints; *CUE package files* and *packageless
CUE files* contribute data and constraints, depending on the CUE they contain.

Here's an example demonstrating multiple input types being specified alongside
a single *CUE package:*

{{{with code "en" "cue export FIXME"}}}
exec echo FIXME
cmp stdout out
-- file --
-- out --
FIXME
{{{end}}}

If *CUE package file* inputs are present then their package clauses need to be
the same as each other, but the package they belong to does not need to match
the name of a *CUE package* input - if that's even present. *Packageless CUE
file* inputs don't contain a package clause, by definition, so this requirement
doesn't affect them.

When **multiple** *CUE package* inputs are specified then the resulting CUE
evaluation is executed once for each package. Multiple *CUE package* inputs
cannot be combined with any other input types - only other *CUE package*
inputs.

{{{with code "en" "cue export .:one .:two .:three"}}}
exec echo FIXME
cmp stdout out
-- file --
-- out --
FIXME
{{{end}}}

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
