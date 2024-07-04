---
title: Embedding data files in a CUE evaluation
authors: [jpluscplusm]
toc_hide: true
---

Sometimes it's necessary for CUE to include non-CUE data in a configuration.
The `@embed()` attribute is designed to enable workflows that require data to
be embedded.

{{<info>}}
The `@embed()` attribute is experimental, and its behaviour is subject to change.
Please subscribe to {{<issue 3264>}}discussion #3264{{</issue>}} for updates.
{{</info>}}

{{< step stepNumber="1" >}}
Enable the embedding experiment by setting the `CUE_EXPERIMENT` environment variable:
```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9FWFBFUklNRU5UPWVtYmVk" }
$ export CUE_EXPERIMENT=embed
```
{{< /step >}}

{{< step stepNumber="2" >}}
This guide uses the following files:

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="left" >}}
@extern(embed) // foo bar baz

package p

oneFile:   _ @embed(file=a.json)
manyFiles: _ @embed(glob=*.json)
{{< /code-tab >}}{{< code-tab name="a.json" language="json" area="right" >}}
{
    "anObject": {
        "foo": "a",
        "bar": "b",
        "baz": "c"
    }
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
    "aField": "a value"
}
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

{{< step stepNumber="3" >}}
Display the result of an evaluation performed in the context of the data files shown above:
```text { title="TERMINAL" codeToCopy="Y3VlIGV2YWw=" }
$ cue eval
oneFile: {
    anObject: {
        foo: "a"
        bar: "b"
        baz: "c"
    }
}
manyFiles: {
    "a.json": {
        anObject: {
            foo: "a"
            bar: "b"
            baz: "c"
        }
    }
    "b.json": {
        aList: [1, 2, 3]
    }
    "c.json": {
        aField: "a value"
    }
}
```
{{< /step >}}

## Related content

- [The embedding proposal](https://github.com/cue-lang/proposal/blob/main/designs/3264-embed.md)
  contains more detail about the `@embed()` feature - your feedback is
  extremely welcome!
- {{<issue 3264>}}Discussion #3264{{</issue>}} will be updated when the
  embedding proposal is accepted or modified - please subscribe on GitHub to
  receive these updates
