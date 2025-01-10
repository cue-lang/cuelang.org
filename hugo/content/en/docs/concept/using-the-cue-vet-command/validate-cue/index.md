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

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

A: 99 & int
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
{{< /code-tab >}}
{{< /code-tabs >}}

The command succeeds silently if the input validates successfully.
Otherwise, the command fails and displays an error message for each validation failure:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

A: 99 & >100
B: 99 & string
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
B: conflicting values 99 and string (mismatched types int and string):
    ./file.cue:4:4
    ./file.cue:4:9
A: invalid value 99 (out of bound >100):
    ./file.cue:3:9
    ./file.cue:3:4
{{< /code-tab >}}
{{< /code-tabs >}}

Another way to refer to the single package in the current directory is with the
shorthand of "`.`".

If there's more than one package in the current directory then you need to tell
`cue vet` which package it should validate ... or else the command fails:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package alpha

X: 1
{{< /code-tab >}}
{{< code-tab name="b.cue" language="cue" area="top-right" >}}
package beta

X: 1
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAu" >}}
$ cue vet .
found packages "alpha" (a.cue) and "beta" (b.cue) in "."
{{< /code-tab >}}
{{< /code-tabs >}}

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

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package alpha

X: false & true // This is invalid.
{{< /code-tab >}}
{{< code-tab name="b.cue" language="cue" area="top-right" >}}
package beta

X: 42
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAuOmJldGEgIyBwYWNrYWdlIGFscGhhIGlzbid0IGNoZWNrZWQsIHNvIHRoaXMgc3VjY2VlZHM=" >}}
$ cue vet .:beta # package alpha isn't checked, so this succeeds
{{< /code-tab >}}
{{< /code-tabs >}}

If you need to validate more than one package then specify multiple import
paths as input parameters. Each package is validated *seperately*, in isolation
from any other packages. If you hand `cue vet` more than one package as its
inputs, then you must *only* specify CUE packages to validate. You can't mix
multiple CUE packages with any other input types.

### CUE file inputs

By telling `cue vet` about one or more CUE files you can check that they're all
valid, and can unify successfully:

{{< code-tabs >}}
{{< code-tab name="a1.cue" language="cue" area="top-left" >}}
package alpha

X: int
O: int & >100
{{< /code-tab >}}
{{< code-tab name="a2.cue" language="cue" area="top-right" >}}
package alpha

X: 42
O: 42
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCBhMS5jdWUgYTIuY3Vl" >}}
$ cue vet a1.cue a2.cue
O: invalid value 42 (out of bound >100):
    ./a1.cue:4:10
    ./a2.cue:4:4
{{< /code-tab >}}
{{< /code-tabs >}}

When you provide more than one CUE files as inputs to `cue vet`,
each CUE file you mention must either:

- belong to the same package as all the other CUE files that have a `package`
  clause, or
- not have a `package` clause.

You can also check that an arbitrary number of CUE files unify successfully
with a single CUE package.

Make sure to specify the package as the first input:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package alpha

X: int
O: float
{{< /code-tab >}}
{{< code-tab name="b.cue" language="cue" area="top-right" >}}
package beta

X: 4.2
{{< /code-tab >}}
{{< code-tab name="x.cue" language="cue" area="top-right" >}}
O: 42
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAuOmFscGhhIGIuY3VlIHguY3Vl" >}}
$ cue vet .:alpha b.cue x.cue
O: conflicting values 42 and float (mismatched types int and float):
    ./a.cue:4:4
    ./x.cue:1:4
X: conflicting values 4.2 and int (mismatched types float and int):
    ./a.cue:3:4
    ./b.cue:3:4
{{< /code-tab >}}
{{< /code-tabs >}}

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
