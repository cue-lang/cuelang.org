---
title: Type Hierarchy
weight: 10
---

CUE defines the following type hierarchy:

{{< mermaid caption="CUE's predefined type hierarchy" >}}
flowchart TD

top["_"]
bottom["_|_"]
struct["{...}"]
list["[...]"]

top --> null --> bottom
top --> bool --> bottom
top --> string --> bottom
top --> bytes --> bottom
top --> number --> int & float --> bottom
top --> struct --> bottom
top --> list --> bottom
{{< /mermaid >}}

CUE defines the value **top** (or any),
written "`_`", <!-- ` vim syntax highlighting hack -->
such that all types are an instance of top,
and the value **bottom** (or error),
written "`_|_`",
which is an instance of all types.

We can mix the terms types and values interchangeably because
CUE doesn't distinguish between types and values.\
The term "type" merely refers to the *kind* of a value,
which may or may not be a concrete instance.

In this hypothetical example, `point` defines an arbitrary point,
while `xaxis` and `yaxis` define any point on their respective axes.
We say that `point`, `xaxis`, and `yaxis` are **incomplete**,
as they don't contain values that specify a specific point.
Incomplete values must not be included when exporting to formats that can't
represent them, such as JSON or YAML.

By contrast, we say that `origin` is **complete** as it contains only
**concrete** values.
However, notice that we didn't need to specify its values explicitly.
CUE is able to **infer** from the **constraints** applied
(that `origin` lies on both the x-axis and y-axis)
that its coordinates *must* be `(x = 0, y = 0)`.

{{{with code "en" "tour"}}}
exec cue eval file.cue
cmp stdout out
-- file.cue --
point: {
	x: number
	y: number
}

xaxis: point
xaxis: y: 0

yaxis: point
yaxis: x: 0

origin: xaxis & yaxis
-- out --
point: {
    x: number
    y: number
}
xaxis: {
    x: number
    y: 0
}
yaxis: {
    x: 0
    y: number
}
origin: {
    x: 0
    y: 0
}
{{{end}}}
