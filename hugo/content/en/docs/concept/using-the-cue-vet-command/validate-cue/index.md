---
title: Validating CUE
weight: 10
tags: [cue command]
authors: [jpluscplusm]
toc_hide: false
---

The `cue vet` command takes any number of inputs, and checks that their
contents are acceptable -- it *validates* the inputs. The command runs in one
of its two validation modes: "CUE" or "data". This page describes "CUE" mode,
which is the command's default. "Data" mode (and how to activate it) is
detailed on [the next page of this guide]({{<relref"validate-data">}}).

## CUE inputs

If `cue vet` is called without any input arguments then it validates the single
CUE package in the current directory:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package alpha

A: 99 & int
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
{{< /code-tab >}}
{{< /code-tabs >}}

The `-c` flag is explained on [the last page of this guide]({{<relref"output">}}),
and is the recommended way to run `cue vet`.

The command succeeds silently if the inputs validate successfully.
Otherwise, the command fails and displays an error message for each validation failure:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package alpha

A: 99 & >100
B: 99 & string
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
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
`cue vet` which package it should validate -- or else the command fails:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package alpha

A: 1
{{< /code-tab >}}
{{< code-tab name="b.cue" language="cue" area="top-right" >}}
package beta

A: 1
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAu" >}}
$ cue vet -c .
found packages "alpha" (a.cue) and "beta" (b.cue) in "."
{{< /code-tab >}}
{{< /code-tabs >}}

Read on for information about how to specify which CUE packages and files `cue
vet` should validate.

## CUE package inputs

The `cue vet` command can validate any number of CUE packages, which are
identified by their *import path*.
Both *relative* and *absolute* import paths can be specified -- see
`{{<linkto/inline "reference/command/cue-help-inputs">}}` for more information
about their differences. This guide's examples use paths starting with `.`
-- relative import paths interpreted as filesystem paths.

If a directory contains CUE files from more than one package
then you must use a `:<package-name>` suffix to specify a package:

{{< code-tabs >}}
{{< code-tab name="dir/a.cue" language="cue" area="top-left" >}}
package alpha

A: false & true // This is invalid.
{{< /code-tab >}}
{{< code-tab name="dir/b.cue" language="cue" area="top-right" >}}
package beta

A: 42
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuL2RpcjpiZXRhICMgT25seSBwYWNrYWdlICJiZXRhIiBpcyBjaGVja2VkLCBzbyB0aGlzIHN1Y2NlZWRzLg==" >}}
$ cue vet -c ./dir:beta # Only package "beta" is checked, so this succeeds.
{{< /code-tab >}}
{{< /code-tabs >}}

If you need to validate more than one package then specify multiple import
paths as input parameters. Each package is validated *seperately*, in isolation
from all other packages. If you give `cue vet` more than one package as its
inputs then you must *only* specify CUE packages to validate: you can't mix
multiple packages with any other input types.

## CUE file inputs

By telling `cue vet` about one or more CUE files you can check that they're all
valid and can unify successfully:

{{< code-tabs >}}
{{< code-tab name="a1.cue" language="cue" area="top-left" >}}
package alpha

A: int
B: int & >100
{{< /code-tab >}}
{{< code-tab name="a2.cue" language="cue" area="top-right" >}}
package alpha

A: 42
B: 42
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyBhMS5jdWUgYTIuY3Vl" >}}
$ cue vet -c a1.cue a2.cue
B: invalid value 42 (out of bound >100):
    ./a1.cue:4:10
    ./a2.cue:4:4
{{< /code-tab >}}
{{< /code-tabs >}}

If your inputs include several CUE files then each one must either:
- belong to the same package as all the other CUE files that have a `package` clause, or
- not contain a `package` clause.

You can also check that an arbitrary number of CUE files unify successfully
with a single CUE package.
You must specify the package as the first input:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package alpha

A: int
B: float
{{< /code-tab >}}
{{< code-tab name="b.cue" language="cue" area="top-right" >}}
package beta

A: 4.2
{{< /code-tab >}}
{{< code-tab name="x.cue" language="cue" area="top-right" >}}
B: 42
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOmFscGhhIGIuY3VlIHguY3Vl" >}}
$ cue vet -c .:alpha b.cue x.cue
A: conflicting values 4.2 and int (mismatched types float and int):
    ./a.cue:3:4
    ./b.cue:3:4
B: conflicting values 42 and float (mismatched types int and float):
    ./a.cue:4:4
    ./x.cue:1:4
{{< /code-tab >}}
{{< /code-tabs >}}

As before, all the individually-mentioned CUE files are unified with each
other, so they must either have the same `package` clause or no
`package` clause at all. However, their `package` clause does *not* have to
match the name of the package against which they're being checked.

The standard input stream of the `cue vet` command can be included as an input
and unified with the other inputs via its special symbol "`-`", as outlined in
`{{< linkto/inline "reference/command/cue-help-inputs" >}}`.
It's treated as if it were any other CUE file mentioned as an input --
so it also needs to have a `package` clause that matches the other CUE files,
or no `package` clause at all.

## Next in this guide

### Using CUE to validate your data

The [next page of this guide]({{<relref"validate-data">}}) explains using `cue
vet` to validate data encoded as JSON, YAML, and other formats.

### Validation output

The `cue vet` command succeeds silently when data validation succeeds, which
means that the command produces no output and its exit code is 0.

If there's a problem with your CUE then `cue vet` displays error messages, as
described above. The
[final page of this guide]({{<relref"output">}}) shows you how to change the
command's output, and how it checks for *incomplete* values.

## Related content

- {{<linkto/related/reference"command/cue-help-inputs">}} -- help text explaining how CUE's inputs can be specified
- {{<linkto/related/reference"command/cue-vet">}}
- {{<linkto/related/reference "command/cue-help-vet">}} -- the help text displayed by `cue help vet`
- {{<issue"3733">}}Issue #3733{{</issue>}} tracks an effort to re-think how
  `cue vet` operates -- if you'd like to provide feedback about ways that the
  command could be improved to help your workflows, the CUE project would love
  to hear it in that issue!
