---
title: Embedding files in a CUE evaluation
authors: [jpluscplusm]
toc_hide: true
---

Users frequently need to load JSON, YAML, or other types of files into their CUE code.
Because CUE's `import` declarations only allow references to CUE packages,
some workflows resort to using the tooling layer
([`cue cmd`]({{< relref "docs/reference/command/cue-help-cmd/" >}}))
to load non-CUE files. This can complicate the process if the tooling layer's
advanced features aren't otherwise needed.

The `@embed()` attribute is designed to simplify workflows that require data to
be loaded at evaluation time, and is available by default from version
`v0.12.0` of CUE onwards. This guide demonstrates the following version:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.12.1
...
```

## Embedding files in an evaluation

{{< step stepNumber="1" >}}
Initialize a CUE module, or use an existing module if that's appropriate in
your situation:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0" }
$ cue mod init
```
{{< /step >}}

{{< step stepNumber="2" >}}
Include the `@extern(embed)` directive at the top of each CUE file that uses the
`@embed()` attribute. Use `@embed()` to embed either a single named file, or a
glob identifying multiple files:

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="left" >}}
@extern(embed)

package p

oneFile:   _ @embed(file=README.md,type=text)
manyFiles: _ @embed(glob=*.json)
{{< /code-tab >}}{{< code-tab name="a.json" language="json" area="right" >}}
{
    "aField": "a value"
}
{{< /code-tab >}}{{< code-tab name="b.json" language="json" area="right" >}}
{
    "aList": [
        1,
        2,
        3
    ]
}
{{< /code-tab >}}{{< code-tab name="c.json" language="json" area="right" >}}
{
    "anObject": {
        "foo": "a",
        "bar": "b",
        "baz": "c"
    }
}
{{< /code-tab >}}{{< code-tab name="README.md" language="md" area="right" >}}
# How to use this project

## Installation

Fetch the latest release from the official site,
and unpack it in your home directory. Next ...
{{< /code-tab >}}{{< /code-tabs >}}

By default, files are decoded using the encoding implied by their filename
extension, and it's an error if the extension is not known. Files or globs with
an unknown filename extension can be loaded by adding the
`type=<filetype>` parameter, where `<filetype>` can be any type described in
[`cue help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes/" >}}).
{{< /step >}}

{{< step stepNumber="3" >}}
Export the resulting configuration:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" }
$ cue export --out yaml
oneFile: |
  # How to use this project

  ## Installation

  Fetch the latest release from the official site,
  and unpack it in your home directory. Next ...
manyFiles:
  a.json:
    aField: a value
  b.json:
    aList:
      - 1
      - 2
      - 3
  c.json:
    anObject:
      foo: a
      bar: b
      baz: c
```
{{< /step >}}

## Related content

- {{<linkto/related/reference"command/cue-help-embed">}}
- {{<linkto/related/reference"command/cue-help-filetypes">}}
