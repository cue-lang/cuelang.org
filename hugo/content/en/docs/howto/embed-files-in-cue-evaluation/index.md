---
title: Embedding files in a CUE evaluation
authors: [jpluscplusm]
toc_hide: true
---

Users frequently need to load JSON, YAML, or other types of files into their CUE
code. As CUE only supports `import` declarations that reference CUE packages,
users currently resort to the CUE tooling layer ([`cue cmd`]({{< relref
"docs/reference/command/cue-help-cmd/" >}})) to load non-CUE files, which can be
overly complex for their needs.

The `@embed()` attribute is designed to enable workflows that require data to
be loaded at evaluation time.

{{<info>}}
The `@embed()` attribute is experimental, and its behaviour is subject to change.
Please subscribe to {{<issue 3264>}}discussion #3264{{</issue>}} for updates.
{{</info>}}

Note to use `@embed` you will need:

```text { title="TERMINAL" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.10.0-alpha.1
...
```

{{< step stepNumber="1" >}}
Enable the embed experiment:

```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9FWFBFUklNRU5UPWVtYmVk" }
$ export CUE_EXPERIMENT=embed
```
{{< /step >}}

{{< step stepNumber="2" >}}
Include the `@extern(embed)` directive at the top of each CUE file that the
`@embed()` attribute. Use `@embed()` to embed either a single named file or a
glob identifying multiple files:

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="left" >}}
@extern(embed)

package p

oneFile:   _ @embed(file=a.json)
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
{{< /code-tab >}}{{< /code-tabs >}}

By default, files are decoded using the encoding implied by the file name
extension. It's an error if the extension is not known. This can be overridden
using `type=$filetype`, where `$filetype` can be any file type described in [`cue
help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes/" >}}).

{{< /step >}}

{{< step stepNumber="3" >}}
Export the resulting configuration:

```text { title="TERMINAL" codeToCopy="Y3VlIGV2YWw=" }
$ cue eval
oneFile: {
    aField: "a value"
}
manyFiles: {
    "a.json": {
        aField: "a value"
    }
    "b.json": {
        aList: [1, 2, 3]
    }
    "c.json": {
        anObject: {
            foo: "a"
            bar: "b"
            baz: "c"
        }
    }
}
```
{{< /step >}}

## Next steps

[The embedding
proposal](https://github.com/cue-lang/proposal/blob/main/designs/3264-embed.md)
contains more detail about the `@embed()` feature. Your feedback on the proposal
is most welcome - please submit it via {{<issue 3264>}}discussion
#3264{{</issue>}}.

{{<issue 3264>}}Discussion #3264{{</issue>}} will be updated when the embedding
proposal is accepted or modified, and when feedback is posted - please subscribe
to the discussion to receive these updates.
