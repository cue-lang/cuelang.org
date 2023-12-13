---
title: Combining multiple YAML files into a list
tags:
- cue command
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/#commented-cue" >}}) demonstrates
how to use the `cue` command to combine multiple YAML files into a list.

{{< code-tabs >}}
{{< code-tab name="a.yaml" language="yaml"  area="top-left" >}}
a: 1
b: "two"
c: 33.3
{{< /code-tab >}}
{{< code-tab name="b.yml" language="yml"  area="top-left" >}}
a: 22
b: "some string"
{{< /code-tab >}}
{{< code-tab name="c.yaml" language="yaml"  area="top-left" >}}
a: 333
c: 42
{{< /code-tab >}}
{{< code-tab name="example.cue" language="cue"  area="top-right" >}}
#Input: {
	a!: int
	b?: string
	c?: number
}

_inputs: [string]: #Input

contents: [
	for _, v in _inputs {v},
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue export --with-context -l '_inputs:' -l filename a.yaml b.yml c.yaml example.cue --out yaml
contents:
  - a: 1
    b: two
    c: 33.3
  - a: 22
    b: some string
  - a: 333
    c: 42
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- [Combining multiple JSON files into a list]({{< relref
    "../combine-multiple-json-files-into-a-list"
  >}})
