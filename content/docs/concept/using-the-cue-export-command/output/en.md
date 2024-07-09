---
title: Output
weight: 30
authors: [jpluscplusm]
toc_hide: false
---

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

By default, a successful `cue export` displays the evaluation result on its
standard output stream, encoded in JSON:

{{{with code "en" "default output"}}}
exec cue export
cmp stdout out
-- data.cue --
package one

nested: data: true
aList: [1, 2.2, "3.33"]
-- out --
{
    "nested": {
        "data": true
    },
    "aList": [
        1,
        2.2,
        "3.33"
    ]
}
{{{end}}}

## Output location: `--outfile`

You can place the output from a successful `cue export` invocation in a file
instead of the standard output stream default by using the `--outfile`/`-o` flag.

The flag accepts a single value: the name of a file that will receive the
result of the command.  The file's name is resolved relative to the current
working directory, and must be inside a directory that already exists. If the
file already exists and the `--force`/`-f` flag is *not* present then the
`cue export` command will fail. The pseudo-filename of "`-`" can also be used
to refer to the command's standard output stream explicitly.

{{<columns>}}
{{{with upload "en" "--outfile data.yml"}}}
-- 1.cue --
package one

data: {
	value: "A string"
	list: [1, 2]
}
{{{end}}}
{{<columns-separator>}}
{{{with script "en" "--outfile data.yml"}}}
cue export --outfile data.yml
cat data.yml
{{{end}}}
{{</columns>}}
{{{with _script_ "en" "HIDDEN: --outfile data.yml tidy up"}}}
rm 1.cue data.yml
{{{end}}}

By default, the data emitted into the named file is encoded in the format
inferred from its filename suffix:
JSON is emitted if the filename ends in `.json`;
YAML is emitted for `.yml` or `.yaml`;
CUE for `.cue`;
and text for `.txt`:

{{<columns>}}
{{{with upload "en" "--outfile data.txt"}}}
-- 1.cue --
package one

data: {
	value: "A string"
	list: [1, 2]
}
{{{end}}}
{{<columns-separator>}}
{{{with script "en" "--outfile data.txt"}}}
cue export --outfile data.txt -e data.value
cat data.txt
{{{end}}}
{{</columns>}}
{{{with _script_ "en" "HIDDEN: --outfile data.txt tidy up"}}}
rm 1.cue data.txt
{{{end}}}

The text encoding can only handle data values that are of type `string`.

Binary data can also be emitted, but because there isn't a standardised
filename suffix for this format it must be explicitly requested using the
`--out` flag, as demonstrated later.
The binary encoding can only handle `string` or `bytes` types. `cue export`
fails with an error if asked to encode other data types as text or binary.

{{<info>}}
Information on the encodings and filetypes supported by the `cue` command is
available in
[`cue help filetypes`]({{< relref "/docs/reference/command/cue-help-filetypes" >}}).
That page documents data, graph, and schema encodings, of which the `cue
export` command can only emit data encodings.
Outputs using graph and schema encodings are supported by the
[`cue def`]({{< relref "/docs/reference/command/cue-help-def" >}}) and
[`cue eval`]({{< relref "/docs/reference/command/cue-help-eval" >}}) commands.
{{</info>}}

## Output encoding: `--out`

As you saw above, the `cue export` command outputs data encoded as JSON, by
default, or encoded in the format inferred from the filename suffix passed to
the `--outfile`/`-o` flag. To change this behaviour, use the `--out` flag to
specify the output encoding explicitly. You can specify any data encoding
documented in
`{{< linkto/inline "reference/command/cue-help-filetypes" >}}`.

When used *without* the `--outfile`/`-o` flag, the value of the `--out` flag
specifies the encoding of the output that's printed to the command's standard
output stream:

{{{with code "en" "stdout yaml"}}}
exec cue export --out yaml
cmp stdout out
-- data.cue --
package one

nested: data: true
aList: [1, 2.2, "3.33"]
-- out --
nested:
  data: true
aList:
  - 1
  - 2.2
  - "3.33"
{{{end}}}

An output file's encoding can also be specified explicitly using the `--out` flag.
Use this if the required data encoding doesn't match the filename's suffix:

{{<columns>}}
{{{with upload "en" "--outfile datafile --out json"}}}
-- 1.cue --
package one

data: {
	value: "A string"
	list: [1, 2]
}
{{{end}}}
{{<columns-separator>}}
{{{with script "en" "--outfile datafile --out json"}}}
cue export --outfile datafile --out json
cat datafile
{{{end}}}
{{</columns>}}
{{{with _script_ "en" "HIDDEN: --outfile datafile --out json tidy up"}}}
rm 1.cue datafile
{{{end}}}

