---
title: Organizing Configuration
weight: 20
draft: false
---

One of CUE's most powerful features is the ability to merge two variants, or
"aspects", of a single configuration into a well-defined and predictable
outcome. This flexibility allows users to break free from the rigidity of some
predefined API structures. It also enables users to split and organize CUE
configurations as desired. This can involve delegating responsibility for
different parts to different owners, with the assurance that the end result will
be the same as if the configuration had been managed as one huge monolith.

## Merging

CUE allows duplicate fields to exist as long as their values are consistent.

This is allowed:

{{< code-tabs >}}
{{< code-tab name="in.cue" language="cue"  area="top-left" >}}
a: 1
a: 1
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="cue" type="terminal" area="top-right" >}}
a: 1
{{< /code-tab >}}
{{< /code-tabs >}}

This is not:

{{< code-tabs >}}
{{< code-tab name="in.cue" language="cue"  area="top-left" >}}
b: 1
b: 2
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="cue" type="terminal" area="top-right" >}}
b: conflicting values 2 and 1:
    in.cue: 1:4
    in.cue: 2:4
{{< /code-tab >}}
{{< /code-tabs >}}

The values do not have to be the same to be consistent.
For instance, maps and lists are merged by matching their keys and indexes,
respectively:

{{< code-tabs >}}
{{< code-tab name="in.cue" language="cue"  area="top-left" >}}
point: {
	x: 1
}

list: [1, 2, 3]

point: {
	y: 2
}

list: [1, 2, 3, 4]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="cue" type="terminal" area="top-right" >}}
point: {
    x: 1
    y: 2
}

list: [1, 2, 3, 4]
{{< /code-tab >}}
{{< /code-tabs >}}

As can be seen, identical fields do not have to be placed next to each other.

Merging is also used for validation.
More on this in [Schemas](Schemas%20b39455d56fdb433ba9ea59c04a2dcece.md).

## Single-field shorthand

For single-field maps, the curly braces can be omitted:

{{< code-tabs >}}
{{< code-tab name="in.cue" language="cue"  area="top-left" >}}
point2: x: 1
point2: y: 2
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="cue" type="terminal" area="top-right" >}}
point2: {
	x: 1
	y: 2
}
{{< /code-tab >}}
{{< /code-tabs >}}

One can also combine values with the `&` operator:

{{< code-tabs >}}
{{< code-tab name="in.cue" language="cue"  area="top-left" >}}
point3: {x: 1} & {y: 2}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="cue" type="terminal" area="top-right" >}}
point3: {
	x: 1
	y: 2
}
{{< /code-tab >}}
{{< /code-tabs >}}

{{{with sidetrack}}}
Overall, a JSON file can be thought of as a sequence of path value pairs, where
these pairs can be combined in any order or combination without changing the
resulting value.
{{{end}}}

## Packages

The package directive allows marking two CUE files to be grouped together.
It is placed at the top of a CUE file.
Splitting a configuration across files allows grouping of related aspects and
makes it easier to separate human written versus machine generated content,
among other things.

{{< code-tabs >}}
{{< code-tab name="fruit.cue" language="cue"  area="top-left" >}}
package food

cart: {
	apples:  1
	oranges: 3
}
{{< /code-tab >}}
{{< code-tab name="vegetables.cue" language="cue"  area="bottom-left" >}}
package food

cart: spinach: 4
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="cue" type="terminal" area="top-right" >}}
cart: {
	apples:  1
	oranges: 3
	spinach: 4
}
{{< /code-tab >}}
{{< /code-tabs >}}

CUE will evaluate all files belonging to the same package as if the file
contents were contained in one large file, merging identical fields as described
above.  This also means that references

If there are multiple packages in a directory, CUE will default to the package
with the same name as the directory.

[File Organization](File%20Organization%207692931315a445acb9634b91b2b397f0.md)
