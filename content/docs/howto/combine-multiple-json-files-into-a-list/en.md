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
#location top-left top-left top-left top-right bottom

exec cue export --with-context -l '_inputs:' -l filename a.json b.json c.json example.cue
cmp stdout out
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
-- example.cue --
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
- [cue help flags]({{< relref
    "docs/reference/cli/cue-flags"
  >}}) documents the `--with-context` and `-l` flags
