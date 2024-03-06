---
title: Queries and Projections
weight: 65
---

Comprehensions allow us to select data via queries and projections.

Queries select which data items we want to process,
and projections define the shape of each resulting item.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
_data: {
	foo: {a: 1, b: "a foo", c: true}
	bar: {a: 100, b: "some bar", c: false}
	baz: {a: 1000, b: "this is baz", c: false}
	quux: {a: 10000, b: "quux?", c: true}
}

result: {
	for k, v in _data
	if v.a < 10 || v.c || v.b =~ "bar" {
		(k): {
			b: v.b
			a: 1 + v.a*2
		}
	}
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgZmlsZS5jdWU=" >}}
$ cue eval file.cue
result: {
    foo: {
        b: "a foo"
        a: 3
    }
    bar: {
        b: "some bar"
        a: 201
    }
    quux: {
        b: "quux?"
        a: 20001
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}
