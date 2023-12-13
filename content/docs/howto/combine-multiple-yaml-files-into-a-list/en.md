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

{{{with code "en" "cc"}}}
#location top-left top-right top-right top-right bottom

exec cue export --with-context -l '_inputs:' -l filename a.yaml b.yml c.yaml example.cue --out yaml 
cmp stdout out
-- example.cue --
#Input: {
	a!: int
	b?: string
	c?: number
}

_inputs: [string]: #Input

contents: [
	for _, v in _inputs {v},
]
-- a.yaml --
a: 1
b: "two"
c: 33.3
-- b.yml --
a: 22
b: "some string"
-- c.yaml --
a: 333
c: 42
-- out --
contents:
  - a: 1
    b: two
    c: 33.3
  - a: 22
    b: some string
  - a: 333
    c: 42
{{{end}}}

## Related content

- [Combining multiple JSON files into a list]({{< relref
    "../combine-multiple-json-files-into-a-list"
  >}})
