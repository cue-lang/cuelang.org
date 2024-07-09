---
title: Output
weight: 30
authors: [jpluscplusm]
toc_hide: false
---

### Emitting data to a file

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

#### Specifying the output encoding explicitly

FIXME: include stdout mention.
The output file's encoding can be specified explicitly using the `--out` flag.
This can be useful if the data encoding inferred from the filename suffix is
different from the required encoding. If the filename suffix doesn't match
*any* of the supported encodings then it must be specified explicitly.

{{< columns >}}
{{{with upload "en" "change output encoding"}}}
-- encoding.cue --
package e

Ae: 1
Be: 2.2
Ce: 3.33
{{{end}}}
{{< columns-separator >}}
{{{with script "en" "change output encoding"}}}
cue export --outfile some.file --out json
cat some.file
{{{end}}}
{{< /columns >}}

#### Emitting CUE

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

{{{with code "en" "cue export cue"}}}
exec cue export --out cue --package g
cmp stdout out
-- package-f.cue --
package f

Afoo: 1
Bfoo: 2.2
Cfoo: 3.33
-- out --
package g

Afoo: 1
Bfoo: 2.2
Cfoo: 3.33
{{{end}}}

### Misc

--escape.
--list.
--merge.

<!-- A warning block is used only to gain access to the yellow background site colour -->
{{<warning>}}
### In [this guide]({{< relref "." >}}):
1. [Inputs]({{< relref "inputs" >}}) --
   learn how the inputs you provide are interpreted and combined
1. [Evaluation]({{< relref "evaluation" >}}) --
   find out about the aspects of the command's operation that you can control
1. **This page** --
   see how the command output's encoding can be selected, and directed into a
   specific location
{{</warning>}}
