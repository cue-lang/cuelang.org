---
title: Combining multiple YAML files by using file metadata
tags:
- cue command
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/#commented-cue" >}}) demonstrates
how to use the `cue` command to combine multiple YAML files by making reference
to the files' metadata.

It shows the use of the `--with-context` parameter to make the input files'
names available as they're read, and the use of the `filename` metadata field
to influence the location of each file's contents in the CUE data structure.

{{{with code "en" "cc"}}}
#location top-right top-left top-left top-left bottom

exec cue export --with-context -l 'inputs:' -l 'path.Base(filename)' -e output a.yaml b.yml c.yaml example.cue --out yaml
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
-- a.yaml --
a: 1
b: 2
c: 3
-- b.yml --
a: a string
b: true
c: 42
-- c.yaml --
- a list element
- another element
- the last element
-- out --
- name: a.yaml
  content:
    a: 1
    b: 2
    c: 3
- name: b.yml
  content:
    a: a string
    b: true
    c: 42
- name: c.yaml
  content:
    - a list element
    - another element
    - the last element
{{{end}}}

## Related content

- [Combining multiple JSON files by using file metadata]({{< relref
    "../combine-multiple-json-files-by-using-file-metadata"
  >}})
