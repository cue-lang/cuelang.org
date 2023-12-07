---
title: Combining multiple JSON files by using their filenames
tags:
- cue command
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/#commented-cue" >}}) demonstrates
how to use the `cue` command to combine multiple JSON files by using their
filenames to determine their location in the exported data structure.

{{{with code "en" "cc"}}}
#location top top top bottom

exec cue export --with-context -l 'input:' -l 'files:' -l 'path.Base(filename)' -e input a.json b.json c.json
cmp stdout out
-- a.json --
{
    "a": 1,
    "b": 2,
    "c": 3
}
-- b.json --
{
    "a": "a string",
    "b": true,
    "c": 42
}
-- c.json --
[
    "a list element",
    "another element",
    "the last element"
]
-- out --
{
    "files": {
        "a.json": {
            "a": 1,
            "b": 2,
            "c": 3
        },
        "b.json": {
            "a": "a string",
            "b": true,
            "c": 42
        },
        "c.json": [
            "a list element",
            "another element",
            "the last element"
        ]
    }
}
{{{end}}}

## Related content

- [Combining multiple YAML files by using their filenames]({{< relref
    "../combine-multiple-yaml-files-by-using-their-filenames"
  >}})