## Output location *and* encoding: `--outfile`

Any combination of output location and data encoding can be specified using a
qualifier with the `--outfile`/`-o` flag.

Qualifiers are described in
`{{< linkto/inline "reference/command/cue-help-filetypes" >}}`, and can be used
to prefix a filename with its required encoding, separated by a colon:

{{<columns>}}
{{{with upload "en" "--outfile json:datafile"}}}
-- 1.cue --
package one

data: {
	value: "A string"
	list: [1, 2]
}
{{{end}}}
{{<columns-separator>}}
{{{with script "en" "--outfile json:datafile"}}}
cue export --outfile json:datafile
cat datafile
{{{end}}}
{{</columns>}}
{{{with _script_ "en" "HIDDEN: --outfile json:datafile tidy up"}}}
rm 1.cue datafile
{{{end}}}

As mentioned above, the pseudo-filename of "`-`" can be used to refer to the
command's standard output stream. Because this filename doesn't have a suffix
its encoding must be specified -- either using `--out`, or using `--outfile`
with a qualifier:

{{{with code "en" "yaml:-"}}}
exec cue export --outfile yaml:-
cmp stdout out
-- data.cue --
package one

nested: data: true
aList: [1, 2.2, "3.33"]
-- out --
nested:
  data: true
aList:
  - 1
  - 2.2
  - "3.33"
{{{end}}}

## Emitting CUE

The `cue export` command can emit CUE
when the `--out` flag is passed the value "`cue`",
or when the output filename ends `.cue`,
or when a `cue:` qualifier is used with `--outfile`:

{{{with code "en" "--out cue"}}}
exec cue export --out cue
cmp stdout out
-- data.cue --
package one

nested: data: true
aList: [1 + 1, 2 * 2, 3 / 3]
-- out --
nested: data: true
aList: [2, 4, 1.0]
{{{end}}}

When emitting data encoded as CUE, as with all `cue export` invocations, the
command succeeds only when the value being emitted is concrete.
This means that the CUE emitted by `cue export` will contain only fields that
contain fully-specified values.
Additionally, the CUE that `cue export` emits will contain only
[regular fields]({{< relref "/docs/tour/types/structs" >}}).
Any hidden fields, definitions, comprehensions, and other CUE language features
will not be present, except insofar as their values affect regular fields:

{{{with code "en" "--out cue no hidden fields"}}}
exec cue export --out cue
cmp stdout out
-- data.cue --
package one

#A: ["a", "b", "c"]
_B: [1, 2, 3]

C: [
	for a in #A
	for b in _B {
		"\(a)-\(b)"
	},
]
-- out --
C: ["a-1", "a-2", "a-3", "b-1", "b-2", "b-3", "c-1", "c-2", "c-3"]
{{{end}}}

When emitting CUE, `cue export` defaults to producing CUE that does not belong
to any package, regardless of the package(s) being evaluated.
This behaviour can be changed using the `--package`/`-p` flag:

{{{with code "en" "--out cue --package foo"}}}
exec cue export --out cue --package foo
cmp stdout out
-- data.cue --
package one

nested: data: true
aList: [1 + 1, 2 * 2, 3 / 3]
-- out --
package foo

nested: data: true
aList: [2, 4, 1.0]
{{{end}}}

## Escaping HTML

When you include the `--escape` flag in a `cue export` invocation, string
values containing the characters `&`, `<`, or `>` are emitted with these
characters replaced by their escaped unicode code point equivalents:

{{{with code "en" "--escape"}}}
#location top bottom
exec cue export --escape
cmp stdout out
-- data.cue --
package one

someHTML: """
	<a href="https://cue.example?foo=bar&baz=quux">...</a>
	"""
-- out --
{
    "someHTML": "\u003ca href=\"https://cue.example?foo=bar\u0026baz=quux\"\u003e...\u003c/a\u003e"
}
{{{end}}}

## Conclusion

This guide showed you how to use `cue export`, and the ways in which you can
customize its inputs, operation, and output.
The command is often used to produce configurations for commands that require
JSON, YAML, or TOML.
You can read more about this common task in
{{< linkto/inline "concept/how-cue-enables-configuration" >}}.

## Related content

- {{< linkto/related/reference "command/cue-export" >}}
- {{< linkto/related/reference "command/cue-help-filetypes" >}}
- {{< linkto/related/reference "command/cue-help-eval" >}}
- {{< linkto/related/reference "command/cue-help-def" >}}
- {{< linkto/related/concept   "how-cue-enables-configuration" >}}.
