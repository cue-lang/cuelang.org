---
title: Combining multiple JSON files by using file metadata
tags:
- cue command
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the `cue` command to combine multiple JSON files by
making reference to the files' metadata.

The **`TERMINAL`** section shows the use of:
- the `--with-context` parameter, which makes information about each input file
  available as metadata
- the `filename` metadata field combined with the `-l` parameter, which places
  each file's contents at an individual and deterministic location in the
  evaluation space

{{{with code "en" "cc"}}}
#location top-right top-left top-left top-left bottom

exec cue export --with-context -l 'inputs:' -l 'path.Base(filename)' -e output a.json b.json c.json example.cue
cmp stdout out
-- example.cue --
package example

// inputs is the location under which we place
// each data file's contents, so that their
// contents can be accessed by the CUE in this
// file. The cue CLI -l parameter places them
// here, under a secondary key determined by each
// file's name.
inputs: [string]: _

output: {
	for _name, _content in inputs {
		(_name): {
			filename: _name
			content:  _content
		}
	}
}
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
    "a.json": {
        "filename": "a.json",
        "content": {
            "a": 1,
            "b": 2,
            "c": 3
        }
    },
    "b.json": {
        "filename": "b.json",
        "content": {
            "a": "a string",
            "b": true,
            "c": 42
        }
    },
    "c.json": {
        "filename": "c.json",
        "content": [
            "a list element",
            "another element",
            "the last element"
        ]
    }
}
{{{end}}}

## Related content

- {{< linkto/related/howto "combine-multiple-yaml-files-by-using-file-metadata" >}}
- {{< linkto/related/reference "cli/cue-flags" >}}
  documents the `--with-context` and `-l` flags
