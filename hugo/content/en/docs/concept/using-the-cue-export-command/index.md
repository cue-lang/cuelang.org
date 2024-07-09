---
title: Using the cue export command
toc_hide: true
tags: [cue command]
authors: [jpluscplusm]
---

The `cue export` command evaluates a configuration and emits a value if the
value is concrete -- in other words, as data. The command can emit data in a
variety of encodings, including JSON, YAML, and CUE.

## The Basics

By default, the `cue export` command:

- evaluates the configuration in the single package found in the current directory
- emits the value of the top-level of the configuration evaluated
- encodes the value as JSON and prints it to the command's standard output stream:

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="left" >}}
package a

Aa: 1
Ba: 2.2
Ca: 3*Aa + Ba
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "Aa": 1,
    "Ba": 2.2,
    "Ca": 5.2
}
{{< /code-tab >}}
{{< /code-tabs >}}

You can override these defaults:
- the configuration to be evaluated can be specified using positional parameters
- the expression to be emitted can be specified with the `--expression`/`-e` flag
- the encoding can be specified with the `--out` flag
- a file that should receive the data can be specified with the `--outfile`/`-o` flag:

{{< code-tabs >}}
{{< code-tab name="package-b.cue" language="cue" area="left" >}}
package b

data: {
	Ab: 1
	Bb: 2.2
	Cb: 3*Ab + Bb
}
{{< /code-tab >}}
{{< code-tab name="package-c.cue" language="cue" area="left" >}}
package c

data: {
	Ac: "some string"
	Bc: 42
	Cc: true
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLWV4cHJlc3Npb24gZGF0YSAtLW91dCB5YW1sIC46Yw==" >}}
$ cue export --expression data --out yaml .:c
Ac: some string
Bc: 42
Cc: true
{{< /code-tab >}}
{{< /code-tabs >}}


The command fails with an error message:

- if evaluation of the configuration is unsuccessful
  - such as when concrete data values are unified with constraints that forbid
    those same values, or if the configuration to be evaluated can't be loaded
- if the value of the expression to be emitted isn't concrete
  - which is when the value *wouldn't* be able to be represented in a data-only
    format such as JSON. Examples of non-concrete values include types such as
    `string` and constraints such as `>=100`:

{{< code-tabs >}}
{{< code-tab name="failure.cue" language="cue" area="left" >}}
package d

Ad: 1
Bd: float
Cd: >=100
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
Bd: incomplete value float:
    ./failure.cue:4:5
Cd: incomplete value >=100:
    ./failure.cue:5:5
{{< /code-tab >}}
{{< /code-tabs >}}

## Emitting data to a file

By default, a successful `cue export` displays the result on its standard
output stream. This behaviour can be changed with the `--outfile`/`-o` flag.

The flag accepts a single value: the name of a file that will receive the
result of the command. The file's name is resolved relative to the current
working directory, and must be inside a directory that already exists. If the
file already exists and the `--force`/`-f` flag is *not* present then the `cue
export` command will fail. Specifying a filename of "`-`" specifies the
command's standard output stream.

By default, the data emitted into the file is encoded in the format inferred
from the file's filename suffix. JSON is emitted if the filename ends in
`.json`; YAML is emitted for `.yml` or `.yaml`, CUE for `.cue`, and text for
`.txt`. Binary data can also be emitted when required but, because there isn't
a standardised filename suffix for this format, it must be explicitly
requested. The text encoding can only handle data values that are of type
`string`; binary encoding can handle `string` or `bytes` types.

Information on the encodings and filetypes supported more generally by the
`cue` command is available in
{{< linkto/related/reference "command/cue-help-filetypes" >}}.
The `cue export` command only supports data encodings. Graph and schema
encodings are supported by the `cue def` and `cue eval` commands. <!--FIXME links.-->

### Specifying the output encoding explicitly

FIXME: include stdout mention.
The output file's encoding can be specified explicitly using the `--out` flag.
This can be useful if the data encoding inferred from the filename suffix is
different from the required encoding. If the filename suffix doesn't match
*any* of the supported encodings then it must be specified explicitly.

{{< columns >}}
{{< code-tabs >}}
{{< code-tab name="encoding.cue" language="cue" area="top-left" >}}
package e

Ae: 1
Be: 2.2
Ce: 3.33
{{< /code-tab >}}{{< /code-tabs >}}
{{< columns-separator >}}
```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgc29tZS5maWxlIC0tb3V0IGpzb24KY2F0IHNvbWUuZmlsZQ==" }
$ cue export --outfile some.file --out json
$ cat some.file
{
    "Ae": 1,
    "Be": 2.2,
    "Ce": 3.33
}
```
{{< /columns >}}

### Emitting CUE

The `cue export` command can emit CUE - for instance, when the `--out` flag is
passed the value "`cue`", or when the output filename ends `.cue`. As with all
uses of `cue export`, this only succeeds when the expression being emitted is
concrete, meaning that the CUE emitted by `cue export` will only contain
regular data fields that have specific values. `cue export` will not emit CUE
containing hidden fields, definitions, comprehensions, and so on - only their
concrete results.

When emitting CUE, `cue export` defaults to producing CUE that does not belong
to any package, regardless of the package(s) being evaluated. This behaviour
can be changed using the `--package`/`-p` flag:

{{< code-tabs >}}
{{< code-tab name="package-f.cue" language="cue" area="top-left" >}}
package f

Afoo: 1
Bfoo: 2.2
Cfoo: 3.33
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCBjdWUgLS1wYWNrYWdlIGc=" >}}
$ cue export --out cue --package g
package g

Afoo: 1
Bfoo: 2.2
Cfoo: 3.33
{{< /code-tab >}}
{{< /code-tabs >}}

## Positional arguments

Leave a TODO for "how cue finds CUE" or similar; don't write it all here.
Placing non-CUE somewhere other than the root.
Leave a TODO for linking to a future --with-context guide.

## Injecting values

Demo briefly; link to to other guides.

## Misc

--escape.
--list.
--merge.

## Related content
