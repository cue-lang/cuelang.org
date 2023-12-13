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
package example

import "list"

// Place each file's contents under _input with
// the -l parameter, under a secondary key taken
// from the file's name. Each file's contents
// must adhere to the #Input schema.
_inputs: [string]: #Input

#Input: {
	a!: int
	b?: string
	c?: number
}

// Construct a sorted list of the input files'
// names so that our output (an ordered list) can
// remain stable no matter the order the filenames
// are provided to the cue CLI.
_sortedInputs: list.SortStrings([
	for k, _ in _inputs {k},
])

contents: [
	for _name in _sortedInputs {_inputs[_name]},
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

- [Combining multiple YAML files into a list]({{< relref
    "../combine-multiple-yaml-files-into-a-list"
  >}})
- [cue help flags]({{< relref
    "docs/reference/cli/cue-flags"
  >}}) documents the `--with-context` and `-l` flags
