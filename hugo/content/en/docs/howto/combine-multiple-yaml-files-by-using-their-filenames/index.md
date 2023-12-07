---
title: Combining multiple YAML files by using their filenames
tags:
- cue command
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/#commented-cue" >}}) demonstrates
how to use the `cue` command to combine multiple YAML files by using their
filenames to determine their location in the exported data structure.

{{< code-tabs >}}
{{< code-tab name="a.yaml" language="yaml"  area="top" >}}
a: 1
b: 2
c: 3
{{< /code-tab >}}
{{< code-tab name="b.yml" language="yml"  area="top" >}}
a: a string
b: true
c: 42
{{< /code-tab >}}
{{< code-tab name="c.yaml" language="yaml"  area="top" >}}
- a list element
- another element
- the last element
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue export --with-context -l 'input:' -l 'files:' -l 'path.Base(filename)' -e input a.yaml b.yml c.yaml --out yaml
files:
  a.yaml:
    a: 1
    b: 2
    c: 3
  b.yml:
    a: a string
    b: true
    c: 42
  c.yaml:
    - a list element
    - another element
    - the last element
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- [Combining multiple JSON files by using their filenames]({{< relref
    "../combine-multiple-json-files-by-using-their-filenames"
  >}})
