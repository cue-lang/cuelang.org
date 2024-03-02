---
title: "Type Hierarchy"
weight: 10
---

CUE defines the following type hierarchy:

{{< mermaid caption="CUE's predefined type hierarchy" >}}
flowchart BT

top["top\n('_')"]
bottom["bottom\n('_|_')"]

bottom                     --> null   --> top
bottom                     --> bool   --> top
bottom                     --> string --> top
bottom                     --> bytes  --> top
bottom --is an instance of --> int    --> top
bottom                     --> float  --> top
bottom                     --> number --> top
bottom                     --> struct --> top
bottom                     --> list   --> top

number --> int & float

{{< /mermaid >}}

CUE defines the value **bottom** (or error),
denoted "`_|_`",
which is an instance of all types.

CUE also defines the value **top** (or any),
denoted "`_`",
so that all types are an instance of top.
<!-- ` vim syntax highlighting hack -->

Note how we mix the terms types and values interchangeably.
CUE does not distinguish between types and values.
The term "type" merely refers to the kind of a value,
which may or may not be a concrete instance.

In the example, `point` defines an arbitrary point, while `xaxis` and `yaxis`
define the points on the respective lines.
We say that `point`, `xaxis`, and `yaxis` are incomplete,
as they do not specify a specific point.
Incomplete values cannot be represented as JSON,
as it can only represent concrete values.

The only concrete point is `origin`.
The `origin` is defined to be both on the x-axis and y-axis, which means it
must be at `0, 0`.
Here we see constraints in action:
`origin` evalutes to `0, 0`, even though we did not specify its coordinates
explicitly.

{{< code-tabs >}}
{{< code-tab name="types.cue" language="cue" area="top-left" >}}
point: {
	x: number
	y: number
}

xaxis: point
xaxis: y: 0

yaxis: point
yaxis: x: 0

origin: xaxis & yaxis
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt" area="top-right" >}}
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
{{< /code-tab >}}
{{< /code-tabs >}}
