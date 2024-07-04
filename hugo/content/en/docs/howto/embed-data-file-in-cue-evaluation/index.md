---
title: Embedding a data file in a CUE evaluation
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

someData: _ @embed(file=data.json)
{{< /code-tab >}}{{< code-tab name="data.json" language="json" area="right" >}}
{
    "dataFromJson": true,
    "aList": [
        1,
        2,
        3
    ],
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
    dataFromJson: true
    aList: [1, 2, 3]
    anObject: {
        foo: "a"
        bar: "b"
        baz: "c"
    }
}
```

