---
title: Combining multiple JSON files
tags:
- cue command
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/#commented-cue" >}}) demonstrates
how to use the `cue` command to combine multiple JSON files, even if their
contents wouldn't unify successfully.

{{{with code "en" "cc"}}}
#location top-left top-right top-right top-right bottom

exec cue export --with-context -l 'inputs:' -l 'path.Base(filename)' -e output .:example a.json b.json c.json
cmp stdout out
-- file.cue --
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
        "filename": "a.json",
        "contents": {
            "a": 1,
            "b": 2,
            "c": 3
        }
    },
    {
        "filename": "b.json",
        "contents": {
            "a": "a string",
            "b": true,
            "c": 42
        }
    },
    {
        "filename": "c.json",
        "contents": [
            "a list element",
            "another element",
            "the last element"
        ]
    }
]
{{{end}}}
