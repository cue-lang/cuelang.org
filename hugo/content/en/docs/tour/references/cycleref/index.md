---
title: Cycles in Fields
weight: 60
---

Logically, we know that unifying any field with itself will result in an
identical value. Unifying `"foo"` with `"foo"` *must* equal `"foo"`; unifying
the non-concrete value `int` with `int` must, similarly, result in `int`.

CUE takes advantage of this property to resolve **cycles between fields** by
simply ignoring the cycle and then unifying the fields a single time.
This achieves the same result as attempting to follow the reference cycle ad
infinitum.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
labels: {
	app:   "foo"
	owner: string
}
selectors: {
	name:  "bar"
	owner: =~"^bar-"
}

// This cycle can be resolved.
labels:    selectors
selectors: labels
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgZmlsZS5jdWU=" >}}
$ cue eval file.cue
labels: {
    app:   "foo"
    name:  "bar"
    owner: =~"^bar-"
}
selectors: {
    name:  "bar"
    app:   "foo"
    owner: =~"^bar-"
}
{{< /code-tab >}}
{{< /code-tabs >}}
