---
title: Validating CUE
weight: 10
tags: [cue command]
authors: [jpluscplusm]
toc_hide: false
---

The `cue vet` command accepts an arbitrary number of input parameters and
checks that they're all consistent - it *validates* the inputs.

If any of the inputs contain non-CUE data (such as JSON, YAML, or TOML) then
the command operates in "data" mode but, by default, it operates in "CUE" mode.

This page describes "CUE" mode --
"data" mode is described on the next page of this guide.

## No input arguments

If `cue vet` is called without any input arguments then its default input is
the single CUE package in the current directory:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

A: 10 & int
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
{{< /code-tab >}}
{{< /code-tabs >}}

The command succeeds silently if the input validates successfully.
If the input doesn't validate successfully then the command fails and displays
an error message for each failure:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

A: 10 & >100
B: 10 & string
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
B: conflicting values 10 and string (mismatched types int and string):
    ./file.cue:4:4
    ./file.cue:4:9
A: invalid value 10 (out of bound >100):
    ./file.cue:3:9
    ./file.cue:3:4
{{< /code-tab >}}
{{< /code-tabs >}}

Another way to refer to the single package in the current directory is with the
shorthand of "`.`". If there's more than one package in the current directory
but you haven't explicitly told `cue vet` what it should validate then the
command fails:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package A

X: 1
{{< /code-tab >}}
{{< code-tab name="b.cue" language="cue" area="top-right" >}}
package B

X: 1
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAu" >}}
$ cue vet .
found packages "A" (a.cue) and "B" (b.cue) in "."
{{< /code-tab >}}
{{< /code-tabs >}}

Read on for information about how to specify which CUE packages and files `cue
vet` should validate.

## Checking for concrete values

The `cue vet` command checks its inputs for consistency and
[completeness]({{< relref "docs/reference/spec" >}}#expressions).
By default, it only displays specific errors if inputs aren't consistent (as
demonstrated above). It displays a general, non-specific error if any
[regular fields]({{< relref "docs/tour/types/structs" >}}) are incomplete --
that is, if there are any non-concrete values present that would *not* be able
to be encoded in a data-only format such as JSON:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

A: int & >10
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
some instances are incomplete; use the -c flag to show errors or suppress this message
{{< /code-tab >}}
{{< /code-tabs >}}

To display specific errors about incomplete regular fields (but *not* incomplete hidden
fields or definitions) use the `--concrete`/`-c` flag:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

A:  int & >10
_B: int & >10
#C: int & >10
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
A: incomplete value >10 & int
{{< /code-tab >}}
{{< /code-tabs >}}

This flag takes a boolean value, which is implicitly `true` when the flag is
present but the value is omitted. These forms of the flag are all equivalent:
`--concrete=true`/`-c=true`/`--concrete`/`-c`.

To make `cue vet` check *only* for data consistency specify the flag's value as
`--concrete=false`/`-c=false`. This value prevents `cue vet` from failing when
it encounters regular fields that have incomplete values that are otherwise valid:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

A: int & >10
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYz1mYWxzZSAjIHRoaXMgY29tbWFuZCBzdWNjZWVkcw==" >}}
$ cue vet -c=false # this command succeeds
{{< /code-tab >}}
{{< /code-tabs >}}

`cue vet -c=false` will still fail when it encounters regular fields with
incomplete *and* inconsistent values:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

A: int & string
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYz1mYWxzZQ==" >}}
$ cue vet -c=false
A: conflicting values int and string (mismatched types int and string):
    ./file.cue:3:4
    ./file.cue:3:10
{{< /code-tab >}}
{{< /code-tabs >}}

## One or more packages

The `cue vet` command can validate any number of CUE packages, which are
identified by their *import path*.
Both relative and absolute import paths can be specified - see
`{{<linkto/inline "reference/command/cue-help-inputs">}}` for more information
about their differences.
In this guide we'll use *relative* import paths (ones that start with "`.`" or
"`..`") in our examples.

To validate a specific package in the current directory, even when there's more
than one package present, use the `:<package-name>` syntax to specify the
package:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package A

X: false & true
{{< /code-tab >}}
{{< code-tab name="b.cue" language="cue" area="top-right" >}}
package B

X: 42
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAuOkI=" >}}
$ cue vet .:B
{{< /code-tab >}}
{{< /code-tabs >}}

To validate more than one package, specify their import paths as input parameters:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package A

X: false & true
{{< /code-tab >}}
{{< code-tab name="b.cue" language="cue" area="top-right" >}}
package B

X: 42
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAuOkIgLjpB" >}}
$ cue vet .:B .:A
X: conflicting values true and false:
    ./a.cue:3:4
    ./a.cue:3:12
{{< /code-tab >}}
{{< /code-tabs >}}

Multiple package inputs aren't unified, so they are validated *independently*.
Notice that field `X` inside `b.cue`, above, plays no part in the validation
failure. This is because it's isolated inside package `B`, which is valid.

If you specify more than one package input for `cue vet` then you can't *also*
include any other input types. If the list of inputs includes two or more
packages along with a non-package input then an error occurs -- even if the
non-package input is a CUE file that belongs to the *same* package as one of
the packge inputs:

{{< code-tabs >}}
{{< code-tab name="a.cue" language="cue" area="top-left" >}}
package A

X: false & true
{{< /code-tab >}}
{{< code-tab name="b.cue" language="cue" area="top-right" >}}
package B

X: 42
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAuOkIgLjpBIGIuY3Vl" >}}
$ cue vet .:B .:A b.cue
too many packages defined (2) in combination with files
{{< /code-tab >}}
{{< /code-tabs >}}




## Single package and CUE package-ful or package-less file(s)

{{<todo>}} From here.

Multiple packages + CUE files: not allowed.

Files must either be in the same package, or none.
Everything is unified.
-d has no effect.
So long as stdin doesn't have a non-CUE filetype qualifier, it's treated:
- as CUE, and
- in line with the above rules.

## non-CUE constraint files???
