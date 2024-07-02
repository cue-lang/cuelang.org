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

The **`TERMINAL`** section shows the use of:
- the `--with-context` parameter, which makes information about each input file
  available as metadata
- the `filename` metadata field combined with the `-l` parameter, which places
  each file's contents at an individual and deterministic location in the
  evaluation space

{{{with code "en" "cc"}}}
#location top-right top-left top-left top-left bottom

exec cue export --with-context -l 'inputs:' -l 'path.Base(filename)' -e output a.yaml b.yml c.yaml example.cue --out yaml
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
a.yaml:
  filename: a.yaml
  content:
    a: 1
    b: 2
    c: 3
b.yml:
  filename: b.yml
  content:
    a: a string
    b: true
    c: 42
c.yaml:
  filename: c.yaml
  content:
    - a list element
    - another element
    - the last element
{{{end}}}

## Related content

- {{< linkto/related/howto "combine-multiple-json-files-by-using-file-metadata" >}}
- {{< linkto/related/reference "command/cue-help-flags" >}}
  documents the `--with-context` and `-l` flags
