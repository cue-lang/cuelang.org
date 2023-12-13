---
title: Combining multiple JSON files into a list
tags:
- cue command
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/#commented-cue" >}}) demonstrates
how to use the `cue` command to combine multiple JSON files into a list.

{{{with code "en" "cc"}}}
#location top-left top-right top-right top-right bottom

exec cue export --with-context -l '_inputs:' -l filename a.json b.json c.json example.cue
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
-- a.json --
{
    "a": 1,
    "b": "two",
    "c": 33.3
}
-- b.json --
{
    "a": 22,
    "b": "some string"
}
-- c.json --
{
    "a": 333,
    "c": 42
}
-- out --
{
    "contents": [
        {
            "a": 1,
            "b": "two",
            "c": 33.3
        },
        {
            "a": 22,
            "b": "some string"
        },
        {
            "a": 333,
            "c": 42
        }
    ]
}
{{{end}}}

## Related content

- [Combining multiple YAML files into a list]({{< relref
    "../combine-multiple-yaml-files-into-a-list"
  >}})
