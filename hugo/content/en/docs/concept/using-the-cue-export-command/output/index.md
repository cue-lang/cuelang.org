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

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="top-left" >}}
package one

nested: data: true
aList: [1, 2.2, "3.33"]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
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
{{< /code-tab >}}
{{< /code-tabs >}}

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
{{< code-tabs >}}
{{< code-tab name="1.cue" language="cue" area="top-left" >}}
package one

data: {
	value: "A string"
	list: [1, 2]
}
{{< /code-tab >}}{{< /code-tabs >}}
{{<columns-separator>}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgZGF0YS55bWwKY2F0IGRhdGEueW1s" }
$ cue export --outfile data.yml
$ cat data.yml
data:
  value: A string
  list:
    - 1
    - 2
```
{{</columns>}}
By default, the data emitted into the named file is encoded in the format
inferred from its filename suffix:
JSON is emitted if the filename ends in `.json`;
YAML is emitted for `.yml` or `.yaml`;
CUE for `.cue`;
and text for `.txt`:

{{<columns>}}
{{< code-tabs >}}
{{< code-tab name="1.cue" language="cue" area="top-left" >}}
package one

data: {
	value: "A string"
	list: [1, 2]
}
{{< /code-tab >}}{{< /code-tabs >}}
{{<columns-separator>}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgZGF0YS50eHQgLWUgZGF0YS52YWx1ZQpjYXQgZGF0YS50eHQ=" }
$ cue export --outfile data.txt -e data.value
$ cat data.txt
A string
```
{{</columns>}}
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
export` command can only use data encodings.
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

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="top-left" >}}
package one

nested: data: true
aList: [1, 2.2, "3.33"]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" >}}
$ cue export --out yaml
nested:
  data: true
aList:
  - 1
  - 2.2
  - "3.33"
{{< /code-tab >}}
{{< /code-tabs >}}

An output file's encoding can also be specified explicitly using the `--out` flag.
Use this if the required data encoding doesn't match the filename's suffix:

{{<columns>}}
{{< code-tabs >}}
{{< code-tab name="1.cue" language="cue" area="top-left" >}}
package one

data: {
	value: "A string"
	list: [1, 2]
}
{{< /code-tab >}}{{< /code-tabs >}}
{{<columns-separator>}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgZGF0YWZpbGUgLS1vdXQganNvbgpjYXQgZGF0YWZpbGU=" }
$ cue export --outfile datafile --out json
$ cat datafile
{
    "data": {
        "value": "A string",
        "list": [
            1,
            2
        ]
    }
}
```
{{</columns>}}
## Output location *and* encoding: `--outfile`

Any combination of output location and data encoding can be specified using a
qualifier with the `--outfile`/`-o` flag.

Qualifiers are described in
`{{< linkto/inline "reference/command/cue-help-filetypes" >}}`, and can be used
to prefix a filename with its required encoding, separated by a colon:

{{<columns>}}
{{< code-tabs >}}
{{< code-tab name="1.cue" language="cue" area="top-left" >}}
package one

data: {
	value: "A string"
	list: [1, 2]
}
{{< /code-tab >}}{{< /code-tabs >}}
{{<columns-separator>}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUganNvbjpkYXRhZmlsZQpjYXQgZGF0YWZpbGU=" }
$ cue export --outfile json:datafile
$ cat datafile
{
    "data": {
        "value": "A string",
        "list": [
            1,
            2
        ]
    }
}
```
{{</columns>}}
As mentioned above, the pseudo-filename of "`-`" can be used to refer to the
command's standard output stream. Because this filename doesn't have a suffix
its encoding must be specified -- either using `--out`, or using `--outfile`
with a qualifier:

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="top-left" >}}
package one

nested: data: true
aList: [1, 2.2, "3.33"]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dGZpbGUgeWFtbDot" >}}
$ cue export --outfile yaml:-
nested:
  data: true
aList:
  - 1
  - 2.2
  - "3.33"
{{< /code-tab >}}
{{< /code-tabs >}}

## Emitting CUE

The `cue export` command can emit CUE when the `--out` flag is passed the value
"`cue`", when the output filename ends `.cue`, or when a `cue:` qualifier is
used with `--outfile`:

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="top-left" >}}
package one

nested: data: true
aList: [1 + 1, 2 * 2, 3 / 3]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCBjdWU=" >}}
$ cue export --out cue
nested: data: true
aList: [2, 4, 1.0]
{{< /code-tab >}}
{{< /code-tabs >}}

As with all `cue export` invocations, emitting data encoded as CUE only
succeeds when the value being emitted is concrete.
This means that the CUE emitted by `cue export` will only contain
regular data fields that contain fully-specified values.
`cue export` cannot emit CUE containing hidden fields, definitions,
comprehensions, and so on - only the concrete data that results from their use:

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="top-left" >}}
package one

#A: ["a", "b", "c"]
_B: [1, 2, 3]

C: [
	for a in #A
	for b in _B {
		"\(a)-\(b)"
	},
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCBjdWU=" >}}
$ cue export --out cue
C: ["a-1", "a-2", "a-3", "b-1", "b-2", "b-3", "c-1", "c-2", "c-3"]
{{< /code-tab >}}
{{< /code-tabs >}}

When emitting CUE, `cue export` defaults to producing CUE that does not belong
to any package, regardless of the package(s) being evaluated.
This behaviour can be changed using the `--package`/`-p` flag:

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="top-left" >}}
package one

nested: data: true
aList: [1 + 1, 2 * 2, 3 / 3]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCBjdWUgLS1wYWNrYWdlIGZvbw==" >}}
$ cue export --out cue --package foo
package foo

nested: data: true
aList: [2, 4, 1.0]
{{< /code-tab >}}
{{< /code-tabs >}}

## Escaping HTML

When you include the `--escape` flag in a `cue export` invocation, string
values containing the characters `&`, `<`, or `>` are emitted with these
characters replaced by their escaped unicode code point equivalents:

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="top" >}}
package one

someHTML: """
	<a href="https://cue.example?foo=bar&baz=quux">...</a>
	"""
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLWVzY2FwZQ==" >}}
$ cue export --escape
{
    "someHTML": "\u003ca href=\"https://cue.example?foo=bar\u0026baz=quux\"\u003e...\u003c/a\u003e"
}
{{< /code-tab >}}
{{< /code-tabs >}}

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

## Related content

- {{< linkto/related/reference "command/cue-export" >}}
- {{< linkto/related/reference "command/cue-help-filetypes" >}}
- {{< linkto/related/reference "command/cue-help-eval" >}}
- {{< linkto/related/reference "command/cue-help-def" >}}
