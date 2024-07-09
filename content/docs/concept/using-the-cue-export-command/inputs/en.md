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
-- package-2.cue --
package two

message: "this is package two"
-- package-1.cue --
package one

message: "this is package one"
-- out --
found packages "one" (package-1.cue) and "two" (package-2.cue) in "."
{{{end}}}

## One positional parameter

If there is more than one package in the current directory, tell `cue export`
which package you want to process by providing its *import path* as a
positional parameter:

{{{with code "en" "cue export .:one"}}}
#location left left right
exec cue export .:one
cmp stdout out
-- package-2.cue --
package two

message: "this is package two"
-- package-1.cue --
package one

message: "this is package one"
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

How to express "schema" versus "CUE"? I.e. include non-CUE schemata at the CLI,
but without exploding the example set unacceptably.

### CUE + data

unification & validation.

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
