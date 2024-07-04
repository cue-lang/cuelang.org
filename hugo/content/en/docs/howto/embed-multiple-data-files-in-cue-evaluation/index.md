---
title: Embedding multiple data files in a CUE evaluation
authors: [jpluscplusm]
toc_hide: true
---

FIXME: prose

```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9FWFBFUklNRU5UPWVtYmVk" }
$ export CUE_EXPERIMENT=embed
```

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="left" >}}
@extern(embed) // FIXME: use @embed() when it's available

package example

someData: _ @embed(glob=*.json)
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

```text { title="TERMINAL" codeToCopy="Y3VlIGV2YWw=" }
$ cue eval
someData: {
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

