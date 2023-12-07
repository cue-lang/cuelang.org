---
title: Combining multiple YAML files
tags:
- cue command
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/#commented-cue" >}}) demonstrates
how to use the `cue` command to combine multiple YAML files, even if their
contents wouldn't unify successfully.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top-left" >}}
package example

inputs: _

output: [
	for _fileName, _fileContents in inputs {
		{
			filename: _fileName
			contents: _fileContents
		}
	},
]
{{< /code-tab >}}
{{< code-tab name="a.yaml" language="yaml"  area="top-right" >}}
a: 1
b: 2
c: 3
{{< /code-tab >}}
{{< code-tab name="b.yml" language="yml"  area="top-right" >}}
a: a string
b: true
c: 42
{{< /code-tab >}}
{{< code-tab name="c.yaml" language="yaml"  area="top-right" >}}
- a list element
- another element
- the last element
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue export --with-context -l 'inputs:' -l 'path.Base(filename)' -e output .:example a.yaml b.yml c.yaml --out yaml
- filename: a.yaml
  contents:
    a: 1
    b: 2
    c: 3
- filename: b.yml
  contents:
    a: a string
    b: true
    c: 42
- filename: c.yaml
  contents:
    - a list element
    - another element
    - the last element
{{< /code-tab >}}
{{< /code-tabs >}}
