---
title: Cycles in Fields
weight: 60
---

Logically, we know that unifying any field with itself will result in an
identical value. Unifying `"foo"` with `"foo"` *must* equal `"foo"`; unifying
the non-concrete value `int` with `int` must, similarly, result in `int`.

CUE takes advantage of this property to resolve **cycles betwen fields**.
The cycle is simply ignored, with the fields being unified a single time.
This achieves the same result as attempting to follow the reference cycle ad
infinitum.

{{{with code "en" "tour"}}}
exec cue eval file.cue
cmp stdout out
-- file.cue --
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
-- out --
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
{{{end}}}
