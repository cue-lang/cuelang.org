---
title: "Type Hierarchy"
weight: 10
---

CUE defines the following type hierarchy:

{{< mermaid caption="CUE's predefined type hierarchy" >}}

flowchart BT

top["top\n(#quot;_#quot;)"]
bottom["bottom\n(#quot;_|_#quot;)"]

bottom  --> null   ---> top
bottom  --> bool   ---> top
bottom  --> string ---> top
bottom  --> bytes  ---> top
bottom  --> int    ---> top
bottom  --> float  ---> top
bottom  --> number  --> top %% shorter arrow stem leading to top affects node rank
bottom  --> struct ---> top
bottom  --> list   ---> top
bottom             ---> top

int & float --> number

subgraph " " %% TODO: figure out how to float this to the top of the graph
  direction LR
  start[ ] --->|is an instance of| stop[ ]
  style start height:0px;
  style stop height:0px;
end

{{< /mermaid >}}

CUE defines the value **bottom** (or error),
denoted "`_|_`",
which is an instance of all types.

CUE also defines the value **top** (or any),
denoted "`_`", <!-- ` vim syntax highlighting hack -->
such that all types are an instance of top.

We can mix the terms types and values interchangeably because
CUE does not distinguish between types and values.\
The term "type" merely refers to the kind of a value,
which may or may not be a concrete instance.

<!-- FIXME: this example seems to require a lot of prose.

Identify its /irreducible/ core,
and figure out if can we construct a different example that
requires less prose to communicate its essential lesson.
-->
In the example , `point` defines an arbitrary point, while `xaxis` and `yaxis`
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
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
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
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgZmlsZS5jdWU=" >}}
$ cue eval file.cue
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
