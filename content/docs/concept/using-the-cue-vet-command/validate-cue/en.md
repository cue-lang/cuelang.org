---
title: Validating CUE
weight: 10
tags: [cue command]
authors: [jpluscplusm]
toc_hide: false
---

The `cue vet` command takes any number of inputs, and checks that their
contents are acceptable -- it *validates* the inputs. The command runs in one
of its two validation modes: "CUE" or "data". This page describes the default
mode, which is "CUE".

## CUE inputs

If `cue vet` is called without any input arguments then it validates the single
CUE package in the current directory:

{{{with code "en" "0 args pass"}}}
exec cue vet
cmp stderr out
-- file.cue --
package example

A: 99 & int
-- out --
{{{end}}}

The command succeeds silently if the input validates successfully.
Otherwise, the command fails and displays an error message for each validation failure:

{{{with code "en" "0 args fail"}}}
#location top bottom
! exec cue vet
cmp stderr out
-- file.cue --
package example

A: 99 & >100
B: 99 & string
-- out --
B: conflicting values 99 and string (mismatched types int and string):
    ./file.cue:4:4
    ./file.cue:4:9
A: invalid value 99 (out of bound >100):
    ./file.cue:3:9
    ./file.cue:3:4
{{{end}}}

Another way to refer to the single package in the current directory is with the
shorthand of "`.`".

If there's more than one package in the current directory then you need to tell
`cue vet` which package it should validate ... or else the command fails:

{{{with code "en" "0 args fail >1 packages"}}}
#location top-left top-right bottom
! exec cue vet .
cmp stderr out
-- a.cue --
package alpha

X: 1
-- b.cue --
package beta

X: 1
-- out --
found packages "alpha" (a.cue) and "beta" (b.cue) in "."
{{{end}}}

Read on for information about how to specify which CUE packages and files `cue
vet` should validate.

### CUE package inputs

The `cue vet` command can validate any number of CUE packages, which are
identified by their *import path*.
Both *relative* and *absolute* import paths can be specified -- see
`{{<linkto/inline "reference/command/cue-help-inputs">}}` for more information
about their differences. We'll use paths that start with `.` in our examples,
which are relative import paths that are interpreted as filesystem paths.

To validate a specific package in a relative import path's directory, even when
there's more than one package present, use the `:<package-name>` syntax to
specify the package:

{{{with code "en" "1 arg pass"}}}
#location top-left top-right bottom
exec cue vet .:beta # package alpha isn't checked, so this succeeds
cmp stderr out
-- a.cue --
package alpha

X: false & true // This is invalid.
-- b.cue --
package beta

X: 42
-- out --
{{{end}}}

If you need to validate more than one package then specify multiple import
paths as input parameters. Each package is validated *seperately*, in isolation
from any other packages. If you hand `cue vet` more than one package as its
inputs, then you must *only* specify CUE packages to validate. You can't mix
multiple CUE packages with any other input types.

### CUE file inputs

By telling `cue vet` about one or more CUE files you can check that they're all
valid, and can unify successfully:

{{{with code "en" "fail file + file"}}}
#location top-left top-right bottom
! exec cue vet a1.cue a2.cue
cmp stderr out
-- a1.cue --
package alpha

X: int
O: int & >100
-- a2.cue --
package alpha

X: 42
O: 42
-- out --
O: invalid value 42 (out of bound >100):
    ./a1.cue:4:10
    ./a2.cue:4:4
{{{end}}}

When you provide more than one CUE files as inputs to `cue vet`,
each CUE file you mention must either:

- belong to the same package as all the other CUE files that have a `package`
  clause, or
- not have a `package` clause.

You can also check that an arbitrary number of CUE files unify successfully
with a single CUE package.

Make sure to specify the package as the first input:

{{{with code "en" "fail package + package-file + file"}}}
#location top-left top-right top-right bottom
! exec cue vet .:alpha b.cue x.cue
cmp stderr out
-- a.cue --
package alpha

X: int
O: float
-- b.cue --
package beta

X: 4.2
-- x.cue --
O: 42
-- out --
O: conflicting values 42 and float (mismatched types int and float):
    ./a.cue:4:4
    ./x.cue:1:4
X: conflicting values 4.2 and int (mismatched types float and int):
    ./a.cue:3:4
    ./b.cue:3:4
{{{end}}}

As before, all the individually-mentioned CUE files are unified with each
other, so they must either have the same `package` clause or no
`package` clause at all. However, their `package` clause does *not* have to
match the name of the package against which they're being checked.

The standard input stream of the `cue vet` command can be included as an input
and unified with the other inputs via its special symbol "`-`", as outlined in
`{{< linkto/inline "reference/command/cue-help-inputs" >}}`.
It's treated as if it were any other CUE file mentioned as an input -- so it
also needs to have a `package` clause that matches the other CUE files, or no
`package` clause at all.
