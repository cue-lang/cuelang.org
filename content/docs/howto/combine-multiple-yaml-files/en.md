---
title: Combining multiple YAML files
tags:
- cue command
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/#commented-cue" >}}) demonstrates
how to use the `cue` command to combine multiple YAML files, even if their
contents wouldn't unify successfully.

{{{with code "en" "cc"}}}
#location top-left top-right top-right top-right bottom

exec cue export --with-context -l 'inputs:' -l 'path.Base(filename)' -e output .:example a.yaml b.yml c.yaml --out yaml
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
- filename: a.yaml
  contents:
    a: 1
    b: 2
    c: 3
- filename: b.yml
  contents:
    a: a string
    b: true
    c: 42
- filename: c.yaml
  contents:
    - a list element
    - another element
    - the last element
{{{end}}}
