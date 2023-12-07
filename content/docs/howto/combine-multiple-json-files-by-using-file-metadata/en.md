---
title: Combining multiple JSON files by using file metadata
tags:
- cue command
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/#commented-cue" >}}) demonstrates
how to use the `cue` command to combine multiple JSON files by making reference
to the files' metadata.

It shows the use of the `--with-context` parameter to make the input files'
names available as they're read, and the use of the `filename` metadata field
to influence the location of each file's contents in the CUE data structure.

{{{with code "en" "cc"}}}
#location top-right top-left top-left top-left bottom

exec cue export --with-context -l 'inputs:' -l 'path.Base(filename)' -e output a.json b.json c.json example.cue
cmp stdout out
-- example.cue --
package example

// place each input file under "inputs" with -l
inputs: _

// construct the output
output: [
	for fileName, fileContent in inputs {{
		name:    fileName
		content: fileContent
	}},
]
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
[
    {
        "name": "a.json",
        "content": {
            "a": 1,
            "b": 2,
            "c": 3
        }
    },
    {
        "name": "b.json",
        "content": {
            "a": "a string",
            "b": true,
            "c": 42
        }
    },
    {
        "name": "c.json",
        "content": [
            "a list element",
            "another element",
            "the last element"
        ]
    }
]
{{{end}}}

## Related content

- [Combining multiple YAML files by using file metadata]({{< relref
    "../combine-multiple-yaml-files-by-using-file-metadata"
  >}})
