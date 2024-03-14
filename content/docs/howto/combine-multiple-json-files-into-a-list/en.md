---
title: Combining multiple JSON files into a list
tags:
- cue command
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the `cue` command to combine multiple JSON files into a
list.

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

// _inputs is the location under which we place
// each data file's contents, so that their
// contents can be accessed by the CUE in this
// file. The cue CLI -l parameter places them
// here, under a secondary key taken from the
// file's name.
_inputs: [string]: _

// Each file's contents must adhere to the #Input
// schema.
_inputs: [string]: #Input

#Input: {
	a!: int
	b?: string
	c?: number
}

// Construct a sorted list of the input files'
// names so that our output (an ordered list) can
// remain stable no matter the order the
// filenames are provided to the cue CLI.
let sortedInputs = list.SortStrings([
	for k, _ in _inputs {k},
])

// Iterate over the stable input filename list,
// and emit each input file's contents in turn.
contents: [for _name in sortedInputs {
	_inputs[_name]
}]
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

- {{< linkto/related/howto "combine-multiple-yaml-files-into-a-list" >}}
- {{< linkto/related/reference "command/cue-help-flags" >}}
  documents the `--with-context` and `-l` flags
